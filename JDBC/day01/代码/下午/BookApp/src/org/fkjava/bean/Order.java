package org.fkjava.bean;

import java.util.Date;

//订单
public class Order {
	
	private Integer id;
	private String order_no;//订单编号
	private Date cruedate;//创建时间
	private Date outdate;//发货时间
	private double money;//订单总金额
	
	//user_id
	private User user;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	

	public Date getCruedate() {
		return cruedate;
	}

	public void setCruedate(Date cruedate) {
		this.cruedate = cruedate;
	}

	public Date getOutdate() {
		return outdate;
	}

	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

}
