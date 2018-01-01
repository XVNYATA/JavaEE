<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="admin_memu">
	<ul id="nav">
		<li><a href="javascript:void(0);" style="text-align: center;"
			onclick="c" class="parent" id="1"><strong><font
					color="blue">商城后台管理</font></strong></a>
			<ul id="opt_1" class="child_area">
				<li class="last"><a href="${pageContext.request.contextPath }/admin/user?method=list">用户管理</a></li>
				<li class="last"><a href="${pageContext.request.contextPath }/admin/articleType?method=list">商品类型管理</a></li>
				<li class="last"><a
					href="${pageContext.request.contextPath }/admin/article?method=list">商品管理</a></li>
				<li class="last"><a
					href="${pageContext.request.contextPath }/admin/order?method=list">订单管理</a></li>
				<li class="last"><a href="<c:url value='/logout.action'/>">安全退出</a></li>
			</ul></li>
	</ul>
</div>