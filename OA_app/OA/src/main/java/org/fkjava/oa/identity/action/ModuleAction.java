package org.fkjava.oa.identity.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.base.BaseAction;
import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.bean.Module;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class ModuleAction extends BaseAction {
	
	//父级模块编号
	private String parentCode;
	private List<Module> modules;
	private Module module;
	

	//异步加载模块信息
	public String ajaxLoadModule(){
		try {
			String result = identityService.ajaxLoadModule();
			ServletActionContext.getResponse().getWriter().print(result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return NONE;
	}
	
	// 管理模块左边查询节点
	public String selectModuleByParentCode(){
		try {
			modules = identityService.selectModuleByParentCode(pageModel,parentCode);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return SUCCESS;
		
	}
	
	//根据模块的code获取模块信息
	public String showUpdateModule(){
		try {
			module = identityService.getModuleCode(module.getCode());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
		
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}


	
	
}
