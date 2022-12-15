package org.skyve.impl.web.spring;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import org.skyve.impl.util.TFAConfigurationSingleton;
import org.skyve.impl.util.UtilImpl;
import org.springframework.security.provisioning.UserDetailsManager;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import de.taimos.totp.TOTP;

public class TwoFactorAuthFilter  extends AbstractTwoFactorAuthFilter {

	
	public TwoFactorAuthFilter(UserDetailsManager userDetailsManager) {
		super(userDetailsManager);
	}
	
	@Override
	protected boolean isTFARequired(HttpServletRequest request) {
		String customerName = obtainCustomer(request);
		
		UserTFA userTfa = getUserDB(request);
		if (userTfa.getTotpSeed() == null) {
			return false;
		}
		if (!canAuthenticateWithPassword(request, userTfa)) {
			return false;
		}
		
		return TFAConfigurationSingleton.getInstance().isTfaTOTP(customerName);
	}

	@Override
	protected void doTFAFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) 
	throws IOException, ServletException{
		String username = obtainUsername(request);
		UserTFA user = getUserDB(username);
		
		String twoFactorCode = UtilImpl.processStringValue(request.getParameter(TWO_FACTOR_CODE_ATTRIBUTE));
		if (twoFactorCode == null) {
			
			// save previous selected remember me token so it can be sent back
			boolean rememberMe = request.getParameter(REMEMBER_PARAMETER) != null;
			
			TwoFactorAuthenticationForwardHandler handler = new TwoFactorAuthenticationForwardHandler("/login");
			request.setAttribute(CUSTOMER_ATTRIBUTE, user.getCustomer());
			request.setAttribute(TWO_FACTOR_PASSWORD_ATTRIBUTE,  super.obtainPassword(request));
			request.setAttribute(USER_ATTRIBUTE, user.getUser());
			request.setAttribute(REMEMBER_ATTRIBUTE, Boolean.valueOf(rememberMe));
			handler.onAuthenticationFailure(request, response, new TwoFactorAuthRequiredException("OTP sent", false));
			return;
		}
		
		if( checkTOTPCode(request, response) ) {
			chain.doFilter(request, response);
			return;
		} else {
			this.publishAuthenticationFailedEvent(username);
			
			UtilImpl.LOGGER.info("Provided TFA code does not match."); 
			TwoFactorAuthenticationForwardHandler handler = new TwoFactorAuthenticationForwardHandler("/login");
			request.setAttribute(CUSTOMER_ATTRIBUTE, user.getCustomer());
			request.setAttribute(TWO_FACTOR_PASSWORD_ATTRIBUTE,  super.obtainPassword(request));
			request.setAttribute(USER_ATTRIBUTE, user.getUser());
			handler.onAuthenticationFailure(request, response, new TwoFactorAuthRequiredException("OTP Request", true));
			return;
		}
			
		
	}


	private boolean checkTOTPCode(HttpServletRequest request, HttpServletResponse response) {
		// get this as a query from user
//		String secretKey = "OIOO6UNMFDDM7D5YYKCBJZR4AX3IKO5H";
		
		String secretKey = getUserDB(request).getTotpSeed();
		String twoFactorCode = UtilImpl.processStringValue(request.getParameter(TWO_FACTOR_CODE_ATTRIBUTE));
		String code = getExpectedTOTPCode(secretKey);
		
		return code.equals(twoFactorCode);
	}
	
	private static String getExpectedTOTPCode(String secretKey) {
	    Base32 base32 = new Base32();
	    byte[] bytes = base32.decode(secretKey);
	    String hexKey = Hex.encodeHexString(bytes);
	    return TOTP.getOTP(hexKey);
	}
	
	///////////////////////////////////////////////////////
	// DEV / Test methodss
	/////////////////////////////////////////////

	public static void main (String [] args) {
		System.out.println(generateSecretKey());
		String secretKey = "OIOO6UNMFDDM7D5YYKCBJZR4AX3IKO5H";
		String company = "bizhub";
		String username = "eric.lam@bizhub.com.au";
		
		String code = getGoogleAuthenticatorBarCode(secretKey, company, username);

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
		    String code = getExpectedTOTPCode(secretKey);
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
