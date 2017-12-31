package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HelloServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 显示当前时间和欢迎语句
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("欢迎学习Java Web!");
		out.println("<br>");
		out.println("当前时间：" + new Date());
		out.flush();
		out.close();
	}

}
