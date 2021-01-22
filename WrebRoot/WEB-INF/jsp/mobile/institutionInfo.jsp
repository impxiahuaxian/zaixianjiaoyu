<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Institution"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			【吉师家教】
		</title>
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		
		<meta name="keywords" content="四平家教中心,四平家教机构">
		<meta name="description" content="吉师家教-始终在您身边的四平家教中心。全市各区教员上门一对一辅导，名校生、专业老师、才艺教员一应俱全。">
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
		<script src="<%=basePath %>static/mobile/js/api">
		</script>
		<script type="text/javascript" src="<%=basePath %>static/mobile/js/getscript">
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
  
  <body>
    	<header class="headbar">
			<div class="headl">
				<a href="javascript:void(0)" onclick="window.history.back();" class="heada">
					<i class="back_hico hico">
					</i>
				</a>
			</div>
			<h1 class="headtitle">
				课程预览
			</h1>
			<div class="headr">
				<a href="javascript:void(0)" class="heada">
					<i class="share_hico hico">
					</i>
				</a>
			</div>
		</header>
		<!--end header-->
		<!-- 中间 -->
		<!-- 一行 -->
		<%
		Institution institution = (Institution)request.getAttribute("institution");
		if(institution!=null){
		%>
		
		<div class="wpbox">
			<ul class="cflist">
				<li class="cfitem">
					<div class="cfface">
						<div class="cfface_content">
							<div class="coursecut">
								<div class="coursecut_preview">
									<div class="coursecut_img">
										<img src="<%=basePath %>static/institutionimg/<%=institution.getLogo() %>"
										alt="">
									</div>
								</div>
								<div class="coursecut_content">
									<div class="cfface_info">
										<div class="coursecut_title">
											<h3><%=institution.getiName() %></h3>
										</div>
										<a href="javascript:void(0)" class="mr0 md_ogbtn">
											<i class="whlisten_mico mico">
											</i>
											免费试听
										</a>
									</div>
									<div class="cfface_info">
										<div class="cfface_info_mc">
											<span class="inf">
											浏览量:<%=institution.getViewNum() %>
											</span>
										</div>
										<span class="inf">
											<i class="gytime_smico smico">
											</i>
											发布时间<%=institution.getPubTime() %>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</li>
			</ul>
		</div>
		<!-- end 一行 -->
		<!-- 一行 -->
		<div class="wpbox">
			<div class="boxmt">
				<div class="wbw">
					<h3 class="ogtitle">
						课程信息
					</h3>
				</div>
			</div>
			<div class="showdlist">
				<div class="dl">
					<div class="dt">
						授课价格
					</div>
					<div class="dd">
						<%=institution.getTeachingPrice() %>
					</div>
				</div>
				<div class="align dl">
					<div class="dt">
						上课地址
					</div>
					<div class="dd">
						<%=institution.getAddress() %>
					</div>
					<a href="<%=basePath %>order/mMap.action?address=<%=institution.getAddress() %>&lat=<%=institution.getLat() %>&lng=<%=institution.getLng() %>"
					class="oglinebtn">
						查看地图
					</a>
				</div>
				<div class="dl">
					<div class="dt">
						授课形式
					</div>
					<div class="dd">
						<%=institution.getTeachingType() %>
					</div>
				</div>
				<div class="dl">
					<div class="dt">
						辅导阶段
					</div>
					<div class="dd">
					<%
					String fdjd = "";
					String[] kmdls = institution.getKemudalei().split(",");
					List<DictInfo> dictList  = (List<DictInfo>)request.getAttribute("dictList");
					if(dictList!=null){
						for(int i = 0;i<kmdls.length;i++){
							for(int j = 0; j <dictList.size(); j++){
								DictInfo dictInfo = dictList.get(j);
								if(kmdls[i].equals(""+dictInfo.getDictId())){
									fdjd+=dictInfo.getContent()+" ";
								}
							}
						}
					}
					%>
					<%=fdjd %>
					</div>
				</div>
				<div class="dl">
					<div class="dt">
						授课科目
					</div>
					<div class="dd">
						<%=institution.getCourse() %>
					</div>
				</div>
				<div class="dl">
					<div class="dt">
						课程介绍
					</div>
					<div class="dd">
						<%=institution.getIntroduce() %>
					</div>
				</div>
				
			</div>
		</div>
		<!-- banner -->
		<!-- banner -->
		<div class="wpbox">
			<div class="boxmt">
				<div class="wbw">
					<h3 class="ogtitle">
						课程相册
					</h3>
				</div>
			</div>
			<div class="mb0 gopiccut">
				<div class="ibn" id="focus">
					<div class="tempWrap" style="overflow:hidden; position:relative;">
						<ul class="bd" style="width: 3500px; position: relative; overflow: hidden; padding: 0px; margin: 0px; display: -webkit-box; transition-duration: 500ms; transform: translate(-2000px, 0px) translateZ(0px);">
							<%
							if(institution.getPhoto()!=null){
								String[] photos = institution.getPhoto().split(",");
								for(int i = 0; i < photos.length; i++){
							%>
								<li style="display: block; vertical-align: top; width: 500px;">
									<a href="<%=basePath%>static/institutionimg/<%=photos[i] %>"
									target="_blank">
										<img src="<%=basePath%>static/institutionimg/<%=photos[i] %>"
										alt="" width="620" height="290">
									</a>
								</li>
							<%
								}
							}
							%>
						</ul>
					</div>
					<ul class="hd">
							<%
							if(institution.getPhoto()!=null){
								String[] photos = institution.getPhoto().split(",");
								for(int i = 0; i < photos.length; i++){
							%>
								<li class="">
									<%=i+1 %>
								</li>
							<%
								}
							}
							%>
					</ul>
				</div>
			</div>
		</div>
		<!-- end 一行 -->
		<!-- end 一行 -->
		<!--end 中间-->
		<!-- 底部 -->
		<div class="fbottom">
			<div class="ftoolbar">
				<div class="ftoolbar_wbw">
					<a href="javascript:void(0)" id="btnView" class="big_ogbtn">
						查看联系方式
					</a>
				</div>
			</div>
		</div>
		<!-- end 底部 -->
		<div class="cpop" id="phonenumCpop">
			<div class="cpopcontent">
				<div class="ntpop">
					<i class="hide-phonenumCpop cpop_close">
					</i>
					<div class="ntpop_content">
						<div class="tr">
							<i class="mdogphone_ntico ntico">
							</i>
						</div>
						<div class="tr telephone">
							<%=institution.getContactPhone() %>
						</div>
						<span>
							<%=institution.getContactName().substring(0,1) %>老师
						</span>
					</div>
					<a href="tel:<%=institution.getContactPhone() %>" class="ntpop_btnfoot">
						呼叫
					</a>
				</div>
			</div>
		</div>
		<%} %>
		<!-- ntextpop -->
		<div class="ntextpop" id="messagebox">
			<span class="ntextpop_content">
			</span>
		</div>
		<!-- end ntextpop -->
		<script src="<%=basePath %>static/mobile/js/TouchSlide.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/tool.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/geolocation.js">
		</script>
		<script>
			function show(msg) {
				$(".ntextpop_content").text(msg);
				//$(".ntextpop").addClass("show");
				$(".ntextpop").fadeIn(1000).fadeOut(0);
			}
		</script>
		<script>
			$("#btnView").click(function() {
				//var param = {};
				//param.CourseId = $("#CourseId").val();
				//param.ClassId = $("#ClassId").val();
				//$.post('/nn/home/ViewClassRecord', param,
				//function(res) {
					$("#phonenumCpop").addClass("show");
				//});
			});

			$(".share_hico").click(function() {
				$(".t_menua").toggle();
			})
		</script>
	</body>

</html>