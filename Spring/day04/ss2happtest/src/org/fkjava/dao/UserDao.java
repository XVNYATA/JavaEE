package org.fkjava.dao;

import org.crazyit.common.dao.BaseDao;
import org.fkjava.domain.User;

public interface UserDao extends BaseDao<User>{
	
	User find(String loginname,String password);

}
