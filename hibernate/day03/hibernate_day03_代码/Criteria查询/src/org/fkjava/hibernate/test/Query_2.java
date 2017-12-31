package org.fkjava.hibernate.test;

import java.util.Arrays;
import java.util.List;

import org.fkjava.hibernate.domain.Student;
import org.fkjava.hibernate.domain.Teacher;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistry;


public class Query_2 {

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
		
	    // 创建关联查询 createAlias
		// 通过老师id查询学生
		// 连接查询 ;连接就是持久化类 
		//        连接的是一个集合 
		// select s from Student s where s.teacher.id = 1 ;
//		List<Student> lists = session.createCriteria(Student.class)
//		       .createAlias("teacher", "t") // 创建关联查询
//		       .add(Restrictions.eq("t.id", 1)).list();
//		lists.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		 // 创建关联查询  createCriteria
		// 通过老师id查询学生 没有关联属性别名
//		List<Student> lists = session.createCriteria(Student.class)
//		       .createCriteria("teacher") // 创建关联查询  
//		       .add(Restrictions.eq("id", 1)).list();
//		lists.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// select s from Student s where s.age > 220 and s.teacher.id = 1
//		List<Student> lists = session.createCriteria(Student.class)
//			       .createAlias("teacher", "t") // 创建关联查询  
//			       .add(Restrictions.gt("age", 220)) // 为学生添加
//			       .add(Restrictions.eq("t.id", 1)) // 为老师添加
//			       .list();
//		lists.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		//select s from Student s where s.age > 220 and s.teacher.id = 1
//		List<Student> lists = session.createCriteria(Student.class)
//				   .add(Restrictions.gt("age", 220)) // 为学生添加
//			       .createCriteria("teacher") // 创建关联查询  
//			       .add(Restrictions.eq("id", 1)) // 为老师添加
//			       .list();
//		lists.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// setFetchMode: 抓取延迟的属性
		// select s from Student s join fetch s.teacher
//		List<Student> lists = session.createCriteria(Student.class)
//				.setFetchMode("teacher", FetchMode.JOIN)  // 立即加载学生的老师 
//				.list();
//		System.out.println("-------------------------");
//		lists.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge()+"--"+s.getTeacher().getName());
//		});
		
		// 离线查询 先将sql语句编译好 放在这里
//		DetachedCriteria dc = DetachedCriteria.forClass(Student.class);
//		// select * from stu_info. = dc
//		// 要查询的时候再跟Session关联
//		List<Student> lists = dc.getExecutableCriteria(session).list();
//		lists.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// 子查询 
		// select s from Student s where s.id in (1,2,3,4)
//		List<Student> lists = session.createCriteria(Student.class)
//				.add(Restrictions.in("id", new Object[]{1,2,3,4})).list();
//		lists.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// 离线查询作为子查询的一部分
		DetachedCriteria dc = DetachedCriteria.forClass(Teacher.class); // 
		dc.setProjection(Projections.property("id"));
		// = select t.id from Teacher t  先准备好了子查询sql语句
		
		// select s from Student s where s.id (select t.id from Teacher t)
		List<Student> lists = session.createCriteria(Student.class)
				             .add(Property.forName("id").in(dc)).list();
				
		lists.forEach(s ->{
			System.out.println(s.getId() + "\t" + s.getName() + "==" + s.getAge());
		});
//		
		
		// 第七步：事务提交或回滚
		transaction.commit();
		// 第八步：关闭Session与SessionFactory
		session.close();
		sf.close();

	}

}
