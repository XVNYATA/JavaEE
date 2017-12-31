package org.fkjava.hibernate.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.Date;

import org.fkjava.hibernate.bean.HusBand;
import org.fkjava.hibernate.bean.Children;
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
			
//		    
//		    HusBand hb = new HusBand();
//		    hb.setAge(35);
//		    hb.setName("李刚");
//		    session.save(hb);
//			
//			Children c1 = new Children();
//			c1.setAge(10);
//			c1.setName("小刚");
//			c1.setSex("男");
//			c1.setBaba(hb);
//		    session.save(c1);
////		    
//			Children c2 = new Children();
//			c2.setAge(11);
//			c2.setName("浩子");
//			c2.setSex("男");
//			c2.setBaba(hb);
//		    session.save(c2);
            
			Children cd = (Children) session.get(Children.class, 1);
			session.delete(cd);
//			System.out.println(cd.getBaba());
		
			tx.commit(); // 事物提交 
			session.close();
			sf.close();
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}









