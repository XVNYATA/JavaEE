<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-bean标签</title>
</head>
<body>
<!-- 创建一个User对象，并且给loginname赋值jack -->
<s:bean name="org.fkjava.bean.User" var="user">
<s:param name="loginname">jack</s:param>
<s:param name="password">123456</s:param>
</s:bean>
<s:property value="#user.loginname"/>

</body>
</html>