package org.fkjava.hibernate.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月20日上午10:35:28
 * 用户表 ： 持久化类 ：与数据库表做映射的类
 * javaBean :  
 *   1.必须提供无参数构造器 
 *   2.一般需要实现序列化接口 对象数据可以保存的磁盘或者进行网络传输 io第二天下午的代码
 *   3.成员变量一般都要封装 private 并且需要提供getter和setter方法
 *   
 */
@Entity(name="tb_user")
public class User implements Serializable{
	
	@Id // 主键
	@Column(name="TB_ID")
	private int id  ;
	
	@Column(name="TB_NAME")
	private String name ;
	
	private int age  ;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", age=" + age + "]";
	}
	
	
}
