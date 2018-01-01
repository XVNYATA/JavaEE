<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--header begin-->
<div id="shortcut">
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		header("${loginUser.name}");
	</script>
	﻿
	<div class="nav">
		<div class="w960 center">
			<ul>
				<li><a title="首页" href="${pageContext.request.contextPath }">首页</a></li>
				<!-- 一级类型 -->
				<c:forEach items="${articleTypeList }" var="articleType">
					<li><a title="首页" href="${pageContext.request.contextPath }/index?typeCode=${articleType.code}">${articleType.name }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<!--header end-->