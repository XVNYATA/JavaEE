package org.fkjava.hibernate.bean.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MapKeyColumn;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月21日上午11:43:11
 * 
 */
@Entity
@Table(name="TB_STUDENT")
public class Student {
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="TB_STU_ID")
	private int id  ;
	@Column(name="TB_NAME",length=23)
	private String name ;
	
	@ElementCollection(fetch=FetchType.LAZY,targetClass=Address.class)
	@CollectionTable(name="TB_MAP_ADDR")
	@MapKeyColumn(name="ADDR_KEY")
    private Map<String, Address> addr = new HashMap<String, Address>();
	
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
	public Map<String, Address> getAddr() {
		return addr;
	}
	public void setAddr(Map<String, Address> addr) {
		this.addr = addr;
	}
	

	
	
}
