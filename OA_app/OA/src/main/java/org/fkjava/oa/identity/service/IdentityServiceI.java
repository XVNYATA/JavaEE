package org.fkjava.oa.identity.service;

import java.util.List;

import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.bean.Module;
import org.fkjava.oa.identity.bean.Role;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.util.webTag.PageModel;

public interface IdentityServiceI {

	//获取部门所有信息
	String getDeptAll();

	//根据id获取用户信息
	User getUserId(String userId);

	//分页查询
	List<User> selectUserByPage(User user, PageModel pageModel);

	//删除用户信息
	void deleteUserByIds(String[] strings);

	//审核用户状态
	void checkUserBuIds(String[] split, Short status);

	//异步加载部门和职位信息
	String ajaxLoadDeptAndJob();

	//异步校验用户名是否已经存在
	String ajaxValidUserId(String userId);

	//添加用户
	void addUser(User user);

	//修改用户
	void updateUser(User user);

	/**********************************角色模块*******************************************/
	//角色分页查询
	List<Role> selectRolePage(PageModel pageModel);

	//添加角色
	void addRole(Role role);

	//修改角色页面
	Role getRoleById(Long id);

	//更新角色
	void updateRole(Role role);

	//删除角色
	void deleteRoleByIds(String[] split);

	//查询角色绑定的用户
	List<User> selectRoleUserByPage(PageModel pageModel, Long id);
	
	//解除绑定用户
	void unbindUser(String[] split, Long id);

	//获取未绑定角色的用户
	List<User> showUnbindUserByPage(PageModel pageModel, Long id);

	//绑定用户
	void bindUser(String[] split, Long id);

	//修改密码
	void updatePassword(String passWord, String userId);

	/******************************管理模块*******************************/
	
	//异步加载模块信息
	String ajaxLoadModule();

	//查询管理模块父级编号
	List<Module> selectModuleByParentCode(PageModel pageModel, String parentCode);

	//根据模块的code获取模块信息
	Module getModuleCode(String code);









}
