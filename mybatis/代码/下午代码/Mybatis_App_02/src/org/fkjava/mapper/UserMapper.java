package org.fkjava.mapper;

import org.apache.ibatis.annotations.Param;
import org.fkjava.bean.User;

public interface UserMapper {

	//根据用户id获取用户信息
	User getUserById(int id);

	//根据用户名以及密码获取用户信息    两个或者两个以上的参数时需要声明
	User getUserByNameAndPass(@Param("name")String loginname, @Param("password")String password);

	
	void deleteUserById(int id);

	//保存用户信息
	void insertUser(User user);

	//更新用户信息
	void updateUser(@Param("aaa")String username, @Param("id")int id);

}
