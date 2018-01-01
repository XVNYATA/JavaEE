package org.fkjava.j1303.ec.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.j1303.ec.entity.model.ArticleType;
import org.fkjava.j1303.ec.exception.NotMethodParameterException;
import org.fkjava.j1303.ec.exception.NotSupportMethodException;
import org.fkjava.j1303.ec.service.ArticleTypeService;

/**
 * Servlet implementation class ArticleTypeServlet
 */
@WebServlet("/admin/articleType")
public class ArticleTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleTypeServlet() {
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
			// 显示商品类型的列表
			this.list(request, response);
		} else if (method.equals("delete")) {
			// 删除商品类型
			this.delete(request, response);
		} else if (method.equals("detail")) {
			// 商品类型的详细信息
			this.detail(request, response);
		} else if (method.equals("update")) {
			// 更新商品类型
			this.update(request, response);
		} else if (method.equals("add")) {
			// 新增商品类型
			this.add(request, response);
		} else if (method.equals("beforAdd")) {
			// 准备新增商品类型之前，调用此方法，用于初始化页面的一级类型
			this.beforAdd(request, response);
		} else {
			// 未知的操作方法，抛出异常
			throw new NotSupportMethodException(method);
		}
	}

	/**
	 * 准备新增商品类型之前，调用此方法，用于初始化页面的一级类型
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void beforAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();
		// 查询顶级商品类型的列表
		List<ArticleType> topArticleTypeList = articleTypeService
				.topArticleTypeList();
		request.setAttribute("topArticleTypeList", topArticleTypeList);

		request.getRequestDispatcher("/WEB-INF/jsp/admin/article/addType.jsp").forward(
				request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String parentCode = request.getParameter("parentCode");
		if (parentCode != null && parentCode.equals("")) {
			// 如果上级code是空字符串，把上级code置为null，表示这是一个一级类型。
			parentCode = null;
		}
		String name = request.getParameter("name");
		String remark = request.getParameter("remark");
		ArticleType type = new ArticleType();
		type.setName(name);
		type.setRemark(remark);
		// 把上级的code放到实体对象中，实际新增的时候还需作一些处理
		type.setCode(parentCode);

		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();
		// 调用服务方法进行数据添加
		boolean isSucceed = articleTypeService.add(type);
		if (isSucceed) {
			// 重定向到列表页面
			response.sendRedirect(request.getContextPath()
					+ "/admin/articleType?method=list");
		} else {
			// 添加失败，返回的新增页面，并提示用户
			request.setAttribute("tip", "商品类型无法添加，因为同名的类型已经存在数据库中！");
			request.getRequestDispatcher("/admin/articleType?method=beforAdd")
					.forward(request, response);
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String remark = request.getParameter("remark");
		// 检查数据
		boolean checked = true;
		String errorMessage = "请求数据错误:";
		if (code == null || code.equals("")) {
			checked = false;
			errorMessage = errorMessage + "请求参数中未包含主键;";
		}
		if (name == null || name.equals("")) {
			checked = false;
			errorMessage = errorMessage + "类型名称不能为空;";
		}
		if (remark == null || remark.equals("")) {
			checked = false;
			errorMessage = errorMessage + "类型的备注信息不能为空;";
		}
		if (!checked) {
			// 校验不通过,回到详细页面,并提醒用户
			request.setAttribute("tip", errorMessage);
			this.detail(request, response);
		} else {
			// 执行更新操作
			// 调用商品类型服务，根据主键查询商品类型
			ArticleTypeService articleTypeService = ArticleTypeService
					.getArticleTypeService();
			ArticleType articleType = articleTypeService.getByCode(code);
			// 把请求参数转换成实体对象
			articleType.setName(name);
			articleType.setRemark(remark);

			// 调用类型服务的更新方法,更新数据库的数据
			boolean isSucceed = articleTypeService.update(articleType);
			if (isSucceed) {
				// 重定向到列表页面
				response.sendRedirect(request.getContextPath()
						+ "/admin/articleType?method=list");
			} else {
				// 修改失败，返回的修改页面，并提示用户
				request.setAttribute("tip", "商品类型无法修改，因为类型的名称重复！");
				this.detail(request, response);
			}
		}
	}

	private void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		if (code == null) {
			// 如果参数为空，不进行删除操作，直接转向到列表页面
			this.list(request, response);
			return;
		}
		// 调用商品类型服务，根据主键查询商品类型
		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();
		ArticleType articleType = articleTypeService.getByCode(code);
		// 把查询出来的商品类型存储到请求对象中
		request.setAttribute("articleType", articleType);
		// 转向到商品类型详细显示和修改的页面
		request.getRequestDispatcher("/WEB-INF/jsp/admin/article/editType.jsp").forward(
				request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		if (code == null) {
			// 如果参数为空，不进行删除操作，直接转向到列表页面
			this.list(request, response);
			return;
		}
		// 调用商品类型管理服务，删除类型
		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();
		boolean isSucceed = articleTypeService.delete(code);
		if (isSucceed) {
			// 删除成功，重定向到列表页面
			response.sendRedirect(request.getContextPath()
					+ "/admin/articleType?method=list");
		} else {
			// 删除失败，表示该类型或者它的子类型，已经被使用
			// 转向到错误提示页面
			request.setAttribute("tip",
					"商品类型删除失败，因为类型或者它的子类型，已经有商品引用。需要先把商品删除才能删除类型！");
			request.getRequestDispatcher("/WEB-INF/jsp/admin/error.jsp").forward(request,
					response);
		}
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("searchCode");
		if (code != null && code.equals("")) {
			// 如果code是空字符串，把code置为null
			code = null;
		}
		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();

		// 查询商品类型的列表
		List<ArticleType> articleTypeList = articleTypeService.list(code);
		request.setAttribute("articleTypeList", articleTypeList);

		// 查询顶级商品类型的列表
		List<ArticleType> topArticleTypeList = articleTypeService
				.topArticleTypeList();
		request.setAttribute("topArticleTypeList", topArticleTypeList);

		request.setAttribute("searchCode", code);

		request.getRequestDispatcher("/WEB-INF/jsp/admin/article/typeList.jsp").forward(
				request, response);
	}
}
