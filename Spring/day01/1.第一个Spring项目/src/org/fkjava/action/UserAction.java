package org.fkjava.action;

import org.fkjava.domain.User;

// 模拟Action
public class UserAction {
	
	private User user;
	
	public UserAction() {
		super();
		System.out.println("UserAction() -->> ");
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		System.out.println("setUser() -->> ");
		this.user = user;
	}

	public void sayHello(){
		System.out.println(user);
	}

}
