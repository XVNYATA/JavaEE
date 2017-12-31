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
<!-- 添加图书 -->
<s:form action="addBook" method="post">
	<s:textfield name="book.name" label="书名"/>
	<s:textfield name="book.author" label="作者"/>
	<s:textfield name="book.price" label="价格"/>
	<s:submit value="提交"/>
</s:form>
</body>
</html>