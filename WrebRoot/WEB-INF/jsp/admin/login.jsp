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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="<%=basePath%>static/back/assets/css/bootstrap.min.css"
			rel="stylesheet" />
		<link rel="stylesheet"
			href="<%=basePath%>static/back/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=basePath%>static/back/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet"
			href="<%=basePath%>static/back/assets/css/ace.min.css" />
		<link rel="stylesheet"
			href="<%=basePath%>static/back/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet"
			href="<%=basePath%>static/back/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="<%=basePath%>static/back/css/style.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath%>static/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="<%=basePath%>static/back/assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="<%=basePath%>static/back/assets/js/html5shiv.js"></script>
		<script src="<%=basePath%>static/back/assets/js/respond.min.js"></script>
		<![endif]-->
		<script src="<%=basePath%>static/back/js/jquery-1.9.1.min.js"></script>
		<script src="<%=basePath%>static/js/jquery.cookie.min.js"></script>
		<script src="<%=basePath%>static/js/register.js"></script>
		<script src="<%=basePath%>static/back/assets/layer/layer.js"
			type="text/javascript"></script>
		<title>吉师家教后台登录</title>

	</head>

	<body class="login-layout Reg_log_style">
		<div class="logintop">
			<span>欢迎吉师家教后台管理界面</span>
			<ul>
				<li>
					<a href="#">返回首页</a>
				</li>
				<li>
					<a href="#">帮助</a>
				</li>
				<li>
					<a href="#">关于</a>
				</li>
			</ul>
		</div>
		<div class="loginbody">
			<div class="login-container">
				<div class="space-6"></div>

				<div class="position-relative">
					<div id="login-box" class="login-box widget-box no-border visible">
						<div class="widget-body">
							<div class="widget-main">
								<h4 class="header blue lighter bigger">
									<i class="icon-coffee green"></i> 管理员登录
								</h4>

								<div class="login_icon">
									<img src="/static/img/logo3.png" />
								</div>

								<form class="">
									<fieldset>
										<ul>
											<li class="frame_style form_error">
												<label class="user_icon"></label>
												<input name="用户名" type="text" id="username" />
												<i>用户名</i>
											</li>
											<li class="frame_style form_error">
												<label class="password_icon"></label>
												<input name="密码" type="password" id="password" />
												<i>密码</i>
											</li>
											<li class="frame_style form_error">
												<label class="Codes_icon"></label>
												<input name="验证码" type="text" id="imgvefyData" />
												<i>验证码</i>
												<div class="Codes_region">
													<img id="codeImg" alt="验证码"
														src="<%=basePath %>/code.action"
														onclick="changeImg()" title="看不清？点击换一张">
												</div>
											</li>

										</ul>
										<div class="space"></div>

										<div class="clearfix">


											<button type="button"
												class="width-35 pull-right btn btn-sm btn-primary"
												id="login_btn">
												<i class="icon-key"></i> 登录
											</button>
										</div>

										<div class="space-4"></div>
									</fieldset>
								</form>

								<div class="social-or-login center">
									<span class="bigger-110">通知</span>
								</div>

								<div class="social-login center">
									本网站系统不再对IE8以下浏览器支持，请见谅。
								</div>
							</div>
							<!-- /widget-main -->

							<div class="toolbar clearfix">

							</div>
						</div>
						<!-- /widget-body -->
					</div>
					<!-- /login-box -->
				</div>
				<!-- /position-relative -->
			</div>
		</div>
		<div class="loginbm">
			版权所有 2019
			<a href="">吉师家教网有限公司</a>
		</div>
		<strong></strong>
	</body>

</html>
<script>
	var isSubmit = false;

	$('#login_btn').on('click', function() {
		var num = 0;
		var str = "";
		$("input[type$='text'],input[type$='password']").each(function(n) {
			if($(this).val() == "") {

				layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
					title: '提示框',
					icon: 0,
				});
				num++;
				return false;
			}
		});
		
		if(num > 0) {
			return false;
		} else {
		
			isSubmit = true;
        	$this = $(this);
        	$this.val('正在提交中...').attr('disabled', true);
		
			var d = {
	            IsAsync: true,
	            username: $("#username").val(),
	            password: $('#password').val(),
	            verifyCode:$("#imgvefyData").val()
	        };
	        
	        $.post('gologin.action', d, function (res) {
	        	
	            if (res.success) {
		            layer.alert('登录成功！', {
						title: '提示框',
						icon: 1,
					});
					
	        		location.href = "index.action";
					layer.close(index);
	            	
	            } else {
	            	isSubmit = false;
	                $this.val('登录').attr('disabled', false);
	                alert(res.message);
	            	
	            }
	        });
			
			
		}

	});
	$(document).ready(function() {
		$("input[type='text'],input[type='password']").blur(function() {
			var $el = $(this);
			var $parent = $el.parent();
			$parent.attr('class', 'frame_style').removeClass(' form_error');
			if($el.val() == '') {
				$parent.attr('class', 'frame_style').addClass(' form_error');
			}
		});
		$("input[type='text'],input[type='password']").focus(function() {
			var $el = $(this);
			var $parent = $el.parent();
			$parent.attr('class', 'frame_style').removeClass(' form_errors');
			if($el.val() == '') {
				$parent.attr('class', 'frame_style').addClass(' form_errors');
			} else {
				$parent.attr('class', 'frame_style').removeClass(' form_errors');
			}
		});
	})
</script>
