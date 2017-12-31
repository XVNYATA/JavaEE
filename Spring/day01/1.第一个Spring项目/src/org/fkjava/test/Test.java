package org.fkjava.test;

import org.fkjava.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
		/*User user = new User();
		user.setId(1);
		user.setName("jack");
		user.setSex("男");
		user.setAge(18);
		System.out.println(user);*/
		
		/**
		 * Spring被称为容器，所有的bean创建处理都会保存在容器当中
		 * */
		// 读取内路径下面的applicationContext.xml文件
		ApplicationContext ac = new ClassPathXmlApplicationContext("/applicationContext.xml");
		// 根据id获取bean,id="user",如果没有该id，返回null
		User user = (User)ac.getBean("user");
		System.out.println(user);
		
		
		
	}

}
