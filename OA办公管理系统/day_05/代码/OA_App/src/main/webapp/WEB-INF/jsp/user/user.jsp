<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fk" uri="/fk-page/j1604" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>OA办公管理系统-用户管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="${ctx}/css/common/commons.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet"/>
	<script type="text/javascript">
	
		//为所有的tr绑定hover事件
		$(function(){
		
			if("${tip}"){
				$.messager.show({
					title:'温馨提示',
					msg:"<font color='red'>${tip}</font>",
					showType:'show'
				});
			}
			
			
			
			//获取用户选中的部门的id
			var deptId = "${user.dept.id}";
			//异步加载部门信息
			$.post("${ctx}/dept/ajaxLoadDept.action",function(data,status){
				//后台响应正常时 status =='success'  后台响应异常时 status =='error'  
				if(status=="success"){
					$.each(data,function(){
						
						$("<option>").val(this.id).text(this.name).attr("selected",deptId==this.id).appendTo("#deptSelect");
					    //$("#deptSelect").append("<option value='"+this.id+"'>"+this.name+"</option>");
					})
				}

			},"json");
			
			
			//为修改按钮绑定事件
			$("#updateUser").on("click",function(){
				//获取用户选中的checkbox
				var boxes = $("input[id^=box_]:checked");
				if(boxes.length==0){
					$.messager.alert('温馨提示',"请选择需要修改的用户！",'warning');
				}else if(boxes.length>1){
					$.messager.alert('温馨提示',"一次只能修改一个用户信息！",'warning');
				}else{
					//获取用户选中的checkbox的value值  
					var userId = boxes.get(0).value;
					 $("#divDialog").dialog({
							title : "修改用户", // 标题
							cls : "easyui-dialog", // class
							width : 580, // 宽度
							height : 320, // 高度
							maximizable : true, // 最大化
							minimizable : false, // 最小化
							collapsible : true, // 可伸缩
							modal : true, // 模态窗口
							onClose : function(){ // 关闭窗口
								window.location = "${ctx}/user/selectUserByPage.action?pageModel.pageIndex=${pageModel.pageIndex}&user.name=${user.name}&user.phone=${user.phone}&user.dept.id=${user.dept.id}&user.status=${user.status}";
							}
						});
					
					 //通过iframe引入添加用户的页面
					 $("#iframe").attr("src","${ctx}/user/showUpdateUser.action?user.userId="+userId).show();
				}
				
			})
			
		})
		
		//删除用户信息
		function userDelete(){
			//获取用户选中的checkbox
			var boxes = $("input[id^=box_]:checked");
			if(boxes.length==0){
				$.messager.alert('温馨提示',"请选择需要删除的用户！",'warning');
			}else{
				
				$.messager.confirm('温馨提示', '是否确认删除该记录?', function(r){
					if (r){
						//获取用户选中的checkbox
						var arr = new Array();
						$.each(boxes,function(){
							arr.push(this.value);
						})
						
						//发送请求删除用户信息
						window.location = "${ctx}/user/deleteUserByIds.action?ids="+arr.join(",")+"&pageModel.pageIndex=${pageModel.pageIndex}&user.name=${user.name}&user.phone=${user.phone}&user.dept.id=${user.dept.id}&user.status=${user.status}";
					}
				});
				
				
			}
		}
		
		function userCheck(){
			//获取用户选中的checkbox
			var boxes = $("input[id^=box_]:checked");
			//获取用户选中的审核状态
			var status = $("#checkStatus").val();
			if(boxes.length==0){
				$.messager.alert('温馨提示',"请选择需要审核的用户！",'warning');
				
			}else if(status==-1){
				$.messager.alert('温馨提示',"请选择需要审核的状态！",'warning');
			}else{

				//获取用户选中的checkbox
				var arr = new Array();
				$.each(boxes,function(){
					arr.push(this.value);
				})
				
				//发送请求删除用户信息
				window.location = "${ctx}/user/checkUserByIds.action?ids="+arr.join(",")+"&status="+status+"&pageModel.pageIndex=${pageModel.pageIndex}&user.name=${user.name}&user.phone=${user.phone}&user.dept.id=${user.dept.id}&user.status=${user.status}";
			}

			}
		
		//添加用户
		function userAdd(){
			 $("#divDialog").dialog({
					title : "添加用户", // 标题
					cls : "easyui-dialog", // class
					width : 580, // 宽度
					height : 320, // 高度
					maximizable : true, // 最大化
					minimizable : false, // 最小化
					collapsible : true, // 可伸缩
					modal : true, // 模态窗口
					onClose : function(){ // 关闭窗口
						window.location = "${ctx}/user/selectUserByPage.action?pageModel.pageIndex=${pageModel.pageIndex}&user.name=${user.name}&user.phone=${user.phone}&user.dept.id=${user.dept.id}&user.status=${user.status}";
					}
				});
			 //通过iframe引入添加用户的页面
			 $("#iframe").attr("src","${ctx}/user/showAddUser.action").show();
		}
		

			//屏幕右下角提示信息
			function addTip(tip){
				$.messager.show({
					title:'温馨提示',
					msg:"<font color='red'>"+tip+"</font>",
					showType:'show'
				});
			}

	</script>
</head>
<body style="overflow:hidden;width:100%;height:100%;">
	<!-- 工具按钮区 -->
	<s:form cssStyle="margin-bottom:1px;"  action="/user/selectUserByPage.action" method="post" theme="simple">
		<table>
			<tr>
				<td><input  type="button" name="pop_btn" id="addUser" value="添加" onclick="userAdd()"/></td>
				<td><input type="button" name="pop_btn" id="updateUser" value="修改"/></td>
				<td><input type="button" name="pop_btn" id="deleteUser" value="删除"  onclick="userDelete()"/></td>
				<td id="status">状态：<s:select id="checkStatus" name="user.status" list="#{-1:'请选择审核状态',0:'新建',1 : '审核', 2 : '不通过', 3 : '冻结'}"/></td>
				<td><input type="button" name="pop_btn" id="checkUser" value="审核" onclick="userCheck()"/></td>
				<td>姓名：<s:textfield name="user.name" size="12"/></td>
				<td>手机号码：<s:textfield name="user.phone" size="12"/></td>
				<td>部门：<select name="user.dept.id" id="deptSelect">
						    <option value="0">==请选择==</option>
						</select></td>
				<td><input type="submit" value="查询"/><span style="color: #ff0000;">${tip }</span></td>
			</tr>
		</table>
	</s:form>
	<!-- 数据展示区 -->
	<table width="100%"   cellpadding="5" cellspacing="1" style="background-image: url('${ctx}/images/system/t2.jpg')">
		<tr>
			<th style="width: 5%;text-align: center; "><input type="checkbox" id ="checkAll"/></th>
			<th style="width: 8%;text-align: center;">账号</th>
			<th style="width: 6%;text-align: center;">姓名</th>
			<th style="width: 5%;text-align: center;">性别</th>
			<th style="width: 8%;text-align: center;">部门</th>
			<th style="width: 8%;text-align: center;">职位</th>
			<th style="width: 8%;text-align: center;">手机号码</th>
			<th style="width: 10%;text-align: center;">邮箱</th>
			<th style="width: 6%;text-align: center;">状态</th>
			<th style="width: 12%;text-align: center;">创建日期</th>
			<th style="width: 6%;text-align: center;">创建人</th>
			<th style="width: 12%;text-align: center;">审核日期</th>
			<th style="width: 6%;text-align: center;">审核人</th>
		</tr>
		<tbody style="background-color: #FFFFFF;">
		
			 
			 <s:iterator value="users"  status="stat">
				<tr id="data_${stat.count}" align="center" >
					<td><input type="checkbox" id="box_${stat.count}" value="${userId}"/></td>
					<td><s:property value="userId"/></td>
					<td><s:property value="name"/></td>
					<td>${sex == 1 ? '男' : '女' }</td>
					<td><s:property value="dept.name"/></td>
					<td><s:property value="job.name"/></td>
					<td><s:property value="phone"/></td>
					<td><s:property value="email"/></td>
					<td>
						<s:if test="status == 0">
							<font color="red">新建</font>
						</s:if>
						<s:elseif test="status == 1">审核</s:elseif>
						<s:elseif test="status == 2">不通过</s:elseif>
						<s:else>冻结</s:else>
					</td>
					<td><s:date name="createDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td><s:property value="creater.name"/></td>
					<td><s:date name="checkDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td><s:property value="checker.name"/></td>
				</tr>
			</s:iterator> 
			
		</tbody>
	</table>
	<!-- 此div不显示 作为弹出框  -->
	<div id="divDialog">
	    <iframe id="iframe" style="display:none;width:100%;height:100%" frameborder="0"></iframe> 
	</div>

	<!-- 分页标签区 -->
	<fk:page pageIndex="${pageModel.pageIndex}" 
				  pageSize="${pageModel.pageSize}" 
				  recordCount="${pageModel.recordCount}" 
				  pageStyle="digg"
				  submitUrl="${ctx}/user/selectUserByPage.action?pageModel.pageIndex={0}&user.name=${user.name}&user.phone=${user.phone}&user.dept.id=${user.dept.id}&user.status=${user.status}"/>
	
</body>
</html>