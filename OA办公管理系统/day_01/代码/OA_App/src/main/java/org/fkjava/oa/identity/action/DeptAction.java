package org.fkjava.oa.identity.action;

import java.util.List;

import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.fkjava.oa.identity.service.impl.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class DeptAction extends ActionSupport {

	@Autowired
	IdentityServiceI identityService;

	//获取部门信息
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List<Dept> depts = identityService.getAllDept();
		System.out.println("获取部门数量："+depts.size());
		return NONE;
	}

	
}
