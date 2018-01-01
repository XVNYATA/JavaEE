package org.fkjava.j1303.ec.exception;

public class MultiUserFoundException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -342017119297017171L;
	private String loginName;

	/**
	 * 表示根据登录名找到多个的用户
	 * 
	 * @param loginName
	 */
	public MultiUserFoundException(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
}
