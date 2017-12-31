<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-subset</title>
</head>
<body>
 <br>subset 获取子集合<br>
     <br>获取子集合在subset内部直接使用<br>
     <s:subset source="{'a','b','c','d','1','2','3','4'}" start="4" count="2">
      	<!-- 内部迭代 -->
      <s:iterator var="s">
        <s:property value="#s"/>
      </s:iterator>
     </s:subset>
     <hr color="red">
     <br>获取子集合在subset外部使用需要添加var属性设置一个变量名，然后在外面使用iterator进行迭代操作<br>
   <s:subset source="{'a','b','c','d','1','2','3','4'}" 
   start="4" count="2" var="subs"/>
    <!-- 外部迭代 -->
     <s:iterator value="#attr.subs" var="s">
      <br><s:property value="#s"/>
     </s:iterator>  
</body>
</html>