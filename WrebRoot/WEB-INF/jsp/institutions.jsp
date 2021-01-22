<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Institution"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
			  content="吉师家教网是莆田家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650">
			
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
			
			
	    <link href="<%=basePath %>static/css/base.css" rel="stylesheet">
	    <link href="<%=basePath %>static/css/home2.css" rel="stylesheet">
	    <link href="<%=basePath %>static/css/style.css" rel="stylesheet">
	    
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
			<span><a href="<%=basePath%>institution/institutionPage.action" class="current_nav">辅导机构</a></span>
			<span><a href="<%=basePath %>paper/paperPage.action" >云课堂</a></span>
			<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
		</div>
	</div>
	<!-- end nav -->
	
	<dl class="site_th w_1200">
	    <dd>当前位置：<a href="<%=basePath %>">首页</a><span class="china">&gt;</span>辅导机构</dd>
	</dl>
	
	
	<div id="content">
		<img alt="" src="<%=basePath %>static/img/fudaojigoubanner.jpg">

		<h4 class="l_th w_1200 l_th_w">
		    <b class="fl th_b">辅导机构</b>
		</h4>
		<!--end标题-->
	
		<div class="page-main home-main">
			<div class="content">
				<div id="comment"
					class="home-review-box xm-plain-box J_itemBox J_reviewBox is-visible">
					<div class="box-bd J_brickBd">
						<ul class="review-list clearfix">
						<%
						List<DictInfo> dictList = (List<DictInfo>)request.getAttribute("dictList");
						
						List<Institution> institutionList = (List<Institution>)request.getAttribute("institutionList");
						if(institutionList!=null){
							for(int i = 0;i<institutionList.size();i++){
								Institution institution = institutionList.get(i);
						%>
							<li class="review-item review-item-first">
								<div class="figure figure-img">
									<a href="<%=basePath %>institution/institutionInfo.action?iId=<%=institution.getiId() %>">
										<img class="figure-goodsimg-4733"
											src="<%=basePath %>static/institutionimg/<%=institution.getLogo() %>" alt="<%=institution.getiName() %>"
											style="display: inline;width: 280px;height: 240px;">
									</a>
								</div>
								<p class="review" style="color: #999">
									机构名：
									<span><%=institution.getiName() %></span>
								</p>
								<p class="review" style="color: #999">
									教学阶段：
									<%
									String[] kemudaleis =  institution.getKemudalei().split(",");
									
									for(int k = 0; k < kemudaleis.length;k++){
										for(int j = 0; j < dictList.size(); j++){
											if( dictList.get(j).getDictId() == Integer.parseInt(kemudaleis[k]) ){
										%>
										<span><%=dictList.get(j).getContent() %></span>
										<%
											break;
											}
										}
									}
									%>
								</p>
								<p class="review" style="color: #999">
									教学科目：
									<span><%=institution.getCourse() %></span>
								</p>
								<p class="review" style="color: #999; height: 48px;">
									联系电话：
									<span><%=institution.getContactPhone()%></span>
								</p>
								<p class="review" style="color: #999">
									地址：
									<span>
									<%
				                    if(institution.getAreaId()==1){
				                    %>
				                    	城厢区
				                    <%} %>
				                    <%if(institution.getAreaId()==2){ %> 
				                    	荔城区
				                    <%} %>
				                    <%if(institution.getAreaId()==3){ %> 
				                    	秀屿区
		        					<%} %>
		        					<%if(institution.getAreaId()==4){ %> 
		        						涵江区
					        		<%} %>
					        		<%if(institution.getAreaId()==5){ %> 
					        			仙游县
		        					<%} %>
									-<%=institution.getAddress() %>...
									</span>
								</p>
								<p class="review">
									<a href="<%=basePath %>institution/institutionInfo.action?iId=<%=institution.getiId() %>"
										title=""></a>
								</p>
							</li>
						<%
							}
						}
						%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
			<jsp:include page="footer.jsp"></jsp:include>