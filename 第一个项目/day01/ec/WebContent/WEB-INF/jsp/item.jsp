<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>疯狂购物商城--${article.title }</title>
	<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<!-- main.css是网站前台主要的CSS -->
	<link rel=stylesheet type=text/css href="<c:url value='/css/main.css'/>" />
	<!-- 使用jQuery-UI的样式来设置tab页 -->
	<link type="text/css" href="${pageContext.request.contextPath }/css/ui-lightness/jquery-ui-1.8.20.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
	<!-- header部分 -->
	<script type="text/javascript" src="<c:url value='/js/header.js'/>"></script>
	<script type="text/javascript">
	var buy = function(){
		document.getElementById("buyform").submit();
	};
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/common/banner.jsp"></jsp:include>
	<!-- middle part -->
	<div style="positon: relative; width: 960px;margin: 0px auto;">
		<!-- 左边商品类型列表 -->
		<jsp:include page="/WEB-INF/jsp/common/left-menu.jsp"></jsp:include>
		<!-- 右边物品明细显示 -->
		<div class="w main">
			<div class="right-extra">
				<div id="name">
					<h1>${article.title } <font style="color: #ff0000"id="advertiseWord"></font></h1>
				</div>
				<div id="preview">
					<div id="spec-n1" class="jqzoom">
						<img src="${pageContext.request.contextPath }/images/article/${article.image }" title="${article.title }" height="280" width="280" />
					</div>
					<ul class="extra">
						<li>
							<span>评分：</span>
							<div class="con" id="star10918727">
								<div style="float: left; margin: 2px 0 0 5px; width: 64px; height: 12px; background-image: url(images/icon_clubs.gif); background-repeat: no-repeat; overflow: hidden;"></div>
								<a href="javascript:void(0);" class="num-comment">(已有151人评价)</a>
							</div>
						</li>
						<li class="tuangou"><a href="javascript:void(0);">该商品支持全国购买</a></li>
					</ul>
				</div>
				<!--preview end-->
				<ul id="summary">
					<li>供应商：<strong> ${article.supplier}</strong></li>
					<li>出产地：<strong> ${article.locality}</strong></li>
				</ul>
				<ul id="book-price">
					<li>定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：<del>￥${article.price}</del></li>
					
					<li><font color="red">疯&nbsp;&nbsp;狂&nbsp;&nbsp;价：</font>
						<span id="priceinfo" class="price">￥<fmt:formatNumber value="${article.discountPrice}" pattern="#,#00.0#"/></span>
						<span class="rate" id="pricediscount">（${article.discount }折）</span></li>
					<li class="sub">
						<span class="fl">库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存：${article.storage}</span>
						<span>&nbsp;&nbsp;下单后立即发货</span>
					</li>
					<!--促销-->
					<li style="display: list-item;" id="mfms" class="hide">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td valign="top">促销信息：</td>
									<td><font color="#ef0000">该商品参加满减活动，购买活动商品每满300元，可减100元现金</font></td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>
				
				
				<!-- 加入购物车表单 -->
				<form action="${pageContext.request.contextPath }/shoppingCar?method=add" method="post" id="buyform">
					<!-- 隐藏表单传递要购买的物品id -->
					<input type="hidden" name="id" value="${article.id }"/>
					<div class="m" id="choose">
						<dl class="amount">
							<dt>我要买：</dt>
							<dd>
								<a class="reduce" onclick="if(parseInt($('#buyNum').val()) <= 1){$('#buyNum').val(1);}else{$('#buyNum').val(parseInt($('#buyNum').val()) - 1);}" href="javascript:void(0);">-</a> 
								<!-- 购买书的数量 -->
								<input value="1" id="buyNum" name="buyNum" onblur="if(parseInt($('#buyNum').val()) <= 1){$('#buyNum').val(1);}" type="text" /> 
								<a class="add" onclick="$('#buyNum').val(parseInt($('#buyNum').val()) + 1);" href="javascript:void(0);">+</a>
							</dd>
						</dl>
						<div class="btns">
							<a id="InitCartUrl" href="javascript:void(0);" onclick="buy();" class="btn-append"
								style="background-image: url(images/btn_new.jpg)">添加到购物车</a> 
							<input	value="关&nbsp;注"
								style="width: 68px; height: 30px; padding: 4px 0 4px 18px; margin-top: 7px; background: url(images/btn_attention.jpg) no-repeat 0 0; border: 0; line-height: 0; color: transparent; font-size: 0; *padding-bottom: 0px;"
								id="coll10918727" 
								type="button" />
							<div class="clr"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!---- middle end----->

	<!--bottom part-->
	<div style="width: 1060px;margin: 0px auto;">
  		<img src="images/step.jpg"/>
  	</div>
</body>
</html>