package org.fkjava.oa.identity.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.fkjava.oa.identity.bean.Module;
import org.fkjava.oa.identity.dao.ModuleDaoI;
import org.fkjava.oa.identity.dao.base.impl.HibernateDaoImpl;
import org.fkjava.oa.util.OAContant;
import org.fkjava.oa.util.webTag.PageModel;

public class ModuleDao extends HibernateDaoImpl implements  ModuleDaoI{

	//异步加载模块管理信息
	@Override
	public List<Map<String, String>> ajaxLoadModule() {
		// TODO Auto-generated method stub
		String hql = "select new Map(m.code as code,m.name as name) from Module m ";
		return this.find(hql);
	}

	//根据父级模块的code模块分页查询
	@Override
	public List<Module> selectModuleByParentCode(PageModel pageModel,
			String parentCode) {
		// TODO Auto-generated method stub
		StringBuffer hql = new StringBuffer();
		List<Object> parent = new ArrayList<>();
		hql.append("select m from Module m where code like ? and length(code) = ? ");
		parent.add(StringUtils.isEmpty(parentCode)?"%":parentCode+"%");
		parent.add(StringUtils.isEmpty(parentCode)?OAContant.CODE_LENGTH:parentCode.length()+OAContant.CODE_LENGTH);
		return this.findByPage(hql.toString(), pageModel, parent);
	}

}
