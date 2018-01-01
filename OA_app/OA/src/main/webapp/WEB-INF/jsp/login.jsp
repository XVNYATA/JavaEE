<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>办公管理系统-登录页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>
	<meta name="Keywords" content="keyword1,keyword2,keyword3"/>
	<meta name="Description" content="网页信息的描述" />
	<meta name="Author" content="gdcct.gov.cn" />
	<meta name="Copyright" content="All Rights Reserved." />
	<link href="pujin.ico" rel="shortcut icon" type="image/x-icon" />

	<style type="text/css">
		body{ 
			background-repeat: repeat; 
			background-positon: 100%, 100%; 
		} 
		li{
			margin-left:20px;
		}
	</style>
	
	<script type="text/javascript">
	
	 if(window.location !=top.window.location){
		  //将当前页面作为最顶级页面
		  top.window.location = window.location;
	  }
	
		$(function(){
			
			$("#vimg").mouseover(function(){
				$(this).css("cursor","pointer");
			}).click(function(){
				$(this).attr("src","${ctx}/verify.action?date="+new Date());
			})
			
			//为看不清绑定事件
			$("#img").click(function(){
				$("#vimg").trigger("click");
			})
			
			//为登录按钮绑定事件
			$("#login_id").click(function(){
				var loginname = $("#userName").val();
				var password = $("#password").val();
				var vcode = $("#vcode").val();
				if($.trim(loginname)==null||$.trim(loginname)==""){
					alert("请输入您的用户名！");
					$("#userName").focus();
				}else if(!/^[0-9a-zA-Z]{5,16}$/.test(loginname)){
					alert("您输入的用户名不合法，请重新输入。");
					$("#userName").val("");
					$("#userName").focus();
				}else if($.trim(password)==null||$.trim(password)==""){
					alert("请输入您的密码");
					$("#password").focus();
				}else if(!/^[0-9a-zA-Z]{6,10}$/.test(password)){
					alert("您输入的密码不合法，请重新输入。");
					$("#password").val("");
					$("#password").focus();
				}else if(!/^[0-9]{4}$/.test(vcode)){
					alert("您输入的验证码不正确！");
					$("#vcode").focus();
				}else{
					//将表单的数据序列化
					var params = $("#form").serialize();
					//验证通过,发送异步请求
					$.ajax({
						type:"post",
						url:"${ctx}/user/userLogin.action",
						data:params,
						dataType:"text",
						success:function(msg){
							if(msg){
								alert(msg);
								//刷新验证码
								$("#vimg").trigger("click");
							}else{
								
								window.location="${ctx}/main.action";
							}
						},error:function(){
							alert("数据加载异常");
						}
					})
				}
			})
			
		})
		
		//为回车绑定事件
		  $(document).keydown(function(e){
		  if(e.keyCode==13){
			  $("#login_id").trigger("click");
		  }
	  })
	</script>
	
</head>
<body background="${ctx }/images/login/9.png">
	<div align="center" style="height:100%">
		<form action="#" method="post" id="form">
			<table border="0" cellpadding="0" cellspacing="0" style="margin-top:120px;">
				<tr>
					<td colspan="2" width="447" height="104" background="${ctx }/images/login/1_01.jpg"></td>
				</tr>
				<tr>
					<td width="92" height="200" background="${ctx }/images/login/1_02.gif">&nbsp;</td>
					<td width="355" height="200" background="${ctx }/images/login/1_03.gif">
						<table style="font-size:13px;margin:0 0 0 30px;" >
							<tr align="left">
								<td>用户名：</td>
								<td colspan="2">
									<input type="text" name="user.userId" size="13" id="userName"/>
								</td>
								
							</tr>
							<tr align="left">
								<td>密&nbsp;&nbsp;码：</td>
								<td>
									<input type="password" name="user.passWord" size="13" id="password"/>
								</td>
								<td>
									<a href="javascript:void(0)" id="findpwd" style="font-size:12px;color:white;">忘了密码?</a>
								</td>
							</tr>
						   <tr align="left">
								<td>验证码：</td>
								<td>
									<div style="float:left;">
										<input type="text" name="vcode" size="4" maxlength="4" id="vcode"/>
									</div>
									<div style="float:left;padding:0 0 0 5px;">
										<img src="${ctx}/verify.action" width="55" height="22" title="验证码" id="vimg"/>
									</div>
								</td>
								<td align="left">
									<a href="javascript:void(0);" id="img" style="font-size:12px;color:white;">看不清楚</a>
								</td>
						   </tr>
						   <tr align="left">
						   		<td>&nbsp;</td>
								<td colspan="2"><input type="radio" name="key" value="1" id="key"/>记住用户</td>
						   </tr>
						 
						  <tr align="center">
							<td colspan="3">
								<input type="button" value="登 录" width="67" height="22" id="login_id"/>&nbsp;
								<input type="reset" value="重 置"/>
							</td>
						  </tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="3" width="447" height="34" background="${ctx }/images/login/1_04.gif"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>