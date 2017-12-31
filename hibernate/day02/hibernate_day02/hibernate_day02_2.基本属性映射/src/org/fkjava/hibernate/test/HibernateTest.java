package org.fkjava.hibernate.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.Date;

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
			user.setAge("23");
			user.setMoney(new BigDecimal(2220.22));
			user.setName("李刚1");
			
			// 把图片转换成字节数组  
			FileInputStream fis = new FileInputStream(new File("C:/Users/apple/Desktop/图片资源/xlei.png"));
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
		    // 定义一个桶 
			byte[] buffer = new byte[1024];
			int len = 0;
			while((len = fis.read(buffer))!=-1){
				baos.write(buffer, 0, len);
			}
			baos.flush();
			user.setLogo(baos.toByteArray());
			fis.close();
			
			user.setCreateDate(new Date());
			
			session.save(user);
			
			tx.commit(); // 事物提交 
			session.close();
			sf.close();
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}









