package org.fkjava.j1303.ec.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.j1303.ec.entity.model.Article;
import org.fkjava.j1303.ec.service.ArticleService;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet("/item")
public class ItemServlet extends UserPageServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ItemServlet() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		initPage(request);

		String rid = request.getParameter("id");
		try {
			Integer id = Integer.parseInt(rid);
			ArticleService articleService = ArticleService.getArticleService();
			Article article = articleService.getById(id);
			request.setAttribute("article", article);
			request.getRequestDispatcher("/WEB-INF/jsp/item.jsp").forward(
					request, response);
		} catch (NumberFormatException e) {
			request.setAttribute("tip", "请求参数无效，无法获取参数id的值，请从正确的路径访问商城，谢谢合作。");
			request.getRequestDispatcher("/WEB-INF/jsp/error.jsp");
		}
	}

}
