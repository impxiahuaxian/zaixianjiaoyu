<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			吉师家教-注册-吉师家教网
		</title>
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		
		<link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
		name="viewport">
		<meta content="yes" name="apple-mobile-web-app-capable">
		<meta content="black" name="apple-mobile-web-app-status-bar-style">
		<meta name="format-detection" content="telephone=no">
		<meta name="format-detection" content="email=no">
		<meta name="msapplication-tap-highlight" content="no">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<meta name="keywords" content="家教，家教网，家教中心，吉师家教网，吉师家教网，兼职">
		<meta name="description" content="吉师家教网是吉师家教行业权威上门和在线辅导平台,自2003年创立以来,已为吉师数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">
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
		<!-- header -->
		<header class="header">
			<div class="headl" style="background-color: #3ac779;">
				<a onclick="goBack();" class="heada">
					<i class="back_hico hico">
					</i>
				</a>
			</div>
			 <script>
	
	            function goBack() {
	                window.history.back();
	            }
	        </script>
			<h1 class="headtitle">
				<img src="<%=basePath %>static/img/logo2.png" alt="" class="headlogo">
			</h1>
			<div class="headr">
			</div>
		</header>
		<!--end header-->
		<!-- 中间 -->
		<div class="signpg" id="tabBox" style="margin-top: 55px;">
			<!-- banner -->
			<div class="signbn">
				<ul class="signhd hd">
					<li data-id="1" class="on">
						<a href="javascript:void(0)">
							学员注册
						</a>
						<em class="png">
						</em>
					</li>
					<li data-id="2" class="">
						<a href="javascript:void(0)">
							教员注册
						</a>
						<em class="png">
						</em>
					</li>
				</ul>
			</div>
			<!-- end banner -->
			<!-- 一行 -->
			<div class="tempWrap" style="overflow: hidden; position: relative; height: 491px;">
				<div class="bd" id="tabBox-bd" style="width: 1920px; position: relative; overflow: hidden; padding: 0px; margin: 0px; display: -webkit-box; transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
					<div style="display: block; vertical-align: top; width: 640px;">
						<div class="signbox box1">
							<form action="<%=basePath %>mregister">
								<div class="mt60 signlist">
									<div class="dl">
										<i class="phone_dtico dtico">
										</i>
										<div class="dd">
											<input type="text" id="mobilephone" placeholder="手机号" class="dtint">
										</div>
										<div class="common-icon re_hint">
										</div>
									</div>
									<div class="dl">
										<i class="pw_dtico dtico">
										</i>
										<div class="dd">
											<input type="password" id="Password" placeholder="请输入密码" class="dtint">
										</div>
										<div class="common-icon re_hint">
										</div>
									</div>
									<div class="dl" id="dlImageCode">
										<i class="captcha_dtico dtico">
										</i>
										<div class="dd">
											<input type="text" id="imgvefyData" placeholder="图形验证码" class="dtint">
										</div>
										<div class="common-icon re_hint">
										</div>
										<div class="captchabox">
											<img id="codeImg" alt="验证码" src="<%=basePath %>code.action" onclick="changeImg()" title="看不清？点击换一张">
										</div>
									</div>
									
									<div class="form_warning Wrong">
									</div>
								</div>
								<div class="signtr">
									<input type="button" id="mobireg" value="注册学员" class="big_ogbtn">
								</div>
								<div class="signlaw signtr">
									点击注册表示你已阅读并同意
									<a href="#" rel="nofollow" class="oglink">
										用户注册协议
									</a>
									和
									<a href="#" rel="nofollow" class="oglink">
										学员须知
									</a>
								</div>
								<div class="signtr">
									<a href="<%=basePath %>mLoginPage.action" class="gylinebtn">
										用户登录
									</a>
								</div>
							</form>
						</div>
					</div>
					<div style="display: block; vertical-align: top; width: 640px;">
						<div class="signbox box2">
							<form action="<%=basePath %>mregister">
								<div class="mt60 signlist">
									<div class="dl">
										<i class="phone_dtico dtico">
										</i>
										<div class="dd">
											<input type="text" id="mobilephone2" placeholder="手机号" class="dtint">
										</div>
										<div class="common-icon re_hint">
										</div>
									</div>
									<div class="dl">
										<i class="pw_dtico dtico">
										</i>
										<div class="dd">
											<input type="password" id="Password2" placeholder="请输入密码" class="dtint">
										</div>
										<div class="common-icon re_hint">
										</div>
									</div>
									
									<div class="calljobPop dl">
										<i class="user_dtico dtico">
										</i>
										<div class="dd">
											<input type="button" placeholder="教员身份" class="dtint" id="selectedJop">
										</div>
										<i class="rgt">
										</i>
									</div>
									<div class="form_warning2 Wrong">
									</div>
								</div>
								<div class="signtr">
									<input type="button" id="mobireg2" value="注册教员" class="big_ogbtn">
								</div>
								<div class="signlaw signtr">
									点击注册表示你已阅读并同意
									<a href="#" class="oglink" rel="nofollow">
										用户注册协议
									</a>
									和
									<a href="#" class="oglink" rel="nofollow">
										教员须知
									</a>
								</div>
								<div class="signtr">
									<a href="<%=basePath %>mLoginPage.action" class="gylinebtn">
										用户登录
									</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- end 一行 -->
		</div>
		<!--end 中间-->
		<!-- ntpop -->
		<div class="cpop" id="jobPop">
			<div class="popmc">
				<div class="ntpop">
					<div class="boxmt">
						<div class="wbw">
							<h3 class="ogtitle">
								选择教员身份
							</h3>
						</div>
						<i class="closejobPop closepop">
						</i>
					</div>
					<ul class="jobselist" id="jobselist">
						<li class="fore1">
							<i class="ico">
							</i>
							<div class="name">
								大学生
							</div>
							<p>
								（在校大学生、研究生）
							</p>
						</li>
						<li class="selected fore2">
							<i class="ico">
							</i>
							<div class="name">
								专职教师
							</div>
							<p>
								（在职、培训机构、离退休、进修老师）
							</p>
						</li>
						
					</ul>
					<div class="confirmjobPop closejobPop ntpopbtn">
						确定
					</div>
				</div>
			</div>
		</div>
		<!-- end ntpop -->
		<!-- ntextpop -->
		<div class="ntextpop" id="messagebox">
			<span class="ntextpop_content">
			</span>
		</div>
		<!-- end ntextpop -->
		<script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/TouchSlide.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/tool.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/jquery.placeholder.min.js">
		</script>
		<script src="<%=basePath %>static/js/jquery.cookie.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/jquery.automail.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/yg_newRefer.js">
		</script>
		<script src="<%=basePath %>static/js/yg_ac_utils.js">
		</script>
		<script type="text/javascript">
			var acUtils = new PPDAcUtils("v1.0");
		</script>
		<script src="<%=basePath %>static/mobile/js/yg_ac_wap_register.js">
		</script>
	</body>

</html>
