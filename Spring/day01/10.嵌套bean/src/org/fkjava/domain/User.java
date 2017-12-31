package org.fkjava.domain;


// domain  域模型 
public class User {
	
	private Integer id;
	private String name;
	private String sex;
	private Integer age;
	
	private Dog dog;
	
	public User() {
		super();
		System.out.println("User() -->> ");
	}
	
	// 有参数构造器
	

	
	public User(Integer id, String name, String sex, Integer age, Dog dog) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.dog = dog;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	
	public Dog getDog() {
		return dog;
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", sex=" + sex + ", age="
				+ age + ", dog=" + dog + "]";
	}

	
	
	

}
