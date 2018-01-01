<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fk" uri="/fk-page/j1604" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>OA办公管理系统-角色管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="${ctx}/css/common/commons.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/js/easyui/themes/default/easyui.css">
	<script type="text/javascript">
	
		$(function(){
			
			
			//为添加角色按钮绑定事件
			$("#addRole").click(function(){
				 $("#divDialog").dialog({
						title : "添加角色", // 标题
						cls : "easyui-dialog", // class
						width : 580, // 宽度
						height : 320, // 高度
						maximizable : true, // 最大化
						minimizable : false, // 最小化
						collapsible : true, // 可伸缩
						modal : true, // 模态窗口
						onClose : function(){ // 关闭窗口
							window.location = "${ctx}/role/selectRole.jspx?pageModel.pageIndex=${pageModel.pageIndex}";
						}
					});
				 //通过iframe引入添加用户的页面
				 $("#iframe").attr("src","${ctx}/role/showAddRole.action").show();
			})
			
			//为添加角色按钮绑定事件
			$("#updateRole").click(function(){
				var boxes = $("input[id^=box_]:checked");
				
				if(boxes.length==0){
					$.messager.alert('温馨提示',"请选择需要修改的用户！",'warning');
					
				}else if(boxes.length>1){
					$.messager.alert('温馨提示',"一次只能修改一个角色！",'warning');
				}else{
					 var roleId = boxes.get(0).value;
					 $("#divDialog").dialog({
							title : "更新角色", // 标题
							cls : "easyui-dialog", // class
							width : 580, // 宽度
							height : 320, // 高度
							maximizable : true, // 最大化
							minimizable : false, // 最小化
							collapsible : true, // 可伸缩
							modal : true, // 模态窗口
							onClose : function(){ // 关闭窗口
								window.location = "${ctx}/role/selectRole.jspx?pageModel.pageIndex=${pageModel.pageIndex}";
							}
						});
					 //通过iframe引入添加用户的页面
					 $("#iframe").attr("src","${ctx}/role/showUpdateRole.action?role.id="+roleId).show();
				}
			})
			
			//为删除按钮绑定事件
			$("#deleteRole").click(function(){
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
							window.location = "${ctx}/role/deleteRoleByIds.action?ids="+arr.join(",")+"&pageModel.pageIndex=${pageModel.pageIndex}";
						}
					});
					
					
				}
			})
			
		})
				
		
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
<body style="overflow: hidden;width: 100%;height: 100%;">
	<!-- 工具按钮区 -->
	<table>
		<tr>
			<td><input type="button" name="pop_btn" value="添加" id="addRole"/></td>
			<td><input type="button" name="pop_btn" value="修改" id="updateRole"/></td>
			<td><input type="button" name="pop_btn" value="删除" id="deleteRole"/>
			    &nbsp;<font color="red">${tip}</font></td>
		</tr>
	</table>
	
	<!-- 数据展示区 -->
	<table width="100%" cellpadding="5" cellspacing="1" style="background-image: url('${ctx}/images/system/t2.jpg');">
		<tr>
			<th width="60px;"><input type="checkbox" id="checkAll"/>全部</th>
			<th>名称</th>
			<th>备注</th>
			<th>操作</th>
			<th>创建日期</th>
			<th>创建人</th>
			<th>修改日期</th>
			<th>修改人</th>
		</tr>
		<tbody style="background-color: #FFFFFF;">
			<s:iterator value="roles" status="stat">
				<tr id="data_${stat.index}">
					<td><input type="checkbox" id="box_${stat.index}" value="${id}"/>${stat.count}</td>
					<td><s:property value="name"/></td>
					<td><s:property value="remark"/></td>
					<td><a href="${ctx}/role/selectRoleUser.jspx?role.id=${id}">绑定用户</a>|
						<a href="${ctx}/admin/identity/mgrPopedom.jspx?role.id=${id}">绑定操作</a></td>
					<td><s:date name="createDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td><s:property value="creater.name"/></td>
					<td><s:date name="modifyDate" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td><s:property value="modifier.name"/></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	
	<!-- 分页标签区 -->
	<fk:page pageIndex="${pageModel.pageIndex}" 
				  pageSize="${pageModel.pageSize}" 
				  recordCount="${pageModel.recordCount}" 
				  pageStyle="digg"
				  submitUrl="${ctx}/role/selectRole.jspx?pageModel.pageIndex={0}"/>
	
	<!-- div作为弹出窗口 -->
    <div id="divDialog" style="overflow: hidden;">
		<iframe id="iframe" frameborder="0" width="100%" height="100%" style="display:none;"></iframe>
	</div>
</body>
</html>