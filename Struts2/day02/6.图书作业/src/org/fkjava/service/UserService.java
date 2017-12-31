package org.fkjava.service;

import org.fkjava.bean.User;

/**
 * 服务层接口
 * */
public interface UserService {

	/**
	 * 通过登录名和密码查找对应的User对象，判断登录
	 * @param loginname
	 * @param password
	 * @return 返回User对象，没有找到返回null
	 * */
	User login(String loginname,String password) throws Exception;
	
}
