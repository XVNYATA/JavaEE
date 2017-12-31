package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.dao.BookDao;
import org.fkjava.dto.Book;
import org.fkjava.dto.User;

/**
 * Servlet implementation class MainServlet
 */
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
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
		
//		User user = (User) request.getAttribute("user");
//		User user = (User)this.getServletContext().getAttribute("user");
		User user = (User)request.getSession().getAttribute("user");
		out.println("欢迎["+user.getUsername()+"]登录");
		out.println("<br>");
		out.println("<a href='myshopcar'>我的购物车</a>");
		
		BookDao bookDao = new BookDao();
		
		/**************从Cookie中读出最近浏览记录显示****************************************/
		// 从request中获取所有Cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0){
			// 遍历找到每一个Cookie对象
			for(Cookie cookie : cookies){
				// name是books的Cookie才是保存最近浏览记录的Cookie
				if(cookie.getName().equals("books3")){
					// 将最近浏览数据显示
					// 拿到保存的最近浏览记录的字符串 3_2_1
					String value = cookie.getValue();
					// 分解字符串 [3,2,1]
					String[] ids = value.split("_");
					// 遍历每一个id
					out.println("<table>");
					for(String newId : ids){
						// 将id转成整形
						Integer tempId = Integer.parseInt(newId);
						// 根据id获得每一个Book
						Book book = bookDao.getBookById(tempId);
						out.println("<tr>");
						out.println("<td>");
						out.println("<img src='images/"+book.getImage()+"' height='30'>");
						out.println("<td>");
						out.println("<td>"+book.getName()+"</td>");
						out.println("</tr>");
					}
					out.println("</table>");
					
				}
			}
		}
		/******************************************************/
		
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<th>封面</th><th>书名</th><th>作者</th><th>价格</th>");
		
		
		for(Book book : bookDao.getBook_list()){
			out.println("<tr>");
			out.println("<td>");
			// 点击图片，跳转到详细信息页面
			out.println("<a href='detail?id="+book.getId()+"'>");
			out.println("<img src='images/"+book.getImage()+"' height='60'>");
			out.println("</a>");
			out.println("</td>");
			out.println("<td>"+book.getName()+"</td>");
			out.println("<td>"+book.getAuthor()+"</td>");
			out.println("<td>"+book.getPrice()+"</td>");
			out.println("</tr>");
		}
		
		out.println("</tr>");
		out.println("</table>");
		
		out.flush();
		out.close();
		
	}

}
