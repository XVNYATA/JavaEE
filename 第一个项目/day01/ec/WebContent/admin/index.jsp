<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--首页</title>
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
						<td>
						<!-- 内容开始 -->
						<div style="width:100%;height:20px;background-color:#eee;margin-bottom:10px;"></div>
					    <div align="center">
							<fieldset style="width:500px;">
								<table width="450" align="center" style="font-size:14px;">
									<tr align="left">
										<td>用&nbsp;户：</td>
										<td>${loginUser.name }</td>
									</tr>
									<tr align="left">
										<td>性&nbsp;别：</td>
										<td>
											<c:choose>
											<c:when test="${loginUser.sex eq 1}">男</c:when>
											<c:when test="${loginUser.sex eq 2}">女</c:when>
											</c:choose>
										</td>
									</tr>
									<tr align="left">
										<td>手&nbsp;机：</td>
										<td>${loginUser.phone }</td>
									</tr>
									<tr align="left">
										<td>邮&nbsp;件：</td>
										<td>${loginUser.email }</td>
									</tr>
									<tr align="left">
										<td>地&nbsp;址：</td>
										<td>${loginUser.address }</td>
									</tr>
									<tr align="left">
										<td>注册时间：</td>
										<td>
										<fmt:formatDate value="${loginUser.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
									</tr>
								</table>
							</fieldset>
						</div>
						<!-- 内容结束 -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>