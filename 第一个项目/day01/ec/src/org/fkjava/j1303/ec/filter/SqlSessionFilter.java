package org.fkjava.j1303.ec.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.fkjava.j1303.ec.common.MyBatisSessionFactory;

/**
 * Servlet Filter implementation class SqlSessionFilter
 */
@WebFilter(urlPatterns = { "/*" }, dispatcherTypes = { DispatcherType.REQUEST })
public class SqlSessionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public SqlSessionFilter() {
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		boolean isCreated = MyBatisSessionFactory.openSession();
		// pass the request along the filter chain
		chain.doFilter(request, response);
		// 如果创建了新的会话，则在完成操作以后，需要销毁掉
		if (isCreated) {
			// 提交事务
			MyBatisSessionFactory.getSession().commit();
			// 关闭SqlSession，并清理线程
			MyBatisSessionFactory.closeSession();
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
