package org.fkjava.j1303.ec.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.j1303.ec.exception.NotMethodParameterException;
import org.fkjava.j1303.ec.exception.NotSupportMethodException;
import org.fkjava.j1303.ec.service.ShoppingCarService;
import org.fkjava.j1303.ec.service.ShoppingCarService.ShoppingCar;

/**
 * Servlet implementation class ShoppingCarServlet
 */
@WebServlet("/shoppingCar")
public class ShoppingCarServlet extends UserPageServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShoppingCarServlet() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method == null || method.equals("")) {
			// 缺少method对应的方法，不能执行
			throw new NotMethodParameterException();
		} else if (method.equals("add")) {
			// 添加商品到购物车
			this.add(request, response);
		} else if (method.equals("show")) {
			// 显示购物车内容
			this.show(request, response);
		} else if (method.equals("del")) {
			// 从购物车删除商品
			this.del(request, response);
		} else {
			// 未知的操作方法，抛出异常
			throw new NotSupportMethodException(method);
		}
	}

	private void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.initPage(request);
		// 购物车无法
		ShoppingCarService shoppingCarService = ShoppingCarService
				.getShoppingCarService();
		// 获取购物车
		ShoppingCar shoppingCar = shoppingCarService.getShoppingCar(request);

		request.setAttribute("shoppingCar", shoppingCar);
		// 转向到购物车页面
		request.getRequestDispatcher("/WEB-INF/jsp/car/show.jsp").forward(
				request, response);
	}

	/**
	 * 从购物车删除商品
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rid = request.getParameter("id");
		Integer articleId = null;
		try {
			articleId = Integer.parseInt(rid);
		} catch (NumberFormatException e) {
			request.setAttribute("tip",
					"字符串 " + rid + " 无法转换成整型，因为：" + e.getLocalizedMessage());
			return;
		}

		// 购物车无法
		ShoppingCarService shoppingCarService = ShoppingCarService
				.getShoppingCarService();
		// 获取购物车
		ShoppingCar shoppingCar = shoppingCarService.getShoppingCar(request);

		// 把商品从购物车删除
		shoppingCar.del(articleId);

		// 重定向到购物车的详情页面
		response.sendRedirect(request.getContextPath()
				+ "/shoppingCar?method=show");
	}

	/**
	 * 添加商品到购物车
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rid = request.getParameter("id");
		// 购买数量
		String rnumber = request.getParameter("buyNum");
		Integer articleId = null;
		try {
			articleId = Integer.parseInt(rid);
		} catch (NumberFormatException e) {
			request.setAttribute("tip",
					"字符串 " + rid + " 无法转换成整型，因为：" + e.getLocalizedMessage());
			return;
		}
		Integer number = null;
		try {
			number = Integer.parseInt(rnumber);
		} catch (NumberFormatException e) {
			request.setAttribute("tip",
					"字符串 " + rnumber + " 无法转换成整型，因为：" + e.getLocalizedMessage());
			return;
		}

		// 购物车无法
		ShoppingCarService shoppingCarService = ShoppingCarService
				.getShoppingCarService();
		// 获取购物车
		ShoppingCar shoppingCar = shoppingCarService.getShoppingCar(request);

		// 把商品添加到购物车
		shoppingCar.add(articleId, number);

		// // 重定向到引用页面（一般是商品详情页面，或者是购物车的详情页面）
		// String referer = request.getHeader("Referer");
		// if (referer == null) {
		// 重定向到购物车详情页面
		response.sendRedirect(request.getContextPath()
				+ "/shoppingCar?method=show");
		// } else {
		// // 重定向到引用页面
		// response.sendRedirect(referer);
		// }
	}
}
