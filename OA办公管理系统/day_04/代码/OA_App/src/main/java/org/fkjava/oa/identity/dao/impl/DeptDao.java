package org.fkjava.oa.identity.dao.impl;

import java.util.List;
import java.util.Map;

import org.fkjava.oa.identity.dao.DeptDaoI;
import org.fkjava.oa.identity.dao.base.impl.HibernateDaoImpl;

public class DeptDao extends HibernateDaoImpl implements DeptDaoI{

	//获取部门信息
	@Override
	public List<Map<Integer, String>> findAllDepts() {
		// TODO Auto-generated method stub
		String hql = "select new Map(d.id as id,d.name as name) from Dept d";
		return this.find(hql.toString());
	}

	

}
