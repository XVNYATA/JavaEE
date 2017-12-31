package org.fkjava.hibernate.test;

import java.util.Arrays;
import java.util.List;

import org.fkjava.hibernate.domain.Student;
import org.fkjava.hibernate.domain.Teacher;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistry;


public class Query_1 {

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
		//                                      "from Student"
//		Criteria ct = session.createCriteria(Student.class);
//		// 查询所有的学生
//		List<Student> students = ct.list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		
//		List<Teacher> students = session.createCriteria("org.fkjava.hibernate.domain.Teacher").list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// 添加查询条件
		// select s from Student s where s.name like "%小%"
//		List<Student> students = session.createCriteria(Student.class)
//				.add(Restrictions.like("name", "%小%")) // 添加查询约束条件
//				.list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// select s from Student s where s.name like  "%小%" and s.age between 19 and 22
//		List<Student> students = session.createCriteria(Student.class)
//				.add(Restrictions.like("name", "%小%")) // 添加查询条件
//				.add(Restrictions.between("age", 19, 22)) // 添加查询条件
//				.list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		
//		List<Student> students = session.createCriteria(Student.class)
//				.add(Property.forName("name").like("%小%")) // 添加查询条件
//				.add(Property.forName("age").between(19, 22)) // 添加查询条件
//				.list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
//		List<Student> students = session.createCriteria(Student.class)
//				.add(Restrictions.sqlRestriction("length(stu_name) = 6 and stu_name like '%沙%'")) // 添加查询条件
//				.list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// 添加排序  select s from Student s order by s.age desc
//		List<Student> students = session.createCriteria(Student.class)
//				.addOrder(Order.desc("age")) // 添加排序
//				.list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
//		List<Student> students = session.createCriteria(Student.class)
//				.addOrder(Property.forName("age").desc()) // 添加排序
//				.list();
//		students.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
//		// 查询一列 select s.name from Student s 
//		List<String> lists = session.createCriteria(Student.class)
//				.setProjection(Projections.property("name")) // 查询指定的列
//				.list();
//		System.out.println(lists);
		
		// 查询多列 select s.name ,s.phone from Student s 
//		ProjectionList pl = Projections.projectionList();
//		pl.add(Projections.property("name"));// 查询指定的列
//		pl.add(Projections.property("phone"));// 查询指定的列
//		List<Object[]> lists = session.createCriteria(Student.class)
//				.setProjection(pl) // 查询指定的多列 
//				.list();
////		System.out.println(lists);
//		lists.forEach(s -> {
//			System.out.println(Arrays.toString(s));
//		});
		
		// 聚集函数 select count(*) from Student
//		Object res = session.createCriteria(Student.class)
//			.setProjection(Projections.rowCount()).uniqueResult();
//		System.out.println(res);
		// avg select avg(s.score) from Student s 
//		Object res = session.createCriteria(Student.class)
//				.setProjection(Projections.sum("score")).uniqueResult();
//		System.out.println(res);
		
		// 分组  每个老师拥有的学生个数
		// select count(*) from Student s group by s.teacher.id 
//		List<Object[]> lists = session.createCriteria(Student.class)
//			.setProjection(Projections.projectionList()
//							.add(Projections.rowCount())
//							.add(Projections.groupProperty("teacher.id"))).list();
//		lists.forEach(obj ->{
//			System.out.println(Arrays.toString(obj));
//		});
		
		// HQL 查询出当前老师 对应学生的个数 
		String hql = "select t.name , count(*) from Teacher t inner join t.students s group by t.id ";
		List<Object[]> infos = session.createQuery(hql).list();
		infos.forEach(obj ->{
			System.out.println(Arrays.toString(obj));
		});
		
		// 第七步：事务提交或回滚
		transaction.commit();
		// 第八步：关闭Session与SessionFactory
		session.close();
		sf.close();

	}

}
