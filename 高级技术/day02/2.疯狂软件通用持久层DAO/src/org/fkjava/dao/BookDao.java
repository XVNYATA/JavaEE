package org.fkjava.dao;

import java.util.List;

import org.fkjava.bean.Book;

public interface BookDao extends BasicDao<Book> {

	List<Book> findByAuthor(String author);
	
}
