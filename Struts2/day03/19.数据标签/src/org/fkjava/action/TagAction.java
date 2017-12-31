package org.fkjava.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TagAction extends ActionSupport {

	private String author;

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("execute -->>" + this.author);
		return "done";
	}
	
	public String login() throws Exception {
		System.out.println("login -->>" + this.author);
		ActionContext.getContext().put("author", getAuthor());
		return "done";
	}
	
	
}
