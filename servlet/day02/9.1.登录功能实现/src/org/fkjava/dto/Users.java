package org.fkjava.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="users")
public class Users {
	
	private List<User> list;

	public List<User> getList() {
		return list;
	}

	@XmlElement(name="user")
	public void setList(List<User> list) {
		this.list = list;
	}
	
	

}
