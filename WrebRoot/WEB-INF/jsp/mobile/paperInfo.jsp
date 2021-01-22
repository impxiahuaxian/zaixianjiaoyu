<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%=basePath%>static/mobile/css/news.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="<%=basePath%>static/mobile/css/news(1).css" rel="stylesheet">
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
   		<%
		Paper paper = (Paper)request.getAttribute("paper");
		if(paper!=null){
		%>
		<header id="gheader">
			<section class="header">
				<aside class="l_header">
					<a class="go_back" style="cursor:pointer;" onclick="goBack();" title="返回">
					</a>
				</aside>
				<h1 class="g_tit">
					试题
				</h1>
				<aside class="r_home">
	
	            <a  href="<%=basePath %>mobile.action" title="首页">
	            <img alt="首页" src="<%=basePath %>static/mobile/img/home.png">
	            </a>
	       		</aside>
				<script>
					function goBack() {
						window.history.back();
					}
				</script>
			</section>
		</header>
		<!--end全局头部-->
		
		<section class="in_main_b6">
			<dl class="art_detail">
				<dt>
					<h2>
						<%=paper.getTitle() %>
					</h2>
					<aside class="color9">
						浏览量：<%=paper.getView() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=paper.getPubTime() %>
					</aside>
					<aside class="color9">
						下载密码：<%=paper.getDownPwd() %>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=paper.getDownLink() %>" style="color: #31ab68">点击下载</a>
					</aside>
				</dt>
				<dd>
				<%=paper.getContent() %>
				</dd>
			</dl>
		</section>
		<!--end中间-->
		<%
		}
		%>
		
	</body>

</html>