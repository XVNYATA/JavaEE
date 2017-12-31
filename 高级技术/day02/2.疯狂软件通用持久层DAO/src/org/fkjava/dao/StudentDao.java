package org.fkjava.dao;

import java.util.List;

import org.fkjava.bean.Student;

public interface StudentDao extends BasicDao<Student>{
	
	List<Student> find();

}
