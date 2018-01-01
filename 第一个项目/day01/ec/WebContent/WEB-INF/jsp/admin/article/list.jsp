<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fktaglib" uri="http://www.fkjava.org/j1303/fktaglib"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--商品管理</title>
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
						<form id="listForm" action="${pageContext.request.contextPath }/admin/article?method=list" method="post">
							名称：<input name="title" size="20" value="${page.searchConditions.title }"/> 
							作者：<input name="supplier" size="20" value="${page.searchConditions.supplier }"/>
							商品类型：
							<select name="typeCode" style="width:150px;">
								<option value="">-- 选择类型 --</option>
								<c:forEach items="${articleTypeList }" var="type">
									<option value="${type.code }" <c:if test="${page.searchConditions.typeCode eq type.code}">selected="selected"</c:if>>${type.name }</option>
								</c:forEach>
							</select>
							<input type="submit" value="查询"/>
							<a href='${pageContext.request.contextPath }/admin/article?method=beforAdd'>新增</a>
							<table>
								<c:forEach items="${articleList }" var="article">
								<tr onmouseover="this.style.backgroundColor='#FFFFB0';" onmouseout="this.style.backgroundColor='#FFFFFF';">
									<td>
										<img alt="封面" src="${pageContext.request.contextPath }/images/article/${article.image }" border="0" height="100" width="90"/>
									</td>
									<td>
										商品类型：${article.articleType.name }<br/><br/>
										${article.title }<br/><br/>
										${article.supplier } / 
										<fmt:formatDate value="${article.putawayDate }" pattern="yyyy-MM-dd"/>/
										${article.locality } 
										<br/><br/>
										售价:${article.price }&nbsp;&nbsp;库存:${article.storage }
										<a href='${pageContext.request.contextPath }/admin/article?method=detail&id=${article.id}'>修改</a>
										<a href='${pageContext.request.contextPath }/admin/article?method=delete&id=${article.id}'>删除</a>
										<br/><br/>
									</td>
								</tr>
								</c:forEach>
							</table>
							<fktaglib:pager formId="listForm"/>
						</form>
						<!-- 内容结束 -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>