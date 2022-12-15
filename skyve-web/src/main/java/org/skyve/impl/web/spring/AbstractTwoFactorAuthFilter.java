package org.skyve.impl.web.spring;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.skyve.EXT;
import org.skyve.domain.messages.DomainException;
import org.skyve.impl.util.TFAConfigurationSingleton;
import org.skyve.impl.util.UtilImpl;
import org.springframework.security.authentication.AuthenticationEventPublisher;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

public abstract class AbstractTwoFactorAuthFilter extends UsernamePasswordAuthenticationFilter {
	
	private static final AntPathRequestMatcher DEFAULT_LOGIN_ATTEMPT_ANT_PATH_REQUEST_MATCHER = new AntPathRequestMatcher("/loginAttempt", "POST");
	
	public static final String SKYVE_SECURITY_FORM_CUSTOMER_KEY = "customer";
	
	public static String TWO_FACTOR_PASSWORD_ATTRIBUTE = "tfaPassword";
	public static String TWO_FACTOR_CODE_ATTRIBUTE = "tfaCode";
	
//	public static String TWO_FACTOR_TOKEN_ATTRIBUTE = "tfaToken";
	public static String USER_ATTRIBUTE = "user"; 
	public static String CUSTOMER_ATTRIBUTE = "customer";
	
	public static String REMEMBER_ATTRIBUTE = "remember";
	
	// this is from the SpringSecurityConfig.remember me.
	public static String REMEMBER_PARAMETER = "remember";
	
	private UserDetailsManager userDetailsManager;
	

    private AuthenticationEventPublisher authEventPublisher;
    
    public AbstractTwoFactorAuthFilter(UserDetailsManager userDetailsManager) {
    	setRequiresAuthenticationRequestMatcher(DEFAULT_LOGIN_ATTEMPT_ANT_PATH_REQUEST_MATCHER);
		this.userDetailsManager = userDetailsManager;
    }
    
	public void setAuthenticationEventPublisher(AuthenticationEventPublisher authEventPublisher) {
		this.authEventPublisher = authEventPublisher;
	}
	
	protected AuthenticationEventPublisher getAuthenticationEventPublisher() {
		return this.authEventPublisher;
	}
	
	@Override
	public void doFilter(ServletRequest iRequest, ServletResponse iResponse, FilterChain chain)
	throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) iRequest;
		HttpServletResponse response = (HttpServletResponse) iResponse;
		
		if (skipTFAFilter(request, response)) {
			chain.doFilter(request, response);
			return;
		}
		
		if (isTFARequired(request)) {
			doTFAFilter(request, response, chain);
			return;
		}
		
		chain.doFilter(request, response);
	
	}
	
	protected abstract boolean isTFARequired(HttpServletRequest request);
	
	protected abstract void doTFAFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException;
	
	protected boolean skipTFAFilter(HttpServletRequest request, HttpServletResponse response) {
		// No two factor customers defined
		if (UtilImpl.TFA_CUSTOMER == null) {
			return true;
		}
		
		// Not a login attempt
		if (! DEFAULT_LOGIN_ATTEMPT_ANT_PATH_REQUEST_MATCHER.matches(request)) {
			return true;
		}
		
		String customerName = obtainCustomer(request);
		if (!UtilImpl.TFA_CUSTOMER.contains(customerName)) {
			return true;
		}
		
		// No customer given or set in JSON
		if (customerName == null) {
			return true;
		}

		// TFA customer not in json
		if (! UtilImpl.TFA_CUSTOMER.contains(customerName)) {
			return true;
		}

		// No authentication required
		if (! requiresAuthentication(request, response)) {
			return true;
		}
				
		return false;
	}
	
	@Override
	protected String obtainUsername(HttpServletRequest request) {
		return UtilImpl.processStringValue(super.obtainUsername(request));
	}

	@SuppressWarnings("static-method")
	protected String obtainCustomer(HttpServletRequest request) {
		String customerName = UtilImpl.processStringValue(request.getParameter(SKYVE_SECURITY_FORM_CUSTOMER_KEY));
		if (customerName == null) {
			customerName = UtilImpl.CUSTOMER;
		}
		
		return customerName;
	}
	
	protected UserTFA getUserDB(HttpServletRequest request) {
		return getUserDB(obtainUsername(request));
	}
	
	/**
	 * Get the user details required for this filter
	 * 
	 * @param username	customer/username
	 * @return
	 * @throws Exception 
	 */
	protected UserTFA getUserDB(String username) {
		UserDetails userDetails;
		try {
			userDetails = userDetailsManager.loadUserByUsername(username);
		}
		catch (@SuppressWarnings("unused") UsernameNotFoundException e) {
			// incorrect username
			return null;
		}
		
		if (userDetails instanceof UserTFA) {
			return (UserTFA) userDetails;
		}
		throw new DomainException("Two Factor Authentication expects the user details service : skyve.jdbcUserDetailsService()");
	}
	
	protected void updateUserTFADetails(UserTFA user) {
		userDetailsManager.updateUser(user);
	}
	
	protected void publishAuthenticationFailedEvent(String username) {
		UsernamePasswordAuthenticationToken authRequest = UsernamePasswordAuthenticationToken.unauthenticated(username,"");
		BadCredentialsException bce  = new BadCredentialsException("Incorrect OTP");
		this.authEventPublisher.publishAuthenticationFailure(bce, authRequest);
		
	}
	
	/**
	 * note: return true here does not log the user in.
	 * Checks the credentials are correct before sending the push notification
	 * 
	 * @param request
	 * @return
	 */
	protected boolean canAuthenticateWithPassword(HttpServletRequest request, UserTFA user) {
		String password = obtainPassword(request);
		password = (password != null) ? password : "";
		
		return EXT.checkPassword(password, user.getUserPassword());
	}
}
