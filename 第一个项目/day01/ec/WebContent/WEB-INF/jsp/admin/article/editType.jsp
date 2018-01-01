<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--修改商品类型</title>
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>" type="text/css" />
<style type="text/css">
*{margin:0;padding:0;}
#banner-td{margin:0px 0px 0px 0px;background: url(<c:url value="/images/header.gif"/>) repeat-x top right;font-size:14px;}
#left-menu-td{background-color:#C0DFFD;font-size:14px;text-align:center;}
#content-td{margin:0px 0px 0px 0px;background-color:#fff;}
</style>
</head>
<body style="font-size:13px;">
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
						<td valign="top" align="center">
						<!-- 内容开始 -->
						<fieldset style="width:550px;"><legend>修改商品类型</legend>
						<form action="<c:url value='/admin/articleType?method=update'/>" method="post">
							<input type="hidden" name="code" value="${articleType.code }"/>
							<table width="100%" border="0">
								<tr>
									<td>类型名称</td>
									<td>
										<input type="text" name="name" size="40" value='${fn:replace(articleType.name, "-", "")}' />
									</td>
								</tr>
								<tr>
									<td>类型描述</td>
									<td>
										<textarea rows="5" cols="38" name="remark">${articleType.remark }</textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="submit" value="保存"/>
										<input type="button" value="返回" onclick="javascript:document.location.href='${pageContext.request.contextPath }/admin/articleType?method=list'"/>
									</td>
								</tr>
							</table>
						</form>
						</fieldset>
						<span style="color:red;">${tip }</span>
						<!-- 内容结束 -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>