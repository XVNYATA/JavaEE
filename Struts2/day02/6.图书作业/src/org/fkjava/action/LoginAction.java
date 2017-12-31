package org.fkjava.action;

import java.util.Map;

import org.fkjava.bean.User;
import org.fkjava.service.UserService;
import org.fkjava.service.impl.UserServiceImpl;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

/**
 * Action接收参数的第一种方式
 * 标量值接收参数
 */
public class LoginAction implements Action{
	
	/**
	 * 对应jindex.jsp的参数，用于自动接收
	 * <input type="text" name="loginname">
	 * */
	private String loginname;
	private String password;
	
	// 登录失败信息
	private String message;
	/**
	 * 依赖服务层对象完成业务的操作
	 * */
	private UserService userService;
	
	public LoginAction() {
		super();
		// 初始化服务层对象
		userService = new UserServiceImpl();
	}
	
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 默认调用处理请求的方法
	 * */
	@Override
	public String execute() throws Exception {
		System.out.println("loginname：" + loginname);
		System.out.println("password：" + password);
		
		// 调用服务层方法判断用户登录
		User user = userService.login(loginname, password);
		System.out.println(user);
		
		if(user != null){
			// 将用户存储到Session对象
			// 获得一个Struts2的ActionContext对象
			ActionContext ac = ActionContext.getContext();
			 /**
		    * ActionContext返回的不是Servlet API的HttpSession对象，
		    * 因为Struts2不希望绑定Servlet的API
		    * 实际Struts2将用户数据返回到前台页面之前，会检查ActionContext的session属性,
		    * 将session属性（Map<String,Object>）中的数据重新设置的HttpSession对象当中
		    * Struts2会默认将所有Action的属性存储到request当中
		    * */
			Map<String, Object> session = ac.getSession();
			session.put("user", user);
			// 转发
			return this.SUCCESS;
		}else{
			this.message = "登录名或密码错误!请重新登录!";
			return this.ERROR;
		}
		
	}
	
}
