package org.fkjava.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.fkjava.dto.Student;

public class StudentDao2 {
	
	// 声明一个字段，代表所有的学生集合
	private List<Student> list;

	// 构造器，创建对象一定会执行
	public StudentDao2() {
		super();
		list = this.findAll();
	}

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
		// 遍历所有的学生集合
		for(Student stu : this.list){
			if(name.equals(stu.getName())){
				return stu;
			}
		}
		return null;
	}
	
	/**
	 * 写一个方法根据性别获取student.xml文件中的同学
	 * @param sex
	 * @return
	 */
	public List<Student> findBySex(String sex){
		// 创建集合保存找到的sex的学生
		List<Student> sex_list = new ArrayList<Student>();
		// 遍历所有的学生集合
		this.list.forEach(stu ->{
			// 如果学生的sex和传进来的参数相等，添加到集合当中
			if(stu.getSex().equals(sex)){
				sex_list.add(stu);
			}
		});
		// 返回集合
		return sex_list;
	}
	
	/**
	 * 写一个方法获取student.xml文件中某个班级的同学
	 * @param classNo
	 * @return
	 */
	public List<Student> findByClass(String classNo){
		// 创建集合保存找到的classNo的学生
		List<Student> clazz_list = new ArrayList<Student>();
		// 遍历所有的学生集合
		this.list.forEach(stu ->{
			// 如果学生的classNo和传进来的参数相等，添加到集合当中
			if(stu.getClazz().equals(classNo)){
				clazz_list.add(stu);
			}
		});
		// 返回集合
		return clazz_list;
	}
	
}










