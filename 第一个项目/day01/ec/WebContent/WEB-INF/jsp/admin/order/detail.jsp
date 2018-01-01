<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--订单详情</title>
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>" type="text/css" />
<style type="text/css">
*{margin:0;padding:0;}
#banner-td{margin:0px 0px 0px 0px;background: url(<c:url value="/images/header.gif"/>) repeat-x top right;font-size:14px;}
#left-menu-td{background-color:#C0DFFD;font-size:14px;text-align:center;}
#content-td{margin:0px 0px 0px 0px;background-color:#fff;}
</style>
</head>
<body>
	<table width="100%" style="padding:0px;">
		<tr>
			<td id="banner-td">
			<!-- 横幅开始 -->
			<jsp:include page="/WEB-INF/jsp/admin/banner.jsp"></jsp:include>
			<!-- 横幅结束 -->
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td id="left-menu-td" width="15%" valign="top">
						<!-- 左侧菜单开始 -->
						<jsp:include page="/WEB-INF/jsp/admin/left-menu.jsp"></jsp:include>
						<!-- 左侧菜单结束 -->
						</td>
						<td valign="top">
						<!-- 内容开始 -->
						<table width="100%">
							<tr>
								<td>订单号</td>
								<td>${order.orderCode }</td>
								<td>下单时间</td>
								<td><fmt:formatDate value='${order.createDate }' pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>用户</td>
								<td>${order.user.name }(${order.user.loginName })</td>
								<td>总价</td>
								<td>${order.amount }</td>
								<td>状态</td>
								<td>
									<c:if test="${order.status eq 0}">新订单</c:if>
									<c:if test="${order.status eq 1}">已发货</c:if>
								</td>
							</tr>
						</table>
						<div align="right">
						&nbsp;
							<c:if test="${order.status eq 0}">
							<button onclick="document.location.href='${pageContext.request.contextPath }/admin/order?method=send&id=${order.id }'">发货</button>
							</c:if>
						</div>
						<table width="100%">
							<tr>
								<th>名称</th>
								<th>供应商</th>
								<th>价格</th>
								<th>数量</th>
							</tr>
							<c:forEach items="${order.orderItemList }" var="orderItem">
								<tr>
									<td>${orderItem.article.title }</td>
									<td>${orderItem.article.supplier }</td>
									<td>${orderItem.article.price }</td>
									<td>${orderItem.orderNum }</td>
								</tr>
							</c:forEach>
						</table>
						
						<!-- 内容结束 -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>