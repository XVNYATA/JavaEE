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

public class Query4 {
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
		// 查谁找谁！！！   查询爸爸是以“李”开始的所有的孩子
//      Query query = session.createQuery("select c from Children c where c.baba.name like ?");
//		query.setParameter(0, "李%");
//		List<Children> childrens = query.list();
//		childrens.forEach(c -> {
//			System.out.println(c.getName());
//		});
		
		// 查询 王小明 的 父亲   
//	    Query query = session.createQuery("select f from HusBand f "
//	    		+ "inner join f.childrens c where c.name = ?");
//	    query.setParameter(0, "王小明");
//	    
//	    HusBand hus = (HusBand) query.uniqueResult();
//	    System.out.println(hus.getName());
		
		// 查询 不是 王小明的父亲 的所有父亲uer
//		String sql = "select f from HusBand f where f.id not in ( ";
//		sql+="select b.id from HusBand b inner join b.childrens c where c.name = ? )";
//		
//		Query query = session.createQuery(sql);
//		query.setParameter(0, "王小明");
//		List<HusBand> huss = query.list();
//		huss.forEach(s -> {
//			System.out.println(s.getName());
//		});
		
//		Query query = session.createQuery("select c from Children c join fetch c.baba where c.id = ?");
//		query.setParameter(0, 2);
//		Children chds  = (Children) query.uniqueResult();
//		System.out.println("----------ddddddddddd---------------");
//		System.out.println(chds.getBaba().getName());
		


		
	
		tx.commit(); // 事物提交 
		session.close();
		sf.close();
	}
}
