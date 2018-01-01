package org.fkjava.j1303.ec.servlet.admin;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.fkjava.j1303.ec.common.DateTimeUtils;
import org.fkjava.j1303.ec.common.Page;
import org.fkjava.j1303.ec.common.UploadFileUtils;
import org.fkjava.j1303.ec.entity.model.Article;
import org.fkjava.j1303.ec.entity.model.ArticleType;
import org.fkjava.j1303.ec.exception.NotMethodParameterException;
import org.fkjava.j1303.ec.exception.NotSupportMethodException;
import org.fkjava.j1303.ec.service.ArticleService;
import org.fkjava.j1303.ec.service.ArticleTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class ArticleServlet
 */
@WebServlet("/admin/article")
@MultipartConfig
public class ArticleServlet extends HttpServlet {

	private static Logger logger = LoggerFactory
			.getLogger(ArticleServlet.class);
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleServlet() {
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

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArticleService articleService = ArticleService.getArticleService();

		// 获取页面上的请求参数
		// ----------------普通的表单属性------------------
		Integer id = null;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			// ID参数错误直接转向到列表页面
			response.sendRedirect(request.getContextPath()
					+ "/admin/article?method=list");
			return;
		}
		String typeCode = request.getParameter("typeCode");
		String title = request.getParameter("title");
		String supplier = request.getParameter("supplier");
		String locality = request.getParameter("locality");
		String price = request.getParameter("price");
		String storage = request.getParameter("storage");
		String putawayDate = request.getParameter("putawayDate");
		String description = request.getParameter("description");
		String image = null;

		// 需要一个方法，能够把请求中包含的文件保存到WEB应用中的/images/article目录下，并且把保存后的文件名返回
		// 请求中可能包含多个文件，所以返回的新文件名也可能多个
		// 以Map的方式，其中KEY是表单的name属性的值，VALUE是保存后的新文件名
		// Map<String, String> fileNames = UploadFileUtils.saveImages(request);
		// 或者直接保存一个指定的part
		try {
			String realPath = request.getServletContext().getRealPath(
					"/images/article");
			Part part = request.getPart("image");
			String fileName = UploadFileUtils.saveImage(realPath, part);
			// 图片地址
			image = fileName;
		} catch (Exception e) {
			// 保存文件是出现异常，表示未上传文件，所以不修改image的属性的值
		}

		Article article = articleService.getById(id);
		article.setCreateDate(new Date());
		article.setDescription(description);
		if (image != null) {
			// 只有image不为空的时候，修改修改image属性
			article.setImage(image);
		}
		article.setLocality(locality);
		// 如果报错，表示不能正常把字符串转换成浮点数字
		try {
			article.setPrice(Double.valueOf(price));
		} catch (NumberFormatException e) {
			logger.error("不能把字符串 [ {0} ] 解析成Double对象，因为：{1}", price,
					e.getLocalizedMessage());
		}
		try {
			article.setPutawayDate(DateTimeUtils.toDate(putawayDate,
					"yyyy-MM-dd"));
		} catch (ParseException e) {
			logger.error("不能把字符串 [ {0} ] 解析成Date对象，因为：{1}", putawayDate,
					e.getLocalizedMessage());
		}
		try {
			article.setStorage(Integer.parseInt(storage));
		} catch (NumberFormatException e) {
			logger.error("不能把字符串 [ {0} ] 解析成Integer对象，因为：{1}", price,
					e.getLocalizedMessage());
		}
		article.setSupplier(supplier);
		article.setTitle(title);
		article.setTypeCode(typeCode);
		request.setAttribute("article", article);
		// 校验请求的参数是否正确
		List<String> validationErrorMessages = this.validateRequest(article);
		if (validationErrorMessages.isEmpty()) {
			// 没有错误消息，表示全部参数正确
			// 调用商品服务把数据保存到数据库
			boolean isSucceed = articleService.update(article);
			if (isSucceed) {
				// 添加成功
				// 重定向到书籍列表页面
				response.sendRedirect(request.getContextPath()
						+ "/admin/article?method=list");
			} else {
				// 添加失败
			}
		} else {
			// 有错误表示部分不正确，转向到添加页面，并提示用户
			request.setAttribute("validationErrorMessages",
					validationErrorMessages);
			this.beforAdd(request, response);
		}
	}

	private void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 商品的ID
		String rid = request.getParameter("id");
		try {
			Integer id = Integer.parseInt(rid);
			// 调用商品服务，根据商品ID查询到商品的详细信息
			Article article = ArticleService.getArticleService().getById(id);
			request.setAttribute("article", article);

			// 查询商品的类型列表，用于初始化类型选择的下拉框
			ArticleTypeService articleTypeService = ArticleTypeService
					.getArticleTypeService();
			List<ArticleType> articleTypeList = articleTypeService.list(null);
			request.setAttribute("articleTypeList", articleTypeList);

			// 转向到商品详情页面，进行修改
			request.getRequestDispatcher("/WEB-INF/jsp/admin/article/edit.jsp")
					.forward(request, response);
		} catch (NumberFormatException e) {
			// 参数id错误，直接重定向到列表页面
			// 重定向到书籍列表页面
			response.sendRedirect(request.getContextPath()
					+ "/admin/article?method=list");
		}
	}

	/**
	 * 接收用户填写的商品信息，并把信息保存起来
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取页面上的请求参数
		// ----------------普通的表单属性------------------
		String typeCode = request.getParameter("typeCode");
		String title = request.getParameter("title");
		String supplier = request.getParameter("supplier");
		String locality = request.getParameter("locality");
		String price = request.getParameter("price");
		String storage = request.getParameter("storage");
		String putawayDate = request.getParameter("putawayDate");
		String description = request.getParameter("description");
		String discount = request.getParameter("discount");

		// 需要一个方法，能够把请求中包含的文件保存到WEB应用中的/images/article目录下，并且把保存后的文件名返回
		// 请求中可能包含多个文件，所以返回的新文件名也可能多个
		// 以Map的方式，其中KEY是表单的name属性的值，VALUE是保存后的新文件名
		// Map<String, String> fileNames = UploadFileUtils.saveImages(request);
		// 或者直接保存一个指定的part
		String realPath = request.getServletContext().getRealPath(
				"/images/article");
		Part part = request.getPart("image");
		String fileName = UploadFileUtils.saveImage(realPath, part);
		// 图片地址
		String image = fileName;

		Article article = new Article();
		article.setCreateDate(new Date());
		article.setDescription(description);
		article.setImage(image);
		article.setLocality(locality);
		// 如果报错，表示不能正常把字符串转换成浮点数字
		try {
			article.setPrice(Double.valueOf(price));
		} catch (NumberFormatException e) {
			logger.error("不能把字符串 [ {0} ] 解析成Double对象，因为：{1}", price,
					e.getLocalizedMessage());
		}
		try {
			article.setPutawayDate(DateTimeUtils.toDate(putawayDate,
					"yyyy-MM-dd"));
		} catch (ParseException e) {
			logger.error("不能把字符串 [ {0} ] 解析成Date对象，因为：{1}", putawayDate,
					e.getLocalizedMessage());
		}
		try {
			article.setStorage(Integer.parseInt(storage));
		} catch (NumberFormatException e) {
			logger.error("不能把字符串 [ {0} ] 解析成Integer对象，因为：{1}", price,
					e.getLocalizedMessage());
		}
		try {
			article.setDiscount(Double.parseDouble(discount));
		} catch (NumberFormatException e) {
			logger.error("不能把字符串 [ {0} ] 解析成Double对象，因为：{1}", discount,
					e.getLocalizedMessage());
		}
		article.setSupplier(supplier);
		article.setTitle(title);
		article.setTypeCode(typeCode);
		request.setAttribute("article", article);
		// 校验请求的参数是否正确
		List<String> validationErrorMessages = this.validateRequest(article);
		if (validationErrorMessages.isEmpty()) {
			// 没有错误消息，表示全部参数正确
			ArticleService articleService = ArticleService.getArticleService();
			// 调用商品服务把数据保存到数据库
			boolean isSucceed = articleService.add(article);
			if (isSucceed) {
				// 添加成功
				// 重定向到书籍列表页面
				response.sendRedirect(request.getContextPath()
						+ "/admin/article?method=list");
			} else {
				// 添加失败
			}
		} else {
			// 有错误表示部分不正确，转向到添加页面，并提示用户
			request.setAttribute("validationErrorMessages",
					validationErrorMessages);
			this.beforAdd(request, response);
		}
	}

	/**
	 * 初始化添加商品的页面
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void beforAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 查询商品的类型列表，用于初始化类型选择的下拉框
		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();
		List<ArticleType> articleTypeList = articleTypeService.list(null);
		request.setAttribute("articleTypeList", articleTypeList);

		// 跳转到新增商品的页面
		request.getRequestDispatcher("/WEB-INF/jsp/admin/article/add.jsp")
				.forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 商品的ID
		String rid = request.getParameter("id");
		try {
			Integer id = Integer.parseInt(rid);

			// 获取商品管理服务的实例
			ArticleService articleService = ArticleService.getArticleService();
			boolean isSucceed = articleService.delete(id);
			if (isSucceed) {
				// 删除完成后，重定向到列表页面
				response.sendRedirect(request.getContextPath()
						+ "/admin/article?method=list");
			} else {
				// 删除失败，转向到错误页面
				request.setAttribute("tip", "根据商品id [" + rid + "] 无法删除商品。");
				request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(
						request, response);
			}
		} catch (NumberFormatException e) {
			// 如果出现异常，表示ID有误，先输出提示，再转向到列表页面
			request.setAttribute("tip", "商品id [" + rid
					+ "] 不是有效的数字，无法根据此参数查询商品详细信息");
			request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(
					request, response);
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取商品管理服务的实例
		ArticleService articleService = ArticleService.getArticleService();

		// 整理搜索参数
		String title = request.getParameter("title");
		if (title != null && title.equals("")) {
			title = null;
		}
		String supplier = request.getParameter("supplier");
		if (supplier != null && supplier.equals("")) {
			supplier = null;
		}
		String typeCode = request.getParameter("typeCode");
		if (typeCode != null && typeCode.equals("")) {
			typeCode = null;
		}

		// 从请求参数中获取分页条件
		Page page = Page.getPage(request);
		// 把查询条件封装到分页对象中
		page.getSearchConditions().put("title", title);
		page.getSearchConditions().put("supplier", supplier);
		page.getSearchConditions().put("typeCode", typeCode);

		List<Article> articleList = articleService.list(page);

		request.setAttribute("articleList", articleList);

		// 查询商品的类型列表，用于初始化查询时的下拉框
		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();
		List<ArticleType> articleTypeList = articleTypeService.list(null);
		request.setAttribute("articleTypeList", articleTypeList);

		request.getRequestDispatcher("/WEB-INF/jsp/admin/article/list.jsp")
				.forward(request, response);
	}

	/**
	 * 校验填写的数据是否完整、准确
	 * 
	 * @param article
	 * @return
	 */
	private List<String> validateRequest(Article article) {
		List<String> validationErrorMessage = new LinkedList<>();
		if (article.getDescription() == null
				|| article.getDescription().equals("")) {
			validationErrorMessage.add("商品的描述信息不能为空");
		}
		if (article.getImage() == null || article.getImage().equals("")) {
			validationErrorMessage.add("封面图片不能为空");
		}
		if (article.getLocality() == null || article.getLocality().equals("")) {
			validationErrorMessage.add("地区不能为空");
		}
		if (article.getPrice() == null) {
			validationErrorMessage.add("价格必须是有效的浮点数字");
		}
		if (article.getPutawayDate() == null) {
			validationErrorMessage.add("上架时间不能为空");
		}
		if (article.getStorage() == null) {
			validationErrorMessage.add("库存数量必须是有效的整型数字");
		}
		if (article.getSupplier() == null || article.getSupplier().equals("")) {
			validationErrorMessage.add("商品的提供商不能为空");
		}
		if (article.getTitle() == null || article.getTitle().equals("")) {
			validationErrorMessage.add("商品的名称(标题)不能为空");
		}
		if (article.getTypeCode() == null || article.getTypeCode().equals("")) {
			validationErrorMessage.add("必须选择商品类型");
		}
		return validationErrorMessage;
	}
}
