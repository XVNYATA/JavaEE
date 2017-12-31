<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-if</title>
</head>
<body>
<s:if test="%{false}">
    <div>Will Not Be Executed</div>
</s:if>
<s:elseif test="%{true}">
    <div>Will Be Executed</div>
</s:elseif>
<s:else>
    <div>Will Not Be Executed</div>
</s:else>
<hr color="red">
  if ... elseif ...else   test里面写要判断的条件<br>
  <%
    java.util.Random rand = new java.util.Random();
    int r = rand.nextInt(200);
    System.out.println(r);
    request.setAttribute("number", r);
  %>
  <s:if test="#request.number % 7 == 0">
    恭喜您 ，您中了一等奖!
  </s:if>
  <s:elseif test="#request.number % 5 == 0">
    恭喜您 ，您中了二等奖!
  </s:elseif>
  <s:else>
    谢谢参与！
  </s:else>
<hr color="red">
<%
	request.setAttribute("loginname", "jack");
%>
 <s:if test="#request.loginname  != null">
    <s:property value="#request.loginname"/>
  </s:if>
  <s:else>
    请登录！
  </s:else>
</body>
</html>