package org.fkjava.oa.identity.service;

import java.util.List;

import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.bean.Role;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.util.webTag.PageModel;

public interface IdentityServiceI {



	//根据用户账号获取用户信息
	User getUserById(String userId);

	//用户分页查询
	List<User> selectUserByPage(User user, PageModel pageModel);

	//获取部门信息
	String findAllDepts();

	 //删除用户信息
	void deleteUserByIds(String[] split);

	//审核用户
	void checkUserByIds(String[] split, Short status);

	//异步加载部门以及职位信息
	String ajaxLoadDeptAndJob();

	//异步校验用户名是否存在
	String ajaxValidUser(String userId);

	//添加用户
	void addUser(User user);
	
	//修改用户
	void updateUser(User user);

	//##########################################角色模块################################################//
	//角色分页查询
	List<Role> selectRoleByPage(PageModel pageModel);

	//添加角色
	void saveRole(Role role);

	//根据角色id获取角色信息
	Role getRoleById(Long id);

	//更新角色
	void updateRole(Role role);

	//删除角色
	void deleteRoleByIds(String[] split);

	//获取当前角色已经绑定了哪些用户
	List<User> selectRoleUserByPage(PageModel pageModel, Long id);

	//解除指定角色中的某些用户
	void unbindUser(String[] ids, Long id);

	//获取当前角色未绑定的用户
	List<User> showUnbindUserByPage(PageModel pageModel, Long id);

	//角色绑定用户
	void bindUser(Long id, String[] split);

	//修改密码
	void updatePwd(String passWord, String userId);

}
