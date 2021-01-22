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
		<meta http-equiv="Cache-Control" content="no-transform">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
		<title>
			【吉师家教】教师个人中心
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
		<script type="text/javascript" src="<%=basePath %>static/mobile/js/jweixin-1.3.2.js">
		</script>
		<style type="text/css">
			#picker{ position: relative; } #upfile{ position: absolute; top: 0; left:
			0; width: 100%; height: 100%; opacity: 0; }
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
				个人中心
				<a href="<%=basePath %>order/mOrderList.action?courseId=0&areaId=0&teacherType=0&gender=2&kmdl=2&location=0" class="tc">
					最新家教
				</a>
			</h3>
		</header>
		<section style="padding:0;">
			<div class="grzx_tx">
				<div class="tx_xx">
					<div id="picker">
						<div id="avatar-box">
							<%
							if(teacher.getGender()==1 && "".equals(teacher.getPersonImg()) ){
							%>
							<img id="photo" src="../static/img/male.png" >
							<%
							}else if(teacher.getGender()==0 && "".equals(teacher.getPersonImg())){
							%>
							<img id="photo" src="../static/img/w.png" >
							<%
							}else{
							%>
							<img id="photo" src="<%=basePath%>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>" >
							<%
							}
							%>
							<p style="width:90px;text-align:center;font-size:12px;">
								<%=teacher.getTeacherName() %>
							</p>
						</div>
						<form action="" method="post" enctype="multipart/form-data" id="upload-form">
							<input type="file" name="file" id="upfile" onchange="TemporaryMedia()">
						</form>
					</div>
					<div class="con1">
						<h3>
						</h3>
						<p>
							教员ID：
							<samp>
								<%=teacher.getTeacherId() %>
							</samp>
						</p>
						<%
							if(teacher.getIsCheck()==1){
						%>
						<p>
							身份审核：
							<samp class="ls">
							
								已审核
							</samp>
						</p>
						<%
						}else{
						%>
						<p>
							身份审核：
							<samp class="ls">
							
								待审核
							</samp>
						</p>
						<p style="color:#f81d1d;margin-top:0;width:90%;font-size:12px;">
							48小时内会审核，若未审核请检查简历是否完善
						</p>	
						<%
						} 
						%>
						
					</div>
					<div class="con2">
						<p>
							<a href="<%=basePath %>teacher/mUpdateTeacherManage.action">
								修改简历
							</a>
						</p>
					</div>
				</div>
			</div>
			<div class="bg1">
			</div>
			<div class="bg1">
			</div>
			<div class="xx_list">
				<ul>
					<li>
						<a href="<%=basePath %>teacher/mTeacherInfo.action?tId=<%=teacher.getTeacherId() %>&isTeacherCenter=1">
							<span class="xtb16">
								我的信息
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>teacher/mUploadIDPage.action">
							<span class="xtb25">
								身份认证
							</span>
							<span style="color:#aaaaaa;margin-left:20px;">
							<%
							if("".equals(teacher.getIdPhoto())){
							%>
								（未上传）
							<%
							}
							%>
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>teacher/mTakeOrderListPage.action">
							<span class="xtb21">
								预约记录
							</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0)">
							<span class="xtb14">
								学员评价
							</span>
						</a>
					</li>
					<li>
						<a href="<%=basePath %>teacher/mUpdatePwdPage.action">
							<span class="xtb9">
								修改密码
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
					<li>
						<a href="<%=basePath %>mLogout.action">
							<span class="xtb15">
								退出
							</span>
						</a>
					</li>
				</ul>
			</div>
			<div style="background:#f2f2f2">
				<p style="font-size:14px;color:#666666;text-align: center;padding-top:20px;">
					© 吉师家教 版权所有
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
				<p style="text-align: center;font-size: 14px;color: #666666;">
					微信公众号：吉师家教ydjj
				</p>
				<p style="text-align: center;font-size: 14px;color: #666666;margin-top:10px;padding-bottom: 20px;">
					<img width="80%" src="<%=basePath %>static/img/wechat.jpg" alt="">
				</p>
			</div>
		</section>
		<script src="<%=basePath %>static/mobile/js/jquery.Jcrop.js">
		</script>
		<link rel="stylesheet" href="<%=basePath %>static/mobile/css/jquery.Jcrop.css">
		<script src="<%=basePath %>static/mobile/js/jquery.form.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/layer.js">
		</script>
		<style type="text/css">
			#upload-box{ position: fixed; top: 0; left: 0; width: 100%; height: 100%;
			background-color: #000; display: none; z-index: 2000; } #crop-btn-box::before,
			#crop-btn-box::after{ content: ''; height: 0; width: 100%; display: block;
			clear: both; } #cancel-crop{ color: #fff; padding: 0 20px; height: 50px;
			line-height: 50px; float: left; } #finish-crop{ color: #2ccb76; padding:
			0 20px; height: 50px; line-height: 50px; float: right; }
		</style>
	
		<script>
			//上传头像
			var $window = $(window);
			var winW = $window.width();
			var winH = $window.height();
			var loadIndex = 0;
			function TemporaryMedia() {
				//判断上传控件中是否选择了图片  
				var image = $("#upfile").val();
				if ($.trim(image) == "") {
					alert("请选择图片！");
					return false;
				}
				loadIndex = layer.load(1);
				$("#upload-form").ajaxSubmit({
					type: "POST",
					url: 'mPersonPhotoUpload.action',
					dataType: 'json',
					success: function(data) {
						layer.close(loadIndex);
						if (data.success) {
							$('#photo').attr("src", data.url);
							
						}else{
							alert(data.message);
							return;
						}
						
					},
					error: function(data) {},
					async: true
				});

			}
			
		</script>

	</body>

</html>