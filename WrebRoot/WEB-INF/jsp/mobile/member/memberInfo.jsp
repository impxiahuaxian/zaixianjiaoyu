<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.District"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Member member = (Member)session.getAttribute("member");
if(member==null){
	response.sendRedirect(basePath+"mobile.action");
	return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>
		【吉师家教】个人信息
	</title>
	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
 	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">	
	
	<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta name="format-detection" content="telephone=no">
	<meta name="format-detection" content="email=no">
	<meta name="msapplication-tap-highlight" content="no">
	<script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
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
		
		<!-- ntextpop -->
		<div class="ntextpop" id="messagebox">
			<span class="ntextpop_content">
			</span>
		</div>
		<!-- end ntextpop -->
		<header>
			<h3>
				<a href="javascript:history.back(-1)" class="fh">
					返回
				</a>
				我的资料
				<a href="<%=basePath %>mobile.action" class="tc" id="current-city">
					首页
				</a>
			</h3>
		</header>
		<!--end header-->
		<!-- 中间 -->
		<!-- 一行 -->
		<div class="wpbox">
			<div class="dtlist">
				<div class="dtitem">
					<a href="<%=basePath %>member/mUpdateNamePage.action" class="dl">
						<div class="dt">
							联系人
						</div>
						<div class="dd">
							<%=member.getName() %>
						</div>
						<i class="rgt">
						</i>
					</a>
				</div>
				<div class="dtitem">
					<a  href="javascript:void(0);" class="dl">
						<div class="dt">
							联系手机
						</div>
						<div class="dd">
							<%=member.getPhone() %>
						</div>
						
					</a>
				</div>
				<div class="dtitem">
					<a href="<%=basePath %>member/mUpdatePwdPage.action" class="dl">
						<div class="dt">
							密码
						</div>
						<div class="dd">
							***************
						</div>
						<i class="rgt">
						</i>
					</a>
				</div>
				
				<div class="dtitem">
					<a href="<%=basePath %>member/mUpdateAreaPage.action" class="dl">
						<div class="dt">
							授课区域
						</div>
						<div class="dd">
							<%=member.getDistrict() %>
						</div>
						<i class="rgt">
						</i>
					</a>
				</div>
				<div class="dtitem">
					<a href="<%=basePath %>member/mUpdateAddressPage.action" class="dl">
						<div class="dt">
							大概地址
						</div>
						<div class="dd">
							<%=member.getAddress() %>
						</div>
						<i class="rgt">
						</i>
					</a>
				</div>
				<div class="dtitem">
					<a href="<%=basePath %>member/mUpdateWxPage.action" class="dl">
						<div class="dt">
							微信号
						</div>
						<div class="dd">
							<%=member.getWxNumber() %>
						</div>
						<i class="rgt">
						</i>
					</a>
				</div>
			</div>
		</div>
		<!-- end 一行 -->
		<!--end 中间-->
		<script>
			document.addEventListener("touchstart",function() {},true);
		</script>
		<script src="<%=basePath %>static/mobile/js/tool.js">
		</script>
	</body>

</html>