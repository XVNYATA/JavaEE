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
    <link rel="stylesheet" type="text/css" href="${ctx}/js/dtree/dtree.css" />
    <script type="text/javascript" src="${ctx }/js/dtree/dtree.js"></script>
	
	<style type="text/css">
		html,body{ height:100%;}
		a{color:#6a6f71; text-decoration:none;}
	</style>	
	
	<script type="text/javascript">
			$(function(){
				
				//收缩按钮
				var fstMain = $("#fstMain",parent.document);
				$("#nav_title").toggle(function(){
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
				<script type="text/javascript">
					//mytree.add(1,0,'my node','node.html','node title','mainframe',img/musicfolder.gif);
			      //第一个参数:节点id   第二个参数:pid(父节点的id) 第三个参数:节点名称    第四个参数:请求地址   第五个参数:节点标题   第六个参数:跳转的目标位置   第七个参数:图片路径
			      
			      //根节点的pid必须是-1
			      d = new dTree('d');
			      
			      d.add(0,-1,'办公管理系统');
			      d.add(1,0,'系统管理','#');
			      d.add(2,0,'假期管理','#');
			      d.add(3,1,'用户管理',"javascript:parent.mainframe.addTab('1','用户管理','${ctx}/user/selectUserByPage.action')",'用户管理',"mainframe");
			      d.add(4,1,'角色管理',"javascript:parent.mainframe.addTab('2','角色管理','${ctx}/role/selectRole.jspx')",'角色管理',"mainframe");
			      d.add(5,1,'模块管理',"javascript:parent.mainframe.addTab('3','模块管理','${ctx}/module/mgrModule.jspx')",'模块管理',"mainframe");
			      d.add(6,2,'假期审批','');
			      d.add(7,2,'假期明细','');
			      d.add(8,2,'假期类型','');
			      
			      document.write(d);
			      d.openAll();
				</script>
			</div>
	    </div>
    </div>
  </body>
</html>
    