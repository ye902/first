<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <ol>
     	<li>如果你准备<span style="color:red">登录</span>，却到了这里，说明你出错了，出错可能原因如下</br>
     		<ul>
     			<li>账号或密码为空</li>
     			<li>账号或密码错误</li>
     			<li>默认账号密码为：Admin；admin</li>
     		</ul>
     	</li>
     	</br>
     	</br>
     	<li>如果你准备<span style="color:red">修改密码</span>，却到了这里，说明你出错了，可能出错原因如下</br>
     		<ul>
     			<li>旧密码错误</li>
     			<li>新密码与密码确认不一致</li>
     			<li>默认旧密码为admin</li>
     			<li>未登录</li>
     		</ul>
     	</li>
     	</br>
     	</br>
     	<li>如果你准备<span style="color:red">退出操作</span>，却到了这里，说明你出错了，出错可能原因如下</br>
     		<ul>
     			<li>未登录</li>
     		</ul>
     	</li>
     	</br>
     	</br>
     	<li>如果你正在做<span style="color:red">删除</span>操作，却到了这里，说明你出错了，出错可能原因如下</br>
     		<ul>
     			<li>非管理员账号，没有权限删除任何信息</li>
     		</ul>
     	</li>
     	</br>
     	</br>
     	<li>如果你正在做<span style="color:red">新增管理员账号</span>操作，却到了这里，说明你出错了，出错可能原因如下</br>
     		<ul>
     			<li>非管理员账号，没有权限新增修改任何信息</li>
     			<li>该管理员账号，已存在</li>
     			<li>该账号正在被使用</li>
     			<li>你要批量删除的账号中，用账号正在被使用</li>
     			<li>账号密码填写错误</li>
     		</ul>
     	</li>
     </ol>
  </body>
</html>
