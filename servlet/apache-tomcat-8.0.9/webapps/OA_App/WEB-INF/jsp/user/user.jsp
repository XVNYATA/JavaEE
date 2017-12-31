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
			
			
			
			
			$("tr[id^=data_]").hover(function(){
				//触发mouseover
				$(this).css({"backgroundColor":"#eeccff","cursor":"pointer"});
			},function(){
				//如果当前tr中checkbox选中的状态则不去掉背景色
				//this==>当前tr对应dom对象
				var trId = this.id;
				//获取checkbox的id
				var boxId = trId.replace("data","box");
				if(!$("#"+boxId).prop("checked")){
					//触发mouseout
					$(this).css("backgroundColor","#ffffff");
				}

			}).click(function(){
				
				//如果当前tr中checkbox选中的状态则不去掉背景色
				//this==>当前tr对应dom对象
				var trId = this.id;
				//获取checkbox的id
				var boxId = trId.replace("data","box");
				$("#"+boxId).trigger("click");
			})
			
			
			//获取所有的子checkbox
			var boxes = $("input[id^=box_]");
			//为所有的子checkbox绑定事件
			boxes.click(function(e){
				//取消事件默认行为
				e.stopPropagation();
				//判断子checkbox的个数是否等于选中的个数
				$("#checkAll").prop("checked",boxes.length==boxes.filter(":checked").length+1);
			})
			
			//为全选checkbox绑定事件
			$("#checkAll").click(function(){
				boxes.prop("checked",$(this).prop("checked"));
				//触发tr的mouseover或者mouseout事件
				$("tr[id^=data_]").trigger($("#checkAll").prop("checked")?"mouseover":"mouseout");
			})
			
			
			
		})
	</script>
</head>
<body style="overflow:hidden">
	<!-- 工具按钮区 -->
	<s:form cssStyle="margin-bottom:1px;"  action="/admin/identity/selectUser.jspx" method="post" theme="simple">
		<table>
			<tr>
				<td><input  type="button" name="pop_btn" id="addUser" value="添加"/></td>
				<td><input type="button" name="pop_btn" id="updateUser" value="修改"/></td>
				<td><input type="button" name="pop_btn" id="deleteUser" value="删除"/></td>
				<td id="status">状态：<s:select id="checkStatus" list="#{1 : '审核', 2 : '不通过', 3 : '冻结'}"/></td>
				<td><input type="button" name="pop_btn" id="checkUser" value="审核"/></td>
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
		  
			<%-- <s:iterator value="users" status="stat">
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
			</s:iterator> --%>
			<tr id="data_1" align="center" >
					<td><input type="checkbox" id="box_1" value="${userId}"/></td>
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
				<tr id="data_2" align="center" >
					<td><input type="checkbox" id="box_2" value="${userId}"/></td>
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
				<tr id="data_3" align="center" >
					<td><input type="checkbox" id="box_3" value="${userId}"/></td>
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
		</tbody>
	</table>
	<!-- 此div不显示 作为弹出框  -->
	

	<!-- 分页标签区 -->
	<fk:page pageIndex="1" 
				  pageSize="5" 
				  recordCount="100" 
				  pageStyle="digg"
				  submitUrl="${ctx}/admin/identity/selectUser.jspx?pageModel.pageIndex={0}&user.name=${user.name}&user.phone=${user.phone}&user.dept.id=${user.dept.id}"/>
	
</body>
</html>