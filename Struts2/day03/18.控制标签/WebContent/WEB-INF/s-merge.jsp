<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-merge</title>
</head>
<body>
<!-- 
	s:append 是合并集合，追加到末尾 广度合并
	s:merge 是合并集合，内部排序  深度合并
 -->
  <s:merge var="newList">
    <s:param value="{'a','b','c','d'}"/>
    <s:param value="{1,2,3,4}"/>
  </s:merge>
  合并<br>
<s:iterator value="#newList" var="myItem">
	<li><s:property value="#myItem"/></li>
</s:iterator>
<hr>
  合并<br>
<s:iterator value="#newList" var="myItem">
	<li><s:property value="#myItem"/></li>
</s:iterator>
</body>
</html>