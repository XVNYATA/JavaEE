package org.fkjava.j1303.ec.exception;

/**
 * 表示用户已经存在于数据库中，注册失败的时候出现此异常
 * 
 * @author lwq
 * 
 */
public class UserIsAlreadyExistsException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5323582142237998850L;
	private String loginName;

	public String getLoginName() {
		return loginName;
	}

	public UserIsAlreadyExistsException(String loginName) {
		this.loginName = loginName;
	}

	@Override
	public String toString() {
		return "User [" + loginName + "] is already exists";
	}
}
