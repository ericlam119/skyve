package org.skyve.impl.web.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Geometry;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.jts.io.ParseException;
import org.locationtech.jts.io.WKTReader;
import org.skyve.CORE;
import org.skyve.content.MimeType;
import org.skyve.domain.Bean;
import org.skyve.domain.messages.SessionEndedException;
import org.skyve.impl.cache.StateUtil;
import org.skyve.impl.persistence.AbstractPersistence;
import org.skyve.impl.web.AbstractWebContext;
import org.skyve.impl.web.WebUtil;
import org.skyve.metadata.customer.Customer;
import org.skyve.metadata.model.document.Document;
import org.skyve.metadata.module.Module;
import org.skyve.metadata.module.query.MetaDataQueryDefinition;
import org.skyve.metadata.user.User;
import org.skyve.metadata.view.model.map.DocumentQueryMapModel;
import org.skyve.metadata.view.model.map.MapModel;
import org.skyve.metadata.view.model.map.MapResult;
import org.skyve.metadata.view.model.map.ReferenceMapModel;
import org.skyve.util.JSON;
import org.skyve.util.Util;

/**
 * Map Servlet - supplies map data to a map display.
 * 
 * there are 3 usage modes:-
 * 
 * 1) This mode executes the query and then gets each geometry object using qeometryBinding.
 * 		parameters
 * 			query
 * 			geometryBinding
 * 2) This mode reaches into the current bean's reference via refrenceBinding 
 * 		and gets each geometry object using collectionGeometryBinding
 * 		parameters
 * 			webContext
 * 			refefrenceBinding
 * 			geometryBinding
 * 3) This mode uses the given model to generate its own geometry list
 * 		parameters
 * 			webContext
 * 			modelName
 */
// TODO This should support continue conversation
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String GEOMETRY_BINDING_NAME = "_geo";
	private static final String NORTH_EAST_NAME = "_ne";
	private static final String SOUTH_WEST_NAME = "_sw";
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setContentType(MimeType.json.toString());
		response.setCharacterEncoding(Util.UTF8);
		response.addHeader("Cache-control", "private,no-cache,no-store"); // never
		response.addDateHeader("Expires", 0); // never

		try (PrintWriter pw = response.getWriter()) {
			AbstractPersistence persistence = AbstractPersistence.get();
			try {
				try {
					persistence.begin();
					User user = WebUtil.processUserPrincipalForRequest(request, request.getUserPrincipal().getName(), true);
					if (user == null) {
						throw new SessionEndedException(request.getLocale());
					}
					persistence.setUser(user);

					String result = null;
					String queryName = request.getParameter(AbstractWebContext.QUERY_NAME);
					if (queryName != null) {
						result = processQuery(request);
					}
					else {
						String modelName = request.getParameter(AbstractWebContext.MODEL_NAME);
						if (modelName != null) {
							result = processModel(request, response);
						}
						else {
							result = processCollection(request, response);
						}
					}

					if (result != null) {
						pw.print(result);
					}
					else {
						pw.print(emptyResponse());
					}
				}
				catch (InvocationTargetException e) {
					throw e.getTargetException();
				}
			}
			catch (Throwable t) {
				t.printStackTrace();
				persistence.rollback();
				pw.print(emptyResponse());
			}
			finally {
				if (persistence != null) {
					persistence.commit(true);
				}
			}
		}
	}
	
	private static String processQuery(HttpServletRequest request)
	throws Exception {
		String moduleName = request.getParameter(AbstractWebContext.MODULE_NAME);
		String queryName = request.getParameter(AbstractWebContext.QUERY_NAME);
		String geometryBinding = request.getParameter(GEOMETRY_BINDING_NAME);
		
		AbstractPersistence persistence = AbstractPersistence.get();
		User user = persistence.getUser();
		Customer customer = user.getCustomer();
		Module module = customer.getModule(moduleName);
		MetaDataQueryDefinition query = module.getMetaDataQuery(queryName);
		if (query == null) {
			query = module.getDocumentDefaultQuery(customer, queryName);
		}
		DocumentQueryMapModel<Bean> model = new DocumentQueryMapModel<>(query);
		model.setGeometryBinding(geometryBinding);
		return JSON.marshall(customer, model.getResult(mapBounds(request)));
	}
	
	private static String processCollection(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		Customer customer = CORE.getCustomer();
		String contextKey = request.getParameter(AbstractWebContext.CONTEXT_NAME);
    	AbstractWebContext webContext = StateUtil.getCachedConversation(contextKey, request, response);
		Bean bean = WebUtil.getConversationBeanFromRequest(webContext, request);
		
		String collectionBinding = request.getParameter(AbstractWebContext.GRID_BINDING_NAME);
		String geometryBinding = request.getParameter(GEOMETRY_BINDING_NAME);
		ReferenceMapModel<Bean> model = new ReferenceMapModel<>(collectionBinding);
		model.setGeometryBinding(geometryBinding);
		model.setBean(bean);
		return JSON.marshall(customer, model.getResult(mapBounds(request)));
	}

	private static String processModel(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		Customer customer = CORE.getCustomer();
		String contextKey = request.getParameter(AbstractWebContext.CONTEXT_NAME);
		AbstractWebContext webContext = StateUtil.getCachedConversation(contextKey, request, response);
		Bean bean = WebUtil.getConversationBeanFromRequest(webContext, request);
		Module module = customer.getModule(bean.getBizModule());
		Document document = module.getDocument(customer, bean.getBizDocument());

		MapModel<Bean> model = document.getMapModel(customer, request.getParameter(AbstractWebContext.MODEL_NAME), true);
		model.setBean(bean);
		
		MapResult result = model.getResult(mapBounds(request));

		String json = JSON.marshall(customer, result);
		
		// Add _doc property to json response for resources such as images for map pins.
		String _doc = bean.getBizModule() + '.' + bean.getBizDocument();
		return json.substring(0, json.length() - 1) + ",\"_doc\":\"" + _doc + "\"}";
	}
	
	private static Geometry mapBounds(HttpServletRequest request) throws ParseException {
		Geometry result = null;

		WKTReader wkt = new WKTReader();
		GeometryFactory gf = new GeometryFactory();
		
		String ne = request.getParameter(NORTH_EAST_NAME);
		Coordinate topRight = (ne == null) ? new Coordinate(180, 90) : ((Point) wkt.read(ne)).getCoordinate();
		
		String sw = request.getParameter(SOUTH_WEST_NAME);
		Coordinate bottomLeft = (sw == null) ? new Coordinate(-180, -90) : ((Point) wkt.read(sw)).getCoordinate();
		
		Coordinate topLeft = new Coordinate(bottomLeft.x, topRight.y);
		Coordinate bottomRight = new Coordinate(topRight.x, bottomLeft.y);

		// If the bounds crosses the anti-meridian, split the polygon up at 180 Longitude 
		if (topLeft.x > bottomRight.x) { // crosses the anti-meridian
			Coordinate minus180Top = new Coordinate(-180, topLeft.y);
			result = gf.createMultiPolygon(new Polygon[] {
				gf.createPolygon(new Coordinate[] {
					topLeft,
					new Coordinate(180, topLeft.y),
					new Coordinate(180, bottomRight.y),
					bottomLeft,
					topLeft}),
				gf.createPolygon(new Coordinate[] {
						minus180Top,
						topRight,
						bottomRight,
						new Coordinate(-180, bottomRight.y),
						minus180Top
				})
			});
		}
		else {
			result = gf.createPolygon(new Coordinate[] {topLeft, topRight, bottomRight, bottomLeft, topLeft});
		}
			
		return result;
	}
	
	private static String emptyResponse() {
		return JSON.marshall(CORE.getCustomer(), new MapResult());
	}
}
