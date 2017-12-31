package org.fkjava.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.bean.Book;
import org.fkjava.dao.BookDao;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/view.action")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取图书的id 
		String id = request.getParameter("id");
		
		BookDao bookDao = new BookDao();
		//根据图书id获取商品的信息
		Book book = bookDao.getBookById(id);
		
		//将书籍信息放在 reqeust 中
		request.setAttribute("book", book);
		
		request.getRequestDispatcher("/WEB-INF/jsp/view.jsp").forward(request, response);
		
	}

}














