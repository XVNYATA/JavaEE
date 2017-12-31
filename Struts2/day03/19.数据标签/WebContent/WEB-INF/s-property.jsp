<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-property标签</title>
</head>
<body>
 set标签用于设置一个新变量,并将新变量放入指定的作用域中<br>
    <s:set var="fk" value=" 'hi fkjava' " scope="request"/>
 通过属性获得:#attr.fk----
     <s:property value="#attr.fk"/><br>
 通过指定范围获得:#request.fk----
     <s:property value="#request.fk"/><br>
     <br>
</body>
</html>