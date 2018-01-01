<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--商品类型</title>
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
						<form action="${pageContext.request.contextPath }/admin/articleType?method=list" method="POST">
							 一级类型：
							<select name="searchCode">
								<option value="">-- 请选择 --</option>
								<c:forEach items="${topArticleTypeList }" var="type">
									<option value="${type.code }" <c:if test="${searchCode eq type.code }">selected="selected"</c:if>>${type.name }</option>
								</c:forEach>
							</select>
						    <input type="submit" value="查询"/> &nbsp;
						    <a href="${pageContext.request.contextPath }/admin/articleType?method=beforAdd">添加</a>
						</form>
						<table width="100%">
							<thead>
								<tr>
									<th>类型编号</th>
									<th>类型名称</th>
									<th>备注</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${articleTypeList }" var="type">
									<tr>
										<td><c:out value="${type.code }"></c:out></td>
										<td><c:out value="${type.name }"></c:out></td>
										<td><c:out value="${type.remark }"></c:out></td>
										<td>
											<a href="${pageContext.request.contextPath }/admin/articleType?method=detail&code=${type.code }">修改</a> &nbsp;
											<a href="${pageContext.request.contextPath }/admin/articleType?method=delete&code=${type.code }" onclick="return confirm('确定要删除 ${type.name } 吗？');">删除</a>
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