<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单文件上传</title>
</head>
<body>
<h3>单文件上传</h3>
<br>
<s:form action="upload" method="post" enctype="multipart/form-data">
	<s:textfield name="remark" label="文件描述"/>
	<s:file name="pic" label="请选择上传文件"/>
	<s:submit value="上传"/>
</s:form>
</body>
</html>