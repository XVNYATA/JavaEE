package org.fkjava.domain;

public class Dog {
	
	private String name;
	private String sex;
	public Dog() {
		super();
		// TODO Auto-generated constructor stub
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
	@Override
	public String toString() {
		return "Dog [name=" + name + ", sex=" + sex + "]";
	}
	
	

}
