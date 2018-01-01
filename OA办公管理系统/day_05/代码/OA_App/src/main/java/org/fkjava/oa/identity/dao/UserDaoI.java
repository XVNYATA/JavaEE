package org.fkjava.oa.identity.dao;

import java.util.List;

import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.dao.base.HibernateDao;
import org.fkjava.oa.util.webTag.PageModel;

public interface UserDaoI extends HibernateDao{

	//用户分页查询
	List<User> selectUserByPage(User user, PageModel pageModel);

	//删除用户信息
	void deleteUserByIds(String[] ids);

	//获取当前角色已经绑定的用户信息
	List<User> selectRoleUserByPage(PageModel pageModel, Long id);

	//获取当前角色未绑定的用户信息
	List<User> showUnbindUserByPage(PageModel pageModel, Long id);

}
