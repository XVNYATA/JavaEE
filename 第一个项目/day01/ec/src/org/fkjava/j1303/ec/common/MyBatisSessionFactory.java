package org.fkjava.j1303.ec.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisSessionFactory {

	private static SqlSessionFactory sqlSessionFactory;
	private static ThreadLocal<SqlSession> sqlSessionVar = new ThreadLocal<>();

	static {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			// 根据配置生成一个sessionFactory，对应一个数据库
			sqlSessionFactory = new SqlSessionFactoryBuilder()
					.build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 给过滤器调用，在开始之前（doFilter之前）调用该方法，并保存返回值
	 * 
	 * @return
	 */
	public static boolean openSession() {
		SqlSession sqlSession = sqlSessionVar.get();
		// 如果线程中没有SqlSession的变量，创建一个并保存到线程中
		if (sqlSession == null) {
			sqlSession = sqlSessionFactory.openSession();
			sqlSessionVar.set(sqlSession);
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 创建一个不使用线程变量的SqlSession
	 * 
	 * @return
	 */
	public static SqlSession openSessionWithoutThreadLocal() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession;
	}

	/**
	 * 关闭线程中的SqlSession
	 */
	public static void closeSession() {
		SqlSession sqlSession = sqlSessionVar.get();
		// 如果线程中没有SqlSession的变量，创建一个并保存到线程中
		if (sqlSession != null) {
			sqlSession.close();
			// 关闭会话以后，要把session从线程中删除掉
			sqlSessionVar.remove();
		}
	}

	/**
	 * 获取一个数据库会话，因为此方法不创建会话，因为也不要在使用以后自行关闭会话。
	 * 
	 * @return
	 */
	public static SqlSession getSession() {
		SqlSession sqlSession = sqlSessionVar.get();
		if (sqlSession == null) {
			throw new RuntimeException("会话过滤器未起作用，请通过会话过滤器过滤后再访问业务代码");
		}
		return sqlSession;
	}
}
