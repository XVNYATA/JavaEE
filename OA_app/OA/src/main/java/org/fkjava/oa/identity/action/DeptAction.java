package org.fkjava.oa.identity.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class DeptAction extends ActionSupport {

	@Autowired
	IdentityServiceI identityService ;

	//获取部门信息
	public String ajaxLoadDept() throws Exception {
		String depts =identityService.getDeptAll();
		ServletActionContext.getResponse().getWriter().print(depts);
		return NONE;
		
	}
	
	
}
