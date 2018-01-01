package org.fkjava.oa.identity.service;

import java.util.List;

import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.bean.User;

public interface IdentityServiceI {

	//获取部门信息
	List<Dept> getAllDept();

	//根据用户账号获取用户信息
	User getUserById(String userId);

}
