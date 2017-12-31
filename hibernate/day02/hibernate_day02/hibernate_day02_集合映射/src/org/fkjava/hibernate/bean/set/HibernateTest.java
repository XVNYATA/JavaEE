package org.fkjava.hibernate.bean.set;

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
 * @Date 2016年8月20日上午10:57:09
 * 
 */
public class HibernateTest {
	public static void main(String[] args) {
		try {
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
			
			User user = new User();
			user.setName("李刚");
			user.getAddress().add("广州车陂1");
			user.getAddress().add("广州车陂2");
			user.getAddress().add("广州车陂3");
			user.getAddress().add("广州车陂4");
			
			session.save(user);
			
			tx.commit(); // 事物提交 
			session.close();
			sf.close();
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}









