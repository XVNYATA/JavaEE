package org.fkjava.action;

import com.opensymphony.xwork2.Action;

public class BookAction implements Action {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String login() throws Exception {
		System.out.println("BookAction login -->>");
		return SUCCESS;
	}
	
	public String register() throws Exception {
		System.out.println("BookAction register -->>");
		return SUCCESS;
	}
	
	public String remove() throws Exception {
		System.out.println("BookAction remove -->>");
		return SUCCESS;
	}
	
	public String modify() throws Exception {
		System.out.println("BookAction modify -->>");
		return SUCCESS;
	}


}
