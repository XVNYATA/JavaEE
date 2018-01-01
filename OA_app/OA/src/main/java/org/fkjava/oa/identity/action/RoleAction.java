package org.fkjava.oa.identity.action;

import java.util.List;

import org.fkjava.oa.identity.base.BaseAction;
import org.fkjava.oa.identity.bean.Role;
import org.fkjava.oa.identity.bean.User;

public class RoleAction extends BaseAction {

	private List<Role> roles;
	private Role role;
	private List<User> users;
	
	//角色分页查询
	public String selectRolePage(){
		try {
			pageModel.setPageSize(2);
			roles = identityService.selectRolePage(pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
	}
	
	//添加角色
	public String addRole(){
		try {
			identityService.addRole(role);
			tip="添加成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
	}
	
	//显示修改角色页面
	public String showUpdateRole(){
		try {
			role = identityService.getRoleById(role.getId());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
	}
	
	//更新角色信息
	public String updateRole(){
		try {
			identityService.updateRole(role);
			tip="更新成功";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
		
	}
	
	//删除角色信息
	public String deleteRoleByIds(){
		try {
			identityService.deleteRoleByIds(ids.split(","));
			tip="删除成功";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
	}
	
		//查看角色用户绑定的用户
		public String selectRoleUser(){
			try {
				users = identityService.selectRoleUserByPage(pageModel,role.getId());
				role = identityService.getRoleById(role.getId());
				System.out.println(role.getId());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				tip=e.getMessage();
			}
			return SUCCESS;
		}
	
		//解除绑定用户
		public String unbindUser(){
			try {
				identityService.unbindUser(ids.split(","),role.getId());
				tip="解除绑定成功!";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				tip=e.getMessage();
			}
			return SUCCESS;
		}
		
		//获取未绑定的角色用户
		public String showUnbindUserByPage(){
			try {
				users = identityService.showUnbindUserByPage(pageModel, role.getId());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				tip=e.getMessage();
			}
			return SUCCESS;
			
		}
		
		//绑定用户
		public String bindUser(){
			try {
				identityService.bindUser(ids.split(","),role.getId());
				tip="绑定成功!";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				tip=e.getMessage();
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

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	
}
