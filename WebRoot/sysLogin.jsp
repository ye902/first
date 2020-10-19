<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<style type="text/css">
		input{outline:none;line-height: 24px;}
	</style>
</head>
	
<body>
		
	<div style="width:300px;margin-left:400px;padding-top:50px; ">
		<div style="border:1px solid #333;">
				<div style="margin:20px;"><h1>后台管理系统</h1></div>
				<form action="${pageContext.request.contextPath}/adminLogin.do"">
				<div style="margin:20px;">
					<lable>账号：</lable>
					<input  type="text" name="adminId" id="adminId" placeholder="Admin"/>
				</div>
				<div style="margin:20px;">
					<lable>密码：</lable>
					<input type="text" name="adminPwd" id="adminId" placeholder="root"/>
				</div>
				<div style="margin:20px;">
					
					<input type="submit"   value="登录" />
				</div>
				</form>
		</div>
	</div>
</body>
</html>