package org.fkjava.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ConnectionFactory {

	private static SqlSessionFactory sqlSessionFactory=null;
	//初始化mybatis数据库连接池
	static{
		
		String resource = "mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			//类似于DataSourse
			 sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//获取连接   类似于Connection 
	public static SqlSession getSqlSession(){
		 try {
			 SqlSession sqlSession = sqlSessionFactory.openSession();
			return sqlSession;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return null;
	}

}
