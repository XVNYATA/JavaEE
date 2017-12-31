package org.fkjava.action;

import java.util.Map;

import org.fkjava.bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class LoginAction extends ActionSupport{

	private User user;
	
	public LoginAction() {
		super();
	}
	
	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	/**
	 * Struts会默认调用execute方法处理请求
	 * */
	public String execute(){
		System.out.println("execute -->>" + user);
		
		Map<String,Object> request 
			= (Map<String, Object>) ActionContext.getContext().get("request");
		
		request.put("country", "中国");
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.put("clazz", "j1604");
		
		Map<String,Object> application = ActionContext.getContext().getApplication();
		application.put("school", "疯狂软件");
		
		// 返回视图
		return this.SUCCESS;
	}
	
	

}
