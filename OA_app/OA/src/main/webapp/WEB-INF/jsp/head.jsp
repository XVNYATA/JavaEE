<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<title>办公管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>
	<meta name="Keywords" content="keyword1,keyword2,keyword3"/>
	<meta name="Description" content="网页信息的描述" />
	<meta name="Author" content="gdcct.gov.cn" />
	<meta name="Copyright" content="All Rights Reserved." />
	<link href="/pujin.ico" rel="shortcut icon" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="./css/common/global.css"/>
	<script type="text/javascript" src="${ctx}/js/fk-timer.js"></script>
	
		<script type="text/javascript">
			$(function(){
				//启动定时器
				$("#time").timeRun();
				
				//收缩按钮
				var tstMain = $("#tstMain",parent.document);
				$("#nav_title").toggle(function(){
					tstMain.attr("rows","14,*");
					$("#headtitle").slideUp("slow");
					$("#img").attr("src","images/system/top_xs.gif");
				},function(){
					tstMain.attr("rows","82,*");
					$("#headtitle").slideDown("slow");
					$("#img").attr("src","images/system/top_yc.gif");
				})
			})
			
			//退出登录
			function exit(){
				//用户退出登录  将session以及cookie中的用户信息清楚
				
				//parent:父级 top:最顶级
				parent.window.location="${ctx}/user/logout.action";
			}
			
			//修改密码
			function updatePassword(){
				parent.mainframe.updateUserPass();
			}
		</script>
	
  </head>

 <body class="headbody">
	<div class="headtitle" id="headtitle">
    	<div class="headlogo"><img src="./images/system/logo.gif" />
    	</div>
        <div class="headmenutop">
        	
        	<a class="headtopout" title="退出系统" href="javascript:void(0);" onclick="exit();">安全退出</a>
        	<a class="headtopout" title="密码修改" href="javascript:void(0);" onclick="updatePassword();">密码修改</a>
			<div class="titlexx">
				<span style="font-size:14px;color:red">${session_user.name }</span>&nbsp;您好，欢迎使用本系统&nbsp;&nbsp;
				<span id="time" style="color:#fff;"></span>
				
			</div>
        </div>
    </div>
    <div class="yctopdiv">
      	<a href="javascript:void(0);" class="t_link" title="隐藏菜单栏" id="nav_title">
		<img src="./images/system/top_yc.gif" id = "img" onclick="ShowNav(this)"/><!--隐藏时反显示的图片<img src="images/top_xs.gif" />--></a>
    </div>
  </body>
</html>