package org.fkjava.hibernate.test1;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class Query_聚合函数 {

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
		
		// 聚集函数(统计函数): count()、sum()、max()、min()、avg()
		// count()
//		Long count = (Long)session.createQuery("select count(*) from Children").uniqueResult();
//		System.out.println(count);
		
		// sum()
//		Long sum = (Long) session.createQuery("select sum(age) from Children").uniqueResult();
//		System.out.println(sum);
		
		// max()
//		Integer max = (Integer)session.createQuery("select max(age) from Children").uniqueResult();
//		System.out.println(max);
		
		// min()
//		Integer min = (Integer)session.createQuery("select min(age) from Children").uniqueResult();
//		System.out.println(min);
		
		// avg()
		Double avg = (Double)session.createQuery("select avg(age) from Children").uniqueResult();
		System.out.println(avg);
		
		// 第七步：事务提交或回滚
		transaction.commit();
		// 第八步：关闭Session与SessionFactory
		session.close();
		sf.close();

	}

}
