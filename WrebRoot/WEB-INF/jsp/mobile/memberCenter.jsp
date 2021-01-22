<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Member"%>
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
		<meta http-equiv="Cache-Control" content="no-transform">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
		<title>
			【吉师家教】学员中心
		</title>
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		
		<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet">
		<script src="<%=basePath %>static/mobile/js/jquery-1.8.3.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/layer.js">
		</script>
		<link rel="stylesheet" href="<%=basePath %>static/mobile/css/layer.css" id="layuicss-skinlayercss">
		<script src="<%=basePath %>static/mobile/js/jquery.cookie.js">
		</script>
		<style>
			*{font-family: "Microsoft YaHei"} .nav1 dl{height:60px;} .nav1 dl dt {line-height:
			60px;font-size: 16px;color:#333333;margin-left: 5%;} .nav1 dl dt a {height:
			28px;width: 50px;background: #ff9000;color: #ffffff;float: right;margin-top:
			16px;margin-right: 5%;border-radius: 3px;line-height: 28px;text-align:
			center;font-size: 14px;} #tx {padding-top: 15px;display: flex;width: 90%;margin:0
			auto;} #stoutxiang {width: 30px;height: 30px;} #mobile {line-height: 30px;margin-left:
			5px;font-size: 18px;color: #fff;} #con {background-color: #2aca74;} #box
			{height: 70px;width: 90%;margin: 0 auto;background-color: #fff;position:
			relative;top:20px;border-radius: 5px;box-shadow:0px 0px 1px #ccc;} #box
			p {color: #f18101;} #p1 {position: absolute;top: 12px;left: 10px;font-size:
			16px;} #p2 {position: absolute;bottom: 12px;left: 10px;font-size: 15px;}
			#btn {width: 59px;height: 28px;border-radius: 15px;background-color: #f66b0f;color:#fff;position:
			absolute; right:10px;top:21px;font-size: 14px;} #bc1 {width: 100%;height:
			30px;background-color: #f0f0f0;} #con2 {width: 100%;height: 74px;background-color:
			#fff;display: flex;} #con2 div{width: 33%;height: 54px;margin-top: 10px;text-align:
			center;} #con2 img{width: 30px;height: 30px;} #con2 p {font-size: 14px;color:
			#333333;} #item1{border-right: 1px solid #dddddd;} #item2{border-right:
			1px solid #dddddd;} #item3{border:0;} #vip{height: 60px;width: 100%;background-color:
			#2aca74;position: relative;overflow: hidden;} #vit_type{display: flex;height:
			30px;width: 33%;background-color: #fff;border-radius: 15px;position: absolute;right:
			-15px;color: #2aca74;font-size: 14px;} #szs{width: 18px;} #sjt{width: 6px;}
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
				学员中心
				<a href="<%=basePath %>mobile.action" class="tc" id="current-city">
					首页
				</a>
			</h3>
		</header>
		<section style="padding:0;">
			<div class="bg1">
			</div>
			<div class="nav1">
				<dl>
					<dt>
						用户：<%=member.getPhone() %>
						<a href="javascript:void(0)" onclick="quit()">
							退出
						</a>
					</dt>
				</dl>
			</div>
			<div class="bg1">
			</div>
			<div class="xx_list">
				<ul>
					<li>
						<a href="<%=basePath %>member/mPubOrderPage.action">
							<span class="xtb18">
								发布需求
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>member/mMemberInfo.action">
							<span class="xtb16">
								我的信息
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=0&areaId=0&teacherType=0&gender=2&kmdl=2&location=0">
							<span class="xtb17">
								挑选老师
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>member/mOrderList.action">
							<span class="xtb18">
								我的订单
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>member/mAppointTeacherList.action">
							<span class="xtb21">
								预约教员记录
							</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="xtb14">
								评价教员
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>member/mUpdatePwdPage.action">
							<span class="xtb19">
								重置密码
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>mFocusWeChat.action">
							<span class="xtb20">
								关注微信公众号
							</span>
						</a>
					</li>
				</ul>
			</div>
			<div style="background:#f2f2f2;margin-bottom:30px;">
				<p style="font-size:14px;color:#666666;text-align: center;padding-top:20px;">
					© 吉师家教版权所有
				</p>
				<p style="text-align: center;font-size: 14px;color: #ff6600;">
					请家教热线：
					<a href="tel:150-6033-8989" style="font-size: 16px;color: #ff6600;">
						150-6033-8989
					</a>
				</p>
				<p style="text-align: center;font-size: 14px;color: #666666;">
					(点击拨打，时间：9:00 - 20:00，节假无休)
				</p>
				<p style="text-align: center;font-size: 14px;color: #666666;margin-top:10px;margin-bottom:70px;">
					<img width="80%" src="<%=basePath %>static/img/wechat.jpg" alt="">
				</p>
			</div>
		</section>
		<nav>
			<ul>
				<li class="bs">
					<a href="<%=basePath %>mFastAppointTeacher.action">
						快速请家教
					</a>
				</li>
				<li class="cs">
					<a href="<%=basePath %>teacher/mTeacherList.action?courseId=0&areaId=0&teacherType=0&gender=2&kmdl=2&location=0">
						<span id="beixuan">
							在线挑老师
						</span>
					</a>
				</li>
				
			</ul>
		</nav>
		<script type="text/javascript">
			function quit() {
				layer.open({
					title: '吉师家教提醒',
					content: '您确定要退出登录吗？',
					btn: ['确定', '取消'],
					yes: function() {
						location.href = '<%=basePath %>mLogout.action';
					},
					no: function() {}
				});
			}
		</script>
	</body>

</html>
