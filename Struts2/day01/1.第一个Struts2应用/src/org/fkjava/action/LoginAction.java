package org.fkjava.action;

import java.lang.reflect.Method;

/**
 * 开发 struts2框架的   业务逻辑  控制器
 * 就是一个普通的java类，没有依赖任何外部 API
 */
public class LoginAction {
	
	/**
	 * 对应index.jsp提交的参数
	 * */
	private String loginname;
	private String password;
	
	public LoginAction() {
		super();
		System.out.println("LoginAction() -->>");
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		System.out.println("setLoginname -->>");
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * Struts会默认调用execute方法处理请求
	 * */
	public String execute(){
		System.out.println("execute -->>");
		System.out.println("loginname：" + loginname);
		System.out.println("password：" + password);
		
		// 返回视图
		return "success";
	}
	
	

}
