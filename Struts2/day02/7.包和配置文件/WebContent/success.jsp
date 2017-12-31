<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
loginname：${requestScope.loginname }<br><br>
password：${requestScope.password }<br><br>
<a href="${pageContext.request.contextPath }/book/main.action">测试命名空间跳转</a>
</body>
</html>