<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-generator</title>
</head>
<body>
字符串分割标签 generator<br>
 
  <s:generator separator="," val="'a,b,c,d'" var="cur"/>
  迭代<br>
  <s:iterator value="#cur" var="c">
    <s:property value="#c"/><br/>
  </s:iterator>
<hr>
  迭代<br>
  <s:iterator value="#cur" var="c">
    <s:property value="#c"/><br/>
  </s:iterator>
</body>
</html>