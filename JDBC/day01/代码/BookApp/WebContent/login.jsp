<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 引入 jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

<script type="text/javascript">

//为按钮绑定事件
$(function(){
	 $("#login").click(function(){
		 
		 //获取用户的输入信息
		 var username = $("#username").val();
		 var password = $("#password").val();
		 if ($.trim(username)==null || $.trim(username)=="") {
			alert("亲爱的，请输入姓名。");
			$("#username").focus();
		} else if($.trim(password)==null || $.trim(password)=="") {
			alert("亲爱的，请输入密码。");
			$("#password").focus();
		} else {
			//根据用户名以及密码发送异步请求，判断用户是否存在
			//存在则跳转首页，否则给出提示信息
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/ajaxLogin.action",
				data:{"username":username,"password":password},
				dataType:"text",
				success:function(msg){
					if(msg){
						alert(msg);
					} else {
						//跳转首页
						window.location="${pageContext.request.contextPath}/main.action";
					}
				}, error:function(){
					alert("哥，你错了，你认吗？");
				}
			})
			
		}
	 })
	
})

//为喜欢按回车的用户绑定事件
$(document).keydown(function(e){
	if(e.keyCode == 13){
		//触发回车按钮的点击事件
		$("#login").trigger("click");
	}
})

</script>

</head>
<body>

	<center>
		<h3>J1604的专属图书系统</h3>
		<form action="#" >
			<table>
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="username" id="username" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<td><input type="button" id="login" value="登录" /></td>
					<td><input type="button" id="register" value="注册" /></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>