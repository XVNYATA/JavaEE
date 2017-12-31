package org.fkjava.hibernate.bean.set;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月21日下午2:07:41
 *  set集合映射
 */
@Entity
@Table(name="TB_USER")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="USER_ID")
	private int id  ;
	
	@Column(name="TB_NAME",length=23,nullable=false,insertable=true)
	private String name ;
	
	@ElementCollection(fetch=FetchType.LAZY,targetClass=String.class)
	@CollectionTable(name="TB_USER_ADDR")
	@Column(nullable=false)  // 集合必须申明非空 集合对应的表才会有主键（外键加列名作为联合主键）
	private Set<String> address = new HashSet<>();
	

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

	public Set<String> getAddress() {
		return address;
	}

	public void setAddress(Set<String> address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", address=" + address
				+ "]";
	}

	

}
