<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
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
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1.0, user-scalable=no"
		name="viewport">
		<title>
			【吉师家教】_快速请家教
		</title>
		<link href="<%=basePath %>static/mobile/css/jz.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet" type="text/css">
	
		<script src="<%=basePath %>static/mobile/js/jquery-1.8.3.min.js">
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
	
		<!-- UI组件库 1.0 -->
		<script src="<%=basePath %>static/mobile/js/main.js">
		</script>
		<script type="text/javascript" src="<%=basePath %>static/mobile/js/jweixin-1.3.2.js">
		</script>

		<style>
			.m_search input,.m_search select{ width:40%;display:inline; font-size:
			16px; } .m_search select{ background:url(static/mobile/img/jt_h_8.png)
			no-repeat right center; background-color:transparent; border-color:transparent;
			-webkit-appearance: none; -moz-appearance:none }
		</style>

  </head>
  
  <body class="xuqiu_body" style="position:static;">
		<header>
			<h3>
				<a href="javascript:history.go(-1);" class="fh">
					返回
				</a>
				快速请家教
			 	<a style="float: right;color: white;" href="<%=basePath %>mobile.action" title="首页">
	          	 首页
	            </a>
			</h3>
		</header>
		<form method="post" id="xuqiu_form">
			<div class="m_search" style="margin: 13px;">
				<ul>
					<li>
						<input name="name" id="name" type="text" placeholder="您的姓名">
					</li>
					<li>
						<input name="phone" id="phone" type="text" placeholder="手机号码" maxlength="11"
						value="">
					</li>
					<li>
						<input name="wxNumber" id="wxNumber" type="text" placeholder="微信号" maxlength="30"
						value="">
					</li>
					<li>
						<select id="snode" name="snode">
							<option value="0">
								选择年级
							</option>
							<%
							List<DictInfo> kemudaleiList = (List<DictInfo>)request.getAttribute("kemudaleiList"); 
							if(kemudaleiList!=null){
								for(int i = 0 ; i < kemudaleiList.size();i++){
									DictInfo dictInfo  = kemudaleiList.get(i);
							%>
								<option value="<%=dictInfo.getDictId() %>">
									<%=dictInfo.getContent() %>
								</option>
							<%
								}
							}
							%>
						</select>
						<select id="snode_child" name="teachingCourse" style="margin-top: 20px;">
							<option value="0">
								选择科目
							</option>
						</select>
					</li>
					
				</ul>
				<input type="hidden" value="" id="teachingCourseName" name="teachingCourseName">
			</div>
			<a href="javascript:checkValue();" id="submit">
				提交需求
			</a>
		</form>
		<div id="zzc" style="width:100%;height:100%;position: absolute;top:0;left:0;z-index:99;display:none;background:#fff">
		</div>
		<div style="margin:30px 13px 30px 13px;color:#999;font-size:12px;text-align:center;">
			备注：此提交订单是针对于家长订单提交，教员可到最新学员查看订单
		</div>
		<div>
			<p style="font-size:14px;color:#666666;text-align: center;padding-top:10px;">
				© 吉师家教版权所有
			</p>
			<p style="text-align: center;font-size: 14px;color: #ff6600;">
				请家教热线：
				<a href="tel:021-61300114" style="font-size: 16px;color: #ff6600;">
					150-6033-8989
				</a>
			</p>
			<p style="text-align: center;font-size: 14px;color: #777777;">
				(点击拨打，时间：9:00 - 20:00，节假无休)
			</p>
			<p style="text-align: center;font-size: 14px;color: #666666;margin-top:10px;padding-bottom:20px;">
				<img width="80%" src="<%=basePath %>static/img/wechat.jpg" alt="">
			</p>
		</div>
		<script src="<%=basePath %>static/mobile/js/jquery.cookie.js">
		</script>
		<script>
			$("#snode").change(function() {
				var pid = $(this).val();
				var id = $(this).attr("id") + "_child";
				$.ajax({
					url: "getCourseBykemudalei.action",
					type: "post",
					data: "id=" + pid,
					success: function(data) {

						var content="<option value=\"0\">选择科目</option>";
						
						for(var i=0;i<data.length;i++){
							content = 
								content+"<option value="+data[i].courseId+">"+data[i].courseName+"</option>";
						}
					
						$("#" + id).html(content);
					}
				})
			});

			function checkValue() {

				var name = $("#name").val();
				var wxNumber = $("#wxNumber").val();
				var phone = $("#phone").val();
				var teachingCourse = $("#snode_child").val();
				$("#teachingCourseName").val($("#snode_child option:selected").text());

				if (name == "" || phone == "" || teachingCourse == 0 || wxNumber=="") {
					alert("所有字段都要正确填写！");
					return;
				}

				if (!isMobile(phone)) {
					alert('请输入正确的手机号码');
					return;
				}

				$('#submit').attr('disabled', true);
				$("#submit").css("pointer-events", "none");

				var url = 'mFastOrderTeacher.action';
				
				$.post(url, $('#xuqiu_form').serialize(),
				function(res) {
					console.log(res);
					if(res.success){
						window.location.href="mOrderTeacherSuccess.action";
					}else{
						alert(res.message);
					}
					
				});
			}


			function isMobile(mobile) {
				if (mobile.length != 11) {
					return false;
				}
				var myreg = /^1[3456789]\d{9}$/;

				if (!myreg.test(mobile)) {
					return false;
				}
				return true;
			}

		
		
		</script>
	</body>

</html>