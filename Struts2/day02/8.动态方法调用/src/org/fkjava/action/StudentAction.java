package org.fkjava.action;

import com.opensymphony.xwork2.Action;

public class StudentAction implements Action {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String login() throws Exception {
		System.out.println("StudentAction login -->>");
		return SUCCESS;
	}
	
	public String register() throws Exception {
		System.out.println("StudentAction register -->>");
		return SUCCESS;
	}
	
	public String remove() throws Exception {
		System.out.println("StudentAction remove -->>");
		return SUCCESS;
	}
	
	public String modify() throws Exception {
		System.out.println("StudentAction modify -->>");
		return SUCCESS;
	}


}
