<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript">

    	function checkAll(){
    		var allCheck = document.getElementById('allChoose');
    		var checks=document.getElementsByName('otc');
    		
    			for(var i=0;i<checks.length;i++){
    				if(allCheck.checked==true){
    					checks[i].checked=true;
    				}else{
    					checks[i].checked=false;
    				}
    			}
    		
    		
    	}
    	function todeleteImage() {
        var msg = "确认删除选中试题";
        var imgids = "";
        var delBtn = document.getElementById('batchDel');
        var checks=document.getElementsByName('otc');
        for(var i=0;i<checks.length;i++){
        	if(checks[i].checked){
        		imgids=imgids+checks[i].value+",";
        	}      	
        }
        
        if(imgids==null){
	 		//则提示信息
	 		alert("请选择要删除的数据!");
	 	}
	 	else{
	 		//如果有选中的则触发请求进行删除
			delBtn.href = "${pageContext.request.contextPath}/sysImageDelMore.do?imgids="+imgids;
	 	} 
        
        }

    </script>
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
                        <li><a href="${pageContext.request.contextPath}/sysShowImages.do?nowpage=1" ><i class="icon-font">&#xe006;</i>图片管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/sysShowAdmins.do?nowpage=1"><i class="icon-font">&#xe006;</i>管理员账号信息</a></li>
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <!--/sidebar-->
    <div class="main-wrap">
       <div class="crumb-wrap">
            <div class="crumb-list"><a href="sysManage.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">图片管理</span></div>
        </div>
        <!--  
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                        	<th width="120">选择分类:</th>
                        	<td>
                                <select name="search-sort" id="">
                                    <option value="">全部</option>
                                    <option value="19">用户管理</option>
                                    <option value="20">评论管理</option>
                                    <option value="20">图片管理</option>
                                </select>
                            </td>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        -->
        <div class="result-wrap">
            <form action="" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        
                        <a id="batchDel" href="javascript:void(0)" onclick="todeleteImage()">批量删除</a>

                    </div>
                </div>
                <div class="result-content">
              
                    <table class="result-tab" width="100%">
                    	<thead>
                        <tr>
                            <th class="tc" width="5%"><input class="allChoose"  id="allChoose" name="" type="checkbox" onclick="checkAll()"></th>
                            
                            <th>图片ID</th>
                            <th>图片路径</th>
                            
                            <th>图片作者</th>
                            <th>点击数</th>
                           <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                      	
							<c:forEach items="${imgsPage.list}" var="imgemp">
							 
								 <tr>
								 	<td class="tc" ><input name="otc" value="${imgemp.imgId}" type="checkbox"></td>
								     <td>${imgemp.imgId}</td>
								     <td>${imgemp.src}</td>
								     <td>${imgemp.author}</td>
								     <td>${imgemp.num}</td>
								     <td>
		                                <a class="link-del" href="${pageContext.request.contextPath}/sysImageDel.do?imgId=${imgemp.imgId}&nowpage=${imgsPage.pageIndex}">删除</a>
		                            </td>
								</tr>
							</c:forEach>
						</tbody>
                    </table>
                    <div class="list-page">
	                    <a href="${pageContext.request.contextPath}/sysShowImages.do?nowpage=${imgsPage.pageIndex-1}">上一页</a> 
	                    <a href="${pageContext.request.contextPath}/sysShowImages.do?nowpage=${imgsPage.pageIndex+1}">下一页</a>
	                    ${imgsPage.pageNumber} 条 ${imgsPage.pageIndex}/${imgsPage.pageCount} 页
                    </div>
                </div>
            </form>
            
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>