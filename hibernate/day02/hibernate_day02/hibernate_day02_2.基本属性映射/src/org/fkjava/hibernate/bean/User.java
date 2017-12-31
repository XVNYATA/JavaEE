package org.fkjava.hibernate.bean;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * @Author xlei
 * @Email dlei0009@163.com
 * @Tel 18665616520
 * @QQ  251425887
 * @From http://www.fkjava.org
 * @Date 2016年8月21日上午10:12:30
 * 
 */
@Entity
@Table(name="TB_USER")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="IB_ID")
	private int id  ;
	
	@Column(name="TB_NAME",
			length=23,
			nullable=false,
			unique=true,
			insertable=true,
			updatable=false
			)
	private String name ;
	
	@Column(name="TB_MONEY",precision=6,scale=2)
	private BigDecimal money ;
	
	@Column(name="TB_AGE",columnDefinition=" varchar(20) not null")
	private String age ;
	
	@Lob   // 映射大的二进制数据或者文本
	@Column(name="TB_PIC")
	private byte[] logo ;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="TB_CREATE_DATE")
	private Date createDate;
	
	// 不愿意参与持久化
//	private transient String passWord ;
	@Transient
	private String passWord ;

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

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public byte[] getLogo() {
		return logo;
	}

	public void setLogo(byte[] logo) {
		this.logo = logo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", money=" + money
				+ ", age=" + age + ", logo=" + Arrays.toString(logo)
				+ ", createDate=" + createDate + ", passWord=" + passWord + "]";
	}

	
	

	
}









