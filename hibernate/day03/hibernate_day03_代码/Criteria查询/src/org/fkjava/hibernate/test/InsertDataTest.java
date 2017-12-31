package org.fkjava.hibernate.test;

import org.fkjava.hibernate.domain.Student;
import org.fkjava.hibernate.domain.Teacher;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;


public class InsertDataTest {

	public static void main(String[] args) {
		// 第一步：创建Configuration
		Configuration configuration = new Configuration() // 加载hibernate.properties
		       .configure(); // 加载hibernate.cfg.xml
		// 第二步：创建服务注册对象
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();
		// 第三步：创建SessionFactory
		SessionFactory sf = configuration.buildSessionFactory(serviceRegistry);
		// 第四步：创建Session
		Session session = sf.openSession();
		// 第五步：开启事务
		Transaction transaction = session.beginTransaction();
		// 第六步：利用 Session完成所有的持久化操作
		
		Teacher t1 = new Teacher();
		t1.setName("唐僧");
		t1.setDept("取经部");
		t1.setJob("长老");
		t1.setAge(30);
		session.save(t1);
		
		Student s1 = new Student();
		s1.setName("孙悟空");
		s1.setAge(500);
		s1.setPhone("13888888888");
		s1.setScore(10.5f);
		s1.setTeacher(t1);
		session.save(s1);
		
		Student s2 = new Student();
		s2.setName("猪八戒");
		s2.setAge(300);
		s2.setPhone("13888888887");
		s2.setScore(50.8f);
		s2.setTeacher(t1);
		session.save(s2);
		
		Student s3 = new Student();
		s3.setName("沙僧");
		s3.setAge(200);
		s3.setPhone("13888888886");
		s3.setScore(59.6f);
		s3.setTeacher(t1);
		session.save(s3);
		
		
		
		Teacher t2 = new Teacher();
		t2.setName("李老师");
		t2.setDept("技术部");
		t2.setJob("架构师");
		t2.setAge(32);
		session.save(t2);
		
		Student s4 = new Student();
		s4.setName("李同学");
		s4.setAge(20);
		s4.setPhone("13788888888");
		s4.setScore(89.4f);
		s4.setTeacher(t2);
		session.save(s4);
		
		Student s5 = new Student();
		s5.setName("李小花同学");
		s5.setAge(19);
		s5.setPhone("13788888887");
		s5.setScore(55.5f);
		s5.setTeacher(t2);
		session.save(s5);
		
		
		Student s6 = new Student();
		s6.setName("李小四");
		s6.setAge(18);
		s6.setPhone("13788888886");
		s6.setScore(62.8f);
		s6.setTeacher(t2);
		session.save(s6);
		
		
		// 第七步：事务提交或回滚
		transaction.commit();
		// 第八步：关闭Session与SessionFactory
		session.close();
		sf.close();

	}

}
