<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--修改用户信息</title>
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
						<td valign="middle" align="center">
						<!-- 内容开始 -->
						<fieldset style="width:350px;"><legend>修改用户信息</legend>
						<form action="${pageContext.request.contextPath }/admin/user?method=update" method="post">
						<input type="hidden" name="id" value="${user.id }" />
						<table width="320" style="font-size:12px;">
							<tr>
								<td>登录名</td>
								<td>
									${user.loginName }
								</td>
							</tr>
							<tr>
								<td>姓名</td>
								<td>${user.name }</td>
							</tr>
							<tr>
								<td>角色</td>
								<td>
									<select name="role" id="role">
										<option  value="1" <c:if test="${user.role == 1}">selected="selected"</c:if>>普通用户</option>
										<option value="2" <c:if test="${user.role == 2}">selected="selected"</c:if>>管理员</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>性别</td>
								<td>
									<select name="sex" id="sex">
										<option  value="1" <c:if test="${user.sex == 1}">selected="selected"</c:if>>男</option>
										<option value="2" <c:if test="${user.sex == 2}">selected="selected"</c:if>>女</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>邮件地址</td>
								<td>
									<input name="email" value="${user.email }"/>
								</td>
							</tr>
							<tr>
								<td>联系地址</td>
								<td>
									<input name="address" value="${user.address }"/>
								</td>
							</tr>
							<tr>
								<td>联系电话</td>
								<td>
									<input name="phone" value="${user.phone }"/>
								</td>
							</tr>
							<tr>
								<td>注册时间</td>
								<td>
									<fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<td>是否已禁用</td>
								<td>
									<c:if test="${user.disabled }">是</c:if>
									<c:if test="${!user.disabled }">否</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="保存"/>
									<input type="button" value="返回" onclick="javascript:document.location.href='${pageContext.request.contextPath }/admin/user?method=list'"/>
								</td>
							</tr>
						</table>
						</form>
						</fieldset>
						<!-- 内容结束 -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>