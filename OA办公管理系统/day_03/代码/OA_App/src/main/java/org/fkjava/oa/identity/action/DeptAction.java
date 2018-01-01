package org.fkjava.oa.identity.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.fkjava.oa.identity.service.impl.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class DeptAction extends ActionSupport {

	@Autowired
	IdentityServiceI identityService;

	//获取部门信息
	public String ajaxLoadDept() throws Exception {
		// TODO Auto-generated method stub
          String depts = identityService.findAllDepts();

		 ServletActionContext.getResponse().getWriter().print(depts);
		return NONE;
	}

	
}
