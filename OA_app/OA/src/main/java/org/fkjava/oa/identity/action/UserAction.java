package org.fkjava.oa.identity.action;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.base.BaseAction;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.util.CookieUtils;
import org.fkjava.oa.util.OAContant;

public class UserAction extends BaseAction{

	private User user;
	private String vcode;
	private String key;
	private List<User> users;
	private Short status;
	
	

	//用户异步登录
	public String userLogin(){
		try {
			String tip = "";
			
			//判断验证码是否正确
			String code = (String) ServletActionContext.getRequest().getSession().getAttribute(OAContant.VCODE);
			if(vcode==null||!vcode.equals(code)){
				tip="您输入的验证码错误请重新输入!";
			}else{
				//根据用户名(主键)获取用户信息
				User u = identityService.getUserId(user.getUserId());
				if(u==null){
					tip="您输入的帐号不正确请重新输入!";
				}else{
					if(!u.getPassWord().equals(user.getPassWord())){
						tip = "您输入的密码有误请重新输入!";
					}else{
						//用户登录成功,将用户信息存放到session中
						ServletActionContext.getRequest().getSession().setAttribute(OAContant.SESSION_USER, u);
						//判断是否记住用户
						if(key!=null&&key.equals("1")){
							CookieUtils.addCookie(OAContant.USER_COOKIE,user.getUserId(),7*24*60*60);
						}
					}
				}
			}
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			//将信息响应至客户端
			ServletActionContext.getResponse().getWriter().print(tip);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return NONE;
	}
	
	//用户退出
	public String logout(){
		try {
			//将用户信息移除
			ServletActionContext.getRequest().getSession().removeAttribute(OAContant.SESSION_USER);
			//将用户从cookie里面移除
			CookieUtils.removeCookie(OAContant.USER_COOKIE);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	//用户分页查询
	public String selectUserByPage(){
		try {
			users = identityService.selectUserByPage(user,pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	//删除用户信息
	public String  deleteUserByIds(){
		try {
			identityService.deleteUserByIds(ids.split(","));
			tip="删除成功!";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = e.getMessage();
		}
		return SUCCESS;
		
	}
	
	//审核用户信息
	public String checkUserBuIds(){
		try {
			identityService.checkUserBuIds(ids.split(","),status);
			tip = "审核成功!";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
		
	}
	
	//异步加载职位和部门信息
	public String ajaxLoadDeptAndJob(){
		try {
			String result = identityService.ajaxLoadDeptAndJob();
			ServletActionContext.getResponse().getWriter().print(result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return NONE;
	}
	
	//异步校验用户名是否已经存在
	public String ajaxValidUser(){
		try {
			String result = identityService.ajaxValidUserId(user.getUserId());
			ServletActionContext.getResponse().getWriter().print(result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return NONE;
	}
	
	//添加用户
	public String addUser(){
		try {
			identityService.addUser(user);
			user.setUserId("");
			tip="添加成功!";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
		
	}
	
	//展现修改页面
	public String showUpdateUser(){
		try {
			identityService.getUserId(user.getUserId());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		
		return SUCCESS;
		
	}
	
	//修改用户
	public String updateUser(){
		try {
			identityService.updateUser(user);
			tip="修改成功!";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
		
	}
	
	//修改个人信息
	public String updateSelf(){
		try {
			identityService.updateUser(user);
			ServletActionContext.getRequest().getSession().setAttribute(OAContant.SESSION_USER, user);
			tip="修改成功!";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
		
	}
	
	//修改密码
	public String updatePassword(){
		try {
			identityService.updatePassword(user.getPassWord(),OAContant.getCurrentUser().getUserId());
			tip="修改成功!";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip=e.getMessage();
		}
		return SUCCESS;
		
	}
	
	public List<User> getUsers() {
		return users;
	}

	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public String getVcode() {
		return vcode;
	}



	public void setVcode(String vcode) {
		this.vcode = vcode;
	}



	public String getKey() {
		return key;
	}



	public void setKey(String key) {
		this.key = key;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Short getStatus() {
		return status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	
}
