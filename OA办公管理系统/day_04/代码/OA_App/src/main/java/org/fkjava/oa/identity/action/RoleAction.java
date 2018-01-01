package org.fkjava.oa.identity.action;


import java.util.List;
import org.fkjava.oa.identity.base.BaseAction;
import org.fkjava.oa.identity.bean.Role;
import com.opensymphony.xwork2.ActionSupport;

public class RoleAction extends BaseAction {

	
    private List<Role> roles;
	private Role role;

	
	//角色分页查询
	public String selectRoleByPage(){
		
		try {
			pageModel.setPageSize(2);
			roles = identityService.selectRoleByPage(pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	//保存角色
	public String addRole(){
		
		try {
			
			identityService.saveRole(role);
			tip = "添加成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = e.getMessage();
		}
		return SUCCESS;
	}
	
	
	//跳转至修改角色页面
	public String showUpdateRole(){
		
	try {
		   
		   role = identityService.getRoleById(role.getId());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}



	//更新角色
	public String updateRole(){
		
		try {
			
			identityService.updateRole(role);
			tip = "更新成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = e.getMessage();
		}
		return SUCCESS;
	}
	
	
	//删除角色
	public String deleteRoleByIds(){
		
		try {
			
			identityService.deleteRoleByIds(ids.split(","));
			tip = "删除成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = e.getMessage();
		}
		return SUCCESS;
	}

	public List<Role> getRoles() {
		return roles;
	}



	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}




	public Role getRole() {
		return role;
	}




	public void setRole(Role role) {
		this.role = role;
	}
	
	 

	
	
}
