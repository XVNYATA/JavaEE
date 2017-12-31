<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-date标签</title>
</head>
<body>
date标签格式化日期并输出<br>
    <%
  request.setAttribute("now",new java.util.Date());
    %>
    <s:date name="#request.now" format="yyyy年MM月dd日 HH时mm分ss秒"/>
</body>
</html>