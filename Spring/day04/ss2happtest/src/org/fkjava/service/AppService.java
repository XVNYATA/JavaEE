package org.fkjava.service;

import org.fkjava.domain.User;

public interface AppService {
	
	User login(String loginname,String password);

}
