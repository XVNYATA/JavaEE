<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-sort</title>
</head>
<body>
<!--  -->
<s:bean var="nc" name="org.fkjava.util.NameComparator"/>
<s:debug/>
<!-- s:sort将排序的结果push到pageContext，只能使用一次 -->
<s:sort var="newList"
	source="{'疯狂Java' , '轻量级JavaEE'
	, '疯狂Android' , '白骨精'}"
	comparator="#nc"
/>
<s:iterator value="#attr.newList" var="name">
	<s:property value="#name"/><br>
</s:iterator>

</body>
</html>