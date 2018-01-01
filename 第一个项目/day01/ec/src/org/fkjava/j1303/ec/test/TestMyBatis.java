package org.fkjava.j1303.ec.test;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.j1303.ec.common.MyBatisSessionFactory;
import org.fkjava.j1303.ec.entity.mapper.ArticleMapper;
import org.fkjava.j1303.ec.entity.model.ArticleExample;

public class TestMyBatis {

	public static void main(String[] args) {
		MyBatisSessionFactory.openSession();
		SqlSession session = MyBatisSessionFactory.getSession();
		ArticleMapper articleMapper = session.getMapper(ArticleMapper.class);
		ArticleExample example = new ArticleExample();
		int count = articleMapper.countByExample(example);
		System.out.println(count);
		MyBatisSessionFactory.closeSession();
	}
}
