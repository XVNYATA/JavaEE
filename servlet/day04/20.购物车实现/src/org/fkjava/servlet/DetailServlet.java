package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.dao.BookDao;
import org.fkjava.dto.Book;
import org.fkjava.dto.User;

/**
 * Servlet implementation class DetailServlet
 */
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收参数
		Integer id = Integer.parseInt(request.getParameter("id"));
		BookDao bookDao = new BookDao();
		Book book = bookDao.getBookById(id);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
//		User user = (User) request.getAttribute("user");
//		User user = (User)this.getServletContext().getAttribute("user");
		User user = (User)request.getSession().getAttribute("user");
		out.println("欢迎["+user.getUsername()+"]登录");
		out.println("<br>");
		out.println("<a href='main'>首页</a>");
		
		// p 段落
		out.println("<p> <img src='images/"+book.getImage()+"' height='120'>");
		out.println("<p> "+book.getName()+"");
		out.println("<p> "+book.getAuthor()+"");
		out.println("<p> "+book.getPrice()+"");
		out.println("<p> "+book.getRemark()+"");
		
		out.println("<br>");
		out.println("<form action='addshopcar' method='post'>");
		out.println("<input type='hidden' name='id' value='"+book.getId()+"'>");
		out.println("<table>");
		out.println("<tr>");
		out.println("<td>购买<input type='text' name='count' value='1'>本</td>");
		out.println("<td><input type='submit' value='添加购物车'></td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</form>");
		
		/***************将当前浏览的Book的id添加到Cookie当中***********************************/
		/**
		 * 设计存储：
		 * 1. 使用"_"分隔图书的id
		 * 2. 最多保存3本
		 * books=1_3_2
		 * */
		// 定义变量
		Cookie cookie = null;
		// 从request中获取所有Cookie
		Cookie[] cookies = request.getCookies();
		// 判断
		if(cookies != null && cookies.length > 0){
			// 遍历所有Cookie
			for(Cookie temp : cookies){
				// 如果Cookie的name是books，说明之前存储过最近浏览数据
				if(temp.getName().equals("books3")){
					// 将该Cooke赋值给变量 
					cookie = temp;
					break;
				}
			}
		}
		// 如果cookie变量是null，说明之前没有存储过最近浏览数据
		if(cookie == null){
			System.out.println("第一次存储");
			cookie = new Cookie("books3",id + "");
		}else{
			System.out.println("再次存储");
			// 获得之前存储的id
			String oldValue = cookie.getValue();
			System.out.println("oldValue：" + oldValue);
			// 使用"_"分解字符串
			String[] oldValues = oldValue.split("_");
			// 将分解出来的字符串转成集合
			Collection<String> odlValueColl = Arrays.asList(oldValues);
			// 将集合转成LinkedList，删除，添加字符串比较麻烦，使用集合LinkedList
			LinkedList<String> linkedList = new LinkedList<String>(odlValueColl);
			// 1. 判断当前浏览的id在不在books里面
			if(linkedList.contains(id + "")){
				// 包含，不管books数量是多少个，直接删除books中的id，讲id放到第一个
				linkedList.remove(id + "");
				linkedList.addFirst(id + "");
			}else{
				// 不包含
				if(linkedList.size() == 3){
					// books已经保存了3个id，删除最后一个id，将现在的id放在第一个
					linkedList.removeLast();
					linkedList.addFirst(id + "");
				}else{
					// books没有保存了3个id，将现在的id放在第一个
					linkedList.addFirst(id + "");
				}
			}
			System.out.println(linkedList);
			// 将linkedList转成字符串
			StringBuffer newValue = new StringBuffer();
			for(String s : linkedList){
				newValue.append(s).append("_");
			}
			// 删除最后一个下划线
			newValue.deleteCharAt(newValue.length() - 1);
			System.out.println(newValue);
			// 重新设置cookie的值
			cookie.setValue(newValue.toString());
		}
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		/**************************************************/
		
		out.flush();
		out.close();
	}

}
