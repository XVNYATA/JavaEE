package org.fkjava.bean;

public class User {
	
	private String loginname;
	private String password;
	
	public User() {
		super();
	}
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
	public String toString() {
		return "User [loginname=" + loginname + ", password=" + password + "]";
	}

}
