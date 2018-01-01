package org.fkjava.j1303.ec.servlet;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.fkjava.j1303.ec.common.Page;
import org.fkjava.j1303.ec.entity.model.ArticleType;
import org.fkjava.j1303.ec.service.ArticleTypeService;

public abstract class UserPageServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4621030157636016919L;

	/**
	 * 初始化用户页面
	 * 
	 * @param request
	 */
	protected void initPage(HttpServletRequest request) {
		ArticleTypeService articleTypeService = ArticleTypeService
				.getArticleTypeService();
		// 查询所有的一级类型
		List<ArticleType> articleTypeList = articleTypeService
				.topArticleTypeList();

		request.setAttribute("articleTypeList", articleTypeList);

		// 从数据库查询请求参数中指定的商品类型，用于显示默认列表和二级类型
		String typeCode = request.getParameter("typeCode");
		if (typeCode != null && typeCode.equals("")) {
			typeCode = null;
		}

		ArticleType articleType = null;
		if (typeCode == null) {
			// 如果没有传入查询的商品类型
			// 使用一级类型中的第一个类型作为查询参数
			articleType = articleTypeList.get(0);
			typeCode = articleType.getCode();
		} else {
			// 否则使用传入的typeCode查询商品类型
			articleType = articleTypeService.getByCode(typeCode);
		}
		request.setAttribute("articleType", articleType);

		ArticleType firstArticleType = null;
		if (typeCode.length() > ArticleTypeService.CODE_LENGTH) {
			// 如果类型主键的长度大于定义的主键长度，则认为它是二级类型
			// 需要根据二级类型查询到一级类型
			String code = typeCode.substring(0, ArticleTypeService.CODE_LENGTH);
			firstArticleType = articleTypeService.getByCode(code);
		} else {
			// 如果传输的typeCode长度不大于定义的主键长度，那么它就是一级类型的CODE
			firstArticleType = articleType;
		}
		request.setAttribute("firstArticleType", firstArticleType);

		// 根据一级类型查询二级类型
		List<ArticleType> secondArticleTypeList = articleTypeService
				.list(firstArticleType.getCode());
		request.setAttribute("secondArticleTypeList", secondArticleTypeList);

		// 根据typeCode查询商品列表，需要分页显示
		Page page = Page.getPage(request);
		if (request.getParameter("maxRows") == null
				|| request.getParameter("maxRows").equals("")) {
			// 默认8个商品
			page.setMaxRows(8);
		}
		page.getSearchConditions().put("typeCode", typeCode);

		String keyword = request.getParameter("keyword");
		if (keyword != null && keyword.trim().equals("")) {
			keyword = null;
		}
		page.getSearchConditions().put("keyword", keyword);
	}
}
