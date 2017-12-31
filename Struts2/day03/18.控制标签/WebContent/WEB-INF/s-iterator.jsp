<%@page import="org.fkjava.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>s-iterator</title>
</head>
<body>
 遍历简单集合<br>
 <!-- value是需要遍历的集合，var是给遍历的元素取一个名词，推入valueStack -->
 <s:iterator value="{'孙悟空','白骨精','猪八戒', '牛魔王'}" var="name">
 	<s:property value="#name"/>
 </s:iterator>
 <br>
 <hr>
<%
	// 模拟Action
	List<String> mylist = new ArrayList<String>();
	mylist.add("周杰伦");
	mylist.add("刘德华");
	mylist.add("周星驰");
	mylist.add("林志玲");
	session.setAttribute("mylist", mylist);
%>
<ul>
<s:iterator value="#session.mylist" var="name">
	<s:property value="#name"/>
</s:iterator>
</ul>
<hr>
<!-- 
s:iterator 中的status 使用方法
1：#status.odd 当前元素索引是否奇数行
2：#status.even 当前元素索引是否偶数行
3：#status.count 当前迭代了几个元素
4：#status.index 当前元素索引，从0开始『#status.count=#status.index+1』
5：#status.first 当前是否第一个元素
6：#status.last 当前是否最后一个元素
7：#status.modules(int) 当前行数取模   
 -->
 <br>获取页面上定义List数据： status表示获得当前循环的状态<br>
<ul>
<s:iterator value="{'中国','美国','英国','法国'}" var="c" status="st">
      <br>-下标index-<s:property value="#st.index"/>
        -是否是第一条数据first-<s:property value="#st.first"/>
        -是否是最后一条数据last-<s:property value="#st.last"/>
        -当前条count-<s:property value="#st.count"/>
        -元素element-<s:property value="#c"/>
     </s:iterator>
</ul>
     <hr>
     <ul>
<s:iterator value='{"孙悟空" , "白骨精" , "猪八戒" , "牛魔王" , "唐僧" , "蜘蛛精"}'
	var="name" begin="2" end="4" status="st">
	<li
	 	<s:if test='#st.odd'>style="background-color:gray"</s:if>
	 >
	 <s:property value="#name"/>
	</li>
</s:iterator>
</ul>
<hr>
<table width="400" border="1">
<s:iterator value='#{"疯狂Java":109 , "轻量级Java":99 , "疯狂android":89}' var="book">
	<tr>
		<!-- 注意：遍历的元素被推入valueStack，同时request也有 -->
		<td>${requestScope.book.key}</td>
		<td><s:property value="#book.value"/></td>
	</tr>
</s:iterator>
</table>
  <hr color="red">
  <%  
    User u1 = new User(1,"tom","18664858738");
    User u2 = new User(2,"tiger","18664858739");
    User u3 = new User(3,"admin","18664858733");
    User u4 = new User(4,"lis","18664858732");
    List<User> userList = new ArrayList<User>();
    userList.add(u1);
    userList.add(u2);
    userList.add(u3);
    userList.add(u4);
    request.setAttribute("userlist", userList);
    pageContext.setAttribute("userlist", userList);
 %>
 <table width="400" border="1">
<s:iterator value="#request.userlist" var="user">
	<tr>
		<td><s:property value="#user.id"/></td>
		<td><s:property value="#user.name"/></td>
		<td><s:property value="#user.phone"/></td>
	</tr>
</s:iterator>
</table>
<hr color="red">
?获得满足条件的所有记录<br>
  <s:iterator value="#attr.userlist.{?#this.id % 2 != 0}" var="u">
     <br><s:property value="#u.name"/>--<s:property value="#u.phone"/><br>
  </s:iterator>
  <hr color="red">
  
  ^获得满足条件的第一条记录<br>
  <s:iterator value="#attr.userlist.{^#this.id % 2 != 0}" var="u">
     <br><s:property value="#u.name"/>--<s:property value="#u.phone"/><br>
  </s:iterator>
  
  <hr color="red">
  
  $获得满足条件的最后一条记录<br>
  <s:iterator value="#attr.userlist.{$#this.id % 2 != 0}" var="u">
     <br><s:property value="#u.name"/>--<s:property value="#u.phone"/><br>
  </s:iterator>
</body>
</html>





