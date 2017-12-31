package org.fkjava.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class Login2Action implements Action {

	/**
	 * 对应jindex.jsp的参数，用于自动接收
	 * <input type="text" name="loginname">
	 * */
	private String loginname;
	private String password;
	
	
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
		if(loginname != null && loginname.equals("jack")
				&& password != null && password.equals("123")){
			
			// 获得HttpServletRequest对象
			HttpServletRequest request = ServletActionContext.getRequest();
			/** 保存数据到Session */
			request.getSession().setAttribute("username", "露丝");
			/** 保存数据到Application */
			ServletActionContext.getServletContext().setAttribute("school", "疯狂Java培训中心");
			/** 保存数据到Request */
			request.setAttribute("clazz", "j1603");
			
			/** 保存Cookie */
			Cookie cookie = new Cookie("id", "1");
			cookie.setMaxAge(60);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addCookie(cookie);
			
			return SUCCESS;
		}else{
			
			return ERROR;
		}
		
	}

}
