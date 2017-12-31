package org.fkjava.service.impl;

import org.fkjava.dao.UserDao;
import org.fkjava.domain.User;
import org.fkjava.service.AppService;

public class AppServiceImpl implements AppService {
	
	private UserDao userDao;
	

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	public User login(String loginname, String password) {
		
		return userDao.find(loginname, password);
	}

}
