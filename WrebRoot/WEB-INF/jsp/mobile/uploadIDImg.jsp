<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
			【吉师家教】教员身份认证
		</title>

		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">			

		<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet">
		<script src="<%=basePath %>static/mobile/js/jquery-1.8.3.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/jquery.form.js">
		</script>
		<!--引入WebUploader-->
		<link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/webuploader.css">
		<script type="text/javascript" src="<%=basePath %>static/mobile/js/webuploader.js">
		</script>
		<style type="text/css">
			.upload-file{ background-color: #efefef; widows: 100%; border-radius:
			4px; /*padding: 50px 0;*/ width: 45px; margin: 50px 0; /*text-align: left;*/
			float: left; }
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
				身份认证
			</h3>
		</header>
		<section style="padding:0;">
			<div class="xx_xg">
				<form id="xuqiu_form" method="post" action="https://m.jiajiao114.com/putian/Teacher/RenZheng.html"
				enctype="multipart/form-data">
					<ul>
						<li>
							<h3>
								<i>
									状态
								</i>
							</h3>
							
							<div class="item-content">
								<p style="padding: 15px 0 10px;color: red;">
								<%
							if(teacher.getIsCheck()==0){
							%>
									<strong>未认证</strong>
							<%}else{ %>
									<strong>已认证</strong>
							<%} %>
								</p>
							</div>
							
						</li>
						<li>
							<h3>
								<i>
									上传证件资料
								</i>
							</h3>
						</li>
						<li>
							<div id="zs" class="item-content">
								<label for="zstjk">
								</label>
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<tbody>
										<tr>
											<td align="center" width="80%" style="padding-top:15px;">
												身份证正面
											</td>
										</tr>
										<tr>
											<td align="center">
												<!--认证中和已认证状态，不能再认证-->
												<%
												if(teacher.getIsCheck()==0){
												%>
												<div class="upload-file webuploader-container" id="certificate_idcard"
												title="+">
													<div class="webuploader-pick">
														+
													</div>
													<div id="rt_" style="position: absolute; top: 0px; left: 2.29688px; width: 41px; height: 39px; overflow: hidden; bottom: auto; right: auto;">
														<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple"
														accept="">
														<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);">
														</label>
													</div>
												</div>
												<%
												}
												%>
												<%
												if("".equals(teacher.getIdPhoto()) ){
												%>
												<img id="confirm_id" src="<%=basePath %>static/mobile/img/sl_1.jpg" style="max-width: 70%;padding-top:20px;">
												<%
												}else{
												%>
												<img id="confirm_id" src="<%=basePath %>static/teacherimg/idimg/<%=teacher.getIdPhoto() %>" style="max-width: 70%;padding-top:20px;">
												<%
												}
												%>
											</td>
										</tr>
										
									</tbody>
								</table>
								<p style="clear:both; text-align:center;">
								</p>
								<div class="srk" style="height:auto;">
									<p style="color:#f00;">
										合格证件要求：
									</p>
									<p style="color:#f00;">
										1、确保姓名和注册姓名一致
									</p>
									<p style="color:#f00;">
										2、确保姓名、号码等内容清晰可见
									</p>
									<p style="color:#f00;">
										3、文件限jpg、jpeg、gif、png格式
									</p>
									<p style="color:#f00;">
										4、证件有效期三个月以上
									</p>
								</div>
								<p>
								</p>
								<p style="clear:both; text-align:center;">
								</p>
							</div>
						</li>
						<!--认证中和已认证状态，不能再认证-->
					</ul>
				</form>
			</div>
			<div>
				<p style="font-size:14px;color:#666666;text-align: center;padding-top:10px;">
					© 吉师家教版权所有
				</p>
				<p style="text-align: center;font-size: 14px;color: #ff6600;">
					请家教热线：
					<a href="tel:150-6033-8989" style="font-size: 16px;color: #ff6600;">
						150-6033-8989
					</a>
				</p>
				<p style="text-align: center;font-size: 14px;color: #777777;">
					(点击拨打，时间：9:00 - 20:00，节假无休)
				</p>
				<p style="text-align: center;font-size: 14px;color: #666666;margin-top:10px;margin-bottom:20px;">
					<img width="80%" src="<%=basePath %>static/img/wechat.jpg" alt="吉师家教网">
				</p>
			</div>
		</section>
		
		<script>
			// 初始化Web Uploader
			var uploader = WebUploader.create({

				// 选完文件后，是否自动上传。
				auto: true,
				// swf文件路径
				swf: '/Uploader.swf',
				// 文件接收服务端。
				server: 'mPersonIDUpload.action',
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				pick: '.upload-file',

				// 只允许选择图片文件。
				accept: {
					title: 'Images',
					extensions: 'gif,jpg,jpeg,png'
				}
			});
			uploader.on('uploadSuccess',
			function(file, response) {
				if (response.success) {
					var btn = getUploadBtn(file);
					btn.find('.webuploader-pick').text('+');
					btn.next().attr('src', response.url).show();
				
					$('#confirm_id').attr("src", response.url);
				} else {
					alert(response.message);
				}
			});
			uploader.on('uploadError',
			function(file, response) {
				alert('Oh，上传出错咯！');
			});
			uploader.on('uploadComplete',
			function() {
				console.log('upload complete！');
			});
			uploader.on('fileQueued',
			function(file) {
				var btn = getUploadBtn(file);
				btn.find('.webuploader-pick').text('...');
				uploader.option('formData', {
					'belong_type': getUploadBtn(file, true),
					'compress_sizes': [270, 180]
				});
			});
			function getUploadBtn(file, onlyGetId) {
				var btn;
				if (onlyGetId) {
					btn = $('#rt_' + file.source.ruid).parent().attr('id');
				} else {
					btn = $('#rt_' + file.source.ruid).parent();
				}
				return btn;
			}
		</script>
	</body>

</html>