package org.fkjava.j1303.ec.servlet.user;

import java.io.IOException;
import java.text.ParseException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fkjava.j1303.ec.common.Constants;
import org.fkjava.j1303.ec.common.DateTimeUtils;
import org.fkjava.j1303.ec.common.Page;
import org.fkjava.j1303.ec.entity.model.Order;
import org.fkjava.j1303.ec.entity.model.OrderItem;
import org.fkjava.j1303.ec.entity.model.User;
import org.fkjava.j1303.ec.exception.NotMethodParameterException;
import org.fkjava.j1303.ec.exception.NotSupportMethodException;
import org.fkjava.j1303.ec.service.OrderService;
import org.fkjava.j1303.ec.service.ShoppingCarService;
import org.fkjava.j1303.ec.service.ShoppingCarService.ShoppingCar;
import org.fkjava.j1303.ec.servlet.UserPageServlet;

/**
 * 用户订单管理的Servlet
 */
@WebServlet(description = "用户订单管理的Servlet", urlPatterns = { "/user/order" })
public class UserOrderServlet extends UserPageServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserOrderServlet() {
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
		} else if (method.equals("confirm")) {
			// 确认订单，显示收货人、支付方式、订单内容等到页面
			this.confirm(request, response);
		} else if (method.equals("save")) {
			// 保存订单到数据库
			this.save(request, response);
		} else if (method.equals("list")) {
			// 我的订单
			this.list(request, response);
		} else {
			// 未知的操作方法，抛出异常
			throw new NotSupportMethodException(method);
		}
	}

	/**
	 * 我的订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.initPage(request);

		HttpSession session = request.getSession();
		// 登录的用户信息
		User user = (User) session.getAttribute(Constants.KEY_LOGIN_USER);
		// 订单服务
		OrderService orderService = OrderService.getOrderService();

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

		String status = request.getParameter("status");
		if (status != null && status.equals("")) {
			status = null;
		} else if (status != null) {
			try {
				Integer.parseInt(status);
			} catch (Exception e) {
			}
		}

		// 获取登录用户中的登录名
		String loginName = user.getLoginName();

		// 从请求参数中获取分页条件
		Page page = Page.getPage(request);

		// 把查询条件封装到分页对象中
		page.getSearchConditions().put("orderTimeBegin", timeBegin);
		page.getSearchConditions().put("orderTimeEnd", timeEnd);
		page.getSearchConditions().put("loginName", loginName);
		page.getSearchConditions().put("status", status);

		List<Order> orderList = orderService.list(page);

		// 转向到用户的订单页面
		request.setAttribute("orderList", orderList);
		request.getRequestDispatcher("/WEB-INF/jsp/user/orderList.jsp")
				.forward(request, response);
	}

	private void save(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShoppingCar car = ShoppingCarService.getShoppingCarService()
				.getShoppingCar(request);
		// 保存订单的时候，只要把session中的OrderItem组织成一个Order，就可以直接用于插入数据库了。
		Order order = new Order();
		// 获取在购物车中的订单条目信息
		Collection<OrderItem> orderItems = car.getOrderItems();
		// 把购物车中的订单条目放到订单中
		Double amount = 0.0;
		for (OrderItem orderItem : orderItems) {
			order.getOrderItemList().add(orderItem);
			amount = amount + orderItem.getAmount();
		}
		// 订单总金额
		order.setAmount(amount);

		// 设置用户信息到订单
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.KEY_LOGIN_USER);
		order.setUser(user);
		order.setUserId(user.getId());

		// 保存订单到数据库
		OrderService orderService = OrderService.getOrderService();
		orderService.save(order);
		// 清除购物车的内容，以便下次购物使用
		car.getOrderItems().clear();
		// 重定向到我的订单
		response.sendRedirect(request.getContextPath()
				+ "/user/order?method=list");
	}

	private void confirm(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		initPage(request);

		request.getRequestDispatcher("/WEB-INF/jsp/user/confirmOrder.jsp")
				.forward(request, response);
	}

}
