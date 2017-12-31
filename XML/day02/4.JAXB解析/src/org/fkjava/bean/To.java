package org.fkjava.bean;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

public class To {
	
	private String text;
	private Integer id;

	public String getText() {
		return text;
	}

	@XmlElement(name="name")
	public void setText(String text) {
		this.text = text;
	}

	public Integer getId() {
		return id;
	}

	@XmlAttribute(name="id")
	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "To [text=" + text + ", id=" + id + "]";
	}

	
	

}
