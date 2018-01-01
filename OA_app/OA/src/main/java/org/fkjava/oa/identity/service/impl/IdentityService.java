package org.fkjava.oa.identity.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.fkjava.oa.identity.Exception.OAException;
import org.fkjava.oa.identity.bean.Module;
import org.fkjava.oa.identity.bean.Role;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.dao.DeptDaoI;
import org.fkjava.oa.identity.dao.JobDaoI;
import org.fkjava.oa.identity.dao.ModuleDaoI;
import org.fkjava.oa.identity.dao.RoleDaoI;
import org.fkjava.oa.identity.dao.UserDaoI;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.fkjava.oa.util.OAContant;
import org.fkjava.oa.util.webTag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly=false, rollbackFor={RuntimeException.class})
@Service
public class IdentityService implements IdentityServiceI{

	@Autowired
	private DeptDaoI deptDao;
	
	@Autowired
	private UserDaoI userDao;
	
	@Autowired
	private JobDaoI jobDao;
	
	@Autowired
	private RoleDaoI roleDao;
	
	@Autowired
	private ModuleDaoI moduleDao;
	
	private Logger logger = Logger.getLogger(IdentityService.class);
	
	


	//根据用户名(主键)获取用户信息
	@Override
	public User getUserId(String userId) {
		// TODO Auto-generated method stub
		try {
			return userDao.get(User.class, userId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("加载用户信息失败",e);
		}
	}

	//用户分页查询
	@Override
	public List<User> selectUserByPage(User user, PageModel pageModel) {
		try {
			List<User> users = userDao.selectUserByPage(user,pageModel);
			for(User u:users){
				if(u!=null&&u.getChecker()!=null)u.getChecker().getName();
				if(u!=null&&u.getCreater()!=null)u.getCreater().getName();
			}
			return users;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("用户查询失败"+e.getMessage(),e);
		}
	}

	//获取部门信息
	@Override
	public String getDeptAll() {
		try {
			System.out.println("===========================================");
			List<Map<Integer, String>> depts = deptDao.getDeptAll();
			System.out.println(depts.toString()+"=="+JSONArray.fromObject(depts).toString());
			//将集合转成json格式字符串
			return JSONArray.fromObject(depts).toString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("获取部门信息失败"+e.getMessage(),e);
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
			throw new OAException("删除用户信息失败"+e.getMessage(),e);
		}
	}

	//审核用户
	@Override
	public void checkUserBuIds(String[] ids, Short status) {
		// TODO Auto-generated method stub
		try {
			for(String id : ids){
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
			throw new OAException("审核用户失败"+e.getMessage(),e);
		}
	}

	//发送异步请求获取部门和职位信息
	@Override
	public String ajaxLoadDeptAndJob() {
		// TODO Auto-generated method stub
		try {
			JSONObject obj = new JSONObject();
			
			List<Map<Integer, String>> depts = deptDao.getDeptAll();
			
			List<Map<Integer, String>> jobs = jobDao.findAllJobs();
			obj.put("depts", depts);
			obj.put("jobs", jobs);
			
			//将集合转成json格式字符串
			return obj.toString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("加载部门职位信息失败!"+e.getMessage(),e);
		}
	}

	//异步校验用户名
	@Override
	public String ajaxValidUserId(String userId) {
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
			throw new OAException("用户校验失败"+e.getMessage(),e);
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
			throw new OAException("添加用户失败!"+e.getMessage(),e);
		}
		
	}

	//修改用户
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		try {
			User u = userDao.get(User.class, user.getUserId());
			u.setAnswer(user.getAnswer());
			u.setDept(user.getDept());
			u.setJob(user.getJob());
			u.setEmail(user.getEmail());
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
			throw new OAException("用户修改失败:"+e.getMessage(),e);
		}
	}

	/*********************************角色模块********************************************/
	//角色分页查询
	@Transactional(readOnly=true)
	@Override
	public List<Role> selectRolePage(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			List<Role> roles = roleDao.selectRolePage(pageModel);
			//由于创建者以及审核者是懒加载通过获取创建者和审核者来在再次发送sql语句获取相关信息
			return roles;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("角色分页查询失败！"+e.getMessage(),e);
		}
	}

	//保存用户
	@Override
	public void addRole(Role role) {
		// TODO Auto-generated method stub
		try {
			role.setCreateDate(new Date());
			role.setCreater(OAContant.getCurrentUser());
			roleDao.save(role);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("添加角色失败！"+e.getMessage(),e);
		} 
	}
	//根据角色id获取用户信息
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
			throw new OAException("角色获取信息异常!"+e.getMessage(),e);
		}
	}

	//更新角色信息
	@Override
	public void updateRole(Role role) {
		// TODO Auto-generated method stub
		try {
			 Role r = roleDao.get(Role.class, role.getId());
			 r.setRemark(role.getRemark());
			 r.setName(role.getName());
			 r.setModifier(OAContant.getCurrentUser());
			 r.setModifyDate(new Date());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("更新角色信息异常!"+e.getMessage(),e);
		}
	}

	//删除角色用户
	@Override
	public void deleteRoleByIds(String[] ids) {
		// TODO Auto-generated method stub
		try {
			roleDao.deleteRoleByIds(ids);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("删除角色用户失败!"+e.getMessage(),e);
		}
	}

	//查询角色绑定的用户
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
			throw new OAException("获取角色用户失败!"+e.getMessage(),e);
		}
	}

	//解除绑定用户
	@Override
	public void unbindUser(String[] ids, Long id) {
		// TODO Auto-generated method stub
				try {
					//根据id获取角色的信息
					Role role = roleDao.get(Role.class, id);
					Set<User> users = role.getUsers();
					for (String userId : ids) {
						//根据id获取用户的信息
						User user = userDao.get(User.class, userId);
						users.remove(user);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.error(e);
					throw new OAException("接触绑定角色用户失败!"+e.getMessage(),e);
				}
		
	}

	//绑定角色
	@Override
	public void bindUser(String[] ids, Long id) {
		// TODO Auto-generated method stub
		try {
			Role role = roleDao.get(Role.class, id);
			Set<User> users = role.getUsers();
			for(String userId :ids){
				//根据id获取用户的信息
				User user = userDao.get(User.class, userId);
				users.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("接触绑定角色用户失败!"+e.getMessage(),e);
		}
		
	}

	//获取未绑定的角色用户
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
			throw new OAException("获取角色未绑定的用户异常!"+e.getMessage(),e);
		}
	}

	//修改密码
	@Override
	public void updatePassword(String passWord, String userId) {
		// TODO Auto-generated method stub
				try {
					User user = userDao.get(User.class, userId);
					user.setPassWord(passWord);
					user.setCreateDate(new Date());
					user.setCreater(OAContant.getCurrentUser());
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					logger.error(e);
					throw new OAException("修改密码异常!"+e.getMessage(),e);
				}
				
		
	}
	
	/*******************************模块管理*************************************/

	//异步加载模块信息
	@Override
	public String ajaxLoadModule() {
		// TODO Auto-generated method stub
		try {
			//{code=0001,name=系统管理},{code=00010001,name=用户管理},{code=000100010001,name=查询用户},{code=0002,name=假期管理}
			List<Map<String, String>> datas = moduleDao.ajaxLoadModule();
			JSONArray arr = new JSONArray();
			for(int i =0;i<datas.size();i++){
				JSONObject obj = new JSONObject();
				String code = datas.get(i).get("code");
				obj.put("id", code);
				obj.put("name", datas.get(i).get("name"));
				obj.put("pid", code.length()==4?OAContant.ROOT_CODE:code.substring(code.length()-4));
				arr.add(obj);
			}
			return arr.toString();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("加载模块信息失败!"+e.getMessage(),e);
		}
	}

	//查询管理模块左边的分页查询
	@Override
	public List<Module> selectModuleByParentCode(PageModel pageModel,
			String parentCode) {
		// TODO Auto-generated method stub
		try {
			return moduleDao.selectModuleByParentCode(pageModel,parentCode);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("加载模块信息失败!"+e.getMessage(),e);
		}
	}
	//根据模块的code获取模块信息
	@Override
	public Module getModuleCode(String code) {
		// TODO Auto-generated method stub
		try {
			return moduleDao.get(Module.class,code);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
			throw new OAException("加载模块信息失败!"+e.getMessage(),e);
		}
	}


	





	
}
