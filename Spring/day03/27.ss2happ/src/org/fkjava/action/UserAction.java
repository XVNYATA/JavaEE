package org.fkjava.action;

import org.fkjava.domain.User;
import org.fkjava.service.AppService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	
	// 依赖关系，使用Spring就不用new，而是依赖注入
	private AppService appService;
	
	public UserAction() {
		super();
		System.out.println("UserAction() -->> ");
	}

	public AppService getAppService() {
		return appService;
	}

	public void setAppService(AppService appService) {
		this.appService = appService;
	}

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String login() throws Exception {
		System.out.println("UserAction login() -->> ");
		user = appService.login(user.getLoginname(), user.getPassword());
		if(user != null){
			ActionContext.getContext().getSession().put("user", user);
			return this.SUCCESS;
		}
		return this.ERROR;
	}
	
	

}
