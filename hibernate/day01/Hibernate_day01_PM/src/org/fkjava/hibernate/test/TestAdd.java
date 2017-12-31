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
 * @Date 2016年8月20日下午2:37:22
 * 
 */
public class TestAdd {
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
		
		/**  ********** save ************   
		User user = new User();  // 瞬态
		user.setName("李刚");
		user.setAge(35);
		Integer id  = (Integer) session.save(user); // 持久化状态
		System.out.println(id+"--"+user); // 返回一个序列化的主键。
		
		// 持久化对象 只要对象被修改 当事物提交的时候 表数据也会对象修改。
		// 持久化对象 一定拥有主键id值。
		user.setName("李刚最后被修改");
		
		 */
		
		/** ************** persist *************** 
		User user = new User();  // 瞬态
		user.setName("孙悟空");
		user.setAge(500);
		session.persist(user);   // 没有返回值 主键存在持久化对象中
		System.out.println("user:"+user); // 也是持久化状态
		user.setName("唐僧");
		*/
		
		/** *************** saveOrUpdate******************** 
		User user = new User();  // 瞬态
		user.setName("猪八戒");
		user.setAge(1500);
		session.saveOrUpdate(user); // 持久化状态  没有id值就添加
		System.out.println("user:"+user);
		user.setName("猪八戒3号"); 
		
		User user = new User();  // 瞬态
		user.setName("天蓬元帅111");
		user.setAge(1200);
		user.setId(10);  //  托管状态  有id值就修改 
		session.saveOrUpdate(user);
		System.out.println("user:"+user); // 持久化状态
		user.setName("天棚元素");
		
		*/
		
		/** *************merge添加**************** 
		User user = new User();
		user.setName("蜘蛛精1");
		user.setAge(200);
		// 返回一个持久化对象  但是 user依然是瞬态
		User u = (User) session.merge(user);
		System.out.println("user :" +user); // 瞬态
		System.out.println("u :" +u);  // 持久化对象
		user.setName("============");  // 瞬态set对象不会产生修改数据库操作
		u.setName("uuuuuuuuuu"); // 持久化状态下set会产生修改数据库操作。
		
		*/
		
		/** *************merge修改**************** */
		User user = new User(); // 瞬态
		user.setName("蜘蛛精2222222221");
		user.setAge(2200);
		user.setId(13);  
		// 返回一个持久化对象  但是 user依然是瞬态
		User u = (User) session.merge(user);
		System.out.println("user :" +user); // 瞬态
		System.out.println("u :" +u);  // 持久化对象
		u.setName("--------------");
		
		
		tx.commit();
		session.close();
		sf.close();
		
		
		
		
	}
}









