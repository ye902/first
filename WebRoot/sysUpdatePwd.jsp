<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改</title>
	<style type="text/css">
		input{outline:none;line-height: 24px;}
	</style>
</head>
	
<body>
		
	<div style="width:300px;margin-left:400px;padding-top:50px; ">
		<div style="border:1px solid #333;">
				<div style="margin:20px;"><h1>修改密码</h1></div>
				<form action="${pageContext.request.contextPath}/updateAdminPwd.do"">
				<div style="margin:20px;">
					<lable>旧密码：</lable>
					<input  type="text" name="oldAdminPwd" id="oldAdminPwd" placeholder="root"/>
				</div>
				<div style="margin:20px;">
					<lable>新密码：</lable>
					<input type="text" name="adminPwd" placeholder="root"/>
				</div>
				<div style="margin:20px;">
					<lable>确认密码：</lable>
					<input type="text" name="adminPwdSec" placeholder="root"/>
				</div>
				<div style="margin:20px;">
					
					<input type="submit"   value="提交" />
				</div>
				</form>
		</div>
	</div>
</body>
</html>