package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.dao.BookDao;
import org.fkjava.dao.UserDao;
import org.fkjava.dto.Book;
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
		
		// 字符编码转换
		request.setCharacterEncoding("UTF-8");
		
		// 接收参数
		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		
		// 调试
		System.out.println(loginname + ":" + password);
		
		// 验证
		UserDao userDao = new UserDao();
		User user = userDao.login(loginname, password);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		// 判断
		if(user != null){
			out.println("欢迎["+user.getUsername()+"]登录");
			out.println("<br>");
			// 显示book信息
			out.println("<table border='1'>");
			out.println("<tr><th>封面</th><th>书名</th><th>作者</th><th>价格</th></tr>");
			// 获得书籍信息
			BookDao bookDao = new BookDao();
			List<Book> book_list = bookDao.getBook_list();
			// 遍历显示
			for(Book book : book_list){
				out.println("<tr>");
				out.println("<td>");
				out.println("<img src='images/"+book.getImage()+"' height='60'>");
				out.println("</td>");
				out.println("<td>"+book.getName()+"</td>");
				out.println("<td>"+book.getAuthor()+"</td>");
				out.println("<td>"+book.getPrice()+"</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		}else{
			out.println("登录名或密码错误!请重新<a href='index.html'>登录</a>");
		}
		out.flush();
		out.close();
		
	}

}
