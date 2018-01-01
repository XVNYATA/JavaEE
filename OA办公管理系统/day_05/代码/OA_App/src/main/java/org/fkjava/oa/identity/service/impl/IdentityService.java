package org.fkjava.oa.identity.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.fkjava.oa.identity.bean.Dept;
import org.fkjava.oa.identity.bean.Role;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.dao.DeptDaoI;
import org.fkjava.oa.identity.dao.JobDaoI;
import org.fkjava.oa.identity.dao.RoleDaoI;
import org.fkjava.oa.identity.dao.UserDaoI;
import org.fkjava.oa.identity.exception.OAException;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.fkjava.oa.util.OAContant;
import org.fkjava.oa.util.webTag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Transactional(readOnly=false, rollbackFor={RuntimeException.class})
@Service
public class IdentityService implements IdentityServiceI{

    @Autowired
    private DeptDaoI deptDao;
    
    @Autowired
    private JobDaoI jobDao;
    
    @Autowired
    private UserDaoI userDao;
    @Autowired
    private RoleDaoI roleDao;
    
    private Logger logger = Logger.getLogger(IdentityService.class);
	//根据用户账号获取用户信息
	@Override
	public User getUserById(String userId) {
		// TODO Auto-generated method stub
		try {
			return userDao.get(User.class, userId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("用户信息获取失败！",e);
		}
	}
	
	
	//用户分页查询
	@Transactional(readOnly=true)
	@Override
	public List<User> selectUserByPage(User user, PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			List<User> users = userDao.selectUserByPage(user,pageModel);
			//由于创建者以及审核者都是懒加载，通过获取创建者以及审核者再次发送sql语句获取相关信息
			//因为创建人  审核人是懒加载
			for(User u : users){
				if(u!=null&&u.getChecker()!=null) u.getChecker().getName();
				if(u!=null&&u.getCreater()!=null) u.getCreater().getName();
			}
			return users;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("用户分页查询异常："+e.getMessage(),e);
		}
		
	}
	

	
	//获取部门信息
	@Transactional(readOnly=true)
	@Override
	public String findAllDepts() {
		// TODO Auto-generated method stub
		try {
			
		
			List<Map<Integer,String>> depts = deptDao.findAllDepts();
			System.out.println(depts.toString()+"=="+JSONArray.fromObject(depts).toString());
			//将集合转成json格式字符窜
			return JSONArray.fromObject(depts).toString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("部门信息加载失败："+e.getMessage(),e);
		}
	}
	
	 //删除用户信息
	@Override
	public void deleteUserByIds(String[] ids) {
		// TODO Auto-generated method stub
		try {
			userDao.deleteUserByIds(ids);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("用户信息删除失败："+e.getMessage(),e);
		}
	}
	
	//审核用户
	@Override
	public void checkUserByIds(String[] ids, Short status) {
		// TODO Auto-generated method stub
		try {
			for(String id : ids){
				//根据用户的id获取用户信息    对象的状态：瞬时状态(与session未关联过)   持久化状态（与session有关联）   脱管状态(之前与session关联过)

				User user = userDao.get(User.class, id);
				user.setStatus(status);
				user.setCheckDate(new Date());
				user.setChecker(OAContant.getCurrentUser());
				user.setModifier(OAContant.getCurrentUser());
				user.setModifyDate(new Date());	
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("用户信息审核失败："+e.getMessage(),e);
		}
		
		
	}

	//异步加载部门以及职位信息
	@Transactional(readOnly=true)
	@Override
	public String ajaxLoadDeptAndJob() {
		// TODO Auto-generated method stub
		try {
			
			JSONObject obj = new JSONObject();
			
			List<Map<Integer,String>> depts = deptDao.findAllDepts();
			
			List<Map<Integer,String>> jobs = jobDao.findAllJobs();
			obj.put("depts", depts);
			obj.put("jobs", jobs);

			//将集合转成json格式字符窜
			return obj.toString();//   {depts:[{},{}],jobs:[{},{}]}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("部门以及职位信息加载失败："+e.getMessage(),e);
		}
	}

	//异步校验用户名是否存在
	@Transactional(readOnly=true)
	@Override
	public String ajaxValidUser(String userId) {
		// TODO Auto-generated method stub
	try {
			
		   User user = userDao.get(User.class, userId);
            if(user!=null){
            	return "exist";
            }else{
            	return "notExist";
            }
            
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("用户信息校验失败："+e.getMessage(),e);
		}
	}

   //添加用户
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		try {
			  user.setCreateDate(new Date());
			  user.setCreater(OAContant.getCurrentUser());
			  userDao.save(user);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error(e);
				throw new OAException("用户添加失败："+e.getMessage(),e);
			}
	
		 
		  
	}
	
	
	    //修改用户
		@Override
		public void updateUser(User user) {
			// TODO Auto-generated method stub
			try {
				
				User u = userDao.get(User.class,user.getUserId());
				u.setAnswer(user.getAnswer());
				u.setDept(user.getDept());
				u.setEmail(user.getEmail());
				u.setJob(user.getJob());
				u.setModifier(OAContant.getCurrentUser());
				u.setModifyDate(new Date());
				u.setName(user.getName());
				u.setPhone(user.getPhone());
				u.setQqNum(user.getQqNum());
				u.setQuestion(user.getQuestion());
				u.setSex(user.getSex());
				u.setTel(user.getTel());
				  
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.error(e);
					throw new OAException("用户更新失败："+e.getMessage(),e);
				}
		}

		//##########################################角色模块################################################//
		//角色分页查询
		@Transactional(readOnly=true)
		@Override
		public List<Role> selectRoleByPage(PageModel pageModel) {
			// TODO Auto-generated method stub
			try {
				List<Role> roles = roleDao.selectRoleByPage(pageModel);
				//由于创建者以及审核者都是懒加载，通过获取创建者以及审核者再次发送sql语句获取相关信息
				
				return roles;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error(e);
				throw new OAException("角色分页查询异常："+e.getMessage(),e);
			}
		}
		
		//添加角色
		@Override
		public void saveRole(Role role) {
			// TODO Auto-generated method stub
			try {
				role.setCreateDate(new Date());
				role.setCreater(OAContant.getCurrentUser());
				roleDao.save(role);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error(e);
				throw new OAException("角色保存异常："+e.getMessage(),e);
			}
		}

		//根据角色id获取角色信息
		@Transactional(readOnly=true)
		@Override
		public Role getRoleById(Long id) {
			// TODO Auto-generated method stub
			try {
				
			   return roleDao.get(Role.class, id);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error(e);
				throw new OAException("角色信息获取异常："+e.getMessage(),e);
			}
		}


		@Override
		public void updateRole(Role role) {
			// TODO Auto-generated method stub
			try {
				/* Role r =roleDao.get(Role.class, role.getId());
				
				 role.setModifier(OAContant.getCurrentUser());
				 role.setModifyDate(new Date());
				 role.setCreateDate(r.getCreateDate());
				 role.setCreater(r.getCreater());
				 roleDao.update(role);*/
				
				 Role r = roleDao.get(Role.class, role.getId());
				 r.setRemark(role.getRemark());
				 r.setName(role.getName());
				 r.setModifier(OAContant.getCurrentUser());
				 r.setModifyDate(new Date());
				  
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.error(e);
					throw new OAException("角色信息更新异常："+e.getMessage(),e);
				}
		}


		//删除角色
		@Override
		public void deleteRoleByIds(String[] ids) {
			// TODO Auto-generated method stub
			try {
		          roleDao.deleteRoleByIds(ids);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.error(e);
					throw new OAException("角色删除异常："+e.getMessage(),e);
				}
		}


		//获取当前角色已经绑定了哪些用户
		@Override
		public List<User> selectRoleUserByPage(PageModel pageModel, Long id) {
			// TODO Auto-generated method stub
			try {
		         List<User> users = userDao.selectRoleUserByPage(pageModel,id);
				 return users;
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.error(e);
					throw new OAException("获取角色绑定的用户异常："+e.getMessage(),e);
				}
		}


		//解除指定角色中的某些用户
		@Override
		public void unbindUser(String[] ids, Long id) {
			// TODO Auto-generated method stub
			try {
				//根据角色id获取角色信息
				Role role = roleDao.get(Role.class, id);
				//获取角色已经绑定的用户
				Set<User> users = role.getUsers();
				for(String userId : ids){
					//根据用户id获取用户信息
					User user = userDao.get(User.class, userId);
					//将用户从应绑定的用户集合中移除
					users.remove(user);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error(e);
				throw new OAException("解除失败："+e.getMessage(),e);
			}
		}

		//获取当前角色未绑定的用户
		@Override
		public List<User> showUnbindUserByPage(PageModel pageModel, Long id) {
			// TODO Auto-generated method stub
			try {
				
		         List<User> users = userDao.showUnbindUserByPage(pageModel,id);
				 return users;
				
			} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.error(e);
					throw new OAException("获取角色未绑定的用户异常："+e.getMessage(),e);
				}
		}


		//角色绑定用户
		@Override
		public void bindUser(Long id, String[] ids) {
			// TODO Auto-generated method stub
			try {
				//根据角色id获取角色信息
				Role role = roleDao.get(Role.class, id);
				//获取角色已经绑定的用户
				Set<User> users = role.getUsers();
                for(String userId : ids){
                	//根据用户id获取用户信息
                	User user = userDao.get(User.class, userId);
                	users.add(user);
                }
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error(e);
				throw new OAException("绑定失败："+e.getMessage(),e);
			}
		}

		//修改密码
		@Override
		public void updatePwd(String passWord, String userId) {
			// TODO Auto-generated method stub
			try {
				
                User user = userDao.get(User.class, userId);
                user.setPassWord(passWord);
                user.setModifyDate(new Date());
                user.setModifier(OAContant.getCurrentUser());
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error(e);
				throw new OAException("修改失败："+e.getMessage(),e);
			}
		}
		
		

}
