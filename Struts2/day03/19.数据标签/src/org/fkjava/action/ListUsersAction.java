package org.fkjava.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class ListUsersAction extends ActionSupport
{
	private List<String> users;

	public List<String> getUsers()
	{
		return users;
	}

	public void setUsers(List<String> users)
	{
		this.users = users;
	}
	
	@Override
	public String execute()
	{
		System.out.println("===ListUsersAction被调用===");
		users = new ArrayList<String>();
		users.add("武松");
		users.add("林冲");
		users.add("鲁智深");
		return SUCCESS;
	}
	

}
