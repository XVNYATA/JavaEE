<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link href="${ctx}/css/common/pager.css" type="text/css" rel="stylesheet"/>
	<script type="text/javascript">
		
	</script>
</head>
<body>
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
		  
			<s:iterator value="users" status="stat">
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
	

	<!-- 分页标签区 -->
	<fkjava:pager pageIndex="${pageModel.pageIndex}" 
				  pageSize="${pageModel.pageSize}" 
				  recordCount="${pageModel.recordCount}" 
				  style="digg"
				  submitUrl="${ctx}/admin/identity/selectUser.jspx?pageModel.pageIndex={0}&user.name=${user.name}&user.phone=${user.phone}&user.dept.id=${user.dept.id}"/>
	
</body>
</html>