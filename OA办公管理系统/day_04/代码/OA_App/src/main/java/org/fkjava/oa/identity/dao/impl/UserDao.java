package org.fkjava.oa.identity.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.dao.UserDaoI;
import org.fkjava.oa.identity.dao.base.impl.HibernateDaoImpl;
import org.fkjava.oa.util.webTag.PageModel;


public class UserDao extends HibernateDaoImpl implements UserDaoI{


	//用户分页查询   hql语句:面向对象
	@Override
	public List<User> selectUserByPage(User user, PageModel pageModel) {
		// TODO Auto-generated method stub
		//定义存储参数的集合
		List<Object> params = new ArrayList<>();
		StringBuffer hql = new StringBuffer();
		hql.append("select u from User u  where 1=1 ");
		if(user!=null&&user.getStatus()!=null&&user.getStatus()>-1){
			hql.append(" and u.status = ? " );
			params.add(user.getStatus());
			
		}
		if(user!=null&&StringUtils.isNotEmpty(user.getName())){
			hql.append(" and u.name like ? " );
			params.add("%"+user.getName()+"%");
		}
		if(user!=null&&StringUtils.isNotEmpty(user.getPhone())){
			hql.append(" and u.phone like ? " );
			params.add("%"+user.getPhone()+"%");
		}
		if(user!=null&&user.getDept()!=null&&user.getDept().getId()!=null&&user.getDept().getId()>0){
			hql.append(" and u.dept.id = ? " );
			params.add(user.getDept().getId());
		}
		
		return this.findByPage(hql.toString(), pageModel, params);
	}

	//删除用户信息
	@Override
	public void deleteUserByIds(String[] ids) {
		// TODO Auto-generated method stub
		StringBuffer hql = new StringBuffer();
		hql.append("delete from User u where u.userId in(");
		for(int i=0;i<ids.length;i++){
			hql.append(i == ids.length-1?"?)":"?");
		}
		this.bulkUpdate(hql.toString(), ids);
	}

}
