package org.fkjava.dao;

import java.util.List;

import org.fkjava.bean.User;

public class UserDaoImpl 
	extends BasicDaoImple<User> 
	implements UserDao {

	@Override
	public User login(String loginname, String password) {
		String sql = " select * from tb_user where loginname = ? and password = ? ";
		List<User> list = this.query(sql, loginname,password);
		return list.size() > 0 ? list.get(0) : null;
	}


	
	

}
