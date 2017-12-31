package org.fkjava.test;

import java.util.List;

import org.fkjava.dao.StudentDao;
import org.fkjava.dto.Student;

public class TestStudent {

	public static void main(String[] args) {
		StudentDao dao = new StudentDao();
		/*List<Student> list = dao.findAll();
		list.forEach(stu -> {
			System.out.println(stu);
		});
*/
		/*Student stu = dao.findByName("周杰伦");
		System.out.println(stu);*/
		
		/*List<Student> sex_list = dao.findBySex("男");
		sex_list.forEach(stu -> System.out.println(stu));*/
		
		List<Student> clazz_list = dao.findByClass("j1302");
		clazz_list.forEach(stu -> System.out.println(stu));
		
	}

}
