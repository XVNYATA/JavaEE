package org.fkjava.oa.identity.dao;

import java.util.List;
import java.util.Map;

import org.fkjava.oa.identity.dao.base.HibernateDao;

public interface JobDaoI extends HibernateDao{

	//获取职位信息
	List<Map<Integer, String>> findAllJobs();

}
