package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FKJavaServlet
 */
public class FKJavaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FKJavaServlet() {
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
		
		out.println("<img src='images/java.jpg'>");
		
		out.flush();
		out.close();
		
	}

}
