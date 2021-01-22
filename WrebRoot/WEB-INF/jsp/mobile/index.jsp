<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%@page import="com.jiajiao.bean.News"%>
<%@page import="com.jiajiao.bean.Member"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>【吉师家教网】四平家教网_免费找家教_四平家教一对一在线辅导</title>
		<meta name="keywords" content="四平家教，四平家教兼职，四平兼职家教，家教">
		<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2003年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">
	
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	
		<link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
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
  
  <body style="">
		<!-- header -->
		<header class="header">
			<div class="headl">
				<a href="javascript:void(0);" class="heada">
					<i class="map_hico hico">
					</i>
					四平
				</a>
			</div>
			<h1 class="headtitle">
				<img src="<%=basePath %>static/img/logo2.png" alt="" class="headlogo">
			</h1>
			<%
			Member ssmember =  (Member)session.getAttribute("member");
			Teacher ssteacher =  (Teacher)session.getAttribute("teacher");
			if(ssmember==null && ssteacher==null){
			%>
			<div class="headr">
				<a href="<%=basePath %>mRegisterPage.action" class="heada" rel="nofollow">
					注册
				</a>
				<i class="hspc">
				</i>
				<a href="<%=basePath %>mLoginPage.action" class="heada" rel="nofollow">
					登录
				</a>
			</div>
			<%
			}else if(ssmember!=null){
			%>
			<div class="headr">
				<a href="<%=basePath %>member/mPubOrderPage.action" class="heada" rel="nofollow">
					发布
				</a>
				<i class="hspc">
				</i>
				<a href="<%=basePath %>member/mMemberCenterPage.action" class="heada" rel="nofollow">
					我的
				</a>
			</div>
			<%
			}else if(ssteacher!=null){
			%>
			<div class="headr">
				
				<i class="hspc">
				</i>
				<a href="<%=basePath %>teacher/mTeacherCenterPage.action" class="heada" rel="nofollow">
					我的
				</a>
			</div>
			<%
			}
			%>
		</header>
		<!--end header-->
		<!-- searchrow -->
		<div class="searchrow">
			<div class="searchrow_box">
				<div class="selint">
					<span class="searchrow_seltext selint_label">
						学员
					</span>
					<select class="selint_select">
						<option value="1">
							学员
						</option>
						<option value="2">
							教员
						</option>
						<option value="3">
							辅导班
						</option>
					</select>
					<i class="selint_arrow">
					</i>
				</div>
				<div class="wbw">
					<input type="search" placeholder="请输入搜索关键字..." class="searchrow_input dtint">
				</div>
				<button class="searchrow_btn">
				</button>
			</div>
		</div>
		<!-- end searchrow -->
		<!-- banner -->
		<div style="height: 200px; background: url(static/mobile/img/01.jpg) no-repeat 0 0/100% 100%; text-align: right; padding-right: 10px;">
		</div>
		<!-- banner -->
		<!-- 中间 -->
		<!-- 一行 -->
		<nav class="inav wbox">
			<a href="<%=basePath %>teacher/mTeacherList.action?courseId=0&areaId=0&teacherType=0&gender=2&kmdl=2&location=0">
				<img src="<%=basePath %>static/mobile/img/01.png" alt="" class="ico">
				<div class="t">
					找教员
				</div>
			</a>
			<a href="<%=basePath %>order/mOrderList.action?courseId=0&areaId=0&teacherType=0&gender=2&kmdl=2&location=0">
				<img src="<%=basePath %>static/mobile/img/02.png" alt="" class="ico">
				<div class="t">
					最新家教
				</div>
			</a>
			<a href="<%=basePath %>mFastAppointTeacher.action">
				<img src="<%=basePath %>static/mobile/img/04.png" alt="" class="ico">
				<div class="t">
					发需求
				</div>
			</a>
			<a href="<%=basePath %>institution/mInstitutionList.action">
				<img src="<%=basePath %>static/mobile/img/03.png" alt="" class="ico">
				<div class="t">
					辅导班
				</div>
			</a>
			
			<a href="<%=basePath %>mCost.action">
				<img src="<%=basePath %>static/mobile/img/05.png" alt="" class="ico">
				<div class="t">
					家教价格
				</div>
			</a>
			
			<a href="<%=basePath %>paper/mPaperList.action?degree=1&grade=0&course=0">
				<img src="<%=basePath %>static/mobile/img/07.png" alt="" class="ico">
				<div class="t">
					试题
				</div>
			</a>
			<a href="<%=basePath %>news/mNewsList.action?degree=1">
				<img src="<%=basePath %>static/mobile/img/06.png" alt="" class="ico">
				<div class="t">
					资讯
				</div>
			</a>
			<a href="<%=basePath %>notice/mNoticeList.action?type=1">
				<img src="<%=basePath %>static/mobile/img/08.png" alt="" class="ico">
				<div class="t">
					必读公告
				</div>
			</a>
		</nav>
		<!-- end 一行 -->
		<!-- 一行 -->
		<div class="wbox" id="cltab">
			<div class="boxmt">
				<div class="wbw">
					<h3 class="ogtitle">
						中小学文化课
					</h3>
				</div>
				<ul class="hd cltab_hd">
					<li class="on">
						一对一家教
					</li>
				</ul>
			</div>
			<div class="tempWrap" style="overflow: hidden; position: relative; ">
				<div class="bd" id="cltab-bd" style="width: 1052px; position: relative; overflow: hidden; padding: 0px; margin: 0px; display: -webkit-box; transition-duration: 200ms; transform: translate(0px, 0px) translateZ(0px);">
					<div style="display: block; vertical-align: top; width: 526px;">
						<div class="overhide">
							<!-- 高度自适应需添加外层 -->
							<ul class="clnav">
								<%
								List<Course> zhongxiaoxueCourseList =  (List<Course>)request.getAttribute("zhongxiaoxueCourseList");
								if(zhongxiaoxueCourseList!=null){
									for(int i=0;i<zhongxiaoxueCourseList.size();i++){
										Course course = zhongxiaoxueCourseList.get(i);
								%>
								<li>
									<a href="javascript:void(0);">
										<%=course.getCourseName() %>
									</a>
								</li>
								<%
									}
								}
								%>
								<li>
									<a href="">
										<i class="clnav_moredot">
										</i>
									</a>
								</li>
							</ul>
							<ul class="tlist">
								<%
								List<Teacher> zhongXiaoXueTeacherList =  (List<Teacher>)request.getAttribute("zhongXiaoXueTeacherList");
								if(zhongXiaoXueTeacherList!=null){
									for(int i=0;i<zhongXiaoXueTeacherList.size();i++){
										Teacher teacher = zhongXiaoXueTeacherList.get(i);
								%>
								<li>
									<a href="<%=basePath %>teacher/mTeacherInfo.action?tId=<%=teacher.getTeacherId() %>&isTeacherCenter=0">
										<div class="tlist_photo">
											<%
											if(teacher.getGender()==1 && "".equals(teacher.getPersonImg()) ){
											%>
											<img src="static/img/male.png" >
											<%
											}else if(teacher.getGender()==0 && "".equals(teacher.getPersonImg())){
											%>
											<img src="static/img/w.png" >
											<%
											}else{
											%>
											<img src="<%=basePath%>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>" >
											<%
											}
											%>
										</div>
										<div class="tlist_job">
											<%=teacher.getEducationName() %>
										</div>
										<span class="tlist_exp">
											<%=teacher.getTeachingAge() %>年
										</span>
									</a>
								</li>
								<%
									}
								}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end 一行 -->
		<!-- 一行 -->
		<div class="wbox" id="cltab2">
			<div class="boxmt">
				<div class="wbw">
					<h3 class="ogtitle">
						艺术/乐器
					</h3>
				</div>
				<ul class="hd cltab_hd">
					<li class="on">
						一对一家教
					</li>
				</ul>
			</div>
			<div class="tempWrap" style="overflow: hidden; position: relative; ">
				<div class="bd" id="cltab2-bd" style="width: 1052px; position: relative; overflow: hidden; padding: 0px; margin: 0px; display: -webkit-box; transition-duration: 200ms; transform: translate(0px, 0px) translateZ(0px);">
					<div style="display: block; vertical-align: top; width: 526px;">
						<div class="overhide">
							<!-- 高度自适应需添加外层 -->
							<ul class="clnav">
								<%
								List<Course> yishuCourseList =  (List<Course>)request.getAttribute("yishuCourseList");
								if(yishuCourseList!=null){
									for(int i=0;i<yishuCourseList.size();i++){
										Course course = yishuCourseList.get(i);
								%>
								<li>
									<a href="javascript:void(0);">
										<%=course.getCourseName() %>
									</a>
								</li>
								<%
									}
								}
								%>
								<li>
									<a href="">
										<i class="clnav_moredot">
										</i>
									</a>
								</li>
							</ul>
							<ul class="tlist">
								<%
								List<Teacher> yueQiTeacherList =  (List<Teacher>)request.getAttribute("yueQiTeacherList");
								if(yueQiTeacherList!=null){
									for(int i=0;i<yueQiTeacherList.size();i++){
										Teacher teacher = yueQiTeacherList.get(i);
								%>
								<li>
									<a href="<%=basePath %>teacher/mTeacherInfo.action?tId=<%=teacher.getTeacherId() %>&isTeacherCenter=0">
										<div class="tlist_photo">
											<%
											if(teacher.getGender()==1 && "".equals(teacher.getPersonImg()) ){
											%>
											<img src="static/img/male.png" >
											<%
											}else if(teacher.getGender()==0 && "".equals(teacher.getPersonImg()))  {
											%>
											<img src="static/img/w.png" >
											<%
											}else{
											%>
											<img src="<%=basePath%>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>" >
											<%
											}
											%>
										</div>
										<div class="tlist_job">
											<%=teacher.getEducationName() %>
										</div>
										<span class="tlist_exp">
											<%=teacher.getTeachingAge() %>年
										</span>
									</a>
								</li>
								<%
									}
								}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end 一行 -->
		<!-- 一行 -->
		<div class="wbox" id="cltab3">
			<div class="boxmt">
				<div class="wbw">
					<h3 class="ogtitle">
						棋类/体育/计算机
					</h3>
				</div>
				<ul class="hd cltab_hd">
					<li class="on">
						一对一家教
					</li>
				</ul>
			</div>
			<div class="tempWrap" style="overflow: hidden; position: relative; ">
				<div class="bd" id="cltab3-bd" style="width: 1052px; position: relative; overflow: hidden; padding: 0px; margin: 0px; display: -webkit-box; transition-duration: 200ms; transform: translate(0px, 0px) translateZ(0px);">
					<div style="display: block; vertical-align: top; width: 526px;">
						<div class="overhide">
							<!-- 高度自适应需添加外层 -->
							<ul class="clnav">
								<%
								List<Course> qitaCourseList =  (List<Course>)request.getAttribute("qitaCourseList");
								if(qitaCourseList!=null){
									for(int i=0;i<qitaCourseList.size();i++){
										Course course = qitaCourseList.get(i);
								%>
								<li>
									<a href="javascript:void(0);">
										<%=course.getCourseName() %>
									</a>
								</li>
								<%
									}
								}
								%>
								<li>
									<a href="">
										<i class="clnav_moredot">
										</i>
									</a>
								</li>
							</ul>
							<ul class="tlist">
								<%
								List<Teacher> qiLeiTeacherList =  (List<Teacher>)request.getAttribute("qiLeiTeacherList");
								if(qiLeiTeacherList!=null){
									for(int i=0;i<qiLeiTeacherList.size();i++){
										Teacher teacher = qiLeiTeacherList.get(i);
								%>
								<li>
									<a href="<%=basePath %>teacher/mTeacherInfo.action?tId=<%=teacher.getTeacherId() %>&isTeacherCenter=0">
										<div class="tlist_photo">
											<%
											if(teacher.getGender()==1 && "".equals(teacher.getPersonImg()) ){
											%>
											<img src="static/img/male.png" >
											<%
											}else if(teacher.getGender()==0 && "".equals(teacher.getPersonImg())){
											%>
											<img src="static/img/w.png" >
											<%
											}else{
											%>
											<img src="<%=basePath%>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>" >
											<%
											}
											%>
										</div>
										<div class="tlist_job">
											<%=teacher.getEducationName() %>
										</div>
										<span class="tlist_exp">
											<%=teacher.getTeachingAge() %>年
										</span>
									</a>
								</li>
								<%
									}
								}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end 一行 -->
		<!-- 一行 -->

		<div class="wpbox">
			<div id="cldowntab">
				<div class="tempWrap" style="overflow: hidden; position: relative; ">
					<div class="bd" id="cldowntab-bd" style="width: 2008px; position: relative; overflow: hidden; padding: 0px; margin: 0px; display: -webkit-box; transition-duration: 200ms; transform: translate(0px, 0px) translateZ(0px);">
						<div style="display: block; vertical-align: top; width: 502px;">
							<ul class="cldownlist">
								<!-- 高度自适应需添加外层 -->
								<%
								List<Paper> topFivePrimaryPaperList =  (List<Paper>)request.getAttribute("topFivePrimaryPaperList");
								if(topFivePrimaryPaperList!=null){
									for(int i=0;i<topFivePrimaryPaperList.size();i++){
										Paper paper = topFivePrimaryPaperList.get(i);
								%>
								<li>
									<div class="dt">
										<a href="<%=basePath %>paper/conPrimaryPaperList.action?pId=<%=paper.getpId() %>" target="_blank">
											小学
										</a>
									</div>
									<div class="dd">
										<a href="<%=basePath %>paper/mPaperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
											<%=paper.getTitle() %>
										</a>
									</div>
									<div class="version">
										试题
									</div>
								</li>
								<%
									}
								} %>
							</ul>
						</div>
						<div style="display: block; vertical-align: top; width: 502px;">
							<ul class="cldownlist">
							<%
							List<Paper> topFiveJuniorPaperList =  (List<Paper>)request.getAttribute("topFiveJuniorPaperList");
							if(topFiveJuniorPaperList!=null){
								for(int i=0;i<topFiveJuniorPaperList.size();i++){
									Paper paper = topFiveJuniorPaperList.get(i);
							%>
								<li>
									<div class="dt">
										<a href="<%=basePath %>paper/conJuniorPaperList.action?pId=<%=paper.getpId() %>" target="_blank">
											初中
										</a>
									</div>
									<div class="dd">
										<a href="<%=basePath %>paper/mPaperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
											<%=paper.getTitle() %>
										</a>
									</div>
									<div class="version">
										试题
									</div>
								</li>
							<%
								}
							} %>
							</ul>
						</div>
						<div style="display: block; vertical-align: top; width: 502px;">
							<ul class="cldownlist">
							<%
							List<Paper> topFiveHighPaperList =  (List<Paper>)request.getAttribute("topFiveHighPaperList");
							if(topFiveHighPaperList!=null){
								for(int i=0;i<topFiveHighPaperList.size();i++){
									Paper paper = topFiveHighPaperList.get(i);
							%>
								<li>
									<div class="dt">
										<a href="<%=basePath %>paper/conHighPaperList.action?pId=<%=paper.getpId() %>" target="_blank">
											高中
										</a>
									</div>
									<div class="dd">
										<a href="<%=basePath %>paper/mPaperInfo.action?pId=<%=paper.getpId() %>" target="_blank">
											<%=paper.getTitle() %>
										</a>
									</div>
									<div class="version">
										试题
									</div>
								</li>
							<%
								}
							} %>
							</ul>
						</div>
						<div style="display: block; vertical-align: top; width: 502px;">
							<ul class="cldownlist">
							<%
							List<News> newsList =  (List<News>)request.getAttribute("newsList");
							if(newsList!=null){
								for(int i=0;i<newsList.size();i++){
									News news = newsList.get(i);
							%>
								<li>
									<div class="dt">
										<a href="#" target="_blank">
											教育
										</a>
									</div>
									<div class="dd">
										<a href="<%=basePath %>news/mNewsInfo.action?nId=<%=news.getnId() %>" target="_blank">
											<%=news.getTitle() %>
										</a>
									</div>
									<div class="version">
										资讯
									</div>
								</li>
							<%
								}
							} 
							%>
							</ul>
						</div>
					</div>
				</div>
				<ul class="cldowntab_hd hd">
					<li class="on">
						1
					</li>
					<li class="">
						2
					</li>
					<li class="">
						3
					</li>
					<li class="">
						4
					</li>
				</ul>
			</div>
		</div>
		<!-- end 一行 -->
		<!-- 一行 -->
		<ul class="clgo3 wpbox">
			<li class="fore1">
				<a href="http://m.ygjj.com/fz/Home/Book?tid=1&amp;gid=1&amp;pid=1">
					<i class="ico">
					</i>
					小学试题
				</a>
			</li>
			<li class="fore2">
				<a href="http://m.ygjj.com/fz/Home/Book?tid=2&amp;gid=7&amp;pid=1">
					<i class="ico">
					</i>
					中学试题
				</a>
			</li>
			<li class="fore3">
				<a href="http://m.ygjj.com/fz/Home/Material?tid=1&amp;gid=0&amp;cid=0&amp;pid=1">
					<i class="ico">
					</i>
					高中试题
				</a>
			</li>
			<li class="fore4">
				<a href="http://m.ygjj.com/fz/Home/Information?tid=1&amp;nid=24&amp;pid=1">
					<i class="ico">
					</i>
					教育资讯
				</a>
			</li>
			<li class="fore5">
				<a href="http://m.ygjj.com/fz/Home/Material?tid=2&amp;gid=0&amp;cid=0&amp;pid=1">
					<i class="ico">
					</i>
					关于我们
				</a>
			</li>
			<li class="fore6">
				<a href="http://m.ygjj.com/fz/Home/Articles?classId=8">
					<i class="ico">
					</i>
					帮助中心
				</a>
			</li>
		</ul>
		<!-- end 一行 -->
		<!--end 中间-->
		<!-- 底部 -->
		<footer class="footer">
			<div>
				©吉师家教网版权所有 
				<a href="<%=basePath %>" class="ml6 sm_gybtn">
					电脑版
				</a>
			</div>
			<div>
				<i class="wechatico40">
				</i>
				微信客服公众号：ydjjcom
			</div>
			<div class="insrow">
				<img src="<%=basePath%>static/mobile/img/logo40.png" alt="" class="footlogo">
				&nbsp;家教热线：150-6033-8989
			</div>
		</footer>
		<!--end 底部-->
		<!-- gotop -->
		<a href="javascript:void(0)" class="gotop_toolbtn toolbtn" style="display: block;">
			顶部
		</a>
		<!-- end gotop -->
		<script>
			$(function() {
				$(".searchrow_btn").on("click",
				function() {
					var type = $(".selint_select").val();
					var keyword = $(".searchrow_input").val();
					if (type == 1) {
						window.location.href = "/fz/home/student?keyword=" + keyword; //window.location.origin + "/home/student";
					}
					if (type == 2) {
						window.location.href = "/fz/home/teacher?keyword=" + keyword; //window.location.origin + "/home/student";
					}
					if (type == 3) {
						window.location.href = "/fz/home/class?keyword=" + keyword; //window.location.origin + "/home/student";
					}
					window.event.returnValue = false;
				});

				//if (is_weixn()) {
				//    console.log('wx');
				//}
			});
		</script>
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
	</body>

</html>
