package org.fkjava.test;

import org.fkjava.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
		
		// 读取内路径下面的applicationContext.xml文件
		ApplicationContext ac = new ClassPathXmlApplicationContext("/applicationContext.xml");
		// 测试set注入
		/*User user = (User)ac.getBean("user");
		System.out.println(user);*/
		// 测试构造器注入
		User user = (User)ac.getBean("user2");
		System.out.println(user);
		
		
	}

}
