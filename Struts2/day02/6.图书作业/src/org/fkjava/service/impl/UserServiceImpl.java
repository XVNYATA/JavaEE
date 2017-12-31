package org.fkjava.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.bean.User;
import org.fkjava.mapper.UserMapper;
import org.fkjava.service.UserService;
import org.fkjava.util.FKSqlSessionFactory;

public class UserServiceImpl implements UserService {
	
	/**
	 * 依赖持久层对象完成访问数据库的操作
	 * */
	private UserMapper userMapper;

	/**
	 * @see UserService
	 * */
	@Override
	public User login(String loginname, String password) throws Exception{
		// 通过FKSqlSessionFactory类获得mybatis的SqlSession对象
		SqlSession sqlSession = FKSqlSessionFactory.getSqlSession();
		try {
			// 获得持久层UserMapper的实现
			userMapper = sqlSession.getMapper(UserMapper.class);
			// 判断登录
			return userMapper.find(loginname, password);
		} catch (Exception e) {
			throw e;
		}finally{
			// 关闭
			sqlSession.close();
		}
		
	}

}
