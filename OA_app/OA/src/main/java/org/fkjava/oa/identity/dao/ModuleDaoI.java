package org.fkjava.oa.identity.dao;

import java.util.List;
import java.util.Map;

import org.fkjava.oa.identity.bean.Module;
import org.fkjava.oa.identity.dao.base.HibernateDao;
import org.fkjava.oa.util.webTag.PageModel;

public interface ModuleDaoI  extends HibernateDao{

	//异步加载模块信息
	List<Map<String, String>> ajaxLoadModule();

	//查询管理模块左边的分页查询
	List<Module> selectModuleByParentCode(PageModel pageModel, String parentCode);

}
