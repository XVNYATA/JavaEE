package org.fkjava.dao;

import java.io.Serializable;
import java.util.List;

import org.fkjava.domain.Book;

public interface BookDao {

	Serializable save(Book book);
	
	List<Book> findAll();
	
}
