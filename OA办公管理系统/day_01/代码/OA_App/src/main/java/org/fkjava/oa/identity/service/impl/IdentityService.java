package org.fkjava.oa.identity.service.impl;

import java.util.List;

import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.dao.DeptDaoI;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IdentityService implements IdentityServiceI{

    @Autowired
    private DeptDaoI deptDao;
    
	@Override
	public List<Dept> getAllDept() {
		// TODO Auto-generated method stub
		return deptDao.find(Dept.class);
	}

}
