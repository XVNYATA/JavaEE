package org.fkjava.dao;

import java.util.List;

import org.fkjava.bean.Book;

public class BookDaoImpl 
	extends BasicDaoImple<Book> 
	implements BookDao {

	@Override
	public List<Book> findByAuthor(String author) {
		String sql = " select * from tb_book where author = ? ";
		return this.query(sql, author);
	}
	
	

}
