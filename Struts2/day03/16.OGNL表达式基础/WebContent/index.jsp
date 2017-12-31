<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
</head>
<body>
	  <h3>用户登陆</h3>
	   	<form action="login.action" method="post">
	   		<table>
	   			<tr>
	   				<td>用户名</td>
	   				<td><input type="text" name="user.loginname"></td>
	   			</tr>
	   			<tr>
	   				<td>密码</td>
	   				<td><input type="password" name="user.password" value="123"></td>
	   			</tr>
	   			<tr>
	   				<td>性别</td>
	   				<td><input type="text" name="sex" ></td>
	   			</tr>
	   			<tr>
	   				<td><input type="submit" name="submit" value="提交">
	   				<input type="reset" name="reset" value="重置"></td>
	   			</tr>
	   		</table>
	   	</form>
  </body>
</html>
