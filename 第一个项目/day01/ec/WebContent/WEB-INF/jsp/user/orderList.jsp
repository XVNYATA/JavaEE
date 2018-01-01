<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>购物商城--我的订单</title>
	<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<!-- main.css是网站前台主要的CSS -->
	<link rel=stylesheet type=text/css href="<c:url value='/css/main.css'/>" />
	<link type="text/css" href="${pageContext.request.contextPath }/css/ui-lightness/jquery-ui-1.8.20.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
	<!-- header部分 -->
	<script type="text/javascript" src="<c:url value='/js/header.js'/>"></script>
	<script type="text/javascript">
		function showDetails(id){
			$("#detail_" + id).toggle();
		}
	</script>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/common/banner.jsp"></jsp:include>

	<!-- middle part -->
	<div style="positon: relative; width: 960px;margin: 0px auto;">
		<div>
	        <p style="text-align:left;">
	        	<span id="shoppingcart_dd" style="font-size:13px;line-height:28px;">
	        	当前位置&nbsp;&gt;&gt;&nbsp;我的订单
	        	 </span>
	        </p>
	     	 <h1 style="font-weight:bold;font-size:12px;">
	     	 <font color="red">${loginUser.name }</font>
	     	 ：您好；您当前共有[${orderList.size() }]个订单：(点击订单可显示该订单下的购物明细)
	     	 </h1>
	        <div style="width:100%;" align="center">
	        	<!-- 
	        	border-collapse:collapse; 表示边框合并在一起。
	        	border-collapse:separate;表示边框之间的间距，间距的大小用border-spacing:px;定义大小。
	        	"border-collapse:separate;border-spacing:0px;" 等效于 "border-collapse:collapse"
	        	 -->
		        <table width="100%" style="border-collapse:separate;border-spacing:0px;">
		        	<thead>
		        		<tr style="background-color:#dff0d8">
		        			<th>订单号</th>
		        			<th>下单时间</th>
		        			<th>发货时间</th>
		        			<th>状态</th>
		        			<th>总金额</th>
		        		</tr>
		        	</thead>
		        	<tbody>
			        	<c:forEach items="${orderList }" var="order">
			        		<tr onmouseover="this.style.backgroundColor='#FFFFB0';" 
			        			onmouseout="this.style.backgroundColor='#FFFFFF';"
			        			style="cursor:pointer;"
			        			onclick="showDetails('${order.orderCode }')">
			        			<td>${order.orderCode }</td>
			        			<td><fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			        			<td><fmt:formatDate value="${order.sendDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			        			<td>
			        				${order.status }
			        			</td>
			        			<td><fmt:formatNumber value="${order.amount }" pattern="#,#00.0#"/></td>
			        		</tr>
			        		<tr id="detail_${order.orderCode }" style="display:none;">
			        			<td colspan="5">
			        				<table style="width:100%;border-collapse:collapse;">
			        					<tr style="background-color:#CCCCCC;border-bottom-style: solid;">
			        						<th>名称</th>
			        						<th>价格</th>
			        						<th>数量</th>
			        					</tr>
			        					<c:forEach items="${order.orderItemList }" var="item">
				        					<tr onmouseover="this.style.backgroundColor='#dff0d8';" 
			        							onmouseout="this.style.backgroundColor='#FFFFFF';"
			        							style="border-bottom-style: solid;">
				        						<td>
				        						<img width="60px" height="60px" src="${pageContext.request.contextPath }/images/article/${item.article.image}"/>
				        						${item.article.title }</td>
				        						<td><fmt:formatNumber value="${item.article.price }" pattern="#,#00.0#"/>
				        						(疯狂价：<fmt:formatNumber value="${item.article.discountPrice }" pattern="#,#00.0#"/>)</td>
				        						<td>${item.orderNum }</td>
				        					</tr>
			        					</c:forEach>
			        				</table>
			        			</td>
			        		</tr>
			        	</c:forEach>
		        	</tbody>
		        </table>
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