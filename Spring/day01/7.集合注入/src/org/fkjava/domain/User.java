package org.fkjava.domain;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

// domain  域模型 
public class User {
	
	private String[] names;
	private List<String> books;
	private Set<String> sets;
	private Map<Integer, Object> maps;
	private Properties pros;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String[] getNames() {
		return names;
	}
	public void setNames(String[] names) {
		this.names = names;
	}
	public List<String> getBooks() {
		return books;
	}
	public void setBooks(List<String> books) {
		this.books = books;
	}
	public Set<String> getSets() {
		return sets;
	}
	public void setSets(Set<String> sets) {
		this.sets = sets;
	}
	public Map<Integer, Object> getMaps() {
		return maps;
	}
	public void setMaps(Map<Integer, Object> maps) {
		this.maps = maps;
	}
	public Properties getPros() {
		return pros;
	}
	public void setPros(Properties pros) {
		this.pros = pros;
	}
	

}
