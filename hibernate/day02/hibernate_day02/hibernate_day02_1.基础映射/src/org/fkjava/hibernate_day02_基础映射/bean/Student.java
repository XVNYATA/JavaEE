package org.fkjava.hibernate_day02_基础映射.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="TB_STUDENT")
public class Student {
	
	@EmbeddedId //复合属性做主键
	private Name1 name ;

	private int age ;

	public Name1 getName() {
		return name;
	}

	public void setName(Name1 name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
	
	
}
