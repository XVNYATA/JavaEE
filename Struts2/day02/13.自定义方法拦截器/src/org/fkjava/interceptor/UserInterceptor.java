package org.fkjava.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 继承MethodFilterInterceptor的拦截器需要重写doIntercept方法
 * */
public class UserInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		System.out.println("doIntercept --> Action执行之前");
		String result = invocation.invoke();
		System.out.println("doIntercept --> Action执行之后");
		return result;
	}

}
