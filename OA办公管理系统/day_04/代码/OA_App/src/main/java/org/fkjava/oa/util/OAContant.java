package org.fkjava.oa.util;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.bean.User;

public class OAContant {

	//指定session中用户的key值
	public final static String SESSION_USER = "session_user";
	//指定验证码对应的key值
	public static final String VCODE = "vcode";
	
	//指定用户信息对应的cookie名字
    public static final String USER_COOKIE = "userCookie";

	public static User getCurrentUser() {
		// TODO Auto-generated method stub
		return (User)ServletActionContext.getRequest().getSession().getAttribute("session_user");
	}

}
