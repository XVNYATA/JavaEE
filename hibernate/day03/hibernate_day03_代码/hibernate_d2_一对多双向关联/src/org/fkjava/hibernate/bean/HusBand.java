package org.fkjava.hibernate.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月21日下午3:08:27
 * 
 */
@Entity
@Table(name="TB_HUSBAND")
public class HusBand {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="H_ID")
	private int id ;
	
	@Column(name="H_NAME",length=23,nullable=false)
	private String name ;
	
	@Column(name="H_AGE")
	private int age ;
	
	@OneToMany(
			   fetch=FetchType.LAZY,
			   targetEntity=Children.class
			   ,
			   cascade=CascadeType.REMOVE // 级联删除(级联到关联的持久化类)
			   ,orphanRemoval=true // 删除孤儿记录
			   ,mappedBy="baba"
			)     // 1对多 1的一方的主键作为多的一方的外键。
	private Set<Children> childrens = new HashSet<Children>();
	
	// 1 - 李刚     
	// 1 - 小刚    1
	// 2 - 刚刚    1
	

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

	public Set<Children> getChildrens() {
		return childrens;
	}

	public void setChildrens(Set<Children> childrens) {
		this.childrens = childrens;
	}

	@Override
	public String toString() {
		return "HusBand [id=" + id + ", name=" + name + ", age=" + age
				+ ", childrens=" + childrens + "]";
	}
	
	
	
}
