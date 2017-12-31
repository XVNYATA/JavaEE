package org.fkjava.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveServlet
 */
public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获得要删除的书籍id 
		Integer id = Integer.parseInt(request.getParameter("id"));
		// 获得购物车
		HttpSession session = request.getSession();
		Map<Integer, Integer> shopcar 
			= (Map<Integer, Integer>) session.getAttribute("shopcar");
		// 从购物车中删除
		shopcar.remove(id);
		// 跳转显示删除结果
		response.sendRedirect("myshopcar");
		
		
	}

}
