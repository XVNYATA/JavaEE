package org.fkjava.action;

import com.opensymphony.xwork2.Action;

public class UserAction implements Action {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String login() throws Exception {
		System.out.println("login -->>");
		return SUCCESS;
	}
	
	public String register() throws Exception {
		System.out.println("register -->>");
		return SUCCESS;
	}
	
	public String remove() throws Exception {
		System.out.println("remove -->>");
		return SUCCESS;
	}
	



}
