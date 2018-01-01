<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>办公管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/fkjava.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="${ctx}/css/common/commons.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx }/css/common/global.css"/>
	    <link rel="StyleSheet" href="${ctx}/js/dtree/dtree.css" type="text/css" />
	<script type="text/javascript" src="${ctx}/js/dtree/dtree.js"></script>
	
	<script type="text/javascript">

			

       var d = new dTree('d');
	   d.add("0", "-1", "模块管理");
	   d.add("1", "0", "全部","${ctx}/module/selectModuleByParentCode.jspx","全部","moduleRightFrame");
	   
	      $.post("${ctx}/module/ajaxLoadModule.action",function(data,status){
	    	  if(status=="success"){

	    		
	    		//1：节点id  2：节点父id   3：节点名称    4：请求的地址   5：节点标题    6：跳转目标地址   
				   $.each(data,function(i,item){
						d.add(this.id,this.pid,this.name,"${ctx}/module/selectModuleByParentCode.jspx?parentCode="+this.id,this.name,'moduleRightFrame');
				   })
				   
				   
				   $("#tree").html(d.toString());
				  
				   d.openTo("0001");
				   d.openTo("0002");
	    		 
	    	  }
	    	  
	      },"json")  
	       
	    
	   
	   
	</script>
</head>
<body style="overflow: hidden;">
    <div class="topdivyc">
    	<a href="javascript:void(0);" class="a_link" title="隐藏菜单栏" id="nav_title"><img src="${ctx }/images/system/left_yc.gif" id= "shownav"/><!--隐藏时反显示的图片<img src="images/left_xs.gif" />--></a>
    </div>
    <div class="bodytextmenu" id="shumenu">
	    <div class="shumenu" >
	    	<div id="tree" >
	    	
			</div>
	    </div>
    </div>
</body>
</html>