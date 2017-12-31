package org.fkjava.dto;

import javax.xml.bind.annotation.XmlElement;

/**
 * <user>
		<loginname>jack</loginname>
		<password>123</password>
		<username>周杰伦</username>
		<sex>男</sex>
		<age>32</age>
	</user>
 * */
public class User {
	
	private String loginname;
	private String password;
	private String username;
	private String sex;
	private Integer age;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getLoginname() {
		return loginname;
	}
	
	@XmlElement(name="loginname")
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "User [loginname=" + loginname + ", password=" + password
				+ ", username=" + username + ", sex=" + sex + ", age=" + age
				+ "]";
	}
	
	

}
