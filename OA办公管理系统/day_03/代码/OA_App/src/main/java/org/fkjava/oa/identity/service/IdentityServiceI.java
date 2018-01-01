package org.fkjava.oa.identity.service;

import java.util.List;

import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.util.webTag.PageModel;

public interface IdentityServiceI {



	//根据用户账号获取用户信息
	User getUserById(String userId);

	//用户分页查询
	List<User> selectUserByPage(User user, PageModel pageModel);

	//获取部门信息
	String findAllDepts();

	 //删除用户信息
	void deleteUserByIds(String[] split);

	//审核用户
	void checkUserByIds(String[] split, Short status);

	//异步加载部门以及职位信息
	String ajaxLoadDeptAndJob();

	//异步校验用户名是否存在
	String ajaxValidUser(String userId);

}
