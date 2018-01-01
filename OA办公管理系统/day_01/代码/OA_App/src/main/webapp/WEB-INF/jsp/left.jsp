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
	<link href="pujin.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/common/global.css"/>
	
	<style type="text/css">
		html,body{ height:100%;}
		a{color:#6a6f71; text-decoration:none;}
	</style>	
	<script type="text/javascript">
          $(function(){
            var fstMain = $("#fstMain",parent.document);
		  $("#nav_title").toggle(function(){
			  //cols="148,*"
			  fstMain.attr("cols","14,*");
			  $("#shumenu").slideUp("slow");
			  $("#img").attr("src","images/system/left_xs.gif");
		  },function(){
			  fstMain.attr("cols","148,*");
			  $("#shumenu").slideDown("slow");
			  $("#img").attr("src","images/system/left_yc.gif");

			  
		  })

           })
    </script>
  </head>
 <body class="leftmenubody">
 	<div class="topdivyc">
    	<a href="javascript:void(0);" class="a_link" title="隐藏菜单栏" id="nav_title"><img src="./images/system/left_yc.gif" id="img"/><!--隐藏时反显示的图片<img src="images/left_xs.gif" />--></a>
    </div>
    <div class="bodytextmenu" id="shumenu">
	    <div class="shumenu" >
	    	<div >
				
			</div>
	    </div>
    </div>
  </body>
</html>
