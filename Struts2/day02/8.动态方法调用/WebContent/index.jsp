<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动态方法调用</title>
</head>
<body>
<!-- 第一种方式：配置一个Action，使用actionName!methodName区分 -->
<a href="user!login.action">登录</a><br><br>
<a href="user!register.action">注册</a><br><br>
<a href="user!remove.action">删除</a><br><br>
<a href="user!modify.action">修改</a><br><br>
<hr>
<!-- 第二种方式：使用通配符*，通过表达式{1},{2}区分 -->
<a href="book_login.action">Book登录</a><br><br>
<a href="book_register.action">Book注册</a><br><br>
<a href="book_remove.action">Book删除</a><br><br>
<a href="book_modify.action">Book登录</a><br><br>
<hr>
<!-- 第二种方式：使用通配符*，通过表达式{1},{2}区分 -->
<a href="StudentAction_login.action">Student登录</a><br><br>
<a href="StudentAction_register.action">Student注册</a><br><br>
<a href="StudentAction_remove.action">Student删除</a><br><br>
<a href="StudentAction_modify.action">Student登录</a><br><br>
</body>
</html>