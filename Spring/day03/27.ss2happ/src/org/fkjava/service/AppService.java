package org.fkjava.service;

import java.io.Serializable;
import java.util.List;

import org.fkjava.domain.Book;
import org.fkjava.domain.User;

// 服务层接口
public interface AppService {
	
	User login(String loginname,String password);
	
	Serializable addBook(Book book);
	
	List<Book> findAll();

}
