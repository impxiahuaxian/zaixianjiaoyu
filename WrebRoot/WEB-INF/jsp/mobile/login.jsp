<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta chartset="utf-8">
	<title>
		吉师家教网-登录-四平家教网
	</title>
	
	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">	
	
	<link href="<%=basePath %>static/mobile/css/site.css" rel="stylesheet">
	<link href="<%=basePath %>static/mobile/css/mobilecss.css" rel="stylesheet" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<meta name="keywords" content="四平家教，四平家教兼职，四平兼职家教，家教">
	<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2003年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">
	<meta name="author" content="[家教 家教网 家教服务]">
	<meta name="copyright" content="吉师家教网">
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
		<header class="topheader transparentbg header">
			<div class="headl">
				<a href="<%=basePath %>mRegisterPage.action" class="heada">
					<i class="back_hico hico">
					</i>
				</a>
			</div>
		</header>
		<header id="gheader">
		</header>
	
		<!-- 中间 -->
		<div class="signpg">
			<!-- banner -->
			<div class="signbn">
				<img src="<%=basePath %>static/mobile/img/loginPage.jpg" alt="" class="fpic">
				<div class="signbn_decs">
					<img src="<%=basePath %>static/img/logo.png" alt="" class="bnlogo">
				</div>
			</div>
			<!-- end banner -->
			<!-- 一行 -->
			<div class="signbox">
					<h2 class="signtitle">
						用户登录
					</h2>
					<div class="signlist">
						<div class="dl">
							<i class="phone_dtico dtico">
							</i>
							<div class="dd">
								<input type="text" id="UserName" name="UserName" placeholder="用户名/手机号" class="dtint" autocapitalize="off">
							</div>
						</div>
						<div class="dl">
							<i class="pw_dtico dtico">
							</i>
							<div class="dd">
								<input type="password" id="Password" name="Password" placeholder="请输入密码" class="dtint"
								autocapitalize="off">
							</div>
						</div>
					</div>
					<div class="signtr20 signtr">
						<div class="form_warning Wrong" id="errMsg" style="float: left;">
						</div>
						
					</div>
					<div class="signtr20 signtr">
						<input id="login_btn" value="立 即 登 录" class="big_ogbtn">
					</div>
					<div class="signtr">
						<a href="#" class="ogtxt">
							找回密码
						</a>
						<i class="spc">
						</i>
						<a href="<%=basePath %>mRegisterPage.action" class="ogtxt">
							立即注册
						</a>
					</div>
			</div>
			<!-- end 一行 -->
		</div>
		<!--end 中间-->
		<div class="quitrow">
			©吉师家教网版权所有&nbsp;&nbsp;&nbsp;
			<a href="<%=basePath %>">
				电脑版
			</a>
			<div>
				<a>
					<img src="<%=basePath %>static/mobile/img/wechat40.png" alt="webchat" class="ico40">
					客服微信号：ydjjcom
				</a>
			</div>
		</div>

		<!--end中间-->
		<script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/ac_wap_login.js">
		</script>
	</body>

</html>
