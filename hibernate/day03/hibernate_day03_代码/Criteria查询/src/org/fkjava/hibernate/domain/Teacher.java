package org.fkjava.hibernate.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


@Entity @Table(name="TEA_INFO")
public class Teacher {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="TEA_ID")
	private int id;
	@Column(name="TEA_NAME", length=30, nullable=false)
	private String name;
	@Column(name="TEA_AGE")
	private int age;
	@Column(name="TEA_DEPT", length=50)
	private String dept;
	@Column(name="TEA_JOB", length=50)
	private String job;
	
	/** 一的一端 */
	@OneToMany(fetch=FetchType.LAZY, // 延迟加载
			  targetEntity=Student.class, // 关联的持久化类
			  mappedBy="teacher") // 代表不维护关联关系(外键列),写关联持久化类中哪个属性引用了它自己.
	private Set<Student> students = new HashSet<>();
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}
}