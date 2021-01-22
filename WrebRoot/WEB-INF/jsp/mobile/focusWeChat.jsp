<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Cache-Control" content="no-transform">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
		<meta name="title" content="上海教员登陆_家教114">
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1.0, user-scalable=no"
		name="viewport">
		<title>
			【吉师家教】_订单提交成功
		</title>
		<script src="<%=basePath %>static/mobile/js/jquery-1.9.1.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/jquery.md5.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/layer.js">
		</script>
		<link rel="stylesheet" href="<%=basePath %>static/mobile/css/layer.css" id="layuicss-skinlayercss">
		<link href="<%=basePath %>static/mobile/css/jz.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet" type="text/css">
		<style>
			.title1 {font-size: 14px;color:#212121;margin-top: 15px;margin-left: 20%;}
			.title2 {width:60%;margin:0 auto;font-size: 14px;color:#212121;margin-top:
			15px;}
		</style>
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
		<header>
			<h3>
				<a href="javascript:history.back(-1)" class="fh">
					返回
				</a>
				关注微信
				<a href="<%=basePath %>mobile.action"
				class="tc" id="current-city">
					首页
				</a>
			</h3>
		</header>
		
		<p class="title1" style="margin-top:0;">
			关注微信公众号：
			<font color="#31ab68">
				吉师家教
			</font>
		</p>
		<p class="title1" style="margin-top:0;margin-bottom:15px;">
			绑定手机号，随时随地接收订单动态。
		</p>
		<p style="text-align:center;">
			<img width="60%" src="<%=basePath %>static/img/wechat.jpg" alt="">
		</p>
		<p class="title2">
			打开微信&gt;&gt;右上角加号&gt;&gt;扫一扫&gt;&gt;右上角相册&gt;&gt;选择照片
		</p>
		<p>
		</p>
		<a href="<%=basePath %>static/img/wechat.jpg" download="img" id="submit2"
		style="width:60%;margin: 0 auto;margin-top:20px;">
			长按图片扫描二维码
		</a>
		<a href="javascript:testApp(&#39;weixin://&#39;)" id="submit2" style="background-color:#2aca74;width:60%;margin: 0 auto;margin-top:15px;">
			打开微信
		</a>
		<script type="text/javascript">
			function testApp(url) {

				var ifr = document.createElement("iframe");
				ifr.setAttribute('src', url);
				ifr.setAttribute('style', 'display:none');
				document.body.appendChild(ifr);

			}
		</script>
		
	</body>

</html>