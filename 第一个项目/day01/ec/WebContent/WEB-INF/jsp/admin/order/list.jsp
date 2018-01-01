<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--订单列表</title>
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>" type="text/css" />
<link type="text/css" href="<c:url value='/css/ui-lightness/jquery-ui-1.8.20.custom.css'/>" rel="stylesheet" />
<link type="text/css" href="<c:url value='/css/jquery-ui-timepicker-addon.css'/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui-i18n.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui-timepicker-addon.js'/>"></script>
<style type="text/css">
*{margin:0;padding:0;}
#banner-td{margin:0px 0px 0px 0px;background: url(<c:url value="/images/header.gif"/>) repeat-x top right;font-size:14px;}
#left-menu-td{background-color:#C0DFFD;font-size:14px;text-align:center;}
#content-td{margin:0px 0px 0px 0px;background-color:#fff;}
</style>
<script type="text/javascript">
	$(window).ready(function(){
		$("#orderTimeBegin").datetimepicker($.datepicker.regional['zh-CN']);
		$("#orderTimeEnd").datetimepicker($.datepicker.regional['zh-CN']);
	});
	
	//检查时间段是否有效
	//结束时间必须大于开始时间
	function checkTimeRange(){
		var orderTimeBegin = $("#orderTimeBegin").val();
		var orderTimeEnd = $("#orderTimeEnd").val();
		//把字符串转换为时间对象
		orderTimeBegin= new Date(Date.parse(orderTimeBegin.replace(/-/g, "/"))); 
		orderTimeEnd= new Date(Date.parse(orderTimeEnd.replace(/-/g, "/")));
		//Date类型可以直接比较
		if(orderTimeEnd <= orderTimeBegin){
			//如果结束时间小于或者等于开始时间，不允许查询
			alert("结束时间必须大于开始时间！");
			//用法：<input type="submit" value="查询" onclick="return checkTimeRange();"/>
			//返回false，onclick事件就不会继续执行，提交也就不会继续
			return false;
		}
	}
</script>
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
						<form action="${pageContext.request.contextPath }/admin/order?method=list" method="post">
							下单时间段，开始：
							<input name="orderTimeBegin" id="orderTimeBegin" value="<fmt:formatDate value='${page.searchConditions.orderTimeBegin }' pattern='yyyy-MM-dd HH:mm'/>"/>
							结束：
							<input name="orderTimeEnd" id="orderTimeEnd" value="<fmt:formatDate value='${page.searchConditions.orderTimeEnd }' pattern='yyyy-MM-dd HH:mm'/>"/>
							登录ID：<input name="loginName" value="${page.searchConditions.loginName }"/>
							状态：
							<select name="status">
								<option value="">-- 请选择 --</option>
								<option value="0" <c:if test="${page.searchConditions.status eq '0' }">selected="selected"</c:if>>新订单</option>
								<option value="1" <c:if test="${page.searchConditions.status eq '1' }">selected="selected"</c:if>>已发货</option>
							</select>
							<input type="submit" value="查询" onclick="return checkTimeRange();"/>
						</form>
						<table width="100%">
							<thead>
								<tr>
									<th style="width:15%">订单号</th>
									<th style="width:10%">用户</th>
									<th style="width:10%">金额</th>
									<th style="width:15%">下单时间</th>
									<th style="width:15%">发货时间</th>
									<th style="width:10%">状态</th>
									<th style="width:10%">操作</th>
								</tr>
							</thead>
							<c:forEach items="${orderList }" var="order">
								<tr>
									<td>${order.orderCode }</td>
									<td>${order.user.name }(${order.user.loginName })</td>
									<td>${order.amount }</td>
									<td><fmt:formatDate value='${order.createDate }' pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${order.sendDate }</td>
									<td>
										${order.status }
									</td>
									<td>
										<button onclick="document.location.href='${pageContext.request.contextPath }/admin/order?method=send&id=${order.id }'">发货</button>
										<button onclick="document.location.href='${pageContext.request.contextPath }/admin/order?method=detail&id=${order.id }'">详情</button>
									</td>
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