package org.fkjava.test;

import java.util.Arrays;

import org.fkjava.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
		
		// 读取内路径下面的applicationContext.xml文件
		ApplicationContext ac = new ClassPathXmlApplicationContext("/applicationContext.xml");
	
		User user = (User)ac.getBean("user");
		
		System.out.println(Arrays.toString(user.getNames()));
		System.out.println(user.getBooks());
		System.out.println(user.getSets());
		System.out.println(user.getMaps());
		System.out.println(user.getPros());
		
	}

}
