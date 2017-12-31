package org.fkjava.hibernate.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQuery;
@Entity
@Table(name="TB_CHILD")
// 只要在持久化类中就可以
@NamedQuery(name="selectBaba" ,query="select f from HusBand f")
public class Children {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="C_ID")
	private int id ;
	
	@Column(name="C_NAME",length=23,nullable=false)
	private String name ;
	
	@Column(name="C_AGE")
	private int age ;
	
	@Column(name="C_SEX")
	private String sex ;
	
	@ManyToOne(fetch=FetchType.LAZY,
			targetEntity=HusBand.class)
	@JoinColumn(name="H_ID_F",referencedColumnName="H_ID")  // 外键需要定义在多的一方
	private HusBand baba ;
	
	
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
	

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public HusBand getBaba() {
		return baba;
	}

	public void setBaba(HusBand baba) {
		this.baba = baba;
	}

	@Override
	public String toString() {
		return "Children [id=" + id + ", name=" + name + ", age=" + age
				+ ", sex=" + sex +  "]";
	}

	

	
	
}
