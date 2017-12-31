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
 * @Date 2016年8月20日下午4:12:58
 * 
 */
public class TestUpdate {
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
		
		/** 持久态下修改  : 推荐使用这种方式修改  */
//		User user = (User) session.get(User.class, 10);
//		user.setName("----猪八戒2-----");
//		System.out.println("------------");
		
//		User user = new User();
//		user.setName("----猪八戒121-----");
//		user.setId(10);
//		session.saveOrUpdate(user); // 持久态
		
//		User user = new User();
//		user.setName("----猪八戒22-----");
//		user.setId(10);
//		User u  = (User) session.merge(user); 
//		System.out.println(u); // 持久态
//		System.out.println(user); // 瞬态
		
//		User user = new User();   // 瞬态
//		user.setName("----猪八戒122----- ");
//		user.setId(10); // 托管态
//		session.update(user);  // 持久态
//		System.out.println(user);
//		user.setAge(1111111111);
		
		tx.commit();
		session.close();
		sf.close();
		
	}
}
