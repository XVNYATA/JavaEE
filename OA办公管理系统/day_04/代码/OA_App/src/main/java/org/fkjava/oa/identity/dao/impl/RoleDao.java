package org.fkjava.oa.identity.dao.impl;

import java.util.List;

import org.fkjava.oa.identity.bean.Role;
import org.fkjava.oa.identity.dao.RoleDaoI;
import org.fkjava.oa.identity.dao.base.impl.HibernateDaoImpl;
import org.fkjava.oa.util.webTag.PageModel;

public class RoleDao extends HibernateDaoImpl implements RoleDaoI{

	//角色分页查询
	@Override
	public List<Role> selectRoleByPage(PageModel pageModel) {
		// TODO Auto-generated method stub
		String hql = "select r from Role r";
		return this.findByPage(hql, pageModel, null);
	}

	//删除角色信息
	@Override
	public void deleteRoleByIds(String[] ids) {
		// TODO Auto-generated method stub
		Long[] roleIds = new Long[ids.length];
		StringBuffer hql = new StringBuffer();
		hql.append("delete from Role r where r.id in(");
		for(int i=0;i<ids.length;i++){
			hql.append(i == ids.length-1?"?)" : "?");
			roleIds[i] = Long.valueOf(ids[i]);
		}
		this.bulkUpdate(hql.toString(), roleIds);
	}

	

}
