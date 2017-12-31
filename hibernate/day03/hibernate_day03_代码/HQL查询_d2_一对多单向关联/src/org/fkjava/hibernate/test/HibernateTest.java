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
			
			Children c1 = new Children();
			c1.setAge(10);
			c1.setName("李小刚");
			c1.setSex("男");
		    session.save(c1);
		    
			Children c2 = new Children();
			c2.setAge(16);
			c2.setName("李浩子");
			c2.setSex("男");
		    session.save(c2);
		    
		    HusBand hb = new HusBand();
		    hb.setAge(35);
		    hb.setName("李刚");
		    hb.getChildrens().add(c1);
		    hb.getChildrens().add(c2);
		    session.save(hb);
		    
		    
			Children c3 = new Children();
			c3.setAge(20);
			c3.setName("王小明");
			c3.setSex("男");
		    session.save(c3);
		    
			Children c4 = new Children();
			c4.setAge(16);
			c4.setName("王小华");
			c4.setSex("男");
		    session.save(c4);
		    
		    HusBand hb1 = new HusBand();
		    hb1.setAge(35);
		    hb1.setName("王大帅");
		    hb1.getChildrens().add(c3);
		    hb1.getChildrens().add(c4);
		    session.save(hb1);
		    
			

			
		
			tx.commit(); // 事物提交 
			session.close();
			sf.close();
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}









