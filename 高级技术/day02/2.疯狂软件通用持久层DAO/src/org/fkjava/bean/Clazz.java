package org.fkjava.bean;

public class Clazz {
	
	private Integer id;
	private String code;
	public Clazz() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Clazz [id=" + id + ", code=" + code + "]";
	}
	
	

}
