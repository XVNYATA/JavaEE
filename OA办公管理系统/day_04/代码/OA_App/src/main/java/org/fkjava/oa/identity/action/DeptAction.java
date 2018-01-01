package org.fkjava.oa.identity.action;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.base.BaseAction;


public class DeptAction extends BaseAction {


	//获取部门信息
	public String ajaxLoadDept() throws Exception {
		// TODO Auto-generated method stub
         String depts = identityService.findAllDepts();

		 ServletActionContext.getResponse().getWriter().print(depts);
		return NONE;
	}

	
}
