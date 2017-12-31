package org.fkjava.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.fkjava.bean.Book;
import org.fkjava.dao.BookDao;

public class TestBook {

	/**
	 * 使用JAXB解析book.xml
	 * */
	public static void main(String[] args) {
		InputStream is = null;
		try {
			// 获得book.xml的流
			is = TestBook.class.getResourceAsStream("/book.xml");
			
			// 表示要把XML转换为哪个类型的Java对象，类名的上方必须有 XmlRootElement 注解
			JAXBContext jc = JAXBContext.newInstance(BookDao.class);
			
			// 获得解码器
			Unmarshaller u = jc.createUnmarshaller();
			
			// 执行解码
			Object obj = u.unmarshal(is);
			
			// 强转
			BookDao dao = (BookDao)obj;
			
			// 遍历
			/*dao.getBooks().forEach(book -> System.out.println(book));*/
			List<Book> list = dao.getBooks();
			for(Book book : list){
				System.out.println(book);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	/**
	 * 课堂练习
	 * 使用JAXB将student.xml的内容读取出来
	 * */

}
