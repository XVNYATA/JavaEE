package org.fkjava.test;

import org.fkjava.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestApplicationContext {

	public static void main(String[] args) {
		
		// 读取内路径下面的applicationContext.xml文件
		// ApplicationContext容器构建的时候会先创建好所有的singleton bean
		ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
		
		User user = (User) context.getBean("user");
		user.say();
		
		User user2 = (User) context.getBean("user");
		user2.say();
	
		
	}

}
