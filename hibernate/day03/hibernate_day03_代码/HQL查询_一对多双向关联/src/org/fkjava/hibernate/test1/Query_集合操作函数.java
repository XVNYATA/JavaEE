package org.fkjava.hibernate.test1;

import java.util.List;

import org.fkjava.hibernate.bean.HusBand;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;


public class Query_集合操作函数 {

	public static void main(String[] args) {
		// 第一步：创建Configuration
		Configuration configuration = new Configuration() // 加载hibernate.properties
		       .configure(); // 加载hibernate.cfg.xml
		// 第二步：创建服务注册对象
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();
		// 第三步：创建SessionFactory
		SessionFactory sf = configuration.buildSessionFactory(serviceRegistry);
		// 第四步：创建Session
		Session session = sf.openSession();
		// 第五步：开启事务
		Transaction transaction = session.beginTransaction();
		// 第六步：利用 Session完成所有的持久化操作
		// 操作集合属性的函数：
		// size()|size, minelement(), maxelement(), minindex(), maxindex().
		// 查询订单明细有三个的订单
		// size() | size 
//		List<HusBand> huss = session.createQuery("select o from HusBand o where size(o.childrens) >= ?")
//		       .setParameter(0,3).list();
//		huss.forEach(o ->{
//			System.out.println(o.getName());
//		});
		
		
//		List<HusBand> huss = session.createQuery("select o from HusBand o where o.childrens.size >= ?")
//			       .setParameter(0,3).list();
//		huss.forEach(o ->{
//			System.out.println(o.getName());
//		});
		
		// minelement(), maxelement() : 对集合中元素生成的列进行操作
		
		// minindex(), maxindex() : 对集合生成的排序列进行操作

		

		
		
		// 第七步：事务提交或回滚
		transaction.commit();
		// 第八步：关闭Session与SessionFactory
		session.close();
		sf.close();

	}

}
