package org.fkjava.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class TestNote {
	
	public void readNote(){
		InputStream is = null;
		try {
			// 1. 读取note.xml返回流
//			is = TestNote.class.getResourceAsStream("/note.xml");
			is = this.getClass().getResourceAsStream("/note.xml");
			// 2. 解析流获得Document
			SAXReader saxReader = new SAXReader();
			// Document 接口表示整个 HTML 或 XML 文档。从概念上讲，它是文档树的根，并提供对文档数据的基本访问。
			Document doc = saxReader.read(is);
			// 3. 依次获取元素内容
			// 获取根元素
			Element root_node = doc.getRootElement();
			System.out.println("root: " + root_node.getName());
			// 获取子元素
			Element to_node = root_node.element("to");
			System.out.println(to_node.getName() + "：" + to_node.getText());
			// 获取属性
			Attribute id_att = to_node.attribute("id");
			System.out.println(id_att.getName() + "：" + id_att.getValue());
			// 其他子元素  方法链，先获得Element对象再调用getText方法
			System.out.println("from：" + root_node.element("from").getText());
			// 直接获取heading子元素的Text
			System.out.println("heading：" + root_node.elementText("heading"));
			// 直接获取body子元素的Text并且去掉首尾的空格
			System.out.println("body：" + root_node.elementTextTrim("body"));
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
	
	/**
	 * 假设不知道xml文档的元素的情况下解析
	 * */
	public void readNote2(){
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/note.xml");
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(is);
			Element root_node = doc.getRootElement();
			// 获取根元素下面的所有子元素
			List<Element> c_node = root_node.elements();
			for(Element c : c_node){
				System.out.println(c.getName() + "： " + c.getText());
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
	 * 假设不知道xml文档的元素的情况下解析，而且根元素下面有子元素，子元素下面可能又有子元素......
	 * */
	public void readNote3(){
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/note.xml");
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(is);
			Element root_node = doc.getRootElement();
			// 调用递归方法
			this.readElement(root_node);
			
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
	 *  递归读取元素的方法
	 *  判断元素是否还有子元素，没有，打印
	 *  如果还有子元素，继续递归
	 */
	public void readElement(Element element){
		// 获得元素下面的所有子元素集合
		List<Element> child_node_list = element.elements();
		if(child_node_list.size() > 0){
			System.out.println(element.getName() + " 还有子元素,继续递归");
			// 说明有子元素
			for(Element child_node : child_node_list){
				// 继续判断
				readElement(child_node);
			}
		}else{
			// 没有子元素
			System.out.println(element.getName() + "：" + element.getText());
		}
	}
	
	/**
	 * 使用dom4j解析note.xml文件，将内容打印在控制台
	 * */
	public static void main(String[] args) {
		
		TestNote t = new TestNote();
//		t.readNote2();
		t.readNote3();

	}

}
