<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-append</title>
</head>
<body>
集合合并标签 append<br>
<!-- 合并两个集合，并取名newList，放入Stack Context -->
  <s:append var="newList">
    <s:param value="{'a','b','c','d'}"/>
    <s:param value="{1,2,3,4,'a'}"/>
  </s:append>
  迭代<br>
  <s:iterator value="#newList" var="cur">
    <s:property value="#cur"/><br/>
  </s:iterator>
  <hr>
   迭代<br>
  <s:iterator value="#newList" var="cur">
    <s:property value="#cur"/><br/>
  </s:iterator>
</body>
</html>