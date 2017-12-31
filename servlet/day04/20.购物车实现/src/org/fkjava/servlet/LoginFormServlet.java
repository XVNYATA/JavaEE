package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginFormServlet
 */
public class LoginFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginFormServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h3>登录页面</h3>");
		
		/*************获取提示信息*******************************/
		String message = (String) request.getAttribute("message");
		if(message != null && !message.equals("")){
			out.println("<font color='red'>"+message+"</font>");
		}
		/********************************************/
		
		out.println("<form action='login' method='post'>");
		out.println("<table>");
		
		out.println("<tr>");
		out.println("<td>登录名:</td>");
		out.println("<td><input type='text' name='loginname'/></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>密码:</td>");
		out.println("<td><input type='text' name='password'/></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td><input type='submit' value='提交'/></td>");
		out.println("</tr>");
		
		out.println("</table>");
		out.println("</form>");
		
		out.flush();
		out.close();
		
	}

}
