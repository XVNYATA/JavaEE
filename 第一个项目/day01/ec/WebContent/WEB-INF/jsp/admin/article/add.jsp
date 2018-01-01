<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面--添加商品</title>
<link rel="stylesheet" href="<c:url value='/css/commons.css'/>" type="text/css" />
<link type="text/css" href="<c:url value='/css/ui-lightness/jquery-ui-1.8.20.custom.css'/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui-i18n.min.js'/>"></script>
<style type="text/css">
*{margin:0;padding:0;}
#banner-td{margin:0px 0px 0px 0px;background: url(<c:url value="/images/header.gif"/>) repeat-x top right;font-size:14px;}
#left-menu-td{background-color:#C0DFFD;font-size:14px;text-align:center;}
#content-td{margin:0px 0px 0px 0px;background-color:#fff;}
/*校验不通过，在文本框下面添加红色的下划线*/
.validate-failed {border-bottom-color:#FF0000; border-bottom-style:dashed; border-bottom-width:1px;}
</style>
<script type="text/javascript">
	$(window).ready(function(){
		//把textarea中的文本框中的前后空格去掉
		$("#articleForm textarea").each(function(){
			$(this).val($(this).val().trim());
		});
		$("#putawayDate").datepicker($.datepicker.regional['zh-CN']);
		$("#articleForm [id]").each(function(){
			var id = $(this).attr("id");
			//获得焦点的时候触发
			//$(this).die().live("focus", validation);
			//失去焦点的时候触发
			$(this).die().live("blur", function(){
				validation(id);
			});
		});
	});
	//所有控件输入完成,失去焦点的时候进行判断
	var validation = function(id){
		var fieldVaue = $("#" + id).val();
		if(fieldVaue == null || fieldVaue.trim() == "" || fieldVaue.trim().length == 0){
			$("#" + id).addClass("validate-failed");
			return false;
		}else{
			$("#" + id).removeClass("validate-failed");
			return true;
		}
	};
	// 提交表单时，验证表单字段函数.
	var submitForm = function(){
		var validateFailed = false;
		var inputs = $("#articleForm [id]");
		for(var i = 0; i < inputs.length; i++){
			var id = inputs[i];
			id = $(id).attr("id");
			var checked = validation(id);
			if(!checked){
				validateFailed = true;
			}
		}
		if(validateFailed){
			alert("所有输入框均不能为空，请根据页面提示填写完整！");
		}else{
			$("#articleForm").submit();
		}
	};
</script>
</head>
<body>
	<table width="100%" style="padding:0px;">
		<tr>
			<td id="banner-td">
			<!-- 横幅开始 -->
			<jsp:include page="/WEB-INF/jsp/admin/banner.jsp"></jsp:include>
			<!-- 横幅结束 -->
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td id="left-menu-td" width="15%" valign="top">
						<!-- 左侧菜单开始 -->
						<jsp:include page="/WEB-INF/jsp/admin/left-menu.jsp"></jsp:include>
						<!-- 左侧菜单结束 -->
						</td>
						<td valign="top" align="center">
						<!-- 内容开始 -->
						<font color="red">
							<c:forEach items="${validationErrorMessages }" var="msg">
							${msg }<br/>
							</c:forEach>
						</font>
						<form id="articleForm" 
							  action="${pageContext.request.contextPath }/admin/article?method=add" 
							  method="post" 
							  enctype="multipart/form-data">
						<fieldset style="width:400px;">
							<legend>添加商品信息</legend>
							<table>
								<tr>
									<td width="60px;" align="right">类型</td>
									<td width="300px;">
									<select name="typeCode" id="typeCode" style="width:150px;">
										<option value="">-- 选择类型 --</option>
										<c:forEach items="${articleTypeList }" var="type">
											<option value="${type.code }" <c:if test="${type.code eq article.typeCode }"> selected="selected"</c:if>>${type.name }</option>
										</c:forEach>
									</select>
									</td>
								</tr>
								<tr>
									<td align="right">名称</td>
									<td>
										<input type=text name="title" id="title" size="50" value="${article.title }"/>
									</td>
								</tr>
								<tr>
									<td align="right">供应商</td>
									<td>
										<input type=text name="supplier" id="supplier" size="50" value="${article.supplier }"/>
									</td>
								</tr>
								<tr>
									<td align="right">地区</td>
									<td>
										<input type=text name="locality" id="locality" size="50" value="${article.locality }"/>
									</td>
								</tr>
								<tr>
									<td align="right">价格</td>
									<td>
										<input type=text name="price" id="price" size="50" value="${article.price }"/>
									</td>
								</tr>
								<tr>
									<td align="right">折扣</td>
									<td>
										<input type=text name="discount" size="50" value="${article.discount }"/>
									</td>
								</tr>
								<tr>
									<td align="right">库存数量</td>
									<td>
										<input type=text name="storage" id="storage" size="50" value="${article.storage }"/>
									</td>
								</tr>
								<tr>
									<td align="right">上架时间</td>
									<td>
										<input type=text name="putawayDate" id="putawayDate" size="50" value="${article.putawayDate }"/>
									</td>
								</tr>
								<tr>
									<td align="right">封面</td>
									<td>
										<input type="file" name="image" id="image" size="33"/>
									</td>
								</tr>
								<tr>
									<td align="right">描述</td>
									<td>
										<textarea rows="5" cols="47" name="description" id="description">
										 ${article.description }
										</textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="button" value="提交" onclick="submitForm()"/>
										<input type="button" value="返回" onclick="javascript:document.location.href='${pageContext.request.contextPath }/admin/article?method=list'"/>
									</td>
								</tr>
							</table>
						</fieldset>
						</form>
						<!-- 内容结束 -->
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>