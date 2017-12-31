package org.fkjava.test;

import org.fkjava.domain.Cat;
import org.fkjava.domain.Dog;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestApplicationContext {

	public static void main(String[] args) {
		
		// 读取内路径下面的applicationContext.xml文件
		// ApplicationContext容器构建的时候会先创建好所有的singleton bean
		ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
		System.out.println("容器构建完成 -->>" + context);
		
		Dog dog = (Dog) context.getBean("dog");
		System.out.println(dog);
		
		Cat cat = (Cat) context.getBean("cat");
		System.out.println(cat);
	
		
	}

}
