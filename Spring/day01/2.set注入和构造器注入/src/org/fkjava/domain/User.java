package org.fkjava.domain;

import java.util.Date;

// domain  域模型 
public class User {
	
	private Integer id;
	private String name;
	private String sex;
	private Integer age;
	private Date currdate;
	
	public User() {
		super();
		System.out.println("User() -->> ");
	}
	
	// 有参数构造器
	public User(Integer id, String name, String sex, Integer age, Date currdate) {
		super();
		System.out.println("有参数User() -->> ");
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.currdate = currdate;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		System.out.println("setId() -->> ");
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getCurrdate() {
		return currdate;
	}
	public void setCurrdate(Date currdate) {
		this.currdate = currdate;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", sex=" + sex + ", age="
				+ age + ", currdate=" + currdate + "]";
	}
	
	

}
