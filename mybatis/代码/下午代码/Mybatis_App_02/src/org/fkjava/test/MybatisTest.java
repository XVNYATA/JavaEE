package org.fkjava.test;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.bean.User;
import org.fkjava.mapper.UserMapper;
import org.fkjava.util.ConnectionFactory;

public class MybatisTest {


	public static void main(String[] args) {
		// TODO Auto-generated method stub
        //获取连接
		SqlSession sqlSession = ConnectionFactory.getSqlSession();
		
		//通过sqlSession来创建数据库访问接口的实例
		UserMapper userMapper =  sqlSession.getMapper(UserMapper.class);
		
		//根据用户id获取用户信息
		//User user  = userMapper.getUserById(6);
		//System.out.println("user:"+user.toString());
		
		//根据用户名以及密码获取用户信息   ---多添件查询
		//User user = userMapper.getUserByNameAndPass("admin","123456");
		//System.out.println("user:"+user.toString());
		
		//删除数据
		//userMapper.deleteUserById(16);
		//提交事务
		//sqlSession.commit();
		
		User user = new User();
		user.setLoginname("zhangrenliang");
		user.setUsername("张任良2");
		user.setPassword("123456");
		
		//插入数据
		//userMapper.insertUser(user);
		//提交事务
		//sqlSession.commit();
		
		//更新数据
		userMapper.updateUser("laowang",5);
		//提交事务
		sqlSession.commit();
		
		
	
	}

}
