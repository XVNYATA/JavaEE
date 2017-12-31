package org.fkjava.hibernate.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月20日下午2:24:03
 * 
 */
@Entity(name="TB_XLEI_USER")  // 申明这个类是持久化类
public class User {
	
	// 自增  create sequence tb_id_sequence 创建序列  oracle数据库
	// 自增  auto_increment mysql数据库
	// 让hibernate根据数据库确定自增策略 推荐使用这种方式
	@Id // 申明主键
	@GeneratedValue(strategy=GenerationType.AUTO)   
	@Column(name="TB_ID")
	private int id ;
	
	@Column(name="TB_NAME")   // 大写快捷键 CTRL+SHIFT+X　　小写　CTRL+SHIFT＋Ｙ
	private String name ;
	
	@Column(name="TB_AGE")
	private int age ;
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
