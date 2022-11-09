package org.skyve.impl.metadata.repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.skyve.impl.generate.ViewGenerator;
import org.skyve.impl.metadata.customer.CustomerImpl;
import org.skyve.impl.metadata.model.document.DocumentImpl;
import org.skyve.impl.metadata.repository.customer.CustomerMetaData;
import org.skyve.impl.metadata.repository.document.DocumentMetaData;
import org.skyve.impl.metadata.repository.module.ModuleMetaData;
import org.skyve.impl.metadata.repository.router.Router;
import org.skyve.impl.metadata.repository.view.ViewMetaData;
import org.skyve.impl.metadata.repository.view.access.ViewUserAccessesMetaData;
import org.skyve.impl.metadata.user.ActionPrivilege;
import org.skyve.impl.metadata.user.Privilege;
import org.skyve.impl.metadata.user.RoleImpl;
import org.skyve.impl.metadata.view.ViewImpl;
import org.skyve.impl.util.UtilImpl;
import org.skyve.metadata.MetaData;
import org.skyve.metadata.MetaDataException;
import org.skyve.metadata.customer.Customer;
import org.skyve.metadata.model.document.Document;
import org.skyve.metadata.module.Module;
import org.skyve.metadata.module.Module.DocumentRef;
import org.skyve.metadata.repository.MutableRepository;
import org.skyve.metadata.repository.OnDemandRepository;
import org.skyve.metadata.user.Role;
import org.skyve.metadata.view.View;
import org.skyve.metadata.view.View.ViewType;

public abstract class MutableCachedRepository extends ProvidedRepositoryDelegate implements MutableRepository, OnDemandRepository {
	/**
	 * The cache.
	 * MetaData namespace and name -> MetaData.
	 * eg customers/bizhub
	 *    modules/admin
	 *    modules/admin/Contact
	 * Thread-safe and performant for mostly-read operations.
	 */
	private ConcurrentHashMap<String, Optional<MetaData>> cache = new ConcurrentHashMap<>();
	
	protected static final String ROUTER_KEY = ROUTER_NAMESPACE + ROUTER_NAME;

	@Override
	public void evictCachedMetaData(Customer customer) {
		// Clear the lot
		if (customer == null) {
			cache.clear();
		}
		else {
			// Clear any customer overrides and any modules the customer has access to.
			List<String> moduleNames = ((CustomerImpl) customer).getModuleNames();
			List<String> modulePrefixes = new ArrayList<>(moduleNames.size());
			for (String moduleName : moduleNames) {
				modulePrefixes.add(MODULES_NAMESPACE + moduleName);
			}
			
			Iterator<String> i = cache.keySet().iterator();
			final String customerOverridePrefix = CUSTOMERS_NAMESPACE + customer.getName();
			while (i.hasNext()) {
				String key = i.next();
				if (key.startsWith(customerOverridePrefix)) {
					i.remove();
					continue;
				}
				for (String modulePrefix : modulePrefixes) {
					if (key.startsWith(modulePrefix)) {
						i.remove();
						break;
					}
				}
			}
		}
	}
	
	@Override
	public Router getRouter() {
		Router result = null;
		
		Optional<MetaData> o = cache.computeIfPresent(ROUTER_KEY, (k, v) -> {
			// Load if empty
			if (v.isEmpty()) {
				Router router = loadRouter();
				router = router.convert(ROUTER_NAME, getDelegator());
				return Optional.of(router);
			}

			// Load if dev mode and new repository version
			if (UtilImpl.DEV_MODE) {
				Router r = (Router) v.get();
				if (r.getLastModifiedMillis() < routerLastModifiedMillis()) {
					Router router = loadRouter();
					router = router.convert(ROUTER_NAME, getDelegator());
					return Optional.of(router);
				}
			}
			
			// Return the cached value
			return v;
		});
		if ((o != null) && o.isPresent()) {
			result = (Router) o.get();
		}
		
		return result;
	}
	
	@Override
	public Router setRouter(Router router) {
		Router result = router.convert(ROUTER_NAME, getDelegator());
		// Ignore dev mode flag here as we need to seed the cache in this method.
		cache.put(ROUTER_KEY, Optional.of(result));
		return result;
	}

	@Override
	public Customer getCustomer(String customerName) {
		String customerKey = CUSTOMERS_NAMESPACE + customerName;
		Optional<MetaData> o = cache.computeIfPresent(customerKey, (k, v) -> {
			// Load if empty
			if (v.isEmpty()) {
				CustomerMetaData customerMetaData = loadCustomer(customerName);
				Customer customer = customerMetaData.convert(customerName, getDelegator());
				return Optional.of(customer);
			}
			
			// Load if dev mode and new repository version
			if (UtilImpl.DEV_MODE) {
				Customer c = (Customer) v.get();
				if (c.getLastModifiedMillis() < customerLastModifiedMillis(customerName)) {
					CustomerMetaData customerMetaData = loadCustomer(customerName);
					Customer customer = customerMetaData.convert(customerName, getDelegator());
					return Optional.of(customer);
				}
			}
			
			// Return the cached value
			return v;
		});
		return ((o == null) || o.isEmpty()) ? null : (Customer) o.get();
	}

	@Override
	public Customer putCustomer(CustomerMetaData customer) {
		String customerName = customer.getName();
		Customer result = customer.convert(customerName, getDelegator());
		cache.put(CUSTOMERS_NAMESPACE + customerName, Optional.of(result));
		return result;
	}

	@Override
	public Module getModule(Customer customer, String moduleName) {
		Module result = null;
		if (customer != null) {
			if (! ((CustomerImpl) customer).getModuleNames().contains(moduleName)) {
				throw new MetaDataException("Module " + moduleName + " does not exist for customer " + customer.getName());
			}
			// get customer overridden
			result = getModuleInternal(customer, moduleName);
		}
		if (result == null) { // not overridden
			result = getModuleInternal(null, moduleName);
		}
		// Note we can not test for existence of the module here because it may be a repository in a DelegatedProvidedRepositoryChain (DefaultRepository)
		return result;
	}
	
	private @Nullable Module getModuleInternal(@Nullable Customer customer, @Nonnull String moduleName) {
		final String customerName = (customer == null) ? null : customer.getName();
		StringBuilder moduleKey = new StringBuilder(64);
		if (customerName != null) {
			moduleKey.append(CUSTOMERS_NAMESPACE).append(customerName).append('/');
		}
		moduleKey.append(MODULES_NAMESPACE).append(moduleName);
		
		Optional<MetaData> result = cache.computeIfPresent(moduleKey.toString(), (k, v) -> {
			// Load if empty
			if (v.isEmpty()) {
				ModuleMetaData moduleMetaData = loadModule(customerName, moduleName);
				Module module = this.convertModule(customerName, moduleName, moduleMetaData);
				return Optional.of(module);
			}

			// Load if dev mode and new repository version
			if (UtilImpl.DEV_MODE) {
				Module m = (Module) v.get();
				if (m.getLastModifiedMillis() < moduleLastModifiedMillis(customerName, moduleName)) {
					ModuleMetaData moduleMetaData = loadModule(customerName, moduleName);
					Module module = this.convertModule(customerName, moduleName, moduleMetaData);
					return Optional.of(module);
				}
			}
			
			// Return the cached value
			return v;
		});
		if ((result != null) && result.isPresent()) {
			return (Module) result.get();
		}
		return null;
	}

	private @Nonnull Module convertModule(@Nullable String customerName, @Nonnull String moduleName, @Nonnull ModuleMetaData module) {
		String metaDataName = null;
		if (customerName != null) {
			metaDataName = new StringBuilder(64).append(moduleName).append(" (").append(customerName).append(')').toString();
		}
		else {
			metaDataName = moduleName;
		}
		return module.convert(metaDataName, getDelegator());
	}
	
	@Override
	public Module putModule(Customer customer, ModuleMetaData module) {
		String customerName = customer.getName();
		String moduleName = module.getName();
		Module result = convertModule(customerName, moduleName, module);
		
		StringBuilder moduleKey = new StringBuilder(64);
		moduleKey.append(CUSTOMERS_NAMESPACE).append(customerName).append('/').append(MODULES_NAMESPACE).append(moduleName);
		cache.put(moduleKey.toString(), Optional.of(result));
		
		return result;
	}
	
	@Override
	public Module putModule(ModuleMetaData module) {
		String moduleName = module.getName();

		Module result = convertModule(null, moduleName, module);
		cache.put(MODULES_NAMESPACE + moduleName, Optional.of(result));
		
		return result;
	}
	
	@Override
	public Document getDocument(Customer customer, Module module, String documentName) {
		Document result = null;
		if (customer != null) {
			// get customer overridden
			result = getDocumentInternal(true, customer, module, documentName);
		}
		if (result == null) { // not overridden
			result = getDocumentInternal(false, customer, module, documentName);
		}
		// Note we can not test for existence of the module here because it may be a repository in a DelegatedProvidedRepositoryChain (DefaultRepository)
		return result;
	}

	private Document getDocumentInternal(boolean customerOverride, Customer customer, Module module, String documentName) {
		DocumentRef ref = module.getDocumentRefs().get(documentName);
		if (ref == null) {
			throw new IllegalArgumentException(documentName + " does not exist for this module - " + module.getName());
		}
		String documentModuleName = ((ref.getReferencedModuleName() == null) ? module.getName() : ref.getReferencedModuleName());

		final String customerName = (customer == null) ? null : customer.getName();
		StringBuilder documentKey = new StringBuilder(64);
		if (customerOverride) {
			documentKey.append(CUSTOMERS_NAMESPACE).append(customerName).append('/');
		}
		documentKey.append(MODULES_NAMESPACE).append(documentModuleName).append('/').append(documentName);
		
		Optional<MetaData> result = cache.computeIfPresent(documentKey.toString(), (k, v) -> {
			// Load if empty
			if (v.isEmpty()) {
				DocumentMetaData documentMetaData = loadDocument(customerOverride ? customerName : null, documentModuleName, documentName);
				Module documentModule = getModule(customer, documentModuleName);
				Document document = convertDocument(customerName, documentModuleName, documentModule, documentName, documentMetaData);
				return Optional.of(document);
			}

			// Load if dev mode and new repository version
			if (UtilImpl.DEV_MODE) {
				Document d = (Document) v.get();
				if (d.getLastModifiedMillis() < documentLastModifiedMillis(customerOverride ? customerName : null, documentModuleName, documentName)) {
					DocumentMetaData documentMetaData = loadDocument(customerOverride ? customerName : null, documentModuleName, documentName);
					Module documentModule = getModule(customer, documentModuleName);
					Document document = convertDocument(customerName, documentModuleName, documentModule, documentName, documentMetaData);
					return Optional.of(document);
				}
			}
			
			// Return the cached value
			return v;
		});
		if ((result != null) && result.isPresent()) {
			return (Document) result.get();
		}
		return null;
	}

	private Document convertDocument(String customerName,
										String moduleName,
										Module module,
										String documentName,
										DocumentMetaData document) {
		StringBuilder metaDataName = new StringBuilder(128);
		metaDataName = new StringBuilder(64).append(moduleName).append('.').append(documentName);
		if (customerName != null) {
			metaDataName.append(" (").append(customerName).append(')');
		}
		Document result = document.convert(metaDataName.toString(), getDelegator());
		
		DocumentImpl internalResult = (DocumentImpl) result;
		internalResult.setOwningModuleName(moduleName);

		// check each document reference query name links to a module query
		for (String referenceName : result.getReferenceNames()) {
			String queryName = result.getReferenceByName(referenceName).getQueryName();
			if ((queryName != null) && (module.getMetaDataQuery(queryName) == null)) {
				StringBuilder mde = new StringBuilder(documentName);
				mde.append(" : The reference ");
				mde.append(referenceName);
				mde.append(" has a query ");
				mde.append(queryName);
				mde.append(" that does not exist in module ");
				if (customerName != null) {
					mde.append(customerName);
					mde.append(".");
				}
				mde.append(moduleName);
				
				throw new MetaDataException(mde.toString());
			}
		}

		// Add actions in privileges to the document to enable good view generation
		for (Role role : module.getRoles()) {
			for (Privilege privilege : ((RoleImpl) role).getPrivileges()) {
				if (privilege instanceof ActionPrivilege) {
					ActionPrivilege actionPrivilege = (ActionPrivilege) privilege;
					if (actionPrivilege.getDocumentName().equals(result.getName())) {
						internalResult.getDefinedActionNames().add(actionPrivilege.getName());
					}
				}
			}
		}
		
		return result;
	}
	
	@Override
	public Document putDocument(Customer customer, Module module, DocumentMetaData document) {
		String customerName = customer.getName();
		String moduleName = module.getName();
		String documentName = document.getName();
		Document result = convertDocument(customerName, moduleName, module, documentName, document);
		
		StringBuilder documentKey = new StringBuilder(64);
		documentKey.append(CUSTOMERS_NAMESPACE).append(customerName).append('/').append(MODULES_NAMESPACE).append(moduleName).append('/').append(documentName);
		cache.put(documentKey.toString(), Optional.of(result));
		
		return result;
	}

	@Override
	public Document putDocument(Module module, DocumentMetaData document) {
		String moduleName = module.getName();
		String documentName = document.getName();
		Document result = convertDocument(null, moduleName, module, documentName, document);
		
		StringBuilder documentKey = new StringBuilder(64);
		documentKey.append(MODULES_NAMESPACE).append(moduleName).append('/').append(documentName);
		cache.put(documentKey.toString(), Optional.of(result));
		
		return result;
	}

	@Override
	public View getView(String uxui,
							Customer customer, 
							Document document, 
							String name) {
		View result = null;
		if (customer != null) {
			String searchCustomerName = customer.getName();
			// get customer overridden
			if (uxui != null) {
				// get uxui specific
				result = getViewInternal(searchCustomerName, uxui, customer, document, uxui, name);
			}
			if (result == null) {
				result = getViewInternal(searchCustomerName, null, customer, document, uxui, name);
			}
		}
		
		if (result == null) { // not overridden
			if (uxui != null) {
				// get uxui specific
				result = getViewInternal(null, uxui, customer, document, uxui, name);
			}
			if (result == null) {
				result = getViewInternal(null, null, customer, document, uxui, name);
			}
		}
		
		// scaffold
		if ((result == null) && getUseScaffoldedViews()) {
			if (UtilImpl.DEV_MODE) {
				result = scaffoldView(customer, document, name, uxui);
			}
			else {
				StringBuilder key = new StringBuilder(128);
				String documentModuleName = document.getOwningModuleName();
				String documentName = document.getName();
				key.append(MODULES_NAMESPACE).append(documentModuleName).append('/');
				key.append(documentName).append('/').append(VIEWS_NAMESPACE).append(name);
				Optional<MetaData> o = cache.computeIfAbsent(key.toString(), k -> {
					View view = scaffoldView(customer, document, name, uxui);
					return (view == null) ? null : Optional.of(view);
				});
				if ((o != null) && o.isPresent()) {
					result = (View) o.get();
				}
			}
		}
		return result;
	}

	private View getViewInternal(String searchCustomerName, // the name of the customer to try to load
									String seachUxUi, // the uxui to try to load {from getView()}
									Customer customer,
									Document document,
									String uxui, // the current uxui
									String viewName) {
		StringBuilder viewKey = new StringBuilder(128);
		if (searchCustomerName != null) {
			viewKey.append(CUSTOMERS_NAMESPACE).append(searchCustomerName).append('/');
		}
		viewKey.append(MODULES_NAMESPACE);
		String documentModuleName = document.getOwningModuleName();
		String documentName = document.getName();
		viewKey.append(documentModuleName).append('/').append(documentName).append('/').append(VIEWS_NAMESPACE);
		if (seachUxUi != null) {
			viewKey.append(seachUxUi).append('/');
		}
		viewKey.append(viewName);
		
		Optional<MetaData> o = cache.computeIfPresent(viewKey.toString(), (k, v) -> {
			// Load if empty
			if (v.isEmpty()) {
				// Load the view using the searchUxUi
				ViewMetaData viewMetaData = loadView(searchCustomerName, documentModuleName, documentName, seachUxUi, viewName);
				View view = null;
				if (viewMetaData != null) {
					// Convert the view ensuring view components within vanilla views are resolved with the current uxui
					view = convertView(searchCustomerName, seachUxUi, customer, documentModuleName, documentName, document, uxui, viewMetaData);
				}
				return Optional.ofNullable(view);
			}

			// Load if dev mode and new repository version
			if (UtilImpl.DEV_MODE) {
				ViewImpl view = (ViewImpl) v.get();
				// check last modified for the view
				if (view.getLastModifiedMillis() < viewLastModifiedMillis(searchCustomerName, documentModuleName, documentName, seachUxUi, viewName)) {
					// Load the view using the searchUxUi
					ViewMetaData viewMetaData = loadView(searchCustomerName, documentModuleName, documentName, seachUxUi, viewName);
					View newView = null;
					if (viewMetaData != null) {
						// Convert the view ensuring view components within vanilla views are resolved with the current uxui
						newView = convertView(searchCustomerName, seachUxUi, customer, documentModuleName, documentName, document, uxui, viewMetaData);
					}
					return Optional.ofNullable(newView);
				}
			}
			
			// Return the cached value
			return v;
		});

		ViewImpl result = null;
		if ((o != null) && o.isPresent()) {
			result = (ViewImpl) o.get();
		}
		
		return result;
	}

	private ViewImpl convertView(String searchCustomerName,
								String searchUxUi, // only used to make the metadata name
								Customer customer,
								String moduleName,
								String documentName,
								Document document,
								String uxui, // the current uxui used to resolve view components
								ViewMetaData view) {
		StringBuilder metaDataNameSB = new StringBuilder(128);
		metaDataNameSB.append(moduleName).append('.').append(documentName).append('.');
		if (searchUxUi != null) {
			metaDataNameSB.append(searchUxUi).append('.');
		}
		metaDataNameSB.append(view.getName());
		if (searchCustomerName != null) {
			metaDataNameSB.append(" (").append(searchCustomerName).append(')');
		}
		String metaDataName = metaDataNameSB.toString();
		
		// Convert the view
		ViewImpl result = view.convert(metaDataName, getDelegator());
		result.setOverriddenCustomerName(searchCustomerName);
		result.setOverriddenUxUiName(searchUxUi);

		final Module documentModule = customer.getModule(document.getOwningModuleName());
		
		// Convert accesses in ViewMetaData to view, which requires customer/module/document context
		ViewUserAccessesMetaData accesses = view.getAccesses();
		result.convertAccesses(documentModule, documentName, metaDataName, accesses);
		
		// Resolve the view ensuring view components within vanilla views are resolved with the current uxui
		result.resolve(uxui, customer, documentModule, document, (accesses == null) ? true : accesses.isGenerate());
		return result;
	}
	
	private View scaffoldView(Customer customer, Document document, String viewName, String uxui) {
		if (ViewType.edit.toString().equals(viewName) || 
				ViewType.pick.toString().equals(viewName) || 
				ViewType.params.toString().equals(viewName)) {
			ViewImpl result = new ViewGenerator(this).generate(customer, document, viewName);
			final Module documentModule = customer.getModule(document.getOwningModuleName());
			result.resolve(uxui, customer, documentModule, document, true);
			return result;
		}
		return null;
	}

	@Override
	public View putView(Customer customer, String uxui, Document document, ViewMetaData view) {
		String customerName = customer.getName();
		String moduleName = document.getOwningModuleName();
		String documentName = document.getName();
		View result = convertView(customerName, uxui, customer, moduleName, documentName, document, uxui, view);
		
		StringBuilder viewKey = new StringBuilder(128);
		viewKey.append(CUSTOMERS_NAMESPACE).append(customerName).append('/');
		viewKey.append(MODULES_NAMESPACE).append(moduleName).append('/');
		viewKey.append(documentName).append('/').append(VIEWS_NAMESPACE);
		viewKey.append(uxui).append('/').append(view.getName());
		cache.put(viewKey.toString(), Optional.of(result));
		
		return result;
	}

	@Override
	public View putView(String uxui, Document document, ViewMetaData view) {
		String moduleName = document.getOwningModuleName();
		String documentName = document.getName();
		View result = convertView(null, uxui, null, moduleName, documentName, document, uxui, view);
		
		StringBuilder viewKey = new StringBuilder(128);
		viewKey.append(MODULES_NAMESPACE).append(moduleName).append('/');
		viewKey.append(documentName).append('/').append(VIEWS_NAMESPACE);
		viewKey.append(uxui).append('/').append(view.getName());
		cache.put(viewKey.toString(), Optional.of(result));
		
		return result;
	}
	
	@Override
	public View putView(Customer customer, Document document, ViewMetaData view) {
		String customerName = customer.getName();
		String moduleName = document.getOwningModuleName();
		String documentName = document.getName();
		View result = convertView(customerName, null, customer, moduleName, documentName, document, null, view);
		
		StringBuilder viewKey = new StringBuilder(128);
		viewKey.append(CUSTOMERS_NAMESPACE).append(customerName).append('/');
		viewKey.append(MODULES_NAMESPACE).append(moduleName).append('/');
		viewKey.append(documentName).append('/');
		viewKey.append(VIEWS_NAMESPACE).append(view.getName());
		cache.put(viewKey.toString(), Optional.of(result));
		
		return result;
	}
	
	@Override
	public View putView(Document document, ViewMetaData view) {
		String moduleName = document.getOwningModuleName();
		String documentName = document.getName();
		View result = convertView(null, null, null, moduleName, documentName, document, null, view);
		
		StringBuilder viewKey = new StringBuilder(128);
		viewKey.append(MODULES_NAMESPACE).append(moduleName).append('/');
		viewKey.append(documentName).append('/');
		viewKey.append(VIEWS_NAMESPACE).append(view.getName());
		cache.put(viewKey.toString(), Optional.of(result));
		
		return result;
	}
	
	/**
	 * Called by populateKeys() implementations.
	 * @param key
	 */
	protected void addKey(String key) {
		cache.putIfAbsent(key, Optional.empty());
	}
	
	@Override
	public String vtable(String customerName, String key) {
		String result = new StringBuilder(128).append(CUSTOMERS_NAMESPACE).append(customerName).append('/').append(key).toString();
		if (! cache.containsKey(result)) {
			if (cache.containsKey(key)) {
				result = key;
			}
			else {
				result = null;
			}
		}
		return result;
	}
}