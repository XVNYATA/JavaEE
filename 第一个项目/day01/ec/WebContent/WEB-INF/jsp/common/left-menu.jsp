<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 左边物品类型列表 -->
<div id="booksort" style="float: left; width: 210px;">
	<div class="mt" style="height: 25px; font-size: 14px;">
		<h2>
			<strong>商品分类</strong>
		</h2>
	</div>
	<div class="mc">
		<!-- 一级类型 -->
		<c:forEach items="${articleTypeList }" var="articleType">
			<div class="item">
				<h3>
					<b>&gt;</b><a href="${pageContext.request.contextPath }/index?typeCode=${articleType.code}">· ${articleType.name }</a>
				</h3>
			</div>
		</c:forEach>
	</div>
</div>