package org.fkjava.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.bean.*;
import org.fkjava.bean.User;
import org.fkjava.dao.UserDao;
import org.fkjava.dao.*;

/**
 * Servlet implementation class LoginSerlvet
 */
@WebServlet("/ajaxLogin.action")
public class LoginSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println("username: "+username + " password: "+password);
		
		//根据用户名和密码获取用户信息
		UserDao userDao = new UserDao();
		User user = userDao.findUserByNameAndPassWord(username , password);
		
		System.out.println("Jss 好帅"+username);
		
		if (user!=null) {
			//用户存在则将用户名放到 session
			request.getSession().setAttribute("session_user", user);
		} else {
			//如果用户不存在的话，则提示
			response.getWriter().print("哥，你的用户名跟密码不正确，请重新输入");			
		}
	}

}
