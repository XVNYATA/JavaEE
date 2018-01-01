package org.fkjava.j1303.ec.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fkjava.j1303.ec.common.Constants;
import org.fkjava.j1303.ec.entity.model.User;
import org.fkjava.j1303.ec.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.action")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		// 调用用户服务，根据登录名查询用户信息
		User user = UserService.getUserService().findUserByLoginName(loginName);
		// 判断登录名是否能够查询到用户信息
		if (user == null) {
			// 如果未查询到用户信息，返回登录界面，并提示用户不存在

			// 设置提示信息
			request.setAttribute("tip", "根据登录名[" + loginName
					+ "]无法找到用户信息，可能是用户不存在");
			// 转向到登录界面
			request.getRequestDispatcher(response.encodeURL("/login.jsp"))
					.forward(request, response);
		} else {
			// 找到用户后，判断用户输入的密码是否正确
			if (user.getPassWord().equals(password)) {
				// 密码正确，表示登录成功
				HttpSession session = request.getSession();
				session.setAttribute(Constants.KEY_LOGIN_USER, user);
				// 登录成功后，根据角色重定向到不同的界面。
				// 管理员重定向到管理界面
				// 普通用户重定向到网站首页
				String url = null;
				if (user.getRole() == 2) {
					// RLE == 2 表示管理员
					url = "/admin/index.jsp";
				} else {
					url = "/";
				}
				url = request.getContextPath() + url;
				url = response.encodeRedirectURL(url);
				response.sendRedirect(url);
			} else {
				// 密码不正确，提示用户密码错误，登录失败
				// 设置提示信息
				request.setAttribute("tip", "密码不正确");
				// 转向到登录界面
				request.getRequestDispatcher(response.encodeURL("/login.jsp"))
						.forward(request, response);
			}
		}
	}
}
