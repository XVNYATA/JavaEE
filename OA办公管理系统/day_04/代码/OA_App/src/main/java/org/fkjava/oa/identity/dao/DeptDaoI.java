package org.fkjava.oa.identity.dao;

import java.util.List;
import java.util.Map;

import org.fkjava.oa.identity.dao.base.HibernateDao;

public interface DeptDaoI extends HibernateDao{

	//获取部门信息
	List<Map<Integer, String>> findAllDepts();

}
