package org.fkjava.hibernate.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.Date;

import org.fkjava.hibernate.bean.HusBand;
import org.fkjava.hibernate.bean.Wife;
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
			
		
			
//			Wife wife = new Wife();
//			wife.setAge(20);
//			wife.setName("李夫人");
//			session.save(wife);
////			
//			HusBand hudBand = new HusBand();
//			hudBand.setAge(35);
//			hudBand.setName("李刚");
//		    hudBand.setWife(wife);
//		    session.save(hudBand);
		    
//		    HusBand husBand = (HusBand) session.get(HusBand.class, 1);
//			System.out.println("--------------------");
//			// 获取的name不是延迟加载的 
//			System.out.println(husBand.getWife().getName());
			
    	    Wife wife = (Wife) session.get(Wife.class, 1);
    	    System.out.println(wife.getHusBand().getName());

		
			
			
			tx.commit(); // 事物提交 
			session.close();
			sf.close();
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}









