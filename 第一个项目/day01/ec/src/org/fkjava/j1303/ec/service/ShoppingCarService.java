package org.fkjava.j1303.ec.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.fkjava.j1303.ec.entity.model.Article;
import org.fkjava.j1303.ec.entity.model.OrderItem;

/**
 * 购物车服务，用于临时保存用户的一些操作。比如选购商品等
 * 
 * @author lwq
 * 
 */
public class ShoppingCarService {

	private static ShoppingCarService shoppingCarService = new ShoppingCarService();

	private ShoppingCarService() {
	}

	public static ShoppingCarService getShoppingCarService() {
		return shoppingCarService;
	}

	/**
	 * 获取用户的购物车，如果没有则新建一个
	 * 
	 * @param request
	 * @return
	 */
	public synchronized ShoppingCar getShoppingCar(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ShoppingCar shoppingCar = (ShoppingCar) session
				.getAttribute("shoppingCar");
		if (shoppingCar == null) {
			shoppingCar = new ShoppingCar();
			session.setAttribute("shoppingCar", shoppingCar);
		}
		return shoppingCar;
	}

	/**
	 * 购物车值对象，用于封装对购物车的操作
	 * 
	 * @author lwq
	 * 
	 */
	public static class ShoppingCar {

		/**
		 * 临时订单条目，保存在会话中的。由于此时还没有订单，所以只是构建订单条目用于方便操作。
		 */
		private final Map<Integer, OrderItem> orderItems = new HashMap<>();

		/**
		 * 计算总数量
		 * 
		 * @return
		 */
		public Integer getTotalNumber() {
			Integer total = 0;
			for (OrderItem orderItem : orderItems.values()) {
				total = total + orderItem.getOrderNum();
			}
			return total;
		}

		/**
		 * 计算总价
		 * 
		 * @return
		 */
		public Double getTotalAmount() {
			Double total = 0.0;
			for (OrderItem orderItem : orderItems.values()) {
				total = total + orderItem.getAmount();
			}
			return total;
		}

		/**
		 * 返回购物车中的全部货物
		 * 
		 * @return
		 */
		public Collection<OrderItem> getOrderItems() {
			return orderItems.values();
		}

		/**
		 * 添加商品到临时订单中。在购物车中，增加或者减少商品的数量，也同样是调用此方法进行的，因为最后一次操作会把前面设置的商品的数量覆盖掉
		 * 
		 * @param articleId
		 *            商品的ID
		 * @param number
		 *            添加的数量
		 */
		public void add(Integer articleId, Integer number) {
			ArticleService articleService = ArticleService.getArticleService();
			Article article = articleService.getById(articleId);
			OrderItem orderItem = null;
			synchronized (orderItems) {
				if (orderItems.containsKey(articleId)) {
					orderItem = orderItems.get(articleId);
				} else {
					orderItem = new OrderItem();
					orderItems.put(articleId, orderItem);
				}
			}
			orderItem.setArticle(article);
			orderItem.setArticleId(articleId);
			orderItem.setOrderNum(number);
		}

		/**
		 * 从购物车中删除一种商品
		 * 
		 * @param articleId
		 */
		public void del(Integer articleId) {
			synchronized (orderItems) {
				orderItems.remove(articleId);
			}
		}
	}
}
