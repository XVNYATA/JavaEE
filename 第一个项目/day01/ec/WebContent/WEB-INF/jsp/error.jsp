<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>疯狂购物商城</title>
	<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<!-- main.css是网站前台主要的CSS -->
	<link rel=stylesheet type=text/css href="<c:url value='/css/main.css'/>" />
	<!-- 使用jQuery-UI的样式来设置tab页 -->
	<link type="text/css" href="${pageContext.request.contextPath }/css/ui-lightness/jquery-ui-1.8.20.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
	<!-- header部分 -->
	<script type="text/javascript" src="<c:url value='/js/header.js'/>"></script>
	<script type="text/javascript">
	if (window.location != parent.window.location){
		parent.window.location = window.location;
	}
	window.onload = function(){
		/** tabs标签页 */
		$('#tabs').tabs();
		
		/** 分页标签  */
		fkjava.pager("pager", {pageIndex : "1",
				pageSize : "8",
				pageCount : "30",
				submitUrl : '/fk_ec/index.action?pageIndex={0}&typecode=0001&keyword='});	
		
		/** 获取所有的li为特定的li绑定事件 */
		var arrays = document.getElementsByTagName("li");
		for (var i = 0; i < arrays.length; i++){
			if (arrays[i].id != "" && arrays[i].id.indexOf('selbgc1') == 0){
				arrays[i].onmouseover = function(){
					this.className = "selbgc1";
				};
				arrays[i].onmouseout = function(){
					this.className = "";
				};
			}
		}
		/** 设置选的下拉列表选项 */
		var select = document.getElementById("typecode");
		for (var i = 0; i < select.options.length; i++){
			var typecode = "0001";
			if (select.options[i].value == typecode){
				select.options[i].selected = true;
			}
		}
	};
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/banner.jsp"></jsp:include>
	<!-- middle part -->
	<div style="positon: relative; width: 960px;margin: 0px auto;">
		<!-- 左边商品类型列表 -->
		<jsp:include page="/WEB-INF/jsp/common/left-menu.jsp"></jsp:include>
		<!-- 右边对应商品列表 -->
		<div style="float:left;width:750px;text-align:center;">
			${tip }
		</div>
	</div>
	<!---- middle end----->

	<!--bottom part-->
	<div style="width: 1060px;margin: 0px auto;">
  		<img src="images/step.jpg"/>
  	</div>
</body>
</html>