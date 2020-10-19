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
	<title>首页-秦时明月主题网站</title>
	<link rel="stylesheet" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<script type="text/javascript" src="js/index.js"></script>
	
</head>
<body>
	<div class="header">
		<div class="header_logo"><a href="index.jsp"><img src="image/header_logo.jpg" alt=""></a></div>
		<div class="nav">
			<ul>
				<li><a href="index.jsp"  style="color:#f7f7f7;">首页</a></li>
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
		<div class="wrap">
			<div id="banner">
				<div id="list" style="left: -600px;">
					<a href=""><img class="img" src="image/banner_index.jpg" alt="5"></a>
					<a href=""><img class="img" src="image/banner_news.jpg" alt="1"></a>
					<a href=""><img class="img" src="image/chilian.jpg" alt="2"></a>
					<a href=""><img class="img" src="image/xuenv.jpg" alt="3"></a>
					<a href=""><img class="img" src="image/banner_cos_o.jpg" alt="4"></a>
					<a href=""><img class="img" src="image/banner_index.jpg" alt="5"></a>
					<a href=""><img class="img" src="image/banner_news.jpg" alt="1"></a>
				</div>
				<div id="buttons">
					<span index="1" class="on"></span>
					<span index="2"></span>
					<span index="3"></span>
					<span index="4"></span>
					<span index="5"></span>
				</div>
				<a href="javascript:;" id="prev" class="arrow"></a>
				<a href="javascript:;" id="next" class="arrow"></a>
			</div>
		</div>
		
		<div class="role_til"></div>
		<div class="role_banner">
			<div class="role_left">
				<a class="top"><img src="image/index_role.jpg" alt=""></a>
			</div>
			<div class="role_right" >
				<h4>秦时明月简介</h4>
				<p>《秦时明月》系列是由中国杭州玄机科技信息技术有限公司制作的3D武侠动画系列，于2007年春节期间起在中国全国各地正式首映，网络上亦有授权播出。另有衍生出的仅在网络、不在电视播出的姐妹篇《天行九歌》等.目前动画已完结前5部，共175集。第6部《秦时明月之沧海横流》已上映序章。</p>
				<p>系列灵感来源于温世仁原著小说。时代背景从秦灭六国、建立中国首个帝国开始，到秦国灭亡，时间跨度30年(包括回忆)，讲述一个体内流淌英雄之血的少年——天明，最终成长为盖世英雄，影响历史进程的热血励志故事</p>
				<!-- <h4>内容简介</h4>
				<p>故事背景取自秦灭六国到西楚霸王项羽灭秦这段英雄辈出的历史时期，时间跨度约30年，是一部以武侠为主题的全民型动画。各种历史事件和民间传说纷呈迭起，仗剑游走江湖的名士侠隐和对现代中国产生深远影响的诸子百家更是在这个合纵连横的大时代中悉数登场。
				</p>
				<p>百家争鸣的中华古文化在此激烈冲突碰撞，大时代恢宏磅礴的战争场面在连天烽火中震撼重现，江湖儿女的侠骨柔情于动荡乱世间绽放光华……少年天明如杂草般顽强生存于时代变革的乱世之中，面对强暴的政权、险恶的敌人，勇敢地与侠士们进行反抗，经历了一段不俗的遭遇。</p> -->
				<div class="role_link"><a href="role.jsp">更多>></a></div>
			</div>
			
		</div>
		<div class="cos_til"></div>
		<div class="cos_banner">
			<div class="cos_left" >
				
				<ul id="wrap" style="left:0px;transition: 1s">
					<li>
						<div class="border">
							<img src="image/chilian.jpg"/> 
							<div class="">
								<p class="" style="">【作者】沫沫</p>

							</div>
						</div>
					</li>
					<li>
						<div class="border">
							<img src="image/xuenv.jpg"/> 
							<div class="">
								<p class="" style="">【作者】斯蒂芬斯</p>

							</div>
						</div>
					</li>
					<li>
						<div class="border">
							<img src="images/16.jpg"/> 
							<div class="">
								<p class="" style="">【作者】丹佛斯</p>

							</div>
						</div>
					</li>
					<li>
						<div class="border">
							<img src="images/7.jpg"/> 
							<div class="">
								<p class="" style="">【作者】斯蒂芬斯</p>

							</div>
						</div>
					</li>
					<li>
						<div class="border">
							<img src="images/27.jpg"/> 
							<div class="">
								<p class="" style="">【作者】斯蒂芬斯</p>

							</div>
						</div>
					</li>
					<li>
						<div class="border">
							<img src="images/83.jpg"/> 
							<div class="">
								<p class="" style="">【作者】斯蒂芬斯</p>

							</div>
							</div>
					</li>
					<li>
						<a href="comic_cos.jsp" class="border" style="height: 180px;width: 280px;color: #669999;text-align: center;">
							 
							<div style="margin:80px auto;">查看更多>></div>
						</a>
					</li>	
				</ul>
				
				
				
				
			</div>
			<a  class="btn_l" id="btn_l" > <img src="image/prev.png" alt="" ></a>
			<a class="btn_r" id="btn_r"><img src="image/next.png" alt=""></a>
		</div>
		<div class="news_til"></div>
		<div class="news_banner">
			<div class="news_left" >
				<div class="intro">
						<span class="sImg">
							<a href="news.jsp">
							<img src="image/news_title.jpg" alt="">
							</a>
						</span>
						<div class="detail_intro">
							<div class="intro_title"><a href="news.jsp"><h1 style="text-align: left;margin: 0px 6%">秦时明月</h1></a></div>
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
			</div>
			<div class="news_right">
				<ul>
					<li><a href="https://baijiahao.baidu.com/s?id=1625170866769422076&wfr=spider&for=pc">《秦时明月》在国产动漫中排第几？</a></li>
					<li><a href="https://baijiahao.baidu.com/s?id=1600313593994152503&wfr=spider&for=pc">《秦时明月》关联作品（动画）介绍</a></li>
					<li><a href="https://wenku.baidu.com/view/e50f3d8c31b765ce04081411.html?fr=search">  浅析国产动画片《秦时明月》</a></li>
					<li><a href="https://www.jianshu.com/p/38f140ef03e4">《秦时明月》之后又一国产3D动画力作，颠覆你的童年 </a></li>
					
				</ul>
				<div class="news_link" style="margin-top:36px;margin-left:36px;"><a href="news.jsp">更多>></a></div>
			</div>
		</div>
		<div class="chat_til"></div>
		<div class="chat_banner">
			<div class="chat_left" >
				
			</div>
		</div>
	</div>
	
	
	<div class="footer">莯筱 | 地址：广东农工商职业技术学院</div>
</body>
</html>