package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fkjava.dao.BookDao;
import org.fkjava.dto.Book;
import org.fkjava.dto.User;

/**
 * Servlet implementation class MyShopcarServlet
 */
public class MyShopcarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyShopcarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// 获得HttpSession对象
		HttpSession session = request.getSession();
		// 从session范围中获取shopcar对象
		Map<Integer, Integer> shopcar 
					= (Map<Integer, Integer>) session.getAttribute("shopcar");
		
		if(shopcar == null){
			request.setAttribute("message", "您还没用过购买任何商品!");
			request.setAttribute("nextpage", "main");
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}else{
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			User user = (User) session.getAttribute("user");
			out.println("欢迎["+user.getUsername()+"]登录");
			out.println("<br>");
			out.println("<a href='main'>首页</a>");
			
			// 显示购物车数据
			Integer sum_count = 0; // 总数量
			Double sum_price = 0.0; // 总价格
			
			out.println("<table border='1'>");
			out.println("<tr><th>封面</th><th>书名</th><th>价格</th><th>数量</th><th>操作</th></tr>");
			BookDao bookDao = new BookDao();
			for(Integer bookId : shopcar.keySet()){
				Book book = bookDao.getBookById(bookId);
				out.println("<tr>");
				out.println("<td>");
				// 点击图片，跳转到详细信息页面
				out.println("<a href='detail?id="+book.getId()+"'>");
				out.println("<img src='images/"+book.getImage()+"' height='60'>");
				out.println("</a>");
				out.println("</td>");
				out.println("<td>"+book.getName()+"</td>");
				out.println("<td>"+book.getPrice()+"</td>");
				Integer count = shopcar.get(bookId);
				sum_count += count; // 累加计算总数量
				sum_price += count * book.getPrice(); // 累加计算总金额
				out.println("<td>"+count+"</td>");
				out.println("<td><a href='remove?id="+bookId+"'>删除</a></td>");
				out.println("</tr>");
			}
			// 格式化，保留两位小数
			DecimalFormat df = new DecimalFormat("#0.00");
			out.println("<tr><th>合计</th><th>&nbsp;</th><th>"+df.format(sum_price)+"</th><th>"+sum_count+"</th><th>&nbsp;</th></tr>");
			out.println("<table>");
			out.println("<br>");
			out.println("<a href='main'>继续购买</a>");
			out.flush();
			out.close();
		}
				
		
		
	}

}
