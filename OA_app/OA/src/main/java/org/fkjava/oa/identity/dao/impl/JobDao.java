package org.fkjava.oa.identity.dao.impl;

import java.util.List;
import java.util.Map;

import org.fkjava.oa.identity.dao.JobDaoI;
import org.fkjava.oa.identity.dao.base.impl.HibernateDaoImpl;

public class JobDao extends HibernateDaoImpl implements JobDaoI{

	//获取职位信息
	@Override
	public List<Map<Integer, String>> findAllJobs() {
		// TODO Auto-generated method stub
		String hql = "select new Map(j.code as code,j.name as name) from Job j";
		return this.find(hql.toString());
	}

}
