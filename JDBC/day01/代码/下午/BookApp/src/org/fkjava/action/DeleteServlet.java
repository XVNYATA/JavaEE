package org.fkjava.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.dao.BookDao;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/deleteBook.action")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取书籍
		String id = request.getParameter("id");
		BookDao bookDao = new BookDao();
		
		//删除
		try {
			bookDao.deleteBookById(id);
			request.setAttribute("message", "删除成功");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("message", "删除失败");
		}
		
		//跳转main页面
		response.sendRedirect("main.action");
		//request.getRequestDispatcher("/main.action").forward(request, response);
	}

}












