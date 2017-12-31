<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- 引入分页标签 -->
 <%@ taglib prefix="fk"  uri="/fk-1604/page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入分页样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css"/>

<title>Insert title here</title>
</head>
<body>


   <!-- 引入分页标签 
   pageIndex:当前页码
   pageSize：每页显示10条
   recordCount：总记录数
   submitUrl：请求地址
   
   -->
   <fk:page  pageIndex = "${pageIndex}" pageSize="10" recordCount="999" submitUrl="index.action?pageIndex={0}" pageStyle="black-red"></fk:page>
   

</body>
</html>