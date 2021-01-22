<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<title>【吉师家教网】四平家教网_免费找家教_四平家教一对一在线辅导</title>
		<meta name="keywords" content="家教，家教网，家教中心，,四平家教，兼职家教">
		<meta name="description"
			content="四平家教网是中国领先的家教辅导服务专业平台，服务覆盖全国，已为10多万学员提供上百种科目的数十万兼职大学生家教、专职教师和专业人士。上门授课，免费试教。182-5380-0650">
		<meta name="applicable-device" content="pc">
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
		<script src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
		<script src="<%=basePath%>static/js/jquery-ui.js"></script>

		<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>

		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
		<script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
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
		<div class="header_i min_1200">
			<div class="w_1200">
				<h2 class="fl logo_text">
					在线1对1.上门家教，来四平家教网！
				</h2>

				<div class="header_i_r fr">
					已有账号，请
					<a href="<%=basePath%>loginPage.action"
						class="btn_border round_m transition_a">登录</a>
				</div>
				<div class="header_i_r fr">
					没有账号？，请
					<a href="<%=basePath%>registerPage.action"
						class="btn_border round_m transition_a">注册</a>
				</div>
			</div>
		</div>
		<!--end头文件-->


		<style>
			.wraploginErrorMessage {
				height: 25px;
				width: 297px;
				opacity: 1;
				margin-left: 30px;
				margin-bottom: 7px;
				position: relative;
			}
			
			.loginErrorMessage {
				height: 25px;
				line-height: 25px;
				font-size: 16px;
				color: red;
				background: #feecec;
				border: 1px solid #fe999f;
				text-indent: 1em;
				position: absolute;
				top: 0;
				left: 0;
				width: 360px;
			}
		</style>
		
		<div class="w_1040 clearfix login_center">
			<div class="login_fill fl w_410">
			<dl class="tab_nav reg_tab_nav_n">
					<dd class="do-ajax">
						<a href="javascript:void(0)" class="tab_light">我是学员<em
							class="png"></em>
						</a>
						<a href="javascript:void(0)" class="">我是教员<em class="png"></em>
						</a>
					</dd>
				</dl>
				<div id="wraploginErrorMessage" class="wraploginErrorMessage"></div>
				<div class="login_o">
					<div class="login_div">
						<label class="fl" for="UserName">
							手机号
						</label>
						<div class="r_cell">
							<input type="text" class="login_text" id="UserName"
								name="UserName" placeholder="请输入手机号" autocomplete="off">
						</div>
					</div>
				</div>

				<div class="login_o">
					<div class="login_div">
						<label class="fl" for="Password">
							密码
						</label>
						<div class="r_cell">
							<input type="password" class="login_text" id="Password"
								name="Password" placeholder="请输入您的密码">
						</div>
					</div>
				</div>

				<div class="link_line orange_link">
					<span>当前登录城市:<a href="javascript:void(0)" target="_blank">四平</a>
					</span>
					<span style="margin-left: 167px;"><a
						href="<%=basePath %>registerPage.action">免费注册</a>&nbsp;&nbsp;<a
						href="#">忘记密码</a>
					</span>
				</div>

				<div class="login_btn_div">
					<input type="button" id="login_btn"
						class="login_btn round_m transition_a" value="立 即 登 录">
				</div>
			</div>
			<!--end左边-->
			<div class="fr login_wechat">
				<img src="<%=basePath %>static/img/wechat.jpg"
					alt="" class="login_wechat_200" width="200" height="200">
				<h4 class="orange_text">
					如有问题寻求帮助
				</h4>
				<p>
					请扫描微信二维码
				</p>
			</div>
			<!--end右边-->
		</div>
		<!--end中间区域-->

		<div class="min_1200 footer_i clearfix">
			<div class="w_1200">
				<span class="fr"><a href="javascript:void(0)">XX安备 XXXXXXXXXX号</a>
				</span><span class="fl">版权所有 XXXXXXXXXXX有限公司－四平家教网 <a
					href="javascript:void(0)">XXXXXXXX号</a>
				</span>
			</div>
		</div>
		<!--end文件底-->

		<script src="<%=basePath%>static/js/jquery.cookie.min.js"></script>
		<script src="<%=basePath%>static/js/jquery.placeholder.min.js"></script>
		<script src="<%=basePath%>static/js/ac_login.js"></script>

	</body>
</html>
