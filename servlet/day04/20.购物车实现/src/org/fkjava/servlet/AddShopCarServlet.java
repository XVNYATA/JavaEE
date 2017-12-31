package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
 * Servlet implementation class AddShopCarServlet
 */
public class AddShopCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddShopCarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 购物车应该存储到HttpSession范围当中
		 * 购物车：Map<id=数量，1=3,2=1>
		 * */
		// 接收传递的参数
		// <input type='hidden' name='id' value='"+book.getId()+"'>
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer count = Integer.parseInt(request.getParameter("count"));
		
		// 获得HttpSession对象
		HttpSession session = request.getSession();
		// 从session范围中获取shopcar对象
		Map<Integer, Integer> shopcar 
			= (Map<Integer, Integer>) session.getAttribute("shopcar");
		
		if(shopcar == null){
			// 第一次购买
			System.out.println("第一次购买 ..... ");
			shopcar = new HashMap<Integer, Integer>();
			shopcar.put(id, count);
			// 将shopcar（Map集合）保存到session范围
			session.setAttribute("shopcar", shopcar);
		}else{
			// 再次购买
			System.out.println("再次购买 ..... ");
			// 通过id到购物车中查找value
			Integer oldValue = shopcar.get(id);
			if(oldValue == null){
				// 没有购买过
				shopcar.put(id, count);
			}else{
				// 之前购买过该商品
				shopcar.put(id, count + oldValue);
			}
		}
		System.out.println(shopcar);
		
		// 跳转到下一个页面去显示购物车的数据
		response.sendRedirect("myshopcar");
		
		
	}

}






