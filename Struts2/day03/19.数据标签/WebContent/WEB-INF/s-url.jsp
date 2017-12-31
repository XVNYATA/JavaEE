<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-url标签</title>
</head>
<body>
 url标签 生成URL地址,可以通过param标签传递请求参数 <br>
    <s:url value="Success.jsp" var="myUrl">
     <s:param name="name">FKjava</s:param>
    </s:url>
    <a href="<s:property value='#myUrl'/>">url标签带参数测试</a>
</body>
</html>