package org.fkjava.test;

import org.fkjava.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestApplicationContext {

	public static void main(String[] args) {
		
		// 读取内路径下面的applicationContext.xml文件
		// ApplicationContext容器构建的时候会先创建好所有的singleton bean
		ApplicationContext ac = new ClassPathXmlApplicationContext("/applicationContext.xml");
		System.out.println("容器构建完成 -->>" + ac);
		
		User user = (User)ac.getBean("user");
		System.out.println(user);
		
		User user2 = (User)ac.getBean("user");
		System.out.println(user2);
		
		
	}

}
