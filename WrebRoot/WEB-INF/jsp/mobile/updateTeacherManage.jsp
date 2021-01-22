<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher teacher = (Teacher)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect(basePath+"mobile.action");
	return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            【吉师家教】教师个人中心
        </title>
        
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">	
        
        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/css114.css">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
        name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta name="format-detection" content="telephone=no">
        <meta name="format-detection" content="email=no">
        <meta name="msapplication-tap-highlight" content="no">
        <script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/jquery-ui.js">
        </script>
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
  
	<body class="whbg" style="">
        <header>
			<h3>
				<a href="javascript:history.back(-1)" class="fh">
					返回
				</a>
				简历中心
				<a href="<%=basePath %>mobile.action" class="tc">
					首页
				</a>
			</h3>
		</header>
        <!--end header-->
        <!-- 中间 -->
        <!-- 一行 -->
        <div class="wpbox">
            <div class="boxmt">
                <div class="wbw">
                    <h3 class="boxmtitle">
                       最近登录时间：<%=teacher.getLastLoginTime() %>
                    </h3>
                </div>
  
            </div>
            <ul class="gonav">
                <li onclick="window.location.href =&#39;<%=basePath %>teacher/mUpdateTeacherInfoPage.action&#39;">
                    <i class="userinfo2_goico goico">
                    </i>
                    <div class="gg">
                        个人信息
                    </div>
                    <i class="rgt">
                    </i>
                </li>
                <li onclick="window.location.href = &#39;<%=basePath %>teacher/mUpdateEducatePage.action&#39;">
                    <i class="studyinfo_goico goico">
                    </i>
                    <div class="gg">
                        教育信息
                    </div>
                    <i class="rgt">
                    </i>
                </li>
                <li onclick="window.location.href = &#39;<%=basePath %>teacher/mUpdateTeachingPage.action&#39;">
                    <i class="techinfo_goico goico">
                    </i>
                    <div class="gg">
                        授课信息
                    </div>
                    <i class="rgt">
                    </i>
                </li>
            </ul>
        </div>
        <!-- end 一行 -->
        <!-- 一行 -->
        <!-- end 一行 -->
        <!--end 中间-->
        <script src="<%=basePath %>static/mobile/js/tool.js">
        </script>
 
    </body>

</html>
