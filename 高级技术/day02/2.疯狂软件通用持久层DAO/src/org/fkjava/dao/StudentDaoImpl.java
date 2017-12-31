package org.fkjava.dao;

import java.util.List;
import java.util.Map;

import org.fkjava.bean.Student;

public class StudentDaoImpl extends BasicDaoImple<Student> implements
		StudentDao {

	/**
	 * 关联查询
	 * */
	@Override
	public List<Student> find() {
		String sql = " select s.*,c.code from tb_student s ,tb_clazz c where s.clazz_id = c.id ";
		List<Map<String,Object>> list = this.queryList(sql);
		list.forEach(map -> System.out.println(map));
		return null;
	}

}
