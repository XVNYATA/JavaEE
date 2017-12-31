package org.fkjava.bean;

//订单明细
public class Item {
	
	private Integer order_id;//订单id
	private Integer book_id;//书籍id
	private Integer amount;//书籍数量
	
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getBook_id() {
		return book_id;
	}
	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
