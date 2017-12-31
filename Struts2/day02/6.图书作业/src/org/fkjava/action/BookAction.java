package org.fkjava.action;

import java.util.List;

import org.fkjava.bean.Book;
import org.fkjava.service.BookService;
import org.fkjava.service.impl.BookServiceImpl;

import com.opensymphony.xwork2.Action;

public class BookAction implements Action {
	
	private List<Book> books;
	private BookService bookService;
	
	public BookAction() {
		super();
		bookService = new BookServiceImpl();
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	@Override
	public String execute() throws Exception {
		
		this.books = bookService.getAll();
		
		return SUCCESS;
	}

}
