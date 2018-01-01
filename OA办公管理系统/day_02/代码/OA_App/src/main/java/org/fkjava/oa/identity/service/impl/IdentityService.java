package org.fkjava.oa.identity.service.impl;

import java.util.List;

import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.dao.DeptDaoI;
import org.fkjava.oa.identity.dao.UserDaoI;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IdentityService implements IdentityServiceI{

    @Autowired
    private DeptDaoI deptDao;
    
    @Autowired
    private UserDaoI userDao;
    
	@Override
	public List<Dept> getAllDept() {
		// TODO Auto-generated method stub
		return deptDao.find(Dept.class);
	}
	//根据用户账号获取用户信息
	@Override
	public User getUserById(String userId) {
		// TODO Auto-generated method stub
		try {
			return userDao.get(User.class, userId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
