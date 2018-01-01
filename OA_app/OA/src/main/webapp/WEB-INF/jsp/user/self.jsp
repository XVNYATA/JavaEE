<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>办公管理系统-修改用户</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>
		<meta name="Keywords" content="keyword1,keyword2,keyword3"/>
		<meta name="Description" content="网页信息的描述" />
		<meta name="Author" content="fkjava.org" />
		<meta name="Copyright" content="All Rights Reserved." />
		<link href="${ctx}/fkjava.ico" rel="shortcut icon" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="${ctx}/css/common/commons.css"/>
		<script type="text/javascript" src="${ctx}/js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery-migrate-1.2.1.js"></script>
		<script type="text/javascript">
			
			$(function(){
				
				/** 还原性别 */
				$("#sex").val("${session_user.sex}");
				
				/** 还原问题 */
				$("#question").val("${session_user.question}");
				
				/** 得到上一次添加用户的部门与职位 */
				var jobCode = "${session_user.job.code}";
				var deptId = "${session_user.dept.id}";
				
				/** 发送异步请求加载部门与职位信息   */
				$.post("${ctx}/user/ajaxLoadDeptAndJob.action",function(data,status){
					//后台响应正常status=="success"  后台啊响应不正常status=="success"
					if(status=="success"){
						//获取部门信息
						var depts = data.depts;
						$.each(depts,function(){
							$("<option>").val(this.id).text(this.name).attr("selected",this.id==deptId).appendTo("#deptSelect")
						})
						
						//获取职位信息
						var jobs = data.jobs;
						$.each(jobs,function(){
							$("<option>").val(this.code).text(this.name).attr("selected",this.code==jobCode).appendTo("#jobSelect")
						})
					}
				},"json");
				
				/** 提交表单函数 */
				$("#btn_submit").click(function(){
					// 对表单中所有字段做校验
					var name = $("#name");
					var email = $("#email");
					var tel = $("#tel");
					var phone = $("#phone");
					var qqNum = $("#qqNum");
					var answer = $("#answer");
					var msg = "";
					if ($.trim(name.val()) == ""){
						msg += "姓名不能为空!";
						name.focus();
					}else if ($.trim(email.val()) == ""){
						msg += "邮箱不能为空!";
						email.focus();
					}else if (!/^\w+@\w{2,}.\w{2,}$/.test(email.val())){
						msg += "邮箱格式不正确!";
						email.focus();
					}else if ($.trim(tel.val()) == ""){
						msg += "电话号码不能为空!";
						tel.focus();
					}else if (!/^0\d{2,3}-?\d{7,8}$/.test(tel.val())){
						msg += "电话号码格式不正确!";
						tel.focus();
					}else if ($.trim(phone.val()) == ""){
						msg += "手机号码不能为空!";
						phone.focus();
					}else if (!/^1[3|5|8]\d{9}$/.test(phone.val())){
						msg += "手机号码格式不正确!";
						phone.focus();
					}else if ($.trim(qqNum.val()) == ""){
						msg += "QQ号码不能为空!";
						qqNum.focus();
					}else if (!/^\d{5,11}$/.test(qqNum.val())){
						msg += "QQ号码长度必须在5-11之间!";
						qqNum.focus();
					}else if ($.trim(answer.val()) == ""){
						msg += "密保问题不能为空!";
						answer.focus();
					}
					// 直接提交
					if (msg){
						$.messager.alert("温情提示",msg,"warning");
					}else{
						$("#updateSelfForm").submit();
					}
				});
			});
			
			/** 修改成功 */
			if ("${tip}"){
				// 刷新head.jsp
				parent.parent.topframe.location.reload();
			}
		
		</script>
	</head>
<body>
	<div align="center">
	<fieldset style="width:500px;"><legend>用户信息</legend>
	<table align="center">
		<s:actionerror/><s:fielderror/>
		<s:if test="tip != null">
			<center><span style="color:red;">${tip}</span></center>
		</s:if>
		<s:form action="/user/updateSelf.jspx" method="post" id="updateSelfForm" theme="simple">
			<s:token></s:token>
			<input type="hidden"  name="user.userId" value="${session_user.userId}"/>
			<tr><td colspan="2"></td></tr>
			<tr>
				<td>
					登&nbsp;录&nbsp;名：
					<input type="text" value="${session_user.userId}" disabled="disabled" size="18"/>
				</td>
				<td>
					用户姓名：
					<input type="text" id="name" name="user.name" value="${session_user.name}" size="18" maxlength="20"/>
				</td>
			</tr>
			<tr>
				<td>
					性&nbsp;&nbsp;&nbsp;&nbsp;别：
					<s:select name="user.sex" id="sex" list="#{1:'男',2:'女'}"/>
				</td>
				<td>
					部&nbsp;&nbsp;&nbsp;&nbsp;门：
					<select id="deptSelect" name="user.dept.id"></select>
				</td>
			</tr>

			<tr>
				<td>
					职&nbsp;&nbsp;&nbsp;&nbsp;位：
					<select id="jobSelect" name="user.job.code"></select>
				</td>
				<td>
					邮&nbsp;&nbsp;&nbsp;&nbsp;箱：
					<input type="text" id="email" name="user.email" size="18" value="${session_user.email}"
						maxlength="50"/>
				</td>
			</tr>
			<tr>
				<td>
					电&nbsp;&nbsp;&nbsp;&nbsp;话：
					<input type="text"  id="tel" name="user.tel" size="18" value="${session_user.tel}"/>
				</td>
				<td>
					手&nbsp;&nbsp;&nbsp;&nbsp;机：
					<input type="text" id="phone" name="user.phone" size="18" maxlength="11" value="${session_user.phone}"/>
				</td>
			</tr>
			<tr>
				<td>
					Q&nbsp;Q号&nbsp;码：
					<input type="text" id="qqNum" name="user.qqNum" size="18" maxlength="20" value="${session_user.qqNum}"/>
				</td>
				<td>
					问&nbsp;&nbsp;&nbsp;&nbsp;题：
					<s:select name="user.question"
						list="#{0:'您的生日？',1:'您父亲的姓名？',2:'您的出生地？',3:'您母亲的名字？'}"  id="question"/>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					结&nbsp;&nbsp;&nbsp;&nbsp;果：
					<input type="text" id="answer" name="user.answer" size="48" maxlength="50" value="${session_user.answer}"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<br />
					<input value="提 交" type="button" id="btn_submit" />
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input value="重 置" type="reset" />
				</td>
			</tr>
		</s:form>
	</table>
	</fieldset>
	</div>
</body>
</html>

	
	