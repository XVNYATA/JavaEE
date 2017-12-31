package org.fkjava.hibernate.bean.list;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月21日上午11:08:11
 * 
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
	
	// 申明是集合属性
	@ElementCollection(
			fetch=FetchType.LAZY
			,targetClass=String.class
			)
//	 fetch=FetchType.EAGER: 立即加载
//     fetch=FetchType.LAZY: 延迟加载
	@CollectionTable(name="TB_USER_ADDR")
//  接口            变量                    =  new  实现类
	@OrderColumn(name="ADDR_ORDER_NUM")  // 排序列 : 因为list是有序的
	private List<String> address = new ArrayList<>();

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

	public List<String> getAddress() {
		return address;
	}

	public void setAddress(List<String> address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", address=" + address
				+ "]";
	}
	
	
}









