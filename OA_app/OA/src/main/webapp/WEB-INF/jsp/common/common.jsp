<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fk" uri="/fk-page/j1604"%>

<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<!-- 引入项目公共的js文件 -->
<script type="text/javascript" src="${ctx}/js/common.js"></script>


<!--    引入jqueryEasyUi样式以及js文件 -->
   	<link rel="stylesheet" type="text/css" href="${ctx}/js/jqueryEasyUi/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jqueryEasyUi/themes/icon.css">
	<script type="text/javascript" src="${ctx}/js/jqueryEasyUi/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jqueryEasyUi/locale/easyui-lang-zh_CN.js"></script>