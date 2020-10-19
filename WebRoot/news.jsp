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
	<title>资讯区-秦时明月主题网站</title>
	<link rel="stylesheet" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/news.css">
	<script type="text/javascript" src="js/news.js"></script>
</head>
<body>
	
	<div class="header">
		<div class="header_logo"><a href="index.jsp"><img src="image/header_logo.jpg" alt=""></a></div>
		<div class="nav">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="role.jsp">设定区</a></li>
				<li><a href="comic_cos.jsp">同人区</a></li>
				<li><a href="news.jsp" style="color:#f7f7f7;">资讯区</a></li>
				
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
		<div class="cos_title" id="cos_title">
			
		</div>
		<div class="chat_title" id="chat_title">
			<ul>
				<li><a href="#">首页/</a></li>
				<li><a href="#" style="color: #669999">资讯区/</a></li>
				<li><a href="#" style="color: #669999"  id="listnum">秦时明月</a></li>
			</ul>
		</div>
		<div class="video" style="margin:0 auto">
			<div class="left">
				<video controls="controls" src="video/1.mp4"  id="player">
					
				</video>
				<div class="intro">
						<span class="sImg">
							<img src="image/news_title.jpg" alt="">
						</span>
						<div class="detail_intro">
							<div class="intro_title"><h1 style="text-align: left;margin: 0px 6%">秦时明月</h1></div>
							<div class="video_type">
								<div>
									
										<p>地区：内地
											<span style="margin-left: 10%;color:#666;">总集数：175集</span>
											<span style="margin-left: 10%">出品时间：2007</span>

										</p>
								</div>
								

							</div>
							<div class="video_tag">
								<p>标签：战斗</p>
								
							</div>
							<div class="video_desc">
								<p>
									故事背景取自秦灭六国到西楚霸王项羽灭秦这段英雄辈出的历史时期，时间跨度约30年，是一部以武侠为主题的全民型动画。各种历史事件和民间传说纷呈迭起，仗剑游走江湖的名士侠隐和对现代中国产生深远影响的诸子百家更是在这个合纵连横的大时代中悉数登场。百家争鸣的中华古文化在此激烈碰撞，大时代恢宏磅礴的战争场面在连天烽火中震撼重现，江湖儿女的侠骨柔情于动荡乱世间绽放光华……少年天明如杂草般顽强生存于时代变革的乱世之中，面对强暴的政权、险恶的敌人，勇敢地与侠士们进行反抗，经历了一段不俗的遭遇。
								</p>
							</div>
						</div>
					</div>
					<div class="viewChat" >
						<div><span style="text-align:left ;padding:10px;"><h4><span id="comment_num"></span>评论</h4></span></div>
						<div title="先登录再发表" class="newComment">
							<div class="v_left head"><a href=""><img src="" alt=""></a></div>
							<div class="v_middle">
								<textarea name="" id="textComments" placeholder="发表评论" ></textarea>
							</div>
							<div class="v_right"><button type="button" id="insertBtn">发表评论</button></div>
						</div>
						<p id="insertmsg" style="font-size:12px;color:red"></p>
						<form action="graduate/showComments">
							<div class="others_view" id="others_view">
								<ul id ="ov_ul" style="border-top: 1px solid #e5e9ef;">
									
								</ul>
							</div>
							<div id = "btnlist" style="margin-top:4%;">
								<ul id="ulbtn">
									
								</ul>
							</div>
						</form>
					</div>
			</div>
			<div class="right">
				 <div class="video_tab" id="v_tab">
				 	<h4 style="text-align: left;padding-left:24px; margin-bottom: 10px;color: #669999">选集</h4>
				 	<ul>
				 		
				 	</ul>
				 </div>
				 <div class="rec">
						<div><h4 style="text-align: left;padding-left:24px; margin-bottom: 10px;color: #669999;line-height: 36px;">秦时明月  系列</h4></div>
						<ul class="recvideo_box">
							<li>
								<div class="rec_video"><a href="#"><img src="image/poster.png" alt=""></a></div>
								<div class="rec_info">
									<a >秦时明月第一季</a>
									<span><p>全10集	</p></span>
								</div>
							</li>
							<li>
								<div class="rec_video"><a href="#"><img src="image/poster.png" alt=""></a></div>
								<div class="rec_info">
									<a >秦时明月第二季</a>
									<span><p>全10集	</p></span>
								</div>
							</li>
							<li>
								<div class="rec_video"><a href="#"><img src="image/poster.png" alt=""></a></div>
								<div class="rec_info">
									<a >秦时明月第三季</a>
									<span><p>全10集	</p></span>
								</div>
							</li>
							<li>
								<div class="rec_video"><a href="#"><img src="image/poster.png" alt=""></a></div>
								<div class="rec_info">
									<a >秦时明月第四季</a>
									<span><p>全10集	</p></span>
								</div>
							</li>
						</ul>
					</div>
				 <div class="rec_article">
				 <div><h4 style="text-align: left;padding-left:24px; margin-bottom: 10px;color: #669999;line-height: 36px;">相关文章</h4></div>
					<ul>
						<li><a href="https://baijiahao.baidu.com/s?id=1625170866769422076&wfr=spider&for=pc" target="_blank">《秦时明月》在国产动漫中排第几？</a></li>
						<li><a href="https://baijiahao.baidu.com/s?id=1600313593994152503&wfr=spider&for=pc"  target="_blank">《秦时明月》关联作品（动画）介绍</a></li>
						<li><a href="https://wenku.baidu.com/view/e50f3d8c31b765ce04081411.html?fr=search"  target="_blank">  浅析国产动画片《秦时明月》</a></li>
						<li><a href="https://www.jianshu.com/p/38f140ef03e4"  target="_blank">《秦时明月》之后又一国产3D动画力作，颠覆你的童年 </a></li>
						
					</ul>
				</div>
			</div>
		</div>
		
		
	</div>
	
	
	<div class="footer">莯筱 | 地址：广东农工商职业技术学院</div>
</body>
</html>