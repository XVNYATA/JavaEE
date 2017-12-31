package org.fkjava.hibernate.test;

import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.fkjava.hibernate.bean.Children;
import org.fkjava.hibernate.bean.HusBand;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class Query6 {
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
		
		// 多态查询  
		// 查询父类的时候 可以查询父类对象和所有子类对象数据
//		Query query = session.createQuery("from java.lang.Object");
//		List<Object> objs= query.list();
//		objs.forEach(o -> {
//			System.out.println(o);
//		});
//		
		
		
	    //命令查询
//		List<HusBand> huss = session.getNamedQuery("query_HQL1").setParameter(0, 2L).list();
//		huss.forEach(h -> {
//			System.out.println(h.getName());
//		});
		
		List<HusBand> f = session.getNamedQuery("selectBaba").list();
		f.forEach(h -> {
			System.out.println(h.getName());
		});
		
	
		tx.commit(); // 事物提交 
		session.close();
		sf.close();
	}
}
