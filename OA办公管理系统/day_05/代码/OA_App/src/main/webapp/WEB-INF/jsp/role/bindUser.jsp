<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fk" uri="/fk-page/j1604" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>OA办公管理系统-角色绑定用户管理</title>
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
	
	   $(function(){
		   
		   if("${tip}"){
			   parent.addTip("${tip}");
		   }
		   //为绑定用户按钮绑定事件
		   $("#bindUser").click(function(){
			   var boxes = $("input[id^=box_]:checked");
	    		 if(boxes.length==0){
	    			 $.messager.alert("温馨提示","请选择需要绑定的用户！","warning");
	    		 }else{
	    			 var arr = new Array();
	    			 //循环jquery数组时，拿到的都是dom对象
	    			 $.each(boxes,function(){
	    			    arr.push(this.value);
	    			 })
	    			 //发送请求绑定用户
	    			 window.location = "${ctx}/role/bindUser.action?ids="+arr.join(",")+"&role.id=${role.id}&pageModel.pageIndex=${pageModel.pageIndex}";
	    		 }
			   
		   })
	   })

	</script>
</head>
<body style="overflow: hidden;">
	<!-- 工具按钮区 -->
	<table>
		<tr>
			<td><input type="button" value="绑定" id="bindUser"/>
			&nbsp;<font color="red">${tip}</font></td>
		</tr>
	</table>
	
	<!-- 数据展示区 -->
	<table width="100%" cellpadding="5" cellspacing="1" style="background-image: url('${ctx}/images/system/t2.jpg');">
		<tr>
			<th><input type="checkbox" id="checkAll"/>全部</th>
			<th>编号</th>
			<th>姓名</th>
			<th>职位</th>
			<th>邮箱</th>
			<th>状态</th>
			<th>创建日期</th>
			<th>创建人</th>
		</tr>
		<tbody style="background-color: #FFFFFF;">
			<s:iterator value="users" status="stat">
				<tr id="data_${stat.index}">
					<td><input type="checkbox" id="box_${stat.index}" value="${userId}"/>${stat.count}</td>
					<td><s:property value="userId"/></td>
					<td><s:property value="name"/></td>
					<td><s:property value="job.name"/></td>
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
				</tr>
			</s:iterator>
		</tbody>
	</table>
	
	<!-- 分页标签区 -->
	<fk:page pageIndex="${pageModel.pageIndex}" 
				  pageSize="${pageModel.pageSize}" 
				  recordCount="${pageModel.recordCount}" 
				  pageStyle="digg"
				  submitUrl="${ctx}/role/showUnbindUser.jspx?pageModel.pageIndex={0}&role.id=${role.id}"/>
	
</body>
</html>