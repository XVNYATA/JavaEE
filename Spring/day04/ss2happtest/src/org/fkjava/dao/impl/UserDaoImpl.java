package org.fkjava.dao.impl;

import java.util.List;

import org.crazyit.common.dao.impl.BaseDaoHibernate4;
import org.fkjava.dao.UserDao;
import org.fkjava.domain.User;
import org.hibernate.SessionFactory;

public class UserDaoImpl 
	extends BaseDaoHibernate4<User>  implements UserDao {

	@Override
	public User find(String loginname, String password) {
		String hql = "select u from User u where u.loginname = ?0 and u.password = ?1";
		List<User> list = super.find(hql, loginname,password);
		return list.size() > 0 ? list.get(0) : null;
	}

}
 