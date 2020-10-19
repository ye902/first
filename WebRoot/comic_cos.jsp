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
<link rel="stylesheet" type="text/css" href="css/cos.css">
<script type="text/javascript" src="js/cos.js"></script>
</head>
<body>
	<div class="header">
		<div class="header_logo">
			<a href="index.jsp"><img src="image/header_logo.jpg" alt="">
			</a>
		</div>
		<div class="nav">
			<ul>
				<li><a href="index.jsp" target="_blank">首页</a>
				</li>
				<li><a href="role.jsp" target="_blank">设定区</a>
				</li>
				<li><a href="comic_cos.jsp" target="_blank"  style="color:#f7f7f7;">同人区</a>
				</li>
				<li><a href="news.jsp" target="_blank">资讯区</a>
				</li>
				
			</ul>
		</div>
		<div class="login_link" id="login_link" style="font-size:12px;">
			<c:if test="${empty userinfo}">
				<a href="login.jsp">[登录 |注册]</a>
			</c:if>
			<c:if test="${!empty userinfo}">
				<a href="#">${userinfo.username}</a>
				<a href="${pageContext.request.contextPath}/quit.do">&nbsp;退出</a>
			</c:if>
		</div>
	</div>
	<div class="contain" id="contain" style="height: auto;">
		<div class="cos_title" id="cos_title">
			
		</div>
		<div id="cos_symbol">
			<div class="" id="sym_box">
				<div id="sym_img">
					<a href=""> <img src="images/1.jpg" /> </a>
					<div class="sym_intro">
						<p class="author" style="" name="author">【作者】沐沐</p>
						<span name="date"></span>
					</div>
				</div>
				<div id="sym_img" class="sym_flex">
					<div class="">
						<a href=""> <img src="images/6.jpg" /> </a>
						<div class="">
							<p class="author" style="" name="author">【作者】斯蒂芬斯</p>
							<span name="date"></span>
						</div>
					</div>
				</div>
				<div id="sym_img">
					<div class="">
						<a href=""> <img src="images/3.jpg" /> </a>
						<div class="">
							<p class="author" style="" name="author">【作者】丹佛斯</p>
							<span name="date"></span>
						</div>
					</div>
				</div>
				<div id="sym_img">
					<div class="">
						<a href=""> <img src="images/6.jpg" /> </a>
						<div class="">
							<p class="author" style="" name="author">【作者】丹佛斯</p>
							<span name="date"></span>
						</div>
					</div>
				</div>
				<div id="sym_img">
					<div class="">
						<a href=""> <img src="images/7.jpg" /> </a>
						<div class="">
							<p class="author" style="" name="author">【作者】丹佛斯</p>
							<span name="date"></span>
						</div>
					</div>
				</div>
				<div id="sym_img">
					<div class="">
						<a href=""> <img src="images/16.jpg" /> </a>
						<div class="">
							<p class="author" style="" name="author">【作者】丹佛斯</p>
							<span name="date"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="cos_tab">
			<ul>
				<li style="background-color: #669999;color: #f7f7f7;" id="recent">最新</li>
				<li id="hottest">最热</li>
			</ul>
		</div>
		<div id="img_container"></div>
	</div>
	<div
		style="font-size: 14px;color: #669999;width: 100%;text-align: center;line-height: 36px;margin-top:200px;margin-bottom: 100px;">
		<p>没有更多了</p>
	</div>

	<div class="footer">莯筱 | 地址：广东农工商职业技术学院</div>
</body>
</html>