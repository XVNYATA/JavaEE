<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s:action标签</title>
</head>
<body>
 <br>push标签 将某个值置于值栈的顶部,标签结束后,将从值栈中移除.<br>
    <s:push value="'hello fkjava'">
     <font color="red"><s:property/></font>
    </s:push>
    <br>


<s:debug></s:debug>
</body>
</html>