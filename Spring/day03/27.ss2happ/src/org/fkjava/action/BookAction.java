package org.fkjava.action;

import java.util.List;

import org.fkjava.domain.Book;
import org.fkjava.service.AppService;

import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	
	private Book book;
	private AppService appService;
	private List<Book> books;

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	
	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public void setAppService(AppService appService) {
		this.appService = appService;
	}

	public String addBook() throws Exception {
		appService.addBook(book);
		return this.SUCCESS;
	}
	
	public String findAll() throws Exception {
		this.books = appService.findAll();
		return this.SUCCESS;
	}
	

}
