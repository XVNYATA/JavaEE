package org.fkjava.j1303.ec.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fkjava.j1303.ec.common.Constants;
import org.fkjava.j1303.ec.entity.model.User;

/**
 * 管理员权限过滤器
 */
@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AdminAuthFilter() {
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.KEY_LOGIN_USER);
		boolean havePermission = false;
		if (user == null) {
			// 未登录
			havePermission = false;
		} else {
			if (user.getRole() == 2) {
				// 管理员
				havePermission = true;
			}
		}

		if (havePermission) {
			// 如果具有权限，继续执行其他的程序
			chain.doFilter(request, resp);
		} else {
			// 否则重定向到登录界面
			HttpServletResponse response = (HttpServletResponse) resp;
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
