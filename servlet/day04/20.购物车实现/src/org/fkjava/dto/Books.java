package org.fkjava.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="books")
public class Books {
	
	private List<Book> list;

	public List<Book> getList() {
		return list;
	}

	@XmlElement(name="book")
	public void setList(List<Book> list) {
		this.list = list;
	}
	
	

}
