package modules.admin.ChangePassword.actions;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SecureRandom;

import org.apache.commons.codec.binary.Base32;
import org.skyve.metadata.controller.ServerSideAction;
import org.skyve.metadata.controller.ServerSideActionResult;
import org.skyve.web.WebContext;

import modules.admin.domain.ChangePassword;

public class GenerateTotpSeed implements ServerSideAction<ChangePassword> {

	@Override
	public ServerSideActionResult<ChangePassword> execute(ChangePassword bean, WebContext webContext) throws Exception {
		String newCode = generateSecretKey();
		bean.setNewtfaTOTPSeed(newCode);
		
		
		return new ServerSideActionResult<>(bean); 
	}
	
	
//	private static void createQRCode(String barCodeData, String filePath, int height, int width) throws WriterException, IOException {
//	    BitMatrix matrix = new MultiFormatWriter().encode(barCodeData, BarcodeFormat.QR_CODE, width, height);
//	    try (FileOutputStream out = new FileOutputStream(filePath)) {
//	        MatrixToImageWriter.writeToStream(matrix, "png", out);
//	    }
//	}
	
	private static String generateStringForQR(String secretKey, String account, String issuer) {
	    try {
	        return "otpauth://totp/"
	                + URLEncoder.encode(issuer + ":" + account, "UTF-8").replace("+", "%20")
	                + "?secret=" + URLEncoder.encode(secretKey, "UTF-8").replace("+", "%20")
	                + "&issuer=" + URLEncoder.encode(issuer, "UTF-8").replace("+", "%20");
	    } catch (UnsupportedEncodingException e) {
	        throw new IllegalStateException(e);
	    }
	}

	private static String  generateSecretKey() {
	    SecureRandom random = new SecureRandom();
	    byte[] bytes = new byte[20];
	    random.nextBytes(bytes);
	    Base32 base32 = new Base32();
	    return base32.encodeToString(bytes);
	    
	}
	
}
