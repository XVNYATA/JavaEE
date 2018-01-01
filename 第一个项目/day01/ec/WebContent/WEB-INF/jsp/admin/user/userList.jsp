<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--用户管理</title>
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
						<form action="${pageContext.request.contextPath }/admin/user?method=list" method="POST">
							 姓名：<input type="text" name="name" value="${searchCondition }"/>
						    <input type="submit" value="查询"/>
						</form>
						<table width="100%">
							<thead>
								<tr>
									<th>登录名</th>
									<th>姓名</th>
									<th>性别</th>
									<th>邮件地址</th>
									<th>手机号码</th>
									<th>联系地址</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList }" var="user">
									<tr>
										<td><c:out value="${user.loginName }"></c:out></td>
										<td><c:out value="${user.name }"></c:out></td>
										<td>
											<c:choose>
												<c:when test="${user.sex == 1}">男</c:when>
												<c:otherwise>女</c:otherwise>
											</c:choose>
										</td>
										<td><c:out value="${user.email }"></c:out></td>
										<td><c:out value="${user.phone }"></c:out></td>
										<td><c:out value="${user.address }"></c:out></td>
										<td><a href="${pageContext.request.contextPath }/admin/user?method=detail&userId=${user.id }">修改</a> &nbsp;
											<a href="${pageContext.request.contextPath }/admin/user?method=delete&userId=${user.id }">删除</a>
										</td>
								</tr>
								</c:forEach>
							</tbody>
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