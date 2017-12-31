<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- <!-- 导入c 标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<!-- 引用项目中 common.jsp 文件 -->
<%@ include file="/WEB-INF/jsp/common.jsp"%>
</head>
<body>
	<center>
		<h2>
			热烈欢迎[ <font color="red">${sessionScope.session_user.username}</font>]登录
		</h2>
		<a href="${prc}/logout.action">退出</a>
		<table>
			<tr>
				<th>封面</th>
				<th>书名</th>
				<th>作者</th>
				<th>价格</th>
				<th>操作</th>
			</tr>

			<c:forEach items="${bookList}" var="book">
				<tr>
					<td><a
						href="${prc}/view.action?id=${book.id}">
							<img src="${prc}/image/${book.image}"
							style="width: 250px; height: 250px" />
					</a></td>
					<td>${book.name}</td>
					<td>${book.author}</td>
					<td>${book.price}</td>
					<td>
						<a href="${prc}/view.action?id=${book.id}">查看</a>
						<a href="${prc}/deleteBook.action?id=${book.id}">删除</a>
					</td>
				</tr>
			</c:forEach>

		</table>
	</center>
</body>
</html>