package org.fkjava.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.bean.Book;
import org.fkjava.mapper.BookMapper;
import org.fkjava.service.BookService;
import org.fkjava.util.FKSqlSessionFactory;

public class BookServiceImpl implements BookService {

	private BookMapper bookMapper;
	
	@Override
	public List<Book> getAll() {
		SqlSession sqlSession = FKSqlSessionFactory.getSqlSession();
		try {
			bookMapper = sqlSession.getMapper(BookMapper.class);
			return bookMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
		
	}

}
