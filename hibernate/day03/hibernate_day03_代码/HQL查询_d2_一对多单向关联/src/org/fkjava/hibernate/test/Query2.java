package org.fkjava.hibernate.test;

import java.util.Arrays;
import java.util.List;

import org.fkjava.hibernate.bean.Children;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class Query2 {
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
		
		int pageIndex  = 1 ;
		int pageSize = 3 ;
		
		//  limit ? , ?	  hibernate的分页
//		Query query = session.createQuery("from Children");
//		query.setFirstResult((pageIndex -1) * pageSize);
//		query.setMaxResults(pageSize);
//		List<Children> childrens = query.list();
//		System.out.println(childrens);
		
//		Query query = session.createQuery("select c from Children c where c.name = ? ");
//		//                 索引    值
//		query.setParameter(0, "王小明");
//		// 认为结果是一个
//		Children ch = (Children) query.uniqueResult();  // 唯一结果
//		System.out.println(ch);
		
	
		tx.commit(); // 事物提交 
		session.close();
		sf.close();
	}
}
