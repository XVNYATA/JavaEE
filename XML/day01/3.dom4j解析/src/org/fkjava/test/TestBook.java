package org.fkjava.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.fkjava.dao.BookDao;
import org.fkjava.dto.Book;

public class TestBook {
	
	/**
	 * 读取book.xml文件内容打印在控制台
	 * */
	public void readBook(){
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/book.xml");
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(is);
			// 根元素
			Element root_node = doc.getRootElement();
			// 获得所有book子元素
			List<Element> book_node_list = root_node.elements("book");
			// 遍历集合
			for(Element book_node : book_node_list){
				// 注意：查找子元素一定是通过父元素去找
				System.out.println("id：" + book_node.elementText("id"));
				System.out.println("name：" + book_node.elementText("name"));
				System.out.println("author：" + book_node.elementText("author"));
				System.out.println("price：" + book_node.elementText("price"));
				System.out.println("image：" + book_node.elementText("image"));
				System.out.println("remark：" + book_node.elementText("remark"));
				System.out.println(" ------------------- ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
//		TestBook t = new TestBook();
//		t.readBook();
		
		BookDao dao = new BookDao();
		List<Book> list = dao.findAllBook();
		list.forEach(book -> {
			System.out.println(book);
		});

	}

}
