package org.fkjava.action;

import org.fkjava.domain.User;
import org.fkjava.service.AppService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	
	private User user;
	private AppService appService;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setAppService(AppService appService) {
		this.appService = appService;
	}

	@Override
	public String execute() throws Exception {
		user = appService.login(user.getLoginname(), user.getPassword());
		ActionContext.getContext().getSession().put("user", user);
		return this.SUCCESS;
	}
	
	

}
