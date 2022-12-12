package org.skyve.impl.web.spring;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.UUID;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import org.skyve.EXT;
import org.skyve.domain.messages.DomainException;
import org.skyve.domain.types.DateTime;
import org.skyve.domain.types.Timestamp;
import org.skyve.impl.util.TFAConfigurationSingleton;
import org.skyve.impl.util.TwoFactorCustomerConfiguration;
import org.skyve.impl.util.UtilImpl;
import org.skyve.util.Mail;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import de.taimos.totp.TOTP;

public class TwoFactorAuthFilter  extends UsernamePasswordAuthenticationFilter {
	private static final AntPathRequestMatcher DEFAULT_LOGIN_ATTEMPT_ANT_PATH_REQUEST_MATCHER = new AntPathRequestMatcher("/loginAttempt", "POST");

	private static final String TFA_CODE_KEY = "{tfaCode}"; 
	
	public static final String SYSTEM_TWO_FACTOR_CODE_SUBJECT = "Please verify your email security code";
	public static final String SYSTEM_TWO_FACTOR_CODE_BODY = "Hi,<br /><br />Your verification code is: {tfaCode}<br />"; 
	
	
	public static final String SKYVE_SECURITY_FORM_CUSTOMER_KEY = "customer";
	
	public static String TWO_FACTOR_TOKEN_ATTRIBUTE = "tfaToken";
	public static String USER_ATTRIBUTE = "user"; 
	public static String CUSTOMER_ATTRIBUTE = "customer";
	
	public static String REMEMBER_ATTRIBUTE = "remember";
	
	// this is from the SpringSecurityConfig.remember me.
	public static String REMEMBER_PARAMETER = "remember";
	
	private UserDetailsManager userDetailsManager;
	
	private boolean failAuthentication = false;

	public TwoFactorAuthFilter(UserDetailsManager userDetailsManager) {
		setRequiresAuthenticationRequestMatcher(DEFAULT_LOGIN_ATTEMPT_ANT_PATH_REQUEST_MATCHER);
		this.userDetailsManager = userDetailsManager;
	}
	
	@Override
	public void doFilter(ServletRequest iRequest, ServletResponse iResponse, FilterChain chain)
	throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) iRequest;
		HttpServletResponse response = (HttpServletResponse) iResponse;
		
		String customerName = obtainCustomer(request);
		
		if (skipTFAFilter(request, response)) {
			chain.doFilter(request, response);
			return;
		}
		
		
		if (TFAConfigurationSingleton.getInstance().isTfaPush(customerName)) {
			doPushFilter(request, response, chain);
			return;
		} else if (TFAConfigurationSingleton.getInstance().isTfaTOTP(customerName)) {
			doTOTPFilter(request, response, chain);
			return;
		}
		
		
		chain.doFilter(request, response);
	}

	
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
	
	private void doPushFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) 
	throws IOException, ServletException{
		String twoFactorToken = UtilImpl.processStringValue(request.getParameter(TWO_FACTOR_TOKEN_ATTRIBUTE));
		if (twoFactorToken != null) {
			boolean stopSecFilterChain = doTFACodeCheckProcess(request,response);
			
			if (! stopSecFilterChain) {
				chain.doFilter(request, response);
			}
			return;
		}
		
		// if it gets to here, there is no two factor token.
		// take the opportunity in this method to clear the old TFA details if they exist;
		if ( TFAConfigurationSingleton.getInstance().getConfig(obtainCustomer(request)).isTfaEmail() ) {
			boolean stopSecFilterChain = doPushNotificationProcess(request, response);
			
			if (! stopSecFilterChain) {
				chain.doFilter(request, response);
			}
			return;
		}

		chain.doFilter(request, response);
	}
	
	private void doTOTPFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) 
	throws IOException, ServletException{
		String username = obtainUsername(request);
		UserTFA user = getUserDB(username);
		
		//TBD currently use the exisitng logic, dont bother checking the token
		// if token exists, user is coming in from TOTP entry page
		// if no token, send paramters back to show user TOTP token entry page.
		String twoFactorToken = UtilImpl.processStringValue(request.getParameter(TWO_FACTOR_TOKEN_ATTRIBUTE));
		if (twoFactorToken == null) {
			
			// save previous selected remember me token so it can be sent back
			boolean rememberMe = request.getParameter(REMEMBER_PARAMETER) != null;
			
			TwoFactorAuthenticationForwardHandler handler = new TwoFactorAuthenticationForwardHandler("/login");

			request.setAttribute(CUSTOMER_ATTRIBUTE, user.getCustomer());
			request.setAttribute(TWO_FACTOR_TOKEN_ATTRIBUTE,  user.getTfaToken());
			request.setAttribute(USER_ATTRIBUTE, user.getUser());
			request.setAttribute(REMEMBER_ATTRIBUTE, Boolean.valueOf(rememberMe));
			handler.onAuthenticationFailure(request, response, new TwoFactorAuthRequiredException("OTP sent", false));
			return ;
		}
		
		
		
		// if it gets to here, there is no two factor token.
		// take the opportunity in this method to clear the old TFA details if they exist;
		if ( TFAConfigurationSingleton.getInstance().getConfig(obtainCustomer(request)).isTfaTOTP() ) {
			if( checkTOTPCode(request, response) ) {
			
				// this is here so we can use the default # of login attempts and waits
				try {
					this.failAuthentication = true;
					attemptAuthentication(request, response);
				}
				catch (@SuppressWarnings("unused") AuthenticationException e) {
					this.failAuthentication = false;
					// throws error if authentication failed, catch so we want to handle it
					UtilImpl.LOGGER.info("Provided TFA code does not match."); 
					TwoFactorAuthenticationForwardHandler handler = new TwoFactorAuthenticationForwardHandler("/login");
					
					request.setAttribute(CUSTOMER_ATTRIBUTE, user.getCustomer());
					request.setAttribute(TWO_FACTOR_TOKEN_ATTRIBUTE,  "notnull");
					request.setAttribute(USER_ATTRIBUTE, user.getUser());
					handler.onAuthenticationFailure(request, response, new TwoFactorAuthRequiredException("OTP sent", true));
					return;
				}
			}
			
			// totp code correct continue on
			chain.doFilter(request, response);
			return;
		}

		chain.doFilter(request, response);
	}
	
	
	
	@Override
	protected String obtainPassword(HttpServletRequest request) {
		
		String pwd =  UtilImpl.processStringValue(super.obtainPassword(request));
		if (failAuthentication) {
			pwd = pwd + String.valueOf(Math.random());
		}
		return pwd;
	}

	private boolean checkTOTPCode(HttpServletRequest request, HttpServletResponse response) {
		// get this as a query from user
		String secretKey = "OIOO6UNMFDDM7D5YYKCBJZR4AX3IKO5H";
		String twoFactorToken = UtilImpl.processStringValue(request.getParameter(TWO_FACTOR_TOKEN_ATTRIBUTE));
		
		String code = getTOTPCode(secretKey);
		
		return code.equals(twoFactorToken);
	}
	
	/**
	 * This gets called when:
	 * - a push notification needs to be sent.
	 * - a user is not performing a 2FA code entry.
	 * 
	 * At the end of this method, the 2FA details will either be updated with the new details or cleared.
	 * 
	 * @param request
	 * @param response
	 * @return true: halt at this filter. false: continue to next security filter.
	 * @throws IOException
	 * @throws ServletException
	 */
	private boolean doPushNotificationProcess(HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException {
		String username = obtainUsername(request);
		String customer = obtainCustomer(request);
		
		UserTFA user = getUserDB(username);
		
		if (user == null) {
			return false;
		}
		
		// if cannot authenticate, let the security chain continue
		// don't send the push notification
		// let whoever handles incorrect credentials take over
		// i.e fall out of this filter without doing anything (call chain.doFilter(...))
		if (canAuthenticateWithPassword(request, user)) {
			UtilImpl.LOGGER.info("Sending 2fa code push notification "); 
			
			// save previous selected remember me token so it can be sent back
			boolean rememberMe = request.getParameter(REMEMBER_PARAMETER) != null;
			
			String twoFactorCodeClearText = generateTFACode();
			
			Timestamp generatedTS = new Timestamp();
			user.setTfaCodeGeneratedTimestamp(generatedTS);
			user.setTfaCode(EXT.hashPassword(twoFactorCodeClearText));
			user.setTfaToken(generateTFAPushId(generatedTS));
			
			updateUserTFADetails(user);
			
			pushNotification(user, twoFactorCodeClearText);

			// redirect to 2FA code entry page
			TwoFactorAuthenticationForwardHandler handler = new TwoFactorAuthenticationForwardHandler("/login");

			request.setAttribute(CUSTOMER_ATTRIBUTE, customer);
			request.setAttribute(TWO_FACTOR_TOKEN_ATTRIBUTE,  user.getTfaToken());
			request.setAttribute(USER_ATTRIBUTE, user.getUser());
			request.setAttribute(REMEMBER_ATTRIBUTE, Boolean.valueOf(rememberMe));
			handler.onAuthenticationFailure(request, response, new TwoFactorAuthRequiredException("OTP sent", false));
			return true;
		}
		
		clearTFADetails(user);
		return false;
	}
	
	/**
	 * if everything checks out and its just the code which is incorrect, then let the user enter the code again.
	 * 
	 * @param request
	 * @param response
	 * @return true: halt at this filter. false: continue to next security filter.
	 * @throws IOException
	 * @throws ServletException
	 */
	private boolean doTFACodeCheckProcess(HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException {
		String twoFactorToken = UtilImpl.processStringValue(request.getParameter(TWO_FACTOR_TOKEN_ATTRIBUTE));
		String username = obtainUsername(request);
		UserTFA user = getUserDB(username);
		
		if ((! tfaCodesPopulated(user)) || (! twoFactorToken.equals(user.getTfaToken())) ) {
			UtilImpl.LOGGER.info("Inconsistent TFA details. TFA Codes populated : " + 
									String.valueOf(tfaCodesPopulated(user)) +
									", TFA Token matches: " + 
									String.valueOf(twoFactorToken.equals(user.getTfaToken())));
			return false;
		}
		
		if (tfaCodeExpired(user.getCustomer(), twoFactorToken)) {
			UtilImpl.LOGGER.info("Users TFA Code has timed out.");
			SimpleUrlAuthenticationFailureHandler handler = new SimpleUrlAuthenticationFailureHandler("/login");
			handler.onAuthenticationFailure(request, response, new AccountExpiredException("TFA timeout"));
			return true;
		}
		
		try {
			attemptAuthentication(request, response);
		}
		catch (@SuppressWarnings("unused") AuthenticationException e) {
			// throws error if authentication failed, catch so we want to handle it
			UtilImpl.LOGGER.info("Provided TFA code does not match."); 
			TwoFactorAuthenticationForwardHandler handler = new TwoFactorAuthenticationForwardHandler("/login");
			request.setAttribute(CUSTOMER_ATTRIBUTE, user.getCustomer());
			request.setAttribute(TWO_FACTOR_TOKEN_ATTRIBUTE,  user.getTfaToken());
			request.setAttribute(USER_ATTRIBUTE, user.getUser());
			handler.onAuthenticationFailure(request, response, new TwoFactorAuthRequiredException("OTP sent", true));
			return true;
		}
		
		return false;
	}
	
	private void clearTFADetails(UserTFA user) {
		boolean edited = false;
		
		if (user.getTfaCodeGeneratedTimestamp() != null) {
			user.setTfaCodeGeneratedTimestamp(null);
			edited = true;
		}
		
		if (user.getTfaCode() != null) {
			user.setTfaCode(null);
			edited = true;
		}
		
		if (user.getTfaToken() != null) {
			user.setTfaToken(null);
			edited = true;
		}

		if (edited) {
			updateUserTFADetails(user);
		}
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
	
	protected void pushNotification(UserTFA user, String code) {
		String emailAddress = user.getEmail();
		if (emailAddress == null) {
			UtilImpl.LOGGER.warning("No email found for user : " + user.getUsername()); 
			return;
		}
		
		String emailSubjectDB = null;
		String emailBodyDB = null;
		try (Connection c = EXT.getDataStoreConnection()) {
			try (PreparedStatement s = c.prepareStatement("select twoFactorEmailSubject, twoFactorEmailBody from ADM_Configuration where bizCustomer = ?")) {
				s.setString(1, user.getCustomer());
				try (ResultSet rs = s.executeQuery()) {
					if (rs.next()) {
						emailSubjectDB = rs.getString(1);
						emailBodyDB = rs.getString(2);
					}
				}
			}
		}
		catch (SQLException e) {
			throw new DomainException("Failed to get Configuration email template", e);
		}
		
		String emailBody = (emailBodyDB == null) ? SYSTEM_TWO_FACTOR_CODE_BODY : emailBodyDB;
		String emailSubject = (emailSubjectDB == null) ? SYSTEM_TWO_FACTOR_CODE_SUBJECT : emailSubjectDB;
		EXT.sendMail(new Mail().addTo(emailAddress)
								.from(UtilImpl.SMTP_SENDER)
								.subject(emailSubject)
								.body(emailBody.replace(TFA_CODE_KEY, code)));
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

	@SuppressWarnings("static-method")
	protected String generateTFAPushId(Timestamp generatedTS) {
		return UUID.randomUUID().toString() + "-" + Long.toString(generatedTS.getTime());
	}
	
	@SuppressWarnings("static-method")
	protected String generateTFACode() {
	    // Get 128 random bytes - move past first seed sequence
		SecureRandom random = new SecureRandom();
	    byte[] randomBytes = new byte[128];
	    random.nextBytes(randomBytes);
	    
		return new DecimalFormat("000000").format(random.nextDouble() * 1000000d);
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
	
	@SuppressWarnings("static-method")
	protected boolean tfaCodeExpired(String customer, String twoFactorCode) {
		
		long generatedTime;
		try {
			String [] splitParts = twoFactorCode.split("-");
			String timeComponent = splitParts[splitParts.length-1];
			
			generatedTime = Long.parseLong(timeComponent);
		} 
		catch (@SuppressWarnings("unused") NumberFormatException e) {
			//code tampered with?
			return true;
		}
		
		long expiryMillis = getTwoFactorTimeoutMillis(customer);
		long currentTime = new DateTime().getTime();
		
		return currentTime > (generatedTime + expiryMillis);
	}
	
	private long getTwoFactorTimeoutMillis(String customer) {
		TwoFactorCustomerConfiguration config = TFAConfigurationSingleton.getInstance().getConfig(customer);
		int timeoutSeconds = config.getTfaTimeOutSeconds();
		return timeoutSeconds * 1000;
	}
	
	/**
	 * Check the user and see if they have the necessary TFA codes populated
	 * 
	 * @param user
	 * @return
	 */
	@SuppressWarnings("static-method")
	protected boolean tfaCodesPopulated(UserTFA user) {
		return ((user.getTfaCode() != null) &&
				(user.getTfaToken() != null) &&
				(user.getTfaCodeGeneratedTimestamp() != null));
	}
	

	public static void main (String [] args) {
		System.out.println(generateSecretKey());
		String secretKey = "OIOO6UNMFDDM7D5YYKCBJZR4AX3IKO5H";
		String company = "bizhub";
		String username = "eric.lam@bizhub.com.au";
		
		String code = getGoogleAuthenticatorBarCode(secretKey, company, username);

//		printCode(secretKey);
		try {
			createQRCode(code, "C:\\code\\code.png", 300, 300);
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		printCode(secretKey);
	}
	
	public static void createQRCode(String barCodeData, String filePath, int height, int width) throws WriterException, IOException {
	    BitMatrix matrix = new MultiFormatWriter().encode(barCodeData, BarcodeFormat.QR_CODE, width, height);
	    try (FileOutputStream out = new FileOutputStream(filePath)) {
	        MatrixToImageWriter.writeToStream(matrix, "png", out);
	    }
	}
	
	public static void printCode(String secretKey) {
		String lastCode = null;
		while (true) {
		    String code = getTOTPCode(secretKey);
		    if (!code.equals(lastCode)) {
		        System.out.println(code);
		    }
		    lastCode = code;
		    try {
		        Thread.sleep(1000);
		    } catch (InterruptedException e) {};
		}
	}
	
		
	public static String  generateSecretKey() {
	    SecureRandom random = new SecureRandom();
	    byte[] bytes = new byte[20];
	    random.nextBytes(bytes);
	    Base32 base32 = new Base32();
	    return base32.encodeToString(bytes);
	    
	}
	
	public static String getTOTPCode(String secretKey) {
	    Base32 base32 = new Base32();
	    byte[] bytes = base32.decode(secretKey);
	    String hexKey = Hex.encodeHexString(bytes);
	    return TOTP.getOTP(hexKey);
	}
	
	public static String getGoogleAuthenticatorBarCode(String secretKey, String account, String issuer) {
	    try {
	        return "otpauth://totp/"
	                + URLEncoder.encode(issuer + ":" + account, "UTF-8").replace("+", "%20")
	                + "?secret=" + URLEncoder.encode(secretKey, "UTF-8").replace("+", "%20")
	                + "&issuer=" + URLEncoder.encode(issuer, "UTF-8").replace("+", "%20");
	    } catch (UnsupportedEncodingException e) {
	        throw new IllegalStateException(e);
	    }
	}
	
}
