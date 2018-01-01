package org.fkjava.oa.identity.action;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.fkjava.oa.identity.bean.User;
import org.fkjava.oa.identity.service.IdentityServiceI;
import org.fkjava.oa.util.CookieUtils;
import org.fkjava.oa.util.OAContant;
import org.fkjava.oa.util.webTag.PageModel;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	@Autowired
	IdentityServiceI identityService;

	private User user;
	private String vcode;
	private String key;
	private List<User> users;
	private String ids;
	//定义分页实体
	PageModel pageModel = new PageModel();
	private String tip;
	private Short status;
	
	//用户异步登录
	public String userLogin(){
		// TODO Auto-generated method stub
         try {
        	 String tip = "";
        	 //判断验证码是否正确
        	 System.out.println(user.getPassWord()+"=="+user.getUserId()+"vcode:"+vcode);
        	 //从session中获取验证码信息
        	 String code = (String)ServletActionContext.getRequest().getSession().getAttribute(OAContant.VCODE);
        	 System.out.println("code:"+code+" vcode:"+vcode);
        	 if(vcode==null||!vcode.equals(code)){
        		 tip = "您输入的验证码不正确，请核实！";
        	 }else{
        		 //根据用户名（主键）获取用户信息
        		 User u = identityService.getUserById(user.getUserId());
        		 System.out.println("u:"+u);
        		 if(u==null){
        			 tip = "您输入的账号不正确，请核实！";
        		 }else{
        			 if(!u.getPassWord().equals(user.getPassWord())){
        				 tip = "您输入的密码不正确，请核实！";
        			 }else{
        				 //用户登录成功，将用户信息存放在session中
        				 ServletActionContext.getRequest().getSession().setAttribute(OAContant.SESSION_USER,u);
        				 //判断是否需要记住用户
        				 if(key!=null&&key.equals("1")){
        					 //将用户信息存放在cookie中   7*24*60*60
        					 CookieUtils.addCookie(OAContant.USER_COOKIE,user.getUserId(),7*24*60*60);
        					 
        				 }
        			 }
        		 }
        	 }
        	 ServletActionContext.getResponse().setCharacterEncoding("utf-8");
    		 //将提示信息响应至客户端
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
			//将用户信息从sesion中清除
			ServletActionContext.getRequest().getSession().removeAttribute(OAContant.SESSION_USER);
			//将用户细心从cookie中清除
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
		public String deleteUserByIds(){
			
		 try {
			   identityService.deleteUserByIds(ids.split(","));
			   tip = "删除成功！";
			  } catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				tip = e.getMessage();
			}
			return SUCCESS;
		}
		
	   //审核用户信息
		public String checkUserByIds(){
			
		 try {
			   identityService.checkUserByIds(ids.split(","),status);
			   tip = "审核成功！";
			  } catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				tip = e.getMessage();
			}
			return SUCCESS;
		}

		
	 //异步加载部门以及职位信息
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
	
	   //异步校验用户账号是否存在
		public String ajaxValidUser(){
			
		 try {
			   String result = identityService.ajaxValidUser(user.getUserId());
			   ServletActionContext.getResponse().getWriter().print(result);
			  } catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				
			}
			return NONE;
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


	public List<User> getUsers() {
		return users;
	}


	public PageModel getPageModel() {
		return pageModel;
	}


	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}


	public String getIds() {
		return ids;
	}


	public void setIds(String ids) {
		this.ids = ids;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}


	public String getTip() {
		return tip;
	}


	public void setTip(String tip) {
		this.tip = tip;
	}


	public Short getStatus() {
		return status;
	}


	public void setStatus(Short status) {
		this.status = status;
	}

	
	
}
