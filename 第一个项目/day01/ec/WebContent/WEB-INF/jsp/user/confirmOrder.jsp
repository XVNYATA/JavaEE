<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>购物商城--确认订单</title>
	<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<!-- main.css是网站前台主要的CSS -->
	<link rel=stylesheet type=text/css href="<c:url value='/css/main.css'/>" />
	<link type="text/css" href="${pageContext.request.contextPath }/css/ui-lightness/jquery-ui-1.8.20.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
	<!-- header部分 -->
	<script type="text/javascript" src="<c:url value='/js/header.js'/>"></script>
	<script type="text/javascript">
		function submitOrder(){
			document.location.href="${pageContext.request.contextPath }/user/order?method=save";
		}
	</script>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/common/banner.jsp"></jsp:include>

	<!-- middle part -->
	<div style="positon: relative; width: 960px;margin: 0px auto;">
		<div class="shoppingcart_wrapper" id="shoppingcart">
	        <p style="text-align:left;">
	        	<span id="shoppingcart_dd" style="font-size:13px;line-height:28px;">
	        	当前位置&nbsp;&gt;&gt;&nbsp;确认订单
	        	 </span>
	        </p>
	        
	        <!--收货人地址开始-->
			<div id="part_consignee">
				<div class="o_write">
					<h1>收货人信息&nbsp;
						<span style="display: none"><a href="javascript:void(0);" style="color: rgb(255, 102, 0);">[创建一个新地址]</a></span>
					</h1>
					<div class="middle">
						<div id="consignee_addr">
							<table border="0" cellspacing="0" width="100%">
								<tbody>
									<tr>
										<td align="right" valign="middle" width="85">
											<font color="red">*</font>收货人姓名：</td>
										<td align="left" valign="middle">
											${loginUser.name }
										</td>
									</tr>
									<tr>
										<td align="right" valign="middle"><font color="red">*</font>地址：</td>
										<td align="left" valign="middle">
										<span id="consigneeShow_addressName"></span> 
											${loginUser.address }
										</td>
									</tr>
									<tr>
										<td align="right" valign="middle"><font color="red">*</font>电话号码：</td>
										<td align="left" valign="middle">
											${loginUser.phone }
										</td>
									</tr>
									<tr>
										<td align="right" valign="middle">电子邮件：</td>
										<td align="left" valign="middle">
											${loginUser.email }">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--收货人地址结束,支付方式及配送方式开始-->
			<div id="part_payTypeAndShipType">
				<div class="o_show">
					<h1>支付及配送方式&nbsp;</h1>
					<div id="updateInfo_payType"></div>
					<div class="middle">
						<table style="width: 100%;">
							<tbody>
								<tr>
									<td style="text-align: right; width: 80px;">支付方式：</td>
									<td>在线支付</td>
								</tr>
								<tr style="">
									<td style="text-align: right;">配送方式：</td>
									<td>快递运输</td>
								</tr>
								<tr style="">
									<td style="text-align: right;">运 费：</td>
									<td>0.00元<span style="color: red">(免运费)</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="footer"></div>
				</div>
			</div>
			<!--支付方式及配送方式结束-->
	        
	        <ul class="shoppingcart_subject" id="ui_shoppingcart_title">
	            <li class="row1">商品名称</li>
	            <li class="row2">积分</li>
	            <li class="row3">疯狂价</li>
	            <li class="row4">小计</li>
	            <li class="row5">数量</li>
	            <li class="row6"></li>
	        </ul>

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
						${orderItem.orderNum}
					</li>
					<li class="row66">
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
	        </div>
	       
	       <div id="ware_info">
				<div style="background: #fff; font-size: 14px; font-weight: bold; padding-left: 2px;">结算信息</div>
				<h1></h1>
				<div class="middle">
					<!--订单信息-->
					<ul id="part_info">
						<li class="info1" style="padding-bottom: 5px">商品金额：
							<fmt:formatNumber value="${shoppingCar.totalAmount}" pattern="#,#00.0#"/>元 +
							运费：0.00元 - 优惠券：
							<span id="price_coupon">0.00</span>元 - 礼品卡： 
							<span id="price_coupon">0.00</span>元 - 返现：0.00元 
							<input id="txtIsUseMoney" value="0" type="hidden"> <br>
						</li>
						<li class="info2" style="width: 100%; overflow: hidden;">
							<table style="width: 100%;" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td></td>
										<td style="text-align: right; font-size: 15px;">
											<b>应付总额：
												<font color="red">
													￥<fmt:formatNumber value="${shoppingCar.totalAmount}" pattern="#,#00.0#"/>
												</font> 元
											</b>
											<div id="paypassword_panel"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
					</ul>
				</div>
			</div>
			<div align="right" id="div_total" style="display: block;clear:both;">
	            <p>
	                <a href="javascript:void(0)" class="clearing" title="提交订单" onclick="submitOrder();">
	                	<img alt="" src="${pageContext.request.contextPath }/images/submit.jpg">
	                </a>
	            </p>
	        </div>
      	</div>
	</div>
	<!---- middle end----->
	
	<!--bottom part-->
	<div style="width: 1060px;margin: 0px auto;">
  		<img src="${pageContext.request.contextPath }/images/step.jpg"/>
  	</div>
</body>
</html>