package org.fkjava.j1303.ec.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.j1303.ec.common.MyBatisSessionFactory;
import org.fkjava.j1303.ec.entity.mapper.ArticleMapper;
import org.fkjava.j1303.ec.entity.mapper.ArticleTypeMapper;
import org.fkjava.j1303.ec.entity.model.Article;
import org.fkjava.j1303.ec.entity.model.ArticleExample;
import org.fkjava.j1303.ec.entity.model.ArticleType;
import org.fkjava.j1303.ec.entity.model.ArticleTypeExample;
import org.fkjava.j1303.ec.entity.model.ArticleTypeExample.Criteria;

/**
 * 商品类型管理服务
 * 
 * @author lwq
 * 
 */
public class ArticleTypeService {

	private static ArticleTypeService articleTypeService = new ArticleTypeService();
	/**
	 * 主键的长度
	 */
	public static final int CODE_LENGTH = 4;

	/**
	 * 使用单例模式，禁止外部初始化实例，只能通过getArticleTypeService()方法获取。
	 */
	private ArticleTypeService() {
	}

	public static ArticleTypeService getArticleTypeService() {
		return ArticleTypeService.articleTypeService;
	}

	/**
	 * 查询商品类型列表
	 * 
	 * @return
	 */
	public List<ArticleType> list(String code) {
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			ArticleTypeMapper articleTypeMapper = sqlSession
					.getMapper(ArticleTypeMapper.class);

			// 构建查询条件
			ArticleTypeExample example = new ArticleTypeExample();
			Criteria criteria = example.createCriteria();
			if (code != null) {
				// 模糊匹配上级类型，把所有它的子类型均like出来
				criteria.andCodeLike(code + "%");
			}

			List<ArticleType> typeList = articleTypeMapper
					.selectByExample(example);
			return typeList;
		} finally {
		}
	}

	/**
	 * 查询顶级(一级)的类型列表
	 * 
	 * @return
	 */
	public List<ArticleType> topArticleTypeList() {
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			ArticleTypeMapper articleTypeMapper = sqlSession
					.getMapper(ArticleTypeMapper.class);
			// 构建查询条件
			ArticleTypeExample example = new ArticleTypeExample();
			Criteria criteria = example.createCriteria();
			// 查询CODE的长度等于4的商品类型
			criteria.andCodeLength(CODE_LENGTH);

			// 使用查询条件进行查询
			List<ArticleType> typeList = articleTypeMapper
					.selectByExample(example);
			return typeList;
		} finally {
		}
	}

	/**
	 * 添加一个新的商品类型到数据库。如果传入的商品类型的code不为空，把该值昨晚新的商品类型的父类型。
	 * 
	 * @param type
	 */
	public boolean add(ArticleType type) {
		// 建立数据库会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			ArticleTypeMapper articleTypeMapper = sqlSession
					.getMapper(ArticleTypeMapper.class);

			// 1.生成类型ID
			// 1.1.上级的CODE,如果parentCode是空的,表示它是一级类型
			String parentCode = type.getCode();

			// 1.2.检查CODE的长度，基本长度是@{CODE_LENGTH}
			int codeLength = CODE_LENGTH;
			if (parentCode != null) {
				codeLength = parentCode.length() + codeLength;
			}
			String maxCode = articleTypeMapper.getMaxCode(parentCode,
					codeLength);
			if (maxCode == null || maxCode.length() < codeLength) {
				// 1.3.数据库是空的，或者长度不够的时候，使用0补齐
				// 在这里是后面补0,主要是如果新增一个新的子类型的时候,maxCode是父类型的CODE,所以要后面加上0,才能得到新的子类型CODE段
				int start = maxCode == null ? 0 : maxCode.length();
				for (int i = start; i < codeLength; i++) {
					maxCode = maxCode + "0";
				}
			}
			int code = Integer.parseInt(maxCode);
			code = code + 1;
			maxCode = String.valueOf(code);

			// 1.4.字符串转换成数字以后，前面的0会丢失掉，再转换成字符串以后，需要把前面丢失的0补上。
			if (maxCode.length() < codeLength) {
				int length = codeLength - maxCode.length();
				for (int i = 0; i < length; i++) {
					maxCode = "0" + maxCode;
				}
			}
			type.setCode(maxCode);

			// 2.修改子类型的名称属性
			modifyName(type);
			// 3.检查类型是否已经存在
			boolean isExists = this.isExists(type);

			if (!isExists) {// 无同名的商品类型
				// 4.插入数据
				articleTypeMapper.insert(type);
				// 5.提交事务
				sqlSession.commit();
				return true;
			} else {// 有同名的商品类型

			}

		} finally {
			// 关闭数据库会话
		}
		return false;
	}

	/**
	 * 删除商品类型
	 * 
	 * @param code
	 * @return
	 */
	public boolean delete(String code) {
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 商品类型查询接口
			ArticleTypeMapper articleTypeMapper = sqlSession
					.getMapper(ArticleTypeMapper.class);
			// 商品查询接口
			ArticleMapper articleMapper = sqlSession
					.getMapper(ArticleMapper.class);
			// 构建商品查询条件
			ArticleExample example = new ArticleExample();
			example.createCriteria().andTypeCodeLike(code + "%");
			List<Article> articleList = articleMapper.selectByExample(example);
			if (articleList.isEmpty()) {
				// 类型及其子类型未被使用，可以删除
				// 构建删除条件
				ArticleTypeExample articleTypeExample = new ArticleTypeExample();
				articleTypeExample.createCriteria().andCodeLike(code + "%");
				// 根据条件，删除类型及其子类型
				articleTypeMapper.deleteByExample(articleTypeExample);
				// 提交事务
				sqlSession.commit();
				return true;
			} else {
				// 类型或者子类型已经被使用，不能删除
			}
		} finally {
		}
		return false;
	}

	/**
	 * 根据商品类型的ID获取商品类型
	 * 
	 * @param code
	 * @return
	 */
	public ArticleType getByCode(String code) {
		// 获取会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取操作接口
			ArticleTypeMapper articleTypeMapper = sqlSession
					.getMapper(ArticleTypeMapper.class);
			// 根据主键查询商品类型
			ArticleType articleType = articleTypeMapper
					.selectByPrimaryKey(code);
			return articleType;
		} finally {
			// 关闭会话
		}
	}

	/**
	 * 更新和修改,都需要使用同样的方法进行修饰
	 * 
	 * @param type
	 */
	private void modifyName(ArticleType type) {
		// 在子类型名称的前面,加上-用于区分
		if (type.getCode().length() > CODE_LENGTH) {
			// CODE的长度大于CODE_LENGTH,表示子类型
			int prefixLength = type.getCode().length() - CODE_LENGTH;
			String name = type.getName();
			for (int i = 0; i < prefixLength; i++) {
				name = "-" + name;
			}
			type.setName(name);
		}
	}

	/**
	 * 检查是否有重复的商品类型
	 * 
	 * @param type
	 * @return 如果有重复,返回true;否则返回false.返回false的时候可以添加
	 */
	private boolean isExists(ArticleType type) {
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		// 获取操作接口
		ArticleTypeMapper articleTypeMapper = sqlSession
				.getMapper(ArticleTypeMapper.class);
		// 检查类型是否已经存在
		ArticleTypeExample ckeckExample = new ArticleTypeExample();
		// ..构建检查条件
		Criteria criteria = ckeckExample.createCriteria();
		criteria.andNameEqualTo(type.getName());
		// 如果CODE不为空,检查的时候要把这个CODE排出在外
		if (type.getCode() != null) {
			criteria.andCodeNotEqualTo(type.getCode());
		}

		List<ArticleType> typeList = articleTypeMapper
				.selectByExample(ckeckExample);

		if (typeList.isEmpty()) {
			// 没有根据名称查询到有商品类型,表示该名称不重复
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 更新数据
	 * 
	 * @param articleType
	 */
	public boolean update(ArticleType articleType) {
		// 获取会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取操作接口
			ArticleTypeMapper articleTypeMapper = sqlSession
					.getMapper(ArticleTypeMapper.class);
			// 修饰子类型名称
			this.modifyName(articleType);
			// 判断名称是否重复
			boolean isExists = this.isExists(articleType);
			if (!isExists) {// 不重复,才把名称修改进去
				// 根据主键更新数据
				articleTypeMapper.updateByPrimaryKey(articleType);
				// 提交事务
				sqlSession.commit();

				return true;
			} else {
				// 否则不修改
			}
		} finally {
			// 关闭会话
		}
		return false;
	}
}
