package org.fkjava.j1303.ec.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.j1303.ec.common.DateTimeUtils;
import org.fkjava.j1303.ec.common.MyBatisSessionFactory;
import org.fkjava.j1303.ec.common.Page;
import org.fkjava.j1303.ec.entity.mapper.OrderItemMapper;
import org.fkjava.j1303.ec.entity.mapper.OrderMapper;
import org.fkjava.j1303.ec.entity.model.Article;
import org.fkjava.j1303.ec.entity.model.Order;
import org.fkjava.j1303.ec.entity.model.OrderExample;
import org.fkjava.j1303.ec.entity.model.OrderExample.Criteria;
import org.fkjava.j1303.ec.entity.model.OrderItem;
import org.fkjava.j1303.ec.entity.model.User;

/**
 * 订单服务
 * 
 * @author lwq
 * 
 */
public class OrderService {

	private static OrderService orderService = new OrderService();

	private OrderService() {
	}

	public static OrderService getOrderService() {
		return orderService;
	}

	/**
	 * 查询订单列表
	 * 
	 * @param page
	 */
	public List<Order> list(Page page) {
		try {
			// 构建查询条件
			OrderExample example = new OrderExample();
			example.setPage(page);

			Criteria criteria = example.createCriteria();

			Date orderTimeBegin = (Date) page.getSearchConditions().get(
					"orderTimeBegin");
			Date orderTimeEnd = (Date) page.getSearchConditions().get(
					"orderTimeEnd");
			String loginName = (String) page.getSearchConditions().get(
					"loginName");
			String status = (String) page.getSearchConditions().get("status");

			if (orderTimeBegin != null) {
				// 下单时间大于或等于开始时间
				criteria.andCreateDateGreaterThanOrEqualTo(orderTimeBegin);
			}
			if (orderTimeEnd != null) {
				// 下单时间小于或等于结束时间
				criteria.andCreateDateLessThanOrEqualTo(orderTimeEnd);
			}
			if (loginName != null) {
				// 用户的登录ID只查找全匹配的
				// 根据用户登录ID查询到用户ID
				UserService userService = UserService.getUserService();
				User user = userService.findUserByLoginName(loginName);
				Integer userId = user.getId();
				// 添加用户ID相等的查询条件
				criteria.andUserIdEqualTo(userId);
			}
			if (status != null) {
				criteria.andStatusEqualTo(status);
			}

			SqlSession sqlSession = MyBatisSessionFactory.getSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			// 调用查询接口进行查询
			List<Order> orderList = orderMapper.selectByExample(example);

			for (Order order : orderList) {
				// 需要先调用一下get方法，否则user对象不会被抓取出来，导致页面无法显示
				order.getUser();
			}
			return orderList;
		} finally {
		}
	}

	public void send(Integer id) {
		try {
			// 获取数据库会话
			SqlSession sqlSession = MyBatisSessionFactory.getSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			// 从数据库中查询订单
			Order order = orderMapper.selectByPrimaryKey(id);
			// 修改订单状态
			order.setStatus("1");
			// 设置发货时间
			order.setSendDate(new Date());
			// 更新修改到数据库
			orderMapper.updateByPrimaryKey(order);
			// 提交事务
			sqlSession.commit();
		} finally {
		}
	}

	public Order detail(Integer id) {
		try {
			SqlSession sqlSession = MyBatisSessionFactory.getSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			// 根据主键查询订单
			Order order = orderMapper.selectByPrimaryKey(id);
			// 关联查询下订单的用户
			order.getUser();
			// 关联查询订单条目
			List<OrderItem> items = order.getOrderItemList();
			for (OrderItem item : items) {
				// 关联查询商品
				Article article = item.getArticle();
				// 关联查询商品类型
				article.getArticleType();
			}
			return order;
		} finally {
		}
	}

	public void save(Order order) {
		try {
			// 下单时间
			order.setCreateDate(new Date());
			// 订单状态，新增的订单都是未发货的，即0
			order.setStatus("0");

			SqlSession sqlSession = MyBatisSessionFactory.getSession();
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);

			// 生成订单号
			String orderCode = generatorOrderCode(order.getUser());
			order.setOrderCode(orderCode);

			// 插入订单
			orderMapper.insert(order);

			// insert中配置了useGeneratedKeys="true" keyProperty="id"属性，
			// mybatis会自动把数据库生成的主键设置到实体对象中。
			// 其中useGeneratedKeys表示使用数据库生成的主键
			// keyProperty表示哪个获取到的主键的值，设置到哪个属性中
			Integer orderId = order.getId();

			// 插入订单的详细条目
			OrderItemMapper orderItemMapper = sqlSession
					.getMapper(OrderItemMapper.class);
			for (OrderItem item : order.getOrderItemList()) {
				// 设置条目对应的订单ID
				item.setOrderId(orderId);
				orderItemMapper.insert(item);
			}

			// 提交事务
			sqlSession.commit();
		} finally {
		}
	}

	/** 生成订单号 */
	private String generatorOrderCode(User user) {
		// PO_用户的id_yyyyMMddHHmmss
		return "PO_" + user.getId() + "_"
				+ DateTimeUtils.toString(new Date(), "yyyyMMddHHmmss");
	}
}
