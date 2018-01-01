package org.fkjava.j1303.ec.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.j1303.ec.common.MyBatisSessionFactory;
import org.fkjava.j1303.ec.common.Page;
import org.fkjava.j1303.ec.entity.mapper.ArticleMapper;
import org.fkjava.j1303.ec.entity.model.Article;
import org.fkjava.j1303.ec.entity.model.ArticleExample;
import org.fkjava.j1303.ec.entity.model.ArticleExample.Criteria;

public class ArticleService {

	private static ArticleService articleService = new ArticleService();

	private ArticleService() {
	}

	public static ArticleService getArticleService() {
		return articleService;
	}

	public List<Article> list(Page page) {
		// 获取数据库会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取商品操作接口
			ArticleMapper articleMapper = sqlSession
					.getMapper(ArticleMapper.class);

			String title = (String) page.getSearchConditions().get("title");
			String supplier = (String) page.getSearchConditions().get(
					"supplier");
			String typeCode = (String) page.getSearchConditions().get(
					"typeCode");
			// 查询关键字
			String keyword = (String) page.getSearchConditions().get("keyword");
			// 构建查询条件
			ArticleExample example = new ArticleExample();
			Criteria criteria = example.createCriteria();
			if (title != null) {
				criteria.andTitleLike("%" + title + "%");
			}
			if (supplier != null) {
				criteria.andSupplierLike("%" + supplier + "%");
			}
			if (typeCode != null) {
				criteria.andTypeCodeLike(typeCode + "%");
			}

			if (keyword != null) {
				// 如果关键字不为空，添加各种字符串的搜索条件
				// 商品名称的搜索，前后模糊
				Criteria likeCriteria = example.createCriteria();
				likeCriteria.andTitleLike("%" + keyword + "%");
				example.like(likeCriteria);
				// 供应商，后模糊
				likeCriteria = example.createCriteria();
				likeCriteria.andSupplierLike(keyword + "%");
				example.like(likeCriteria);
				// 商品描述，前后模糊
				likeCriteria = example.createCriteria();
				likeCriteria.andDescriptionLike("%" + keyword + "%");
				example.like(likeCriteria);
			}

			// 只查询未被禁用的商品
			criteria.andDisabledEqualTo(Boolean.FALSE);

			// 一定要在查询总记录数之前构建好查询条件，因为查询总记录数也是要查询条件的
			int rowsCount = articleMapper.countByExample(example);
			// 构建分页参数
			page.setRowsCount(rowsCount);
			example.setPage(page);
			// 使用查询条件查询符合的商品列表
			List<Article> list = articleMapper.selectByExample(example);
			return list;
		} finally {
			// 关闭会话
		}
	}

	public boolean add(Article article) {
		// 获取数据库会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			ArticleMapper articleMapper = sqlSession
					.getMapper(ArticleMapper.class);
			articleMapper.insert(article);
			// 提交事务
			sqlSession.commit();
			return true;
		} finally {
		}
	}

	/**
	 * 根据ID查询商品的详细信息
	 * 
	 * @param id
	 */
	public Article getById(Integer id) {
		// 获取数据库会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			ArticleMapper articleMapper = sqlSession
					.getMapper(ArticleMapper.class);
			Article article = articleMapper.selectByPrimaryKey(id);
			return article;
		} finally {
		}
	}

	/**
	 * 更新商品信息
	 * 
	 * @param article
	 * @return
	 */
	public boolean update(Article article) {
		// 获取数据库会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			ArticleMapper articleMapper = sqlSession
					.getMapper(ArticleMapper.class);
			articleMapper.updateByPrimaryKey(article);
			// 提交事务
			sqlSession.commit();
			return true;
		} finally {
		}
	}

	/**
	 * 根据主键删除商品记录
	 * 
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id) {
		// 获取数据库会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			ArticleMapper articleMapper = sqlSession
					.getMapper(ArticleMapper.class);
			// 构建根据主键更新数据的条件
			Article article = new Article();
			article.setId(id);
			article.setDisabled(Boolean.TRUE);

			// 调用接口进行更新数据
			articleMapper.updateByPrimaryKey(article);
			// 提交事务
			sqlSession.commit();
			return true;
		} finally {
		}
	}
}
