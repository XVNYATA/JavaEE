package org.fkjava.j1303.ec.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.j1303.ec.common.Page;
import org.fkjava.j1303.ec.entity.model.Article;
import org.fkjava.j1303.ec.service.ArticleService;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends UserPageServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexServlet() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		initPage(request);
		Page page = (Page) request.getAttribute("page");

		ArticleService articleService = ArticleService.getArticleService();
		List<Article> articleList = articleService.list(page);

		request.setAttribute("articleList", articleList);

		request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request,
				response);
	}

}
