package org.fkjava.dao;

import org.fkjava.domain.User;

public interface UserDao {
	
	User findByLoginnameAndPassword(String loginname,String password);

}
