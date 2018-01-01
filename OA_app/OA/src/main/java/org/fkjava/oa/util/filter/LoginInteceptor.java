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
public class LoginInteceptor extends AbstractInterceptor{

	@Autowired()
	private IdentityServiceI identityService;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute(OAContant.SESSION_USER);
		//如果user等于空就没有登录过跳转至登录页面，否则放行
		if(user==null){
			//session中用户信息为空时,还得判断cookie中是否还有信息保存
			//根据cookie中获取cookie
			Cookie cookie = CookieUtils.getCookieName(OAContant.USER_COOKIE);
			if(cookie!=null){
				//从cookie中获取获取用户的账号
				String userId = cookie.getValue();
				//根据用户的账号获取用户信息，并存放在session中
				user = identityService.getUserId(userId);
				ServletActionContext.getRequest().getSession().setAttribute(OAContant.SESSION_USER, user);
			}
		}
		//设置请求以及响应的编码格式
		System.out.println("----------------");
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		return user==null?Action.LOGIN : invocation.invoke();
	}
		
}
