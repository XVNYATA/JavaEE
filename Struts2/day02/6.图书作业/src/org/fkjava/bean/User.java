package org.fkjava.bean;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	
	private Integer id;
	private String username;
	private String loginname;
	private String password;
	
	public User() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
		return "User [id=" + id + ", username=" + username + ", loginname="
				+ loginname + ", password=" + password + "]";
	}
	
	
	
	
	

}
