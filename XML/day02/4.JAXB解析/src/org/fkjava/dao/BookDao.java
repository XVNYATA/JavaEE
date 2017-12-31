package org.fkjava.dao;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.fkjava.bean.Book;

@XmlRootElement(name="books")
public class BookDao {
	
	private List<Book> books;

	public List<Book> getBooks() {
		System.out.println("getBooks->");
		return books;
	}

	// 表示books集合中的元素Book类对应的是的是xml的book元素
	@XmlElement(name="book")
	public void setBooks(List<Book> books) {
		System.out.println("setBooks->");
		this.books = books;
	}
	
	

}
