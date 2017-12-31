<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-set</title>
</head>
<body>
<s:set name="age" value="20" scope="action"/>
<s:property value="#request.age"/>
<s:property value="#attr.age"/>
<s:property value="age"/>
<s:property value="#age"/>
</body>
</html>