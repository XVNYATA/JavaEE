package org.fkjava.j1303.ec.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.j1303.ec.entity.model.User;
import org.fkjava.j1303.ec.exception.NotMethodParameterException;
import org.fkjava.j1303.ec.exception.NotSupportMethodException;
import org.fkjava.j1303.ec.service.UserService;

/**
 * Servlet implementation class UserManagerServlet
 */
@WebServlet("/admin/user")
public class UserManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserManagerServlet() {
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
			// 显示用户列表
			this.list(request, response);
		} else if (method.equals("delete")) {
			// 删除用户
			this.delete(request, response);
		} else if (method.equals("detail")) {
			// 用户详细信息
			this.detail(request, response);
		} else if (method.equals("update")) {
			// 更新用户信息
			this.update(request, response);
		} else {
			// 未知的操作方法，抛出异常
			throw new NotSupportMethodException(method);
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获取要删除的用户的ID
		String id = request.getParameter("id");
		// 检查该ID是否为数字，只有数字才是有效的参数
		try {
			int userId = Integer.parseInt(id);
			// 参数正确，调用用户服务删除用户数据
			UserService userService = UserService.getUserService();
			// 根据用户ID从数据库获取用户信息
			User user = userService.getUserById(userId);

			// 获取请求参数
			String role = request.getParameter("role");
			String sex = request.getParameter("sex");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");

			// 把请求参数中的数据set到用户信息中
			user.setRole(Integer.parseInt(role));
			user.setSex(Integer.parseInt(sex));
			user.setEmail(email);
			user.setAddress(address);
			user.setPhone(phone);

			// 调用用户服务，保存用户数据
			userService.update(user);
			// 重定向到用户列表
			response.sendRedirect(request.getContextPath()
					+ "/admin/user?method=list");
		} catch (Exception ex) {
			// 出现异常，表示无法把字符串转换成整型，即参数不是有效的数字
			// 出现异常只需要返回用户列表即可，不作额外处理
			this.list(request, response);
		}
	}

	private void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取要删除的用户的ID
		String id = request.getParameter("userId");
		// 检查该ID是否为数字，只有数字才是有效的参数
		try {
			int userId = Integer.parseInt(id);
			// 参数正确，调用用户服务删除用户数据
			UserService userService = UserService.getUserService();
			User user = userService.getUserById(userId);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/WEB-INF/jsp/admin/user/userDetail.jsp").forward(
					request, response);
		} catch (Exception ex) {
			// 出现异常，表示无法把字符串转换成整型，即参数不是有效的数字
			// 出现异常只需要返回用户列表即可，不作额外处理
			this.list(request, response);
		}
	}

	/**
	 * 删除用户记录
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取要删除的用户的ID
		String id = request.getParameter("userId");
		// 检查该ID是否为数字，只有数字才是有效的参数
		try {
			int userId = Integer.parseInt(id);
			// 参数正确，调用用户服务删除用户数据
			UserService userService = UserService.getUserService();
			userService.delete(userId);
			// 重定向到用户列表
			response.sendRedirect(request.getContextPath()
					+ "/admin/user?method=list");
		} catch (Exception ex) {
			// 出现异常，表示无法把字符串转换成整型，即参数不是有效的数字
			// 出现异常只需要返回用户列表即可，不作额外处理
			this.list(request, response);
		}
	}

	/**
	 * 查询用户列表
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		if (name != null && name.equals("")) {
			// 如果查询条件是空字符串，把查询条件置空
			name = null;
		}
		// 调用用户服务，查询用户列表
		List<User> userList = UserService.getUserService().list(name);
		request.setAttribute("userList", userList);
		request.setAttribute("searchCondition", name);
		request.getRequestDispatcher("/WEB-INF/jsp/admin/user/userList.jsp").forward(
				request, response);
	}
}
