package org.fkjava.test;

import org.fkjava.action.UserAction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestAction {

	public static void main(String[] args) {
		// 获得Spring的容器
		ApplicationContext ac = new ClassPathXmlApplicationContext("/applicationContext.xml");
		// 获取id为userAction的bean
		UserAction action = (UserAction) ac.getBean("userAction");
		// 调用方法
		action.sayHello();
	}

}
