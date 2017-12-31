package org.fkjava.hibernate.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="TB_WIFE")
public class Wife {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="W_ID")
	private int id ;
	
	@Column(name="W_NAME",length=23,nullable=false)
	private String name ;
	
	@Column(name="W_AGE")
	private int age ;
	
	@OneToOne(fetch=FetchType.LAZY,targetEntity=HusBand.class
			,mappedBy="wife")
	private HusBand husBand;

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
	
	public HusBand getHusBand() {
		return husBand;
	}

	public void setHusBand(HusBand husBand) {
		this.husBand = husBand;
	}

	@Override
	public String toString() {
		return "Wife [id=" + id + ", name=" + name + ", age=" + age
				+ ", husBand=" + husBand + "]";
	}

	
	
}
