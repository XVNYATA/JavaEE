package org.fkjava.dto;
/**
 * <student class="j1301">
		<name>周杰伦</name>
		<sex>男</sex>
		<age>25</age>
	</student>
 * */
public class Student {
	
	private String name;
	private String sex;
	private Integer age;
	private String clazz;
	
	public Student() {
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
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getClazz() {
		return clazz;
	}
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}
	@Override
	public String toString() {
		return "Student [name=" + name + ", sex=" + sex + ", age=" + age
				+ ", clazz=" + clazz + "]";
	}
	
	
}
