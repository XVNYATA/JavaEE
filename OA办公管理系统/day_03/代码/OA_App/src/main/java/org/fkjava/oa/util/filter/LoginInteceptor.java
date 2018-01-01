package org.fkjava.oa.util.filter;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.fkjava.oa.util.CookieUtils;
import org.fkjava.oa.util.OAContant;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

//登录拦截器
public class LoginInteceptor extends AbstractInterceptor {

	@Autowired
	IdentityServiceI identityService;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		//从session中获取用户信息
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute(OAContant.SESSION_USER);
		if(user==null){
			//session中用户信息为空时，还得判断cookie中是否有用户信息
			//根据cookie名字获取cookie
			Cookie cookie = CookieUtils.getCookieByName(OAContant.USER_COOKIE);
			if(cookie!=null){
				//从cookie中获取获取用户的账号
				String userId = cookie.getValue();
				//根据用户的账号获取用户信息，并存放在session中
				user = identityService.getUserById(userId);
				ServletActionContext.getRequest().getSession().setAttribute(OAContant.SESSION_USER, user);
			}
		}
		
		//设置请求以及响应的编码格式
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		//用户信息为空则跳转至登录页面，否则放行
		return user==null?Action.LOGIN : invocation.invoke();
	}

}
