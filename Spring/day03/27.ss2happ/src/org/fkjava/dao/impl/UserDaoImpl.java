package org.fkjava.dao.impl;

import java.util.List;

import org.fkjava.dao.UserDao;
import org.fkjava.domain.User;
import org.springframework.orm.hibernate4.HibernateTemplate;

public class UserDaoImpl implements UserDao {
	
	private HibernateTemplate hibernateTemplate;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public UserDaoImpl() {
		super();
		System.out.println("UserDaoImpl() -->> ");
	}

	@Override
	public User findByLoginnameAndPassword(String loginname, String password) {
		System.out.println("UserDaoImpl findByLoginnameAndPassword -->> ");
		/*// HQL
		String hql = "select u from User u where u.loginname = ? and u.password = ? ";
		System.out.println(hql);
		List list = hibernateTemplate.find(hql, loginname,password);
		System.out.println(list);
		return list.size() > 0 ? (User)list.get(0) : null;*/
		User user = new User();
		user.setLoginname(loginname);
		user.setPassword(password);
		List<User> list = this.hibernateTemplate.findByExample(user);
		System.out.println(list);
		return list.size() > 0 ? list.get(0) : null;
	}

}




