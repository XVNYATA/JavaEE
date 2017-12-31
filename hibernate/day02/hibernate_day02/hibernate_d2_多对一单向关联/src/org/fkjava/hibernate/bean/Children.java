package org.fkjava.hibernate.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;
@Entity
@Table(name="TB_CHILD")
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
	
	@ManyToOne(
			fetch=FetchType.LAZY,
			targetEntity = HusBand.class
//			,cascade=CascadeType.REMOVE
			)
	@JoinColumn(name="BB_ID_F",referencedColumnName="H_ID")
	private HusBand baba;
	
	
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
				+ ", sex=" + sex + ", baba=" + baba + "]";
	}

	
	
	
	

	
	
}
