package org.fkjava.hibernate.bean.map;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MapKeyColumn;
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
	@CollectionTable(name="TB_USER_MAP_ADDR")
	@MapKeyColumn(name="ADDR_KEY")
	private Map<Integer,String> address = new HashMap<>();
	

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

	public Map<Integer, String> getAddress() {
		return address;
	}

	public void setAddress(Map<Integer, String> address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", address=" + address
				+ "]";
	}

	
	

}
