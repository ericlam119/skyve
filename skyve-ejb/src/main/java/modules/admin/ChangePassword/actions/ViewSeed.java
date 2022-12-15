package modules.admin.ChangePassword.actions;

import org.skyve.metadata.controller.ServerSideAction;
import org.skyve.metadata.controller.ServerSideActionResult;
import org.skyve.web.WebContext;

import modules.admin.ModulesUtil;
import modules.admin.User.UserExtension;
import modules.admin.domain.ChangePassword;

public class ViewSeed  implements ServerSideAction<ChangePassword> {

	@Override
	public ServerSideActionResult<ChangePassword> execute(ChangePassword bean, WebContext webContext) throws Exception {
		UserExtension user = ModulesUtil.currentAdminUser();
		bean.setTfaTOTPSeed(user.getTwoFactorTotpSeed());
		return new ServerSideActionResult<>(bean); 
	}
	
	

}
