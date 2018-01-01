<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>购物商城--我的购物车</title>
	<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<!-- main.css是网站前台主要的CSS -->
	<link rel=stylesheet type=text/css href="<c:url value='/css/main.css'/>" />
	<link type="text/css" href="${pageContext.request.contextPath }/css/ui-lightness/jquery-ui-1.8.20.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
	<!-- header部分 -->
	<script type="text/javascript" src="<c:url value='/js/header.js'/>"></script>
	<script type="text/javascript">
		//修改数量
		function change(id){
			if(parseInt($('#number_' + id).val()) < 1){
				$('#number_' + id).val(1);
			}
			saveNumber(id);
		}
		//增加一个
		function addOne(id){
			$('#number_' + id).val(parseInt($('#number_' + id).val()) + 1);
			saveNumber(id);
		}
		//减少一个
		function reduceOne(id){
			if(parseInt($('#number_' + id).val()) <= 1){
				$('#number_' + id).val(1);
			}else{
				$('#number_' + id).val(parseInt($('#number_' + id).val()) - 1);
			}
			saveNumber(id);
		}
		//保存新的商品数量到购物车
		function saveNumber(id){
			var number = $('#number_' + id).val();
			$("#changeNumberForm #id").val(id);
			$("#changeNumberForm #buyNum").val(number);
			//提交表单
			$("#changeNumberForm").submit();
		}
	</script>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/common/banner.jsp"></jsp:include>

	<!-- middle part -->
	<div style="positon: relative; width: 960px;margin: 0px auto;">
		<div class="shoppingcart_wrapper" id="shoppingcart">
	        <p style="text-align:left;"><span id="shoppingcart_dd" style="font-size:13px;line-height:28px;">当前位置&nbsp;&gt;&gt;&nbsp;我的购物车 </span></p>
	        <ul class="shoppingcart_subject" id="ui_shoppingcart_title">
	            <li class="row1">商品名称</li>
	            <li class="row2">积分</li>
	            <li class="row3">疯狂价</li>
	            <li class="row4"><span title="在疯狂价基础上再优惠">&nbsp;&nbsp;&nbsp;小计&nbsp;&nbsp;&nbsp;</span></li>
	            <li class="row5">数量</li>
	            <li class="row6">操作</li>
	        </ul>
	        
	        <c:if test="${empty shoppingCar.orderItems }">
	        	<!-- 购物车为空的话 -->
	        	<table align="center">
	        		<tr>
	        			<td><img alt="" src="images/cart_icon.gif"/></td>
	        			<td>
	        				<span style="font-size:14px;font-weight:bold;">
	        					购物车为空，<a href="${pageContext.request.contextPath }">我要去看看&gt;&gt;</a>
	        				</span>
	        			</td>
	        		</tr>
	        	</table>
	        </c:if>
	        <c:if test="${!empty shoppingCar.orderItems }">
	        	<!-- 购物车不为空 -->
	        	<c:forEach items="${shoppingCar.orderItems }" var="orderItem">
				<div class="shoppingcart_promotions_01">
					<ul class="shoppingcart_list">
						<li class="row00">
							<a name="productpic" href="${pageContext.request.contextPath }/item?id=${orderItem.article.id }" title="${orderItem.article.title }">
								<img src="${pageContext.request.contextPath }/images/article/${orderItem.article.image }" width="60xp" height="60xp">
							</a>
						</li>
						<li class="row11">
							<p>
								<span class="name">
									<a name="product"  href="${pageContext.request.contextPath }/item?id=${orderItem.article.id }" title="${orderItem.article.title } ">${orderItem.article.title }</a>
								</span>
							</p>
						</li>
						<li class="row22">0</li>
						<li class="row33"><span>￥<fmt:formatNumber value="${orderItem.article.discountPrice}" pattern="#,#00.0#"/></span>&nbsp;&nbsp;(${orderItem.article.discount }折)</li>
						<li class="row44"><span>￥<fmt:formatNumber value="${orderItem.amount}" pattern="#,#00.0#"/></span></li>
						<li class="row55">
							<input type="text" id="number_${orderItem.article.id }" value="${orderItem.orderNum} " onblur="change('${orderItem.article.id }');">
							<a href="javascript:void(0);" onclick="addOne('${orderItem.article.id }');" title="数量加一" class="add">+</a>
							<a href="javascript:void(0);" onclick="reduceOne('${orderItem.article.id }');" title="数量减一" class="cut">-</a>
						</li>
						<li class="row66">
							<a name="delete" href="${pageContext.request.contextPath }/shoppingCar?method=del&id=${orderItem.article.id }">删除</a>
						</li>
					</ul>
				</div>
	        	</c:forEach>
				
		        <div align="right" id="div_total" style="display: block;clear:both;">
		        	<p style="font-size:14px;font-weight:bold;line-height:31px;">
		        		数量总计：
		            	<span style="color:red;font-size:16px;font-weight:bold;">${shoppingCar.totalNumber }</span>&nbsp;&nbsp;(件)
		        	</p>
		            <p style="font-size:14px;font-weight:bold;line-height:31px;">
		            	金额总计：
		                <span>￥</span>
		                <span style="color:red;font-size:16px;font-weight:bold;">
		                	<fmt:formatNumber value="${shoppingCar.totalAmount}" pattern="#,#00.0#"/>
		                </span>&nbsp;&nbsp;(折后价)
		            </p>
		            <p>
		            	<a href="${pageContext.request.contextPath }" name="goon" class="goon"><img alt="" src="images/shop.jpg"/></a>
		                <a href="${pageContext.request.contextPath }/user/order?method=confirm" class="clearing" title="结算"><img alt="" src="images/balance.jpg"></a>
		            </p>
		        </div>
	       </c:if>
      	</div>
	</div>
	<form id="changeNumberForm" action="${pageContext.request.contextPath }/shoppingCar" method="get">
		<input type="hidden" id="method" name="method" value="add"/>
		<input type="hidden" id="buyNum" name="buyNum"/>
		<input type="hidden" id="id" name="id"/>
	</form>
	<!---- middle end----->
	
	<!--bottom part-->
	<div style="width: 1060px;margin: 0px auto;">
  		<img src="images/step.jpg"/>
  	</div>
</body>
</html>