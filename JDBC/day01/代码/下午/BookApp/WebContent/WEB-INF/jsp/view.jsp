<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 引用项目中 common.jsp 文件 -->
<%@ include file="/WEB-INF/jsp/common.jsp"%>

<script type="text/javascript">
	//校验
	function validNum(obj) {
		//获取用户输入的信息是否合法
		var num = obj.value;
		//not a number
		if(isNaN(num)||num < 1){
			obj.value=1;
		}else{
			obj.value = Math.ceil(num);
		}
	}
</script>

</head>
<body>

	<center>

		<h2>
			热烈欢迎[ <font color="red">${sessionScope.session_user.username}</font>]登录
		</h2>

		<p>
			<img src="${prc}/image/${book.image}"
				style="width: 250px; height: 250px" />
		</p>

		<p>${book.name}</p>
		<p>${book.author}</p>
		<p>${book.price}</p>
		<p>${book.publication}</p>
		<p>${book.publicationdate}</p>
		<p>${book.remark}</p>
		
		<p>
		请输入购买<input type="text" value="1" id="buyNum"  onblur="validNum(this)"/>本
		<input type="button" value="提交"/> 
		</p>
	</center>

</body>
</html>