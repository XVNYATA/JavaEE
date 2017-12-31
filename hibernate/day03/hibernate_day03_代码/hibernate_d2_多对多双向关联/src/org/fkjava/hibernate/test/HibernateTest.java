package org.fkjava.hibernate.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import org.fkjava.hibernate.bean.Teacher;
import org.fkjava.hibernate.bean.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

	
/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月20日上午10:57:09
 * 
 */
public class HibernateTest {
	public static void main(String[] args) {
		try {
			/** 1.加载核心配置文件  */ 
			Configuration configuration = new Configuration()  // 只会加载hibernate.properties文件
			.configure(); // 可以加载hibernate.cfg.xml文件
			
			/** 2.得到一个服务注册对象  */
			ServiceRegistry serviceRegistry =
              new StandardServiceRegistryBuilder().applySettings(configuration.getProperties())
              .build();
			
			/** 3.得到一个连接工厂 : 连接工厂一初始化表就开始自动创建 */
			SessionFactory sf = configuration.buildSessionFactory(serviceRegistry);
			
			System.out.println(sf);
			
			/** 4.得到一个会话   */
			Session session = sf.openSession();
			/** 5.得到事物对象  */
			Transaction tx = session.beginTransaction();
			
//			Student stu = new Student();
//			stu.setAge(12);
//		    stu.setName("小明");
//		    stu.setSex("男");
//		    session.save(stu);
//		    
//			Student stu1 = new Student();
//			stu1.setAge(14);
//		    stu1.setName("小华");
//		    stu1.setSex("男");
//		    session.save(stu1);
		    
//		    Teacher tr = new Teacher();
//		    tr.setName("王老师");
//		    tr.setAge(31);
//		    tr.getStudents().add(stu1);
//		    tr.getStudents().add(stu);
//		    session.save(tr);
		    
		    
//		    Teacher tr1 = new Teacher();
//		    tr1.setName("李老师");
//		    tr1.setAge(31);
//		    tr1.getStudents().add(stu1);
//		    tr1.getStudents().add(stu);
//		    session.save(tr1);
//			
			
//			Teacher tea = (Teacher) session.get(Teacher.class, 2);
//			tea.getStudents().forEach(s -> {
//				System.out.println(s.getName());
//			});
			
			
//			Student stu = (Student) session.get(Student.class, 3);
//			Teacher tea = (Teacher) session.get(Teacher.class, 1);
//			tea.getStudents().add(stu);
			
			Student stu = (Student) session.get(Student.class, 3);
			stu.getTeachers().forEach(s -> {
				System.out.println(s.getName());
			});
			
		//	stu.getTeachers().clear();  中间表是有老师维护的  这里不行
			
			Teacher tea = (Teacher) session.get(Teacher.class, 2);
			tea.getStudents().clear();
			
			tx.commit(); // 事物提交 
			session.close();
			sf.close();
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}









