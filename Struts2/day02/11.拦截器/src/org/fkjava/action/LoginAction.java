package org.fkjava.action;


import java.util.logging.Logger;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.opensymphony.xwork2.util.logging.log4j2.Log4j2Logger;



public class LoginAction implements Action{
		
	private String loginname;
	private String password;
	
	public LoginAction() {
		super();
		
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("loginname：" + loginname);
		System.out.println("password：" + password);
		
		// 返回视图
		return SUCCESS;
	}
	
	
	

}
