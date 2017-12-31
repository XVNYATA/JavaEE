package org.fkit.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.reflection.wrapper.MapWrapper;
import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.fkit.domain.Clazz;
import org.fkit.domain.Student;
import org.fkit.domain.User;
import org.fkit.factory.FKSqlSessionFactory;

public class SelectClazzTest {

	public static void main(String[] args) throws Exception {
		// 获得Session实例
		SqlSession session = FKSqlSessionFactory.getSqlSession();
		// 查询TB_CLAZZ表所有数据返回List集合,集合中的每个元素都是一个Clazz对象
		List<Clazz> clazz_list 
			= session.selectList("org.fkit.mapper.UserMapper.selectClazz");
		// 遍历List集合，打印每一个Clazz对象和该Clazz关联的所有Student对象
		for(Clazz clazz : clazz_list){
			System.out.println(clazz);
			List<Student> student_list = clazz.getStudents();
			for(Student stu : student_list){
				System.out.println(stu.getId() + " " + stu.getName() + " " + stu.getSex() + " " + stu.getAge());
			}
		}
		// 提交事务
		session.commit();
		// 关闭Session
		session.close();
	}

}
