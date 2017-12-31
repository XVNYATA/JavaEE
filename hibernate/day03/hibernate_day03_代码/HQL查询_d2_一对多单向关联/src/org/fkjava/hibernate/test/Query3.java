package org.fkjava.hibernate.test;

import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.fkjava.hibernate.bean.Children;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class Query3 {
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
		
		// 自定义结果类型 来封装结果数据。
		
//      Query query = session.createQuery("select new Map(c.name as NAME , c.age as AGE) from Children c");
//      List<Map<String,Object>> maps = query.list();
//      System.out.println(maps);
		
		
//      Query query = session.createQuery("select new List(c.name , c.age ) from Children c");
//      List<List<Object>> list = query.list();
//      System.out.println(list);
		 
        Query query = session.createQuery("select new Children(c.name,c.age) from Children c");
        List<Children> list = query.list();
        System.out.println(list);

		
	
		tx.commit(); // 事物提交 
		session.close();
		sf.close();
	}
}
