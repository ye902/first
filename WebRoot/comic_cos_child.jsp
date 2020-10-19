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
	<title>同人区-秦时明月主题网站</title>
	<link rel="stylesheet" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/cos_child.css">
	<script type="text/javascript" src="js/cos_child.js"></script>
</head>
<body>
	<div class="header">
		<div class="header_logo"><a href="index.jsp"><img src="image/header_logo.jpg" alt=""></a></div>
		<div class="nav">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="role.jsp">设定区</a></li>
				<li><a href="comic_cos.jsp">同人区</a></li>
				<li><a href="news.jsp">资讯区</a></li>
				
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
	<div class="contain" id="contain" style="height: auto;">
		<div class="cos_title" id="cos_title"><h1>同人区</h1></div>
		<div class="detail">
			<div class="detail_title">
				<h4 id="authorH">【作者】丹佛斯</h4>
				<p>
					<span id="authorS">【作者】丹佛斯</span>
					<span id="date">03-16</span>
				</p>
			</div>
			<div class="detail_img">
				<img src="images/2.jpg" alt="" id="detail_img">
			</div>
			<div class="detail_message">
				
			</div>
		</div>
		
	</div>
	
	
	<div class="footer">莯筱 | 地址：广东农工商职业技术学院</div>
</body>
</html>