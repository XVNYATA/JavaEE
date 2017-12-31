package org.fkjava.dao;

import org.fkjava.bean.User;

/**
 * 泛型表示该UserDao只是操作User对象
 * */
public interface UserDao extends BasicDao<User> {

	/**
	 * 个性化方法
	 * @param String loginname
	 * @param String password
	 * @return 查找到的User对象
	 * */
	User login(String loginname,String password);
	
}
