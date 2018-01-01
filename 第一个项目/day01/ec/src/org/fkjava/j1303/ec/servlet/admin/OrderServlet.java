package org.fkjava.j1303.ec.servlet.admin;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.j1303.ec.common.DateTimeUtils;
import org.fkjava.j1303.ec.common.Page;
import org.fkjava.j1303.ec.entity.model.Order;
import org.fkjava.j1303.ec.exception.NotMethodParameterException;
import org.fkjava.j1303.ec.exception.NotSupportMethodException;
import org.fkjava.j1303.ec.service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/admin/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
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
		} else if (method.equals("list")) {
			// 订单列表
			this.list(request, response);
		} else if (method.equals("detail")) {
			// 订单详情
			this.detail(request, response);
		} else if (method.equals("send")) {
			// 发货后，调用此方法修改订单状态
			this.send(request, response);
		} else {
			// 未知的操作方法，抛出异常
			throw new NotSupportMethodException(method);
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 整理搜索参数
		String orderTimeBegin = request.getParameter("orderTimeBegin");
		Date timeBegin = null;
		if (orderTimeBegin != null && orderTimeBegin.equals("")) {
			orderTimeBegin = null;
		} else if (orderTimeBegin != null) {
			try {
				timeBegin = DateTimeUtils.toDate(orderTimeBegin,
						"yyyy-MM-dd HH:mm");
			} catch (ParseException e) {
				// 如果时间格式错误，认为时间无效
				orderTimeBegin = null;
			}
		}
		String orderTimeEnd = request.getParameter("orderTimeEnd");
		Date timeEnd = null;
		if (orderTimeEnd != null && orderTimeEnd.equals("")) {
			orderTimeEnd = null;
		} else if (orderTimeEnd != null) {
			try {
				timeEnd = DateTimeUtils
						.toDate(orderTimeEnd, "yyyy-MM-dd HH:mm");
			} catch (ParseException e) {
				// 如果时间格式错误，认为时间无效
				orderTimeEnd = null;
			}
		}
		String loginName = request.getParameter("loginName");
		if (loginName != null && loginName.equals("")) {
			loginName = null;
		}
		String status = request.getParameter("status");
		if (status != null && status.equals("")) {
			status = null;
		} else if (status != null) {
			try {
				Integer.parseInt(status);
			} catch (Exception e) {
			}
		}

		// 从请求参数中获取分页条件
		Page page = Page.getPage(request);

		// 把查询条件封装到分页对象中
		page.getSearchConditions().put("orderTimeBegin", timeBegin);
		page.getSearchConditions().put("orderTimeEnd", timeEnd);
		page.getSearchConditions().put("loginName", loginName);
		page.getSearchConditions().put("status", status);

		// 调用订单服务
		OrderService orderService = OrderService.getOrderService();
		List<Order> orderList = orderService.list(page);

		request.setAttribute("orderList", orderList);
		request.getRequestDispatcher("/WEB-INF/jsp/admin/order/list.jsp")
				.forward(request, response);
	}

	/**
	 * 显示订单的详细信息，包括里面的每件货物的简表
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rid = request.getParameter("id");
		try {
			Integer id = Integer.parseInt(rid);
			// 调用订单服务，修改状态
			OrderService orderService = OrderService.getOrderService();
			Order order = orderService.detail(id);
			// 转向到订单详情页面
			request.setAttribute("order", order);
			request.getRequestDispatcher("/WEB-INF/jsp/admin/order/detail.jsp")
					.forward(request, response);
		} catch (Exception e) {
			request.setAttribute("tip", "请求参数错误，字符串 " + rid + " 不是有效的订单ID");
			request.getRequestDispatcher("/WEB-INF/jsp/admin/error.jsp").forward(request, response);
		}
	}

	/**
	 * 已发货后，通过此方法修改订单状态
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void send(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rid = request.getParameter("id");
		try {
			Integer id = Integer.parseInt(rid);
			// 调用订单服务，修改状态
			OrderService orderService = OrderService.getOrderService();
			orderService.send(id);
			// 重定向到列表页面
			response.sendRedirect(request.getContextPath()
					+ "/admin/order?method=list");
		} catch (Exception e) {
			request.setAttribute("tip", "请求参数错误，字符串 " + rid + " 不是有效的订单ID");
		}
	}
}
