package org.fkjava.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * CREATE TABLE `tb_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(54) DEFAULT NULL,
  `author` varchar(54) DEFAULT NULL,
  `publicationdate` date DEFAULT NULL,
  `publication` varchar(150) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(54) DEFAULT NULL,
  `remark` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 
 * */
public class Book implements Serializable {
	
	private Integer id;
	private String name;
	private String author;
	private Date publicationdate;
	private String publication;
	private Double price;
	private String image;
	private String remark;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public Date getPublicationdate() {
		return publicationdate;
	}
	public void setPublicationdate(Date publicationdate) {
		this.publicationdate = publicationdate;
	}
	public String getPublication() {
		return publication;
	}
	public void setPublication(String publication) {
		this.publication = publication;
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
				+ ", publicationdate=" + publicationdate + ", publication="
				+ publication + ", price=" + price + ", image=" + image
				+ ", remark=" + remark + "]";
	}
	
	

}
