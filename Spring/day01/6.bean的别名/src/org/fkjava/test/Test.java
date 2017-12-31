package org.fkjava.test;

import org.fkjava.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
		
		// 读取内路径下面的applicationContext.xml文件
		ApplicationContext ac = new ClassPathXmlApplicationContext("/applicationContext.xml");
		
		// 通过id="user"访问
		User user = (User)ac.getBean("user");
		System.out.println(user);
		
		// 通过alias="person"访问
		User person = (User)ac.getBean("person");
		System.out.println(person);
		
	}

}
