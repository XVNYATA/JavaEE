package org.fkjava.hibernate.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="TB_WIFE")
public class Wife {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="W_ID")
	private int id ;
	
	@Column(name="W_NAME",length=23,nullable=false)
	private String name ;
	
	@Column(name="W_AGE")
	private int age ;

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

	@Override
	public String toString() {
		return "Wife [id=" + id + ", name=" + name + ", age=" + age + "]";
	}
	
	
}
