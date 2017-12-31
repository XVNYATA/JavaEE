package org.fkjava.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.dao.UserDao;
import org.fkjava.dto.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		System.out.println(loginname + ": " + password);
		UserDao userDao = new UserDao();
		User user = userDao.login(loginname, password);
		
		if(user !=null){
//			request.setAttribute("user", user);
//			this.getServletContext().setAttribute("user", user);
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("main").forward(request, response);
		}else{
			// 登录失败，返回登录页面，并提示用户
			request.setAttribute("message", "登录名或密码错误!请重新输入!");
			request.setAttribute("nextpage", "loginform");
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}
		
	}

}
