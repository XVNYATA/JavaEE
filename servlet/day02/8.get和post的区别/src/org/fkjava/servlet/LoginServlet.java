package org.fkjava.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("doGet...");
		// 转码，将http数据包中的所有数据转成UTF-8
		request.setCharacterEncoding("UTF-8");

		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		System.out.println("loginname：" + loginname);
		// 转码
//		loginname = new String(loginname.getBytes("iso-8859-1"), "UTF-8");
		System.out.println("loginname：" + loginname);
		System.out.println("password：" + password);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("doPost...");
		// 转码，将http数据包中的所有数据转成UTF-8
		request.setCharacterEncoding("UTF-8");
	
		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		
		// 转码
//		loginname = new String(loginname.getBytes("iso-8859-1"), "UTF-8");
		System.out.println("loginname：" + loginname);
		System.out.println("password：" + password);
	}


}
