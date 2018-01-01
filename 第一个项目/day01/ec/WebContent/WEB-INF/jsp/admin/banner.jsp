<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div style="float: left; margin: 0px 0px 0px 10px;">
		<h1 style="margin: 2px;">
			<img alt="疯狂java" src="<c:url value="/images/logo.gif"/>">
		</h1>
	</div>
	<div
		style="float: right; text-align: center; margin: 30px 30px 0px 0px; algin: center;">
		<span style="color: white">${loginUser.name }：您好；欢迎登录购物商城管理系统！</span>
	</div>
</div>