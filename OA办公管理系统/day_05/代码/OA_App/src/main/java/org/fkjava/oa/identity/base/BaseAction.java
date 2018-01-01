package org.fkjava.oa.identity.base;

import org.fkjava.oa.identity.service.IdentityServiceI;
import org.fkjava.oa.util.webTag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport {

	@Autowired
	public IdentityServiceI identityService;
	
	public String ids;
	//定义分页实体
	public PageModel pageModel = new PageModel();
	public String tip;
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public PageModel getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	
	
}
