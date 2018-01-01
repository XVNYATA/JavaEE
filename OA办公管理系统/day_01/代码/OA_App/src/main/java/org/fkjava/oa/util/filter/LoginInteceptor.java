package org.fkjava.oa.util.filter;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.util.OAContant;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

//登录拦截器
public class LoginInteceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute(OAContant.SESSION_USER);
		
		//用户信息为空则跳转至登录页面，否则放行
		return user==null?Action.LOGIN : invocation.invoke();
	}

}
