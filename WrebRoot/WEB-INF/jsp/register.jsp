<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>【吉师家教网】吉师家教网_免费找家教_四平家教一对一在线辅导,四平领先的家教辅导服务专业平台</title>
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="width=1200">
		<meta name="keywords" content="家教，家教网，家教中心，吉师家教网">
		<meta name="description"
			content="吉师家教网是中国领先的家教辅导服务专业平台，服务覆盖全国，已为10多万学员提供上百种科目的数十万兼职大学生家教、专职教师和专业人士。上门授课，免费试教。182-5380-0650">
		<meta name="applicable-device" content="pc">
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>static/css/css.css">
		<script src="<%=basePath%>static/js/jquery-1.7.2.min.js"></script>
		<script src="<%=basePath%>static/js/jquery-ui.js"></script>

		<script src="<%=basePath%>static/js/yg_ac_utils.js"></script>

		<script src="<%=basePath%>static/js/jquery.placeholder.min.js"></script>
		<script src="<%=basePath%>static/js/jquery.cookie.min.js"></script>
		<script src="<%=basePath%>static/js/register.js"></script>
		<style>
			.errorMessage {
				clear: both;
				display: none;
				padding-left: 23px;
				height: 32px;
				font: 12px/ 32px "SimSun";
				color: #db0101;
				background: url(<%=basePath%>static/img/error.png) left center no-repeat;
			}
			
		</style>

		<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>

		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>static/css/code.css">
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
					在线1对1.上门家教，来吉师家教网！
				</h2>

				<div class="header_i_r fr">
					已有账号，请
					<a href="<%=basePath %>loginPage.action"
						class="btn_border round_m transition_a">登录</a>
				</div>
				<div class="header_i_r fr">
					没有账号？请
					<a href="<%=basePath %>registerPage.action"
						class="btn_border round_m transition_a">注册</a>
				</div>
			</div>
		</div>
		<!--end头文件-->
		<div class="w_1040 clearfix login_center"
			style="margin-bottom: 120px; margin-top: 5em;">
			<div class="fl w_410">
				<dl class="tab_nav reg_tab_nav_n">
					<dd class="do-ajax">
						<a href="javascript:void(0)" class="tab_light">我是学员<em
							class="png"></em>
						</a>
						<a href="javascript:void(0)" class="">我是教员<em class="png"></em>
						</a>
					</dd>
				</dl>
				<div class="login_fill @*tab_box*@">
					<div id="mobilereg">
						<div class="login_o">
							<div class="login_div">
								<label class="fl" for="mobilephone">
									手机号码
								</label>
								<div class="r_cell">
									<input type="text" class="login_text" id="mobilephone"
										name="mobilephone" placeholder="请输入您的手机号">
								</div>
								<p class="errorMessage"></p>
							</div>
						</div>

						<div class="login_o">
							<div class="login_div">
								<label class="fl" for="pass1">
									设置密码
								</label>
								<div class="r_cell">
									<input type="password" class="login_text password"
										id="Password" name="Password"
										placeholder="密码长度6~16位，数字、字母、字符等">
								</div>
								<p class="errorMessage"></p>
							</div>
						</div>


						<div class="login_o">
							<div class="login_div">
								<label class="fl" for="pass2">
									确认密码
								</label>
								<div class="r_cell">
									<input type="password" class="login_text password"
										id="cfmPassword" name="cfmPassword" placeholder="再次输入密码">
								</div>
								<p class="errorMessage"></p>
							</div>
						</div>

						<div class="login_o">
							<div class="login_div">
								<span class="login_ma orange_link"> 
									<a href="javascript:void(0)">
										<img id="codeImg" alt="验证码"  src="<%=basePath %>code.action" onclick="changeImg()"    title="看不清？点击换一张"/>
									</a> 
								</span>
								<label class="fl" for="ma3">
									图形验证码
								</label>
								<div class="r_cell">
									<input type="text" class="login_text" id="imgvefyData"
										name="imgvefyData" placeholder="请输入图形验证码">
								</div>
								<p class="errorMessage"></p>
							</div>
						</div>

						<div class="login_o_l orange_link">
							<div class="treaty">
								当前注册城市:
								<a href="javascript:void(0);" target="_blank">四平</a>
							</div>
						</div>

						<div class="login_o_l orange_link">

							<div class="treaty">
								<input type="checkbox" id="agree" name="agree" value="1"
									checked="checked" class="check">
								已阅读并同意
								<a href="javascript:void(0);" rel="nofollow"
									target="_blank">《用户协议》</a>和
								<a class="policy1" href="javascript:void(0);"
									rel="nofollow" style="" target="_blank">《学员须知》</a>
								<a class="policy2" href="javascript:void(0);"
									rel="nofollow" style="display: none;" target="_blank">《教员须知》</a>
								<a class="policy3" href="javascript:void(0);"
									rel="nofollow" style="display: none;" target="_blank">《辅导班须知》</a>
							</div>
							<p class="errorMessage"></p>
						</div>

						<div class="login_btn_div">
							<button type="submit" class="login_btn round_m transition_a"
								id="mobireg">
								注 册
							</button>
						</div>

					</div>
				</div>
				<!--end左边_标签内容-->
			</div>
			<!--end左边-->
			<div class="fr login_wechat">
				<img src="<%=basePath%>static/img/wechat.jpg" alt="扫描微信二维码"
					class="login_wechat_200" width="200" height="200">
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
				</span><span class="fl">版权所有 XXXXXXXXXXX有限公司－吉师家教网 <a
					href="javascript:void(0)">吉ICP备15011267号</a>
				</span>
			</div>
		</div>
		<!--end文件底-->

	</body>
</html>
