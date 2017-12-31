<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
调用第一个Action，并将结果包含到本页面中<br>
<s:action name="tag1" executeResult="true"/>
<hr>
调用第二个Action，并将结果包含到本页面中<br>
但阻止本页面请求参数传入<br>
<s:action name="tag2" executeResult="true" ignoreContextParams="true"/>
<hr>
调用第三个Action，且并不将结果包含到本页面中<br>
<s:action name="tag2" executeResult="false"/>
本页面是否可访问?<s:property value="author"/>
</body>
</html>