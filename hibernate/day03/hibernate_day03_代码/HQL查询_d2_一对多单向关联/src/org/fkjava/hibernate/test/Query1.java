package org.fkjava.hibernate.test;

import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class Query1 {
	public static void main(String[] args) {
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
		
		// 查询所有的爸爸  hql 
//		Query query = session.createQuery("select h from HusBand h");
//		List<HusBand> huss = query.list();
//		System.out.println(huss);
		
//		Query query1 = session.createQuery("select c from Children c");
//		List<Children> ccc = query1.list();
//		System.out.println(ccc);
		
//		Query query = session.createQuery("from HusBand h");
//		List<HusBand> huss = query.list();
//		System.out.println(huss);
		
//		Query query = session.createQuery("from HusBand");
//		List<HusBand> huss = query.list();
//		System.out.println(huss);
		
//		Query query = session.createQuery("from HusBand as h");
//		List<HusBand> huss = query.list();
//		System.out.println(huss);
		
		// select 对象变量|对象.属性 from 类 对象变量
//		Query query = session.createQuery("select h.name from HusBand h");
//		List<String> huss = query.list();
//		System.out.println(huss);
       
//		Query query = session.createQuery("select h.age from HusBand h");
//		List<Integer> huss = query.list();
//		System.out.println(huss);
		
//		Query query = session.createQuery("select h.name, h.age from HusBand h");
//		List<Object[]> huss = query.list();
//		for(Object[] obj : huss){
//			System.out.println(Arrays.toString(obj));
//		}
		
//		Query query = session.createQuery("select name, age from HusBand");
//		List<Object[]> huss = query.list();
//		for(Object[] obj : huss){
//			System.out.println(Arrays.toString(obj));
//		}
		
		Query query = session.createQuery("select h.name, h.age , h from HusBand h");
		List<Object[]> huss = query.list();
		for(Object[] obj : huss){
			System.out.println(Arrays.toString(obj));
		}
		
	
		tx.commit(); // 事物提交 
		session.close();
		sf.close();
	}
}
