<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="java.util.Enumeration"%>
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
<!-- 重点：根对象中的数据OGNL可以直接访问，非根对象中的数据OGNL如果要访问需要使用# -->
 <font color="red">访问Value Stack中的数据</font><br>
 EL：${requestScope.user.loginname }<br>
OGNL：<s:property value="user.loginname"/><br>
OGNL：<s:property value="user.password"/><br>
<font color="red">访问request中的数据</font><br>
OGNL：<s:property value="#request.user.loginname"/><br>
OGNL：<s:property value="#request.user.password"/><br>
OGNL：<s:property value="#request.country"/><br>
OGNL：<s:property value="#request['country']"/><br>
OGNL：<s:property value="%{#request.country}"/><br>
OGNL：<s:property value="%{#request['country']}"/><br>
<!-- cuntry只是存储在request中，并没有设置成Action的属性 -->
OGNL：<s:property value="country"/><br>
<font color="red">访问session中的数据</font><br>
EL：${sessionScope.clazz }<br>
OGNL：<s:property value="#session.clazz"/><br>
OGNL：<s:property value="#session['clazz']"/><br>
OGNL：<s:property value="%{#session.clazz}"/><br>
OGNL：<s:property value="%{#session['clazz']}"/><br>
<font color="red">访问application中的数据</font><br>
EL：${application.school }<br>
OGNL：<s:property value="#application.school"/><br>
OGNL：<s:property value="#application['school']"/><br>
OGNL：<s:property value="%{#application.school}"/><br>
OGNL：<s:property value="%{#application['school']}"/><br>
<font color="red">访问parameters中的数据</font><br>
jsp:<%=request.getParameter("sex") %><br>
EL:${param.sex }<br>
OGNL：<s:property value="#parameters.sex"/><br>
<font color="red">访问attr中的数据</font><br>
OGNL：<s:property value="#attr.country"/><br>
OGNL：<s:property value="#attr['clazz']"/><br>
OGNL：<s:property value="%{#attr.school}"/><br>
OGNL：<s:property value="#attr.user.loginname"/><br>
<font color="red">OGNL可以直接创List对象</font><br>
<s:set value="{'a','b','c','d'}" var="mylist"/>
<s:property value="#mylist"/>
<font color="red">OGNL可以直接创Map对象</font><br>
<s:set value="#{'1':'a','2':'b','3':'c','4':'d'}" var="mymap"/>
<s:property value="#mymap"/>

<s:debug/>

</body>
</html>









