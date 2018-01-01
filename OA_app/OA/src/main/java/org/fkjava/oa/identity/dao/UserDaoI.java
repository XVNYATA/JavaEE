package org.fkjava.oa.identity.dao;

import java.util.List;

import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.dao.base.HibernateDao;
import org.fkjava.oa.util.webTag.PageModel;

public interface UserDaoI  extends HibernateDao{

	//用户分页查询
	List<User> selectUserByPage(User user, PageModel pageModel);

	//删除用户信息
	void deleteUserByIds(String[] ids);

	////查询角色绑定的用户
	List<User> selectRoleUserByPage(PageModel pageModel, Long id);

	//获取未绑定的角色用户
	List<User> showUnbindUserByPage(PageModel pageModel, Long id);

}
