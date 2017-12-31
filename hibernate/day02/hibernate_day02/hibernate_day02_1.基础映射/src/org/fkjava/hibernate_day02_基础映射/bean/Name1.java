package org.fkjava.hibernate_day02_基础映射.bean;

import java.io.Serializable;

import javax.persistence.Column;

public class Name1 implements Serializable{
	
	@Column(name="FIRST_NAME")
	private String firstName ;
	
	@Column(name="LAST_NAME")
	private String lastName ;

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

	
	
}
