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

public class Query5 {
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
		
	   // 查询 孩子个数 <= 2的 父亲 
//		String hql = "select f from HusBand f inner join f.childrens c "
//				+ " group by f.id having count(*) <= ? order by f.id desc ";
//		Query query = session.createQuery(hql);
//		query.setParameter(0, 2L);
//		List<HusBand> huss = query.list();
//		huss.forEach(h -> {
//			System.out.println(h.getName());
//		});
		
		// 查询孩子平均年龄大于等于 16岁的父亲  
//		StringBuilder hql = new StringBuilder();
//		hql.append(" select f from HusBand f ");
//		hql.append(" inner join f.childrens c");
//		hql.append(" group by f.id having avg(c.age) >= ? order by f.id desc");
//		Query query = session.createQuery(hql.toString());
//		query.setParameter(0, 16.0);
//		List<HusBand> huss = query.list();
//		huss.forEach(h -> {
//			System.out.println(h.getName());
//		});
	
		tx.commit(); // 事物提交 
		session.close();
		sf.close();
	}
}
