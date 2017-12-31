<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

     <script type="text/javascript">
     
           //通过ajax异步校验用户名是否存在
           function validUserName(obj){
        	   //获取用户输入的信息
        	   var name = obj.value;
        	   
        	   //通过内置函数XMLHttpRequest老发送请求至后台
        	   var xrt = new XMLHttpRequest();
        	   //通过open方法建立服务器之间的连接   第一个参数：请求方式   第二个参数：请求地址    第三个参数：同步还是异步    true:异步  false:同步
        	   xrt.open("post","${pageContext.request.contextPath}/register",true);
        	   
        	   
        	   
        	   //post请求可以将参数拼装在  url地址后传递至后台，或者通过send方法传递参数，假设通过send方法传递参数 需要在发送请求之前这是请求头
        	   //通过send方法传递参数 需要在发送请求之前这是请求头
        	   xrt.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        	   
        	   //发送请求至后台
        	   xrt.send("name="+name);
        	   
        	   
        	   
        	   
        	   //为XMLHttpRequest绑定事件   onreadystatechange
        	   xrt.onreadystatechange = function(){
        		   
        		    if(xrt.status==200&&xrt.readyState==4){
        		    	  //获取服务器响应至前台的数据
        		    	  var msg = xrt.responseText;
        		    	  //如果用户存在，给用户提示信息，请清除用户名
        		    	   if(msg){
        		    		   document.getElementById("mess").innerHTML = "<font color='red'>"+msg+"</font>";
        		    		   //清空用户输入的额内容
        		    		   obj.value = "";
        		    	   }
        		    	
        		    }
        		   
        	   }
        	   
        	   
        	   
        	   
        	   
        	   
        	   
           }
     
     </script>
</head>
<body>
       <center>
       
           <h2>用户注册</h2>
           <h3 id="mess">${message}</h3>
           <form action="${pageContext.request.contextPath}/register">
           <table>
               <tr><td>登录名<input type="text" name="loginName" onblur="validUserName(this)"/></td></tr>
               <tr><td>密码<input type="password" name="password"/></td></tr>
               <tr><td>确认密码<input type="password" name="okpassword"/></td></tr>
               <tr><td>真实姓名<input type="text" name="realName"/></td></tr>
               <tr><td><input type="submit" value="注册" /></td></tr>
           
           </table>
          
         </form>
       
       </center>
</body>
</html>