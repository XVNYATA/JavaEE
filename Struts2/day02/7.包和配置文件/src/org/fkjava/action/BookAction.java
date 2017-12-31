package org.fkjava.action;

import com.opensymphony.xwork2.Action;

public class BookAction implements Action {

	@Override
	public String execute() throws Exception {
		System.out.println("BookAction -->>");
		return SUCCESS;
	}

}
