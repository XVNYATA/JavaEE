package org.fkjava.service.impl;

import java.io.Serializable;
import java.util.List;

import org.fkjava.dao.BookDao;
import org.fkjava.dao.UserDao;
import org.fkjava.domain.Book;
import org.fkjava.domain.User;
import org.fkjava.service.AppService;

// 服务层实现类
public class AppServiceImpl implements AppService {
	
	// 依赖关系，使用Spring就不用new，而是依赖注入
	private UserDao userDao;
	private BookDao bookDao;

	public AppServiceImpl() {
		super();
		System.out.println("AppServiceImpl() -->> ");
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public BookDao getBookDao() {
		return bookDao;
	}

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	public User login(String loginname, String password) {
		System.out.println("AppServiceImpl login -->>");
		return userDao.findByLoginnameAndPassword(loginname, password);
	}

	@Override
	public Serializable addBook(Book book) {
		
		return bookDao.save(book);
	}

	@Override
	public List<Book> findAll() {
		
		return bookDao.findAll();
	}

}
