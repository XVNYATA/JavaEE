package org.fkjava.hibernate_day02_基础映射.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月21日上午9:15:51
 * 
 */
@Entity  // 持久化类
@Table(name="tb_user",
       indexes={@Index(columnList="name",name="TB_USER_NAME_INDEX"),
		        @Index(columnList="address",name="TB_USER_ADDR_INDEX")} 
        ,uniqueConstraints={@UniqueConstraint(columnNames={"name"},name="TB_USER_NAME_UNIQUE")}
		)
@DynamicInsert
@DynamicUpdate  // 哪个属性改变了就生成对应的修改语句
@SelectBeforeUpdate
public class User implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id  ; 
	private String name  ;
	private int age ;
	private String address ;
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
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", age=" + age
				+ ", address=" + address + "]";
	}
	
	
	
	
}





