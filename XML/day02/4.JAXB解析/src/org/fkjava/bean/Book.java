package org.fkjava.bean;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlEnum;

/**
 * <book>
		<id>1</id>
		<name>疯狂Java讲义(附光盘)</name>
		<author>李刚 编著</author>
		<price>74.20</price>
		<image>java.jpg</image>
		<remark>疯狂源自梦想,技术成就辉煌 本书来自作者3年的Java培训经历,凝结了作者近3000个小时的授课经验,总结了几百个Java学员学习过程中的典型错误.</remark>
	</book>
	
	一个Book类的实例对象对应一个book元素,id属性对应id子元素
	数据源：book.xml、数据库的一张表tb_book
	DTO：Data Transfer Object  数据传输对象  bean、pojo、domian
	DAO：Data Access Object  数据访问对象
 * */

// 如果成员变量或者是set、get方法名和xml的元素是一样的，可以不用设置@XmlElement
public class Book {
	
	private Integer id;
	private String name;
	private String author;
	private Double price;
	private String image;
	private String remark;
	
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		System.out.println("getId->");
		return id;
	}
	public void setId(Integer id) {
		System.out.println("setId->");
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", author=" + author
				+ ", price=" + price + ", image=" + image + ", remark="
				+ remark + "]";
	}

	
}
