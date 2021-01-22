<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%@page import="com.jiajiao.bean.News"%>
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
		<meta name="viewport" content="width=1300">

		<meta name="360-site-verification"
			content="22009208546d72dc927d8f886d5d0bb1" />

	  <title>【吉师家教网】吉师家教网_免费找家教_四平在线一对一在线辅导</title>
	  <meta name="keywords" content="吉师家教，吉师家教兼职，四平兼职家教，家教">
	  <meta name="description"
			content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650">
			
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
			
			
	    <link href="<%=basePath %>static/css/base.css" rel="stylesheet">
	    <link href="<%=basePath %>static/css/home2.css" rel="stylesheet">
	    <link href="<%=basePath %>static/css/style.css" rel="stylesheet">
	    
	    <link href="<%=basePath %>static/css/teach.css" rel="stylesheet">
	    
	    <script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
	    <script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
		<script type="text/javascript" src="<%=basePath%>static/js/jquery.SuperSlide.2.1.2.js"></script>
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

			<h3 class="h_city fl">
				<span class="png city_arrow">四平</span>
				<p>
					<a href="javascript:void(0);" class="round_s city_btn"
						rel="nofollow">切换城市</a>
				</p>
			</h3>

			<img alt="" src="<%=basePath%>static/img/logo_contact.png">
			
			<div class="header_r fr">
				<span class="font_16">客服微信：</span>
				<img src="<%=basePath%>static/img/wechat.jpg" class="wechat_img" alt="吉师家教客服微信" width="80" height="80">

				<%
					Teacher teacher = (Teacher) session.getAttribute("teacher");
					Member member = (Member) session.getAttribute("member");
					if (member == null && teacher == null) {
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
				 
				<%
				 	} else {
				%>
				<span class="font_13">
                   <b class="orange_link">
                       <a href="<%=basePath%>logout.action" class="heada"> 退出</a>
                   </b>
                   <em class="china"></em>
                   <b class="orange_link">
                  	<%
                  		if (member != null) {
                  	%>
                      <a href="<%=basePath%>member/index.action" class="heada">我的</a>
                  	<%
                  		} else if (teacher != null) {
                  	%>
                      <a href="<%=basePath%>teacher/index.action" class="heada">我的</a>
                  	<%
                  		}
                  	%>
                   </b>
                 </span>
					<%
						}
					%>
			</div>
			<!--end头文件右-->
		</div>
	</div>
	<!--end头文件-->
	
	<div class="nav min_1200">
		<div class="tnav w_1200" id="slideNav">
			<span><a href="<%=basePath%>" >家教首页</a></span>
			<span><a href="<%=basePath%>costPage.action" >资费标准</a></span>
			<span><a href="<%=basePath%>teacher/teachersPage.action" >找老师</a></span>
			<span><a href="<%=basePath%>member/ordersPage.action">最新家教</a></span>
			<span><a href="<%=basePath%>institution/institutionPage.action" >辅导机构</a></span>
			<span><a href="<%=basePath %>paper/paperPage.action" class="current_nav">云课堂</a></span>
			<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
		</div>
	</div>
	<!-- end nav -->
	
	<dl class="site_th w_1200">
	    <dd>当前位置：<a href="<%=basePath %>">首页</a>
	    <span class="china">&gt;</span>云课堂</dd>
	</dl>
	
	<div id="content">
		<img alt="" src="<%=basePath %>static/img/paperbanner.jpg">

		<h4 class="l_th w_1200 l_th_w">
		    <b class="fl th_b">云课堂</b>
		</h4>
		<%
		List<Paper> oneGradePaperList = (List<Paper>)request.getAttribute("oneGradePaperList");
		List<Paper> SecondGradePaperList = (List<Paper>)request.getAttribute("SecondGradePaperList");
		List<Paper> thirdGradePaperList = (List<Paper>)request.getAttribute("thirdGradePaperList");
		List<Paper> fourthGradePaperList = (List<Paper>)request.getAttribute("fourthGradePaperList");
		List<Paper> fifthGradePaperList = (List<Paper>)request.getAttribute("fifthGradePaperList");
		List<Paper> sixthGradePaperList = (List<Paper>)request.getAttribute("sixthGradePaperList");
		List<Paper> newMoonPaperList = (List<Paper>)request.getAttribute("newMoonPaperList");
		List<Paper> lunarCalendarPaperList = (List<Paper>)request.getAttribute("lunarCalendarPaperList");
		List<Paper> gradePaperList = (List<Paper>)request.getAttribute("gradePaperList");
		List<Paper> higherPaperList = (List<Paper>)request.getAttribute("higherPaperList");
		List<Paper> highPaperList = (List<Paper>)request.getAttribute("highPaperList");
		List<Paper> threePaperList = (List<Paper>)request.getAttribute("threePaperList");
		Paper paper = null;
		%>
		<!--end标题-->
	
	    <!--大图片-->
		<dl class="th_t">
			<dt>
				小学
			</dt>
			<dd>
				<a href="<%=basePath %>paper/primaryPaperList.action?grade=1" target="_blank">一年级</a>
				<em>|</em>
				<a href="<%=basePath %>paper/primaryPaperList.action?grade=2" target="_blank">二年级</a>
				<em>|</em>
				<a href="<%=basePath %>paper/primaryPaperList.action?grade=3" target="_blank">三年级</a>
				<em>|</em>
				<a href="<%=basePath %>paper/primaryPaperList.action?grade=4" target="_blank">四年级</a>
				<em>|</em>
				<a href="<%=basePath %>paper/primaryPaperList.action?grade=5" target="_blank">五年级</a>
				<em>|</em>
				<a href="<%=basePath %>paper/primaryPaperList.action?grade=6" target="_blank">六年级</a>
				<em>|</em>
			</dd>
		</dl>

		<div class="w_1000 cf2">
			<div class="w_1000_m">
				<div class="t_list t_link_l">
					<dl class="t_th">
						<dd>
							一年级
						</dd>
						<dt>
							<a href="<%=basePath %>paper/primaryPaperList.action?grade=1" target="_blank">更多<em
								class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(oneGradePaperList!=null){
							for(int i=0;i<oneGradePaperList.size();i++){
								paper = oneGradePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end教材-->
				<div class="t_list">
					<dl class="t_th">
						<dd>
							二年级
						</dd>
						<dt>
							<a href="<%=basePath %>paper/primaryPaperList.action?grade=2" target="_blank">更多<em
								class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(SecondGradePaperList!=null){
							for(int i=0;i<SecondGradePaperList.size();i++){
								paper = SecondGradePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end练习-->
				<div class="t_list t_list_r">
					<dl class="t_th">
						<dd>
							三年级
						</dd>
						<dt>
							<a href="<%=basePath %>paper/primaryPaperList.action?grade=3" target="_blank">更多<em class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(thirdGradePaperList!=null){
							for(int i=0;i<thirdGradePaperList.size();i++){
								paper = thirdGradePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<div class="t_list t_list_r">
					<dl class="t_th">
						<dd>
							四年级
						</dd>
						<dt>
							<a href="<%=basePath %>paper/primaryPaperList.action?grade=4" target="_blank">更多<em class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(fourthGradePaperList!=null){
							for(int i=0;i<fourthGradePaperList.size();i++){
								paper = fourthGradePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<div class="t_list t_list_r">
					<dl class="t_th">
						<dd>
							五年级
						</dd>
						<dt>
							<a href="<%=basePath %>paper/primaryPaperList.action?grade=5" target="_blank">更多<em class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(fifthGradePaperList!=null){
							for(int i=0;i<fifthGradePaperList.size();i++){
								paper = fifthGradePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<div class="t_list t_list_r">
					<dl class="t_th">
						<dd>
							六年级
						</dd>
						<dt>
							<a href="<%=basePath %>paper/primaryPaperList.action?grade=6" target="_blank">更多<em class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(sixthGradePaperList!=null){
							for(int i=0;i<sixthGradePaperList.size();i++){
								paper = sixthGradePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end热点-->
			</div>
			<!--end一行内容-->
		</div>
		<!--end一行-->
		<dl class="th_t">
			<dt
				style="background: url(../static/img/paper2.png) no-repeat left center;">
				初中
			</dt>
			<dd>
				<a href="<%=basePath %>paper/juniorPaperList.action?grade=7" target="_blank">初一</a><em>|</em><a
					href="<%=basePath %>paper/juniorPaperList.action?grade=8" target="_blank">初二</a><em>|</em><a
					href="<%=basePath %>paper/juniorPaperList.action?grade=9" target="_blank">初三</a><em>|</em>
			</dd>
		</dl>

		<div class="w_1000 cf2 t_blue">
			<div class="w_1000_m">
				<div class="t_list t_link_l">
					<dl class="t_th">
						<dd>
							初一
						</dd>
						<dt>
							<a href="<%=basePath %>paper/juniorPaperList.action?grade=7" target="_blank">更多<em
								class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(newMoonPaperList!=null){
							for(int i=0;i<newMoonPaperList.size();i++){
								paper = newMoonPaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end教材-->
				<div class="t_list">
					<dl class="t_th">
						<dd>
							初二
						</dd>
						<dt>
							<a href="<%=basePath %>paper/juniorPaperList.action?grade=8" target="_blank">更多<em
								class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(lunarCalendarPaperList!=null){
							for(int i=0;i<lunarCalendarPaperList.size();i++){
								paper = lunarCalendarPaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end练习-->
				<div class="t_list t_list_r">
					<dl class="t_th">
						<dd>
							初三
						</dd>
						<dt>
							<a href="<%=basePath %>paper/juniorPaperList.action?grade=9" target="_blank">更多<em class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(gradePaperList!=null){
							for(int i=0;i<gradePaperList.size();i++){
								paper = gradePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end热点-->
			</div>
			<!--end一行内容-->
		</div>
		<!--end一行-->
		
		<dl class="th_t">
			<dt
				style="background: url(../static/img/paper3.png) no-repeat left center;">
				高中
			</dt>
			<dd>
				<a href="<%=basePath %>paper/highPaperList.action?grade=10" target="_blank">高一</a><em>|</em><a
					href="<%=basePath %>paper/highPaperList.action?grade=11" target="_blank">高二</a><em>|</em><a
					href="<%=basePath %>paper/highPaperList.action?grade=12" target="_blank">高三</a><em>|</em>
			</dd>
		</dl>
		<div class="w_1000 cf2 t_green">
			<div class="w_1000_m">
				<div class="t_list t_link_l">
					<dl class="t_th">
						<dd>
							高一
						</dd>
						<dt>
							<a href="<%=basePath %>paper/highPaperList.action?grade=10" target="_blank">更多<em
								class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(higherPaperList!=null){
							for(int i=0;i<higherPaperList.size();i++){
								paper = higherPaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end教材-->
				<div class="t_list">
					<dl class="t_th">
						<dd>
							高二
						</dd>
						<dt>
							<a href="<%=basePath %>paper/highPaperList.action?grade=11" target="_blank">更多<em
								class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(highPaperList!=null){
							for(int i=0;i<highPaperList.size();i++){
								paper = highPaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end练习-->
				<div class="t_list t_list_r">
					<dl class="t_th">
						<dd>
							高三
						</dd>
						<dt>
							<a href="<%=basePath %>paper/highPaperList.action?grade=12" target="_blank">更多<em class="china">&gt;</em>
							</a>
						</dt>
					</dl>
					<ul class="cf2 t_list">
						<%
						if(threePaperList!=null){
							for(int i=0;i<threePaperList.size();i++){
								paper = threePaperList.get(i);
						%>
						<li>
							<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
								<em>&gt;</em><%=paper.getTitle() %>
							</a>
						</li>						
						<%
							}
						}
						%>
					</ul>
				</div>
				<!--end热点-->
			</div>
			<!--end一行内容-->
		</div>
		<!--end一行-->
		
		<%
		List<News> primaryNewsList = (List<News>)request.getAttribute("primaryNewsList");
		List<News> juniorNewsList = (List<News>)request.getAttribute("juniorNewsList");
		List<News> highNewsList = (List<News>)request.getAttribute("highNewsList");
		News news = null;
		%>
		<div class="cf2 t_link">
			<dl class="t_th_d">
				<dd>
					<em>&gt;</em>教育资讯
				</dd>
			</dl>
			<div class="t_link_w">
				<dl class="t_link t_link_l">
					<dt>
						<span>小学资讯</span><a style="float: right" href="<%=basePath %>news/newsList.action?degree=1" target="_blank">更多&gt;</a>
					</dt>
					<dd>
						<ul class="cf2 t_list">
							<%
							if(primaryNewsList!=null){
								for(int i = 0 ; i < primaryNewsList.size();i++){
									news = primaryNewsList.get(i);
							%>
								<li>
									<a href="<%=basePath %>news/newsInfo.action?nId=<%=news.getnId() %>" target="_blank">
									<em>&gt;</em><%=news.getTitle() %></a>
								</li>
							<%
								}
							}
							%>

						</ul>
					</dd>
				</dl>
				<dl class="t_link">
					<dt>
						<span>初中资讯</span><a style="float: right" href="<%=basePath %>news/newsList.action?degree=2" target="_blank">更多&gt;</a>
					</dt>
					<dd>
						<ul class="cf2 t_list">
							<%
							if(juniorNewsList!=null){
								for(int i = 0 ; i < juniorNewsList.size();i++){
									news = juniorNewsList.get(i);
							%>
								<li>
									<a href="<%=basePath %>news/newsInfo.action?nId=<%=news.getnId() %>" target="_blank">
									<em>&gt;</em><%=news.getTitle() %></a>
								</li>
							<%
								}
							}
							%>
						</ul>

					</dd>
				</dl>
				<dl class="t_link t_link_r">
					<dt>
						<span>高中资讯</span><a style="float: right" href="<%=basePath %>news/newsList.action?degree=3" target="_blank">更多&gt;</a>
					</dt>
					<dd>

						<ul class="cf2 t_list">
							<%
							if(highNewsList!=null){
								for(int i = 0 ; i < highNewsList.size();i++){
									news = highNewsList.get(i);
							%>
								<li>
									<a href="<%=basePath %>news/newsInfo.action?nId=<%=news.getnId() %>" target="_blank">
									<em>&gt;</em><%=news.getTitle() %></a>
								</li>
							<%
								}
							}
							%>
						</ul>

					</dd>
				</dl>
			</div>
			<!--end宽度-->
		</div>
		
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
