package org.fkjava.domain;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class User implements ApplicationContextAware {
	
	private Dog dog;
	
	private ApplicationContext context;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 每次手动使用容器去获取dog
	 * */
	public Dog getDog() {
		return (Dog) context.getBean("dog");
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}
	
	/**
	 * 程序最终目的是：每一个user获取的dog是不同实例
	 * 首先，放弃依赖注入，换成每次手动使用容器去获取dog,而dog的scope="prototype"
	 * 所以每次获取的就是不同的实例。
	 * 在bean中使用容器，需要实现ApplicationContextAware接口
	 * */
	public void say(){
		System.out.println("宠物：" + this.getDog());
	}

	@Override
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		this.context = arg0;
		
	}

}
