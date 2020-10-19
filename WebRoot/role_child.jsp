<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/role_child.css">
<script type="text/javascript" src="js/role_child.js"></script>
<title>设定区--秦时明月主题网站</title>
</head>
<body>
	<div class="header">
		<div class="header_logo">
			<a href="index.jsp"><img src="image/header_logo.jpg" alt=""> </a>
		</div>
		<div class="nav">
			<ul>
				<li><a href="index.jsp" target="_blank">首页</a></li>
				<li><a href="role.jsp" target="_blank" >设定区</a></li>
				<li><a href="comic_cos.jsp" target="_blank">同人区</a></li>
				<li><a href="new.jsp" target="_blank">资讯区</a></li>
				
			</ul>
		</div>
		<div class="login_link" id="login_link" style="font-size:12px;">
		<c:if test="${empty userinfo}">
			<a href="login.jsp" >[登录 |注册]</a>
		</c:if>
		<c:if test="${!empty userinfo}">
			<a href="#">${userinfo.username}</a>
            <a href="${pageContext.request.contextPath}/quit.do">&nbsp;退出</a>
		</c:if>
		</div>
	</div>
	<div class="contain">

		<div class="inContain">

			<div class="article">
				<h3 id="tlt">
					<!-- 荆天明 -->
				</h3>
				<p style="width:100%;border-bottom:1px solid #000;margin:50px 0px;"></p>

				<p id="age"></p>

				<p id="personal"></p>
				<p>
					<img alt="" style="width:50%" id="photo">
				</p>
				<p id="experience"></p>
				<p>
					<img src="" alt="" style="width:50%;" id="photob">
				</p>
				<p id="arms"></p>

			</div>
		</div>
	</div>
	<div class="footer">莯筱 | 地址：广东农工商职业技术学院</div>
</body>
</html>