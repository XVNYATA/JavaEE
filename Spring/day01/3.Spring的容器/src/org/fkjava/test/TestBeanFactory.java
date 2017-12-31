package org.fkjava.test;

import org.fkjava.domain.User;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

public class TestBeanFactory {

	// 简单了解  BeanFactory创建的时候不会去初始化singleton bean,使用时才创建bean的实例
	public static void main(String[] args) {
		BeanFactory bf = new XmlBeanFactory(
				new ClassPathResource("/applicationContext.xml"));
		System.out.println("容器构建完成 -->>" + bf);
		User user = (User) bf.getBean("user");
		System.out.println(user);
		User user2 = (User) bf.getBean("user");
		System.out.println(user2);

	}

}
