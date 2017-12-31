package org.fkjava.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.fkjava.dto.Book;

// DAO，封装book.xml文件的所有增删改查方法
public class BookDao {
	
	/**
	 * 查找所有book信息，将找到的数据封装到Book对象，并返回给调用者
	 * @return 返回包含所有Book信息的List集合
	 * */
	public List<Book> findAllBook(){
		List<Book> list = new ArrayList<Book>();
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
				// 每一个book元素的内容保存到一个Book对象当中
				Book book = new Book();
				book.setId(Integer.parseInt(book_node.elementText("id")));
				book.setName(book_node.elementText("name"));
				book.setAuthor(book_node.elementText("author"));
				book.setPrice(Double.parseDouble(book_node.elementText("price")));
				book.setImage(book_node.elementText("image"));
				book.setRemark(book_node.elementText("remark"));
				// 将book对象存储到集合当中
				list.add(book);
			}
			return list;
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
