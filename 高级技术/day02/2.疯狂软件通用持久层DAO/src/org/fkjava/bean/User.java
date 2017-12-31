package org.fkjava.bean;

/**
 * 规则：
1. 类必须是具体（非抽象）并且是公共的
2. 必须有无参数的构造方法
3. 字段必须提供set和get方法（属性）
4. 建议实现 Serializable（序列化） 接口
 * */
//Class 类
public class User {
	
	// Field 字段
	private Integer id;
	private String loginname;
	private String password;
	private String username;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String loginname, String password, String username) {
		super();
		this.loginname = loginname;
		this.password = password;
		this.username = username;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", loginname=" + loginname + ", password="
				+ password + ", username=" + username + "]";
	}
	
	

}
