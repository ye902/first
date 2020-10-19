<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="sysManage.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="sysManage.jsp">首页</a></li>
                <li><a href="index.jsp" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
           	  	
	            	<c:if test="${empty admin}">
						<li><a href="sysManage.jsp">登录</a></li>
						<li><a href="#">修改密码</a></li>
						 <li><a href="#">退出</a></li>
					</c:if>
					<c:if test="${!empty admin}">
						<li><a href="#">${admin.adminId}</a></li>
						 <li><a href="${pageContext.request.contextPath}/sysUpdatePwd.jsp">修改密码</a></li>
						 <li><a href="${pageContext.request.contextPath}/adminQuit.do">退出</a></li>
					</c:if>
	                
	              
	              
                
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu" id ="menu">
                        <li><a href="${pageContext.request.contextPath}/showUsers.do?nowpage=1"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/showComments.do?nowpage=1"><i class="icon-font">&#xe005;</i>评论管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/sysShowImages.do?nowpage=1"><i class="icon-font">&#xe006;</i>图片管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/sysShowAdmins.do?nowpage=1"><i class="icon-font">&#xe006;</i>管理员账号信息</a></li>
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
    	<c:import url="sysLogin.jsp"></c:import>
   		
    </div>
    <!--/main-->
</div>

</body>
</html>