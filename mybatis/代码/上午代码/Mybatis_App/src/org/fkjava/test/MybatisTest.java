package org.fkjava.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.fkjava.bean.User;

public class MybatisTest {


	private static Logger logger = Logger.getLogger(MybatisTest.class);
	 
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			//SqlSessionFactory类似于 dataSourse
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			//获取连接  SqlSession类似于 Connection 
			SqlSession sqlSession = sqlSessionFactory.openSession();
			
			//根据用户id获取用户信息
			//User u = sqlSession.selectOne("getUserById", 1);
           // System.out.println("获取到的用户信息："+u.toString());
			//获取所有的用户信息
			///List<User> list = sqlSession.selectList("findAllUser");
			//logger.debug(list.toString());
			
			//根据用户id删除用户信息                    
			//sqlSession.delete("deleteUserById",1);
            //提交事务
			//sqlSession.commit();
			
			//跟新用户信息
			//sqlSession.update("updateUserById",6);
			//提交事务
			//sqlSession.commit();
            
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
