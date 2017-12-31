package org.fkjava.hibernate_day02_基础映射.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TB_NAME")
public class Name implements Serializable{
	@Id
	@Column(name="TB_FIRST_AME")
	private String firstName ;
	
	@Id
	@Column(name="TB_LAST_AME")
	private String lastName ;
	
	private int age  ;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
}
