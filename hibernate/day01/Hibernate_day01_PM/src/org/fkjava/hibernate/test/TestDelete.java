package org.fkjava.hibernate.test;

import org.fkjava.hibernate.bean.User;
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
 * @Date 2016年8月20日下午4:40:35
 * 
 */
public class TestDelete {
	public static void main(String[] args) {
		/** 1.加载核心配置文件  */ 
		Configuration configuration = new Configuration()  // 只会加载hibernate.properties文件
		.configure(); // 可以加载hibernate.cfg.xml文件
		
		/** 2.得到一个服务注册对象  */
		ServiceRegistry serviceRegistry =
          new StandardServiceRegistryBuilder().applySettings(configuration.getProperties())
          .build();
		;   
		
		/** 3.得到一个连接工厂 : 连接工厂一初始化表就开始自动创建 */
		SessionFactory sf = configuration.buildSessionFactory(serviceRegistry);
		
		/** 4.得到一个会话对象  */
		Session session = sf.openSession();
		
		/** 5.事物  */
		Transaction tx = session.beginTransaction();
		
		/** 持久态下删除   */
//		User user = (User) session.get(User.class,10);
//		session.delete(user);
		
		User user = new User();
		user.setId(13);
		session.delete(user);
		
		tx.commit();
		session.close();
		sf.close();
	}
}
