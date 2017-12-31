package org.fkjava.hibernate.bean.set;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable // 申明是集合的复合类型
public class Address {
	
	@Column(nullable=false)
	private String province ;
	
	@Column(name="ADDR_DESC",nullable=false)
	private String desc ;  // asc desc   数据库的关键字不能作为列名
	

	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}

	
	
}
