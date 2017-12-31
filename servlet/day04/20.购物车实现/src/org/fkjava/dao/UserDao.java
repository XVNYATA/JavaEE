package org.fkjava.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.fkjava.dto.User;
import org.fkjava.dto.Users;

public class UserDao {
	
	// 代表所有的User信息
	private List<User> user_list;

	public UserDao() {
		super();
		this.user_list = this.getAll();
	}

	public List<User> getUser_list() {
		return user_list;
	} 
	
	// 使用JAXB解析user.xml，获取所有用户信息
	public List<User> getAll(){
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/user.xml");
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Unmarshaller u = jc.createUnmarshaller();
			Users users = (Users)u.unmarshal(is);
			return users.getList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 根据登录名和密码登录
	 * @param loginname
	 * @param password
	 * @return 如果用户存在，返回包含用户所有信息的User对象
	 * 		否则返回null
	 * */
	public User login( String loginname, String password){
		for(User user : this.user_list){
			if(loginname.equals(user.getLoginname())
					&& password.equals(user.getPassword())){
				return user;
			}
		}
		return null;
	}

}









