<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.GradePrice"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%@page import="com.jiajiao.bean.News"%>
<%@page import="com.jiajiao.bean.Notice"%>
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
	<meta name="viewport" content="width=1200">

	  <title>【吉师家教网】吉师家教网_免费找家教_四平在线一对一在线辅导</title>
	  <meta name="keywords" content="吉师家教，吉师家教兼职，四平兼职家教，家教">
	  <meta name="description"
			content="吉师家教网是莆田家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
	
    <link href="<%=basePath %>static/css/teach.css" rel="stylesheet">

	<link href="<%=basePath%>static/css/ui-choose.css" rel="stylesheet"  type="text/css"/>
	<link rel="stylesheet" href="<%=basePath%>static/css/buttons.css">

	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
	 <link href="<%=basePath%>static/css/home2.css" rel="stylesheet">
	
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
            <span class="png city_arrow">四平</span>
            <p>
				<a href="#" class="round_s city_btn" rel="nofollow">切换城市</a>
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
				<span><a href="<%=basePath%>teacher/teachersPage.action">找老师</a></span>
				<span><a href="<%=basePath%>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath%>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action" class="current_nav">云课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->

		<dl class="site_th w_1200">
			<dd>当前位置：
				<a href="<%=basePath%>">首页</a> 
				<span class="china">&gt;</span>云课堂</dd>
		</dl>

		<div id="content" style="width: 1200px;">
	    	<div  style="width: 900px;float: left;">
				<h4 class="l_th w_1200 l_th_w">
				    <b class="fl th_b"><%=request.getAttribute("newsType") %></b>
				</h4>
				<div style="margin-bottom: 30px;">
					<ul class="filelist">
                    <%
	                List<News> newsList = (List<News>)request.getAttribute("newsList");
	                if(newsList!=null){
	                	for(int j = 0 ; j<newsList.size();j++){	
	                		News news = newsList.get(j);
	                %>
		                <li class="doc">
			                <a href="<%=basePath %>paper/paperInfo.action?pId=<%=news.getnId() %>">
				                <i class="ico"></i>
				                <%=news.getTitle() %>
				                <span style="font-size: 14px;color: #CCC;">
				                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                	<%=news.getPubTime().substring(0,11) %>
				                </span>
			                </a>
			                
		                </li>
	                <%
	                	}
	                }
	                %>
	                </ul>
	                
				</div>
				<%=request.getAttribute("pageTool") %>
			</div>
	    	<div id="other" style="width: 270px;float: right;">
	      		<div id="problem" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				常见问题
      				</div>
      				<div class="hot-list">
		                <ul>
		                   <%
	      				List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
	      				if(noticeList!=null){
	      					for(int i = 0; i < noticeList.size(); i++){
	      						Notice notice2 = noticeList.get(i);
	      				%>
	      					<li>
			                    <a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice2.getnId() %>" title="<%=notice2.getTitle() %>">
			                      <span >
			                        <%=i+1 %>、
			                      </span>
			                      <%=notice2.getTitle() %>
			                    </a>
							</li>
	      				<%
	      					}
	      				}
	      				%>
		               </ul>
	              </div>
	    		</div>
	    		<div id="problem" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				关注微信
      				</div>

					<div style="padding:15px 15px 40px 15px;font-size:16px;">
						<p style="margin-bottom: 20px;">
							扫一扫关注<span style="color: red;"><strong>“吉师家教网&nbsp;——&nbsp;一对一辅导”</strong></span>微信公众号，方便获得家教信息、考试试题、教育文章精选。
						</p>
						<img alt="吉师家教二维码" src="<%=basePath %>static/img/wechat.jpg" width="220px;" height="220px;">
					</div>

	    		</div>
	    		<div id="paper" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				最新试题
      				</div>
      				
      				<div class="hot-list">
		                <ul>
		                <%
		                List<Paper> topTenPaperList = (List<Paper>)request.getAttribute("topTenPaperList");
		                if(topTenPaperList!=null){
		                	for(int i = 0; i < topTenPaperList.size(); i++){
		                		Paper paper = topTenPaperList.get(i);
		                %>
		                <li>
		                	<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" title="<%=paper.getTitle() %>">
		                    	<span ><%=i+1 %>、</span>
								<%=paper.getTitle() %>
		                    </a>
		                 </li>
		                <%
		                	}
		                }
		                %>
		               </ul>
	              </div>
      			  
	    		</div>
	    		<div id="paper" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
	      				
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				最新资讯
      				</div>
      				
      				<div class="hot-list">
		                <ul>
		                <%
		                List<News> topTenNewsList = (List<News>)request.getAttribute("topTenNewsList");
		                if(topTenNewsList!=null){
		                	for(int i = 0; i < topTenNewsList.size(); i++){
		                		News news = topTenNewsList.get(i);
		                %>
		                <li>
		                	<a href="<%=basePath %>news/newsInfo.action?nId=<%=news.getnId() %>" title="<%=news.getTitle() %>">
		                    	<span ><%=i+1 %>、</span>
								<%=news.getTitle() %>
		                    </a>
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
	    <div style="clear: both;padding-bottom: 30px;"></div>
	    <script src="<%=basePath %>static/js/ui-choose.js"></script>
		<script>
		// 将所有.ui-choose实例化
		$('.ui-choose').ui_choose();
		</script>
	<jsp:include page="footer.jsp"></jsp:include>
