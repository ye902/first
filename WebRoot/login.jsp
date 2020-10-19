<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录注册-秦时明月主题网站</title>
</head>
	<link rel="stylesheet" type="text/css" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript" src="js/loginTab.js"></script>
	
<body>
	<!-- 注册页面头部 -->
	<div class="header">
		<div class="header_logo">
			<a href="index.jsp" style="width: 16%;"><img src="image/header_logo.jpg" alt=""></a>
		</div>
		<div class="header_link"></div>
	</div>
	<div class="container">
	
		<div class="container_bag">
			<div class="sentence">
				<p class="sentence_content" id="s_content">有些梦想虽然遥不可及，但不是不可能实现。只要我足够的强。</p>
				<p class="sentence_speaker" id="s_speaker">——少年盖聂</p>
			</div>
			
		</div>
		<!-- 登录注册表单 -->
		
		<div class="box">
			
				<div class="tab">
					<div class="login tabColor" id="login_tab">登录</div>
					
					<div class="registe" id="registe_tab">注册</div>
				</div>
				<div class="content">
				
						<div id="login_box" style="display: block">
							<div class="login_item" >
				                <label for="username">账号：</label>
				                <input type="text" name="userid" id="username" placeholder="请输入9位数字号码" oninput="value=value.replace(/[^\d]/g,'')" maxlength="9" >
				                <p id="namemsg" style="font-size:12px"></p>
			            	</div>
				            <div class="login_item" >
				                <label for="password">密 码 ：</label>
				                <input type="password" name="userpwd" id="password" placeholder="请输入7位密码" oninput="value=value.replace(/[\W]/g,'')" maxlength="7" >
				                <p id ="pwdmsg" style="font-size:12px"></p>
				            </div>
				            <div class="login_btn">
				            	<div  class="login_submit">
				            		<button id="login" type="button">登录</button>
				            	</div>
				            	
				           	 	
				            </div>
				            <p id="loginmsg" style="font-size:12px;color:red"></p>
				            
						</div>
					
				
						<div id="registe_box" style="display: none;">
							<div class="registe_item" >
				                <label for="userid">账号：</label>
				                <input type="text"  id="ruserid" placeholder="请输入9位数字号码" oninput="value=value.replace(/[^\d]/g,'')" maxlength="9"  >
				                <p id="regimsg" style="font-size:12px"></p>
			            	</div>
			            	<div class="registe_item" >
				                <label for="password">密 码 ：</label>
				                <input type="password" id="rpassword" placeholder="请输入7位密码" oninput="value=value.replace(/[\W]/g,'')" maxlength="7">
				                <p id ="regpwdmsg" style="font-size:12px"></p>
				            </div>
			            	<div class="registe_item" >
				                <label for="username">用户名：</label>
				                <input type="text"  id="rusername" placeholder="请输入用户名" oninput="value=value.replace(/[^\w\u4E00-\u9FA5]/g, '')" >
				                <p id="regnamemsg" style="font-size:12px"></p>
			            	</div>
				            
				            <div class="registe_btn">
				            	<div  class="registe_submit">
				            		<button id="registe" type="button">注册</button>
				            	</div>
				            	
				           	 	
				            </div>
				            <p id = "regmsg"  style="font-size:12px;color:red"></p>
						</div>
					
				</div>
			
		</div>
	</div>
	<!-- 页面底部 -->
	<div class="footer">莯筱 | 地址：广东农工商职业技术学院</div>
</body>
</html>