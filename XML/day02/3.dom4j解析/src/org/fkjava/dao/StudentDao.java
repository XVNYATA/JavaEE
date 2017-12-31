package org.fkjava.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.fkjava.dto.Student;

public class StudentDao {

	/**
	 * 写一个方法获取student.xml文件所有信息，封装到对象，返回list集合
	 * @return
	 */
	public List<Student> findAll(){
		List<Student> list = new ArrayList<Student>();
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/student.xml");
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(is);
			Element root_node = doc.getRootElement();
			// 查找所有student元素
			List<Element> student_node_list = root_node.elements("student");
			// 遍历
			for(Element student_node : student_node_list){
				// 找到每一个student元素，使用Student对象存储
				Student stu = new Student();
				stu.setName(student_node.elementText("name"));
				stu.setSex(student_node.elementText("sex"));
				stu.setAge(Integer.parseInt(student_node.elementText("age")));
				// 属性class
				stu.setClazz(student_node.attributeValue("class"));
				// 添加到list集合
				list.add(stu);
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
	
	
	/**
	 * 写一个方法根据姓名获取student.xml文件中的同学,不考虑同名情况
	 * @param name
	 * @return
	 */
	public Student findByName(String name){
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/student.xml");
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(is);
			Element root_node = doc.getRootElement();
			// 查找所有student元素
			List<Element> student_node_list = root_node.elements("student");
			// 遍历
			for(Element student_node : student_node_list){
				// 获得当前元素的name子元素的text
				String text = student_node.elementText("name");
				// 判断
				if(name.equals(text)){
					// 找到要找的学生的元素
					Student stu = new Student();
					stu.setName(text);
					stu.setSex(student_node.elementText("sex"));
					stu.setAge(Integer.parseInt(student_node.elementText("age")));
					// 属性class
					stu.setClazz(student_node.attributeValue("class"));
					return stu;
				}
			}
			return null;
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
	
	/**
	 * 写一个方法根据性别获取student.xml文件中的同学
	 * @param sex
	 * @return
	 */
	public List<Student> findBySex(String sex){
		List<Student> sex_list = new ArrayList<Student>();
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/student.xml");
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(is);
			Element root_node = doc.getRootElement();
			// 查找所有student元素
			List<Element> student_node_list = root_node.elements("student");
			// 遍历
			for(Element student_node : student_node_list){
				// 获得当前元素的sex子元素的text
				String text = student_node.elementText("sex");
				// 判断
				if(sex.equals(text)){
					// 找到
					Student stu = new Student();
					stu.setName(student_node.elementText("name"));
					stu.setSex(student_node.elementText("sex"));
					stu.setAge(Integer.parseInt(student_node.elementText("age")));
					// 属性class
					stu.setClazz(student_node.attributeValue("class"));
					// 添加到集合
					sex_list.add(stu);
				}
			}
			return sex_list;
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
	
	/**
	 * 写一个方法获取student.xml文件中某个班级的同学
	 * @param classNo
	 * @return
	 */
	public List<Student> findByClass(String classNo){
		List<Student> clazz_list = new ArrayList<Student>();
		InputStream is = null;
		try {
			is = this.getClass().getResourceAsStream("/student.xml");
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(is);
			Element root_node = doc.getRootElement();
			// 查找所有student元素
			List<Element> student_node_list = root_node.elements("student");
			// 遍历
			for(Element student_node : student_node_list){
				// 获得当前元素的class属性的value
				String value = student_node.attributeValue("class");
				// 判断
				if(classNo.equals(value)){
					// 找到
					Student stu = new Student();
					stu.setName(student_node.elementText("name"));
					stu.setSex(student_node.elementText("sex"));
					stu.setAge(Integer.parseInt(student_node.elementText("age")));
					// 属性class
					stu.setClazz(student_node.attributeValue("class"));
					// 添加到集合
					clazz_list.add(stu);
				}
			}
			return clazz_list;
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










