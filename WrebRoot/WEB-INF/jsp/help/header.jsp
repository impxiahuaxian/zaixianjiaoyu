<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Orders"%>
<%@page import="com.jiajiao.bean.Member"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=1200">

	<title>四平·家教网_免费找家教_【吉师家教网】_四平·一对一在线辅导</title>
	<meta name="keywords" content="四平·家教，四平·家教兼职，四平·兼职家教">
	<meta name="description" content="吉师家教网是四平·家教行业权威上门和在线辅导平台,自2003年创立以来,已为四平·数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<LINK rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/pageSwitch.min.css">
	
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
	<script src="<%=basePath%>static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/jquery.artDialog.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/jQuery.rTabs.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/search_tab.js" type="text/javascript"></script>
	
		
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?20766a1a5bc02124297ce7be22ff84b1";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
		
  </head>
  
  <body>
  
   
		<div class="header min_1200">
			<div class="w_1200">
				<h1 class="logo fl png_img"><a href="#"><img src="<%=basePath%>static/img/logo2.png" alt="吉师家教"></a></h1>
				<h3 class="h_city fl">
            <span class="png city_arrow">四平·</span>
            <p>
				<a href="#" class="round_s city_btn" rel="nofollow">切换城市</a>
			</p>
        </h3>

				<img alt="" src="<%=basePath %>static/img/logo_contact.png">
				<div class="header_r fr">
					<span class="font_16">客服微信：</span>
					<img src="<%=basePath%>static/img/wechat.jpg" class="wechat_img" alt="吉师家教客服微信" width="80" height="80">

					<%
					Member member =  (Member)session.getAttribute("member");
					Teacher teacher = (Teacher)session.getAttribute("teacher");
					if(member==null && teacher==null){
					 %>
					<span class="font_13">
                    <b class="orange_link">
                        <a href="<%=basePath%>loginPage.action" class="heada"> 登录</a>
                    </b>
                    <em class="china"></em>
                    <b class="orange_link">
                        <a href="<%=basePath%>registerPage.action" class="heada">注册</a>
                    </b>
                    </span>
					 
					<%}else if(member!=null && teacher==null){ %>
					 <span class="font_13">
                    <b class="orange_link">
                        <a href="<%=basePath%>logout.action" class="heada"> 退出</a>
                    </b>
                    <em class="china"></em>
                    <b class="orange_link">
                        <a href="<%=basePath%>member/index.action" class="heada">我的</a>
                    </b>
                    </span>
					
					<%}else if(member==null && teacher!=null){ %>
					 <span class="font_13">
                    <b class="orange_link">
                        <a href="<%=basePath%>logout.action" class="heada"> 退出</a>
                    </b>
                    <em class="china"></em>
                    <b class="orange_link">
                        <a href="<%=basePath%>teacher/index.action" class="heada">我的</a>
                    </b>
                    </span>
                    <%} %>
					
				</div>
				<!--end头文件右-->
			</div>
		</div>
		<!--end头文件-->

		<!--end头文件-->

		<div class="nav min_1200">
		    <div class="tnav w_1200" id="slideNav">
    			<span><a href="<%=basePath %>" class="current_nav">家教首页</a></span>
				<span><a href="<%=basePath %>costPage.action">资费标准</a></span>
				<span><a href="<%=basePath %>teacher/teachersPage.action">找老师</a></span>
				<span><a href="<%=basePath %>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath %>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action" target="_blank">吉师课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
		    </div>
		</div>
		
		<!-- end nav -->