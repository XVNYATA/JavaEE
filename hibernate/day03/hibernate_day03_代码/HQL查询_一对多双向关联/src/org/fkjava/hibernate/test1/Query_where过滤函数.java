package org.fkjava.hibernate.test1;

import java.util.List;

import org.fkjava.hibernate.bean.Children;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * Query_3
 * @author LEE.SIU.WAH
 * @email lixiaohua7@163.com
 * @date 2015年4月13日 上午9:31:04
 * @version 1.0
 */
public class Query_where过滤函数 {

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
		
		// like
//		List<Children> childrens = session.createQuery("select s from Children s where s.name like ?19")
//				       .setParameter("19", "%小%").list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// between ... and
//		List<Children> childrens = session.createQuery("select s from Children s where s.name like ?19 and s.age between ?10 and ?11")
//			       .setParameter("19", "%小%")
//			       .setInteger("10", 20)
//			       .setInteger("11", 24)
//			       .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// concat 字符连接
//		List<Children> childrens = session.createQuery("select s from Children s where s.name like concat('%', ?2, '%')")
//			       .setParameter("2", "小").list();  // % + "小" + %
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// is not null
//		List<Children> childrens = session.createQuery("select s from Children s where s.name is not null")
//			       .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// trim()  去空字符
//		List<Children> childrens = session.createQuery("select s from Children s where trim(s.name) like ?")
//				    .setParameter(0, "%小%")
//			       .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// upper()
//		List<Children> childrens = session.createQuery("select s from Children s where upper(s.name) like ?")
//			    .setParameter(0, "%aaB%")
//		       .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		
		// 查询学生姓名长度为2
		// length  字节长度
//		List<Children> childrens = session.createQuery("select s from Children s where length(s.name) >= ?")
//			    .setParameter(0, 9)
//		       .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		
		// sqrt() 开方
//		List<Children> childrens = session.createQuery("select s from Children s where sqrt(s.id) = ?")
//			    .setParameter(0, 2.0)
//		       .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// bit_length 位长
//		List<Children> childrens = session.createQuery("select s from Children s where bit_length(s.name) = ?")
//	    .setParameter(0, 96L)
//        .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getName() + "==" + s.getAge());
//		});
		
		// mod  对谁取余
//		List<Children> childrens = session.createQuery("select s from Children s where mod(s.id, ?) = ?")
//	    .setParameter(0, 2)
//	    .setParameter(1, 1)
//        .list();
//		childrens.forEach(s ->{
//			System.out.println(s.getId() + "\t " + s.getName() + "==" + s.getAge());
//		});
//		
		
		
		
		// 第七步：事务提交或回滚
		transaction.commit();
		// 第八步：关闭Session与SessionFactory
		session.close();
		sf.close();

	}

}
