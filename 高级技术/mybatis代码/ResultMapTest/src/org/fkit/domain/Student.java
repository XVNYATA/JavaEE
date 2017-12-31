package org.fkit.domain;
/**
 * CREATE TABLE TB_CLAZZ(
id INT PRIMARY KEY AUTO_INCREMENT,
CODE VARCHAR(18)
);
INSERT INTO TB_CLAZZ(CODE) VALUES('j1601');
INSERT INTO TB_CLAZZ(CODE) VALUES('j1602');
CREATE TABLE TB_STUDENT(
id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(18),
sex CHAR(3),
age INT,
clazz_id INT,
FOREIGN KEY (clazz_id) REFERENCES TB_CLAZZ(id)
);
INSERT INTO TB_STUDENT(NAME,sex,age,clazz_id) VALUES('jack','男',22,1);
INSERT INTO TB_STUDENT(NAME,sex,age,clazz_id) VALUES('rose','女',18,1);
INSERT INTO TB_STUDENT(NAME,sex,age,clazz_id) VALUES('tom','男',25,2);
INSERT INTO TB_STUDENT(NAME,sex,age,clazz_id) VALUES('mary','女',20,2);

 * */
public class Student {
	
	private Integer id;
	private String name;
	private String sex;
	private Integer age;
	
	// 多对一 clazz_id
	private Clazz clazz;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
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
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", sex=" + sex
				+ ", age=" + age + ", clazz=" + clazz + "]";
	}
	
	

}
