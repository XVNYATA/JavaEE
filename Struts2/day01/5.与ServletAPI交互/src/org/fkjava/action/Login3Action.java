package org.fkjava.action;

import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.Action;

/**
 * 实现ServletRequestAware接口，需要重写setServletRequest，该方法传递了一个参数就是HttpServletRequest
 * */
public class Login3Action implements Action,ServletRequestAware,ServletResponseAware {
	
	private HttpServletRequest request;
	private HttpServletResponse response;

	@Override
	public String execute() throws Exception {
		System.out.println("execute() -->>");
		/** 保存数据到Request */
		request.setAttribute("clazz", "j1605");
		/** 保存数据到Session */
		request.getSession().setAttribute("username", "汤姆");
		/** 保存数据到Application */
		request.getServletContext().setAttribute("school", "疯狂java培训");
		/** 保存Cookie */
		Cookie cookie = new Cookie("id", "1");
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		
		return this.SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		System.out.println("setServletRequest() -->>");
		this.request = request;
		
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		System.out.println("setServletResponse() -->>");
		this.response = response;
	}

}
