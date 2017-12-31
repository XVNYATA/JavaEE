package org.fkjava.test;

import java.util.List;

import org.fkjava.bean.Book;
import org.fkjava.bean.User;
import org.fkjava.dao.BookDaoImpl;
import org.fkjava.dao.StudentDao;
import org.fkjava.dao.StudentDaoImpl;
import org.fkjava.dao.UserDaoImpl;



public class Test {

	public static void main(String[] args) {
		
		UserDaoImpl userDao = new UserDaoImpl();
		/*User user = userDao.get(1);
		System.out.println(user);*/
		/*List<User> user_list = userDao.get();
		System.out.println(user_list);*/
		/*User user = new User("tom","123","汤姆");
		System.out.println(userDao.save(user));*/
//		userDao.remove(1);
		/*User user = userDao.get(3);
		user.setUsername("张三");
		userDao.update(user);*/
//		User u = userDao.login("jack", "123");
//		System.out.println(u);
		
		BookDaoImpl bookDao = new BookDaoImpl();
		/*Book book = bookDao.get(1);
		System.out.println(book);*/
		/*List<Book> book_list = bookDao.get();
		System.out.println(book_list);*/
		/*Book book = new Book("疯狂Android讲义","李刚2",99.0);
		System.out.println(bookDao.save(book));*/
//		System.out.println(bookDao.findByAuthor("李刚"));
		
		StudentDao studao = new StudentDaoImpl();
		studao.find();
		
	}

}
