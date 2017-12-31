package org.fkjava.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.fkjava.dao.BookDao;
import org.fkjava.domain.Book;
import org.springframework.orm.hibernate4.HibernateTemplate;

public class BookDaoImpl implements BookDao {

	private HibernateTemplate hibernateTemplate;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public Serializable save(Book book) {
		
		return this.hibernateTemplate.save(book);
	}

	@Override
	public List<Book> findAll() {
		
		return (List<Book>) this.hibernateTemplate.find("select b from Book b");
	}

}
