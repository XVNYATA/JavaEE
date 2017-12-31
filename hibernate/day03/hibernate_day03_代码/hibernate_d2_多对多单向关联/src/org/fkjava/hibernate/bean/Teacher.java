package org.fkjava.hibernate.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月21日下午3:08:27
 * 
 */
@Entity
@Table(name="TB_TEA")
public class Teacher {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="TEA_ID")
	private int id ;
	
	@Column(name="TEA_NAME",length=23,nullable=false)
	private String name ;
	
	@Column(name="TEA_AGE")
	private int age ;
	
	@ManyToMany(fetch=FetchType.LAZY,targetEntity=Student.class)
	//  joinColumns 加入自己对象的主键  @ManyToMany注解中没有加mappedBy表的主键列
	//  inverseJoinColumns 加入多对多关联对象的主键 @ManyToMany注解中加了mappedBy属性的表的主键列
	@JoinTable(name="TB_TEA_STU",joinColumns=@JoinColumn(name="TEA_ID_F",referencedColumnName="TEA_ID")
	,inverseJoinColumns=@JoinColumn(name="STU_ID_F",referencedColumnName="STU_ID"))		
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

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	
	
}
