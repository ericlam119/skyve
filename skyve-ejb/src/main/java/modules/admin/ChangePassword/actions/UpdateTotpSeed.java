package modules.admin.ChangePassword.actions;

import org.skyve.CORE;
import org.skyve.domain.messages.ValidationException;
import org.skyve.metadata.controller.ServerSideAction;
import org.skyve.metadata.controller.ServerSideActionResult;
import org.skyve.web.WebContext;

import modules.admin.ModulesUtil;
import modules.admin.User.UserExtension;
import modules.admin.domain.ChangePassword;

public class UpdateTotpSeed implements ServerSideAction<ChangePassword> {

	@Override
	public ServerSideActionResult<ChangePassword> execute(ChangePassword bean, WebContext webContext) throws Exception {
		
		if(bean.getNewtfaTOTPSeed() == null) {
			throw new ValidationException("Generate a new Seed");
		}
		UserExtension user = ModulesUtil.currentAdminUser();
		user.setTwoFactorTotpSeed(bean.getNewtfaTOTPSeed());
		
		CORE.getPersistence().save(user);
		
		return new ServerSideActionResult<>(bean); 
	}

}
