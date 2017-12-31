package org.fkjava.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.fkjava.dto.Book;
import org.fkjava.dto.Books;
import org.fkjava.dto.User;
import org.fkjava.dto.Users;

public class BookDao {
	
	// 代表所有的Book信息
	private List<Book> book_list;

	public BookDao() {
		super();
		this.book_list = this.getAll();
	}

	public List<Book> getBook_list() {
		return book_list;
	}
	
	// 使用JAXB解析book.xml，获取所有用户信息
	public List<Book> getAll(){
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/book.xml");
			JAXBContext jc = JAXBContext.newInstance(Books.class);
			Unmarshaller u = jc.createUnmarshaller();
			Books books = (Books)u.unmarshal(is);
			return books.getList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
