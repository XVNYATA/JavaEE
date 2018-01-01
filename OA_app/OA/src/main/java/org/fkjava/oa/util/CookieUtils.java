package org.fkjava.oa.util;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

public class CookieUtils {

	//添加cookie
	public static void addCookie(String cookieName, String userId, int time) {
		// TODO Auto-generated method stub
		//根据cookie名字判断cookie是否存在
		Cookie cookie = getCookieName(cookieName);
		if(cookie==null){
			//第一个参数名字
			cookie = new Cookie(cookieName, userId);
		}
		//设置cookie的存活时间
		cookie.setMaxAge(time);
		//设置cookie的访问作用域
		cookie.setPath("/");
		//将cookie响应到客
		ServletActionContext.getResponse().addCookie(cookie);
		
	}

	//获取cookie信息
	public static Cookie getCookieName(String cookieName) {
		// TODO Auto-generated method stub
		Cookie[] cookies = ServletActionContext.getRequest().getCookies();
		if(cookies!=null){
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals(cookieName)){
					return cookie;
				}
			}
		}
		return null;
	}

	//删除cookie信息
	public static void removeCookie(String cookieName) {
		// TODO Auto-generated method stub
		Cookie cookie = getCookieName(cookieName);
		if(cookie!=null){
			cookie.setMaxAge(0);
			cookie.setPath("/");
		}
		//将cookie响应至客户端
		ServletActionContext.getResponse().addCookie(cookie);
	}
	
}
