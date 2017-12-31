package org.fkjava.domain;

import java.util.Locale;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 一个bean实现ApplicationContextAware接口，说明该bean需要获取ApplicationContext容器
 * 
 * Spring创建bean的时候，会检查bean上面是否实现了ApplicationContextAware接口,
 * 如果有该接口，比然实现该接口的setApplicationContext方法，Spring会将容器作为参数传给该方法
 * setApplicationContext方法在所有setPropety方法之后执行。
 * */
public class User implements ApplicationContextAware{
	
	private String name;
	private ApplicationContext context;

	public User() {
		super();
		System.out.println("User() --> ");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		System.out.println("setName() --> ");
		this.name = name;
	}
	
	// 输出国际化的欢迎语句（需要使用ApplicationContext.getMessage方法）
	public void sayHello(){
		System.out.println("sayHello --> ");
		System.out.println(name + context.getMessage("hello", null, Locale.getDefault()));
	}

	@Override
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		System.out.println("setApplicationContext --> ");
		this.context = arg0;
	}

}
