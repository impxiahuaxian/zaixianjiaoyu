<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Orders"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Link"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%@page import="com.jiajiao.bean.News"%>
<%@page import="com.jiajiao.bean.Notice"%>
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
	<meta name="viewport" content="width=1300">
	
	<meta name="360-site-verification" content="22009208546d72dc927d8f886d5d0bb1" />

	<title>【吉师家教网】吉师家教网_免费找家教_吉师家教一对一在线辅导</title>
	<meta name="keywords" content="吉师家教，吉师家教兼职，吉师兼职家教，家教">
	<meta name="description" content="吉师家教网是莆田家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<LINK rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/pageSwitch.min.css">
	
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
	<script src="<%=basePath%>static/js/jquery.artDialog.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/jQuery.rTabs.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/search_tab.js" type="text/javascript"></script>
	
	<STYLE>
			* {
				padding: 0;
				margin: 0;
			}
			
			html,
			body {
				height: 100%;
			}
			
			#container {
				width: 100%;
				height: 500px;
				overflow: hidden;
			}
			
			.sections,
			.section {
				height: 100%;
			}
			
			#container,
			.sections {
				position: relative;
			}
			
			.section {
				background-color: #000;
				background-size: cover;
				background-position: 50% 50%;
				text-align: center;
				color: white;
			}
			
			#section0 {
				background-image: url('<%=basePath%>static/img/banner (1).png');
			}
			
			#section1 {
				background-image: url('<%=basePath%>static/img/banner.png');
			}
			
			#section2 {
				background-image: url('<%=basePath%>static/img/01.jpg');
			}
			
			.mainProNav {
				background: rgba(0, 0, 0, .7);
				width: 230px;
				height: 500px;
			}
			
			.mainProNav dt {
				color: #fff;
			}
			
			.mainProNav dt {
				padding-top: 15px;
				height: 80px;
				line-height: 18px;
				font-size: 16px;
			}
			
			.mainProNav .dlHover dt {
				padding-left: 24px;
				background: #000;
				line-height: 18px;
				padding-top: 15px;
				height: 80px;
			}
			
			.mainProNav p {
				height: 28px;
				padding-top: 10px;
				font-size: 12px;
				font-weight: 100;
				width: 180px;
			}
			
			.mainProNav dd {
				left: 230px;
				border-left: none
			}
		</STYLE>
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

	<div class="header min_1200">
		<div class="w_1200">
			<h3 class="h_city fl">
				<span class="png city_arrow">四平</span>
				<p>
					<a href="javascript:void(0);" class="round_s city_btn"
						rel="nofollow">切换城市</a>
				</p>
			</h3>

			<img alt="" src="<%=basePath%>static/img/logo_contact.png">
			
			<div class="header_r fr">
				<span class="font_16">客服微信：</span>
				<img src="<%=basePath%>static/img/wechat.jpg" class="wechat_img" alt="吉师家教客服微信" width="80" height="80">

				<%
					Teacher teacher = (Teacher) session.getAttribute("teacher");
					Member member = (Member) session.getAttribute("member");
					if (member == null && teacher == null) {
				%>
				<span class="font_13">
                   <b class="orange_link">
                       <a href="<%=basePath%>loginPage.action" class="heada"> 登录</a>
                   </b>
                   <em class="china"></em>
                   <b class="orange_link">
                       <a href="<%=basePath%>registerPage.action" class="heada">注册</a>
                   </b>
                   </span>
				 
				<%
				 	} else {
				%>
				<span class="font_13">
                   <b class="orange_link">
                       <a href="<%=basePath%>logout.action" class="heada"> 退出</a>
                   </b>
                   <em class="china"></em>
                   <b class="orange_link">
                  	<%
                  		if (member != null) {
                  	%>
                      <a href="<%=basePath%>member/index.action" class="heada">我的</a>
                  	<%
                  		} else if (teacher != null) {
                  	%>
                      <a href="<%=basePath%>teacher/index.action" class="heada">我的</a>
                  	<%
                  		}
                  	%>
                   </b>
                 </span>
					<%
						}
					%>
			</div>
			<!--end头文件右-->
		</div>
	</div>
	<!--end头文件-->


	<div class="nav min_1200">
		<div class="tnav w_1200" id="slideNav">
			<span><a href="<%=basePath %>" class="current_nav">家教首页</a></span>
			<span><a href="<%=basePath %>costPage.action" >资费标准</a></span>
			<span><a href="<%=basePath %>teacher/teachersPage.action">找老师</a></span>
			<span><a href="<%=basePath %>member/ordersPage.action">最新家教</a></span>
			<span><a href="<%=basePath %>institution/institutionPage.action">辅导机构</a></span>
			<span><a href="<%=basePath %>paper/paperPage.action" >云课堂</a></span>
			<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
		</div>
	</div>
	<!-- end nav -->

		
		<!--轮播图begin-->
		<div id="container">
			<div class="sections">
				<div class="section" id="section0">
				</div>
				<div class="section" id="section1">
				</div>
				<div class="section" id="section2">
				</div>
			</div>
		</div>

		<script src="<%=basePath%>static/js/pageSwitch.min.js"></script>
		<script>
			$("#container").PageSwitch({
				direction: 'horizontal',
				easing: 'ease-in',
				duration: 1000,
				autoPlay: true,
				loop: 'false'
			});
		</script>
		<!--轮播图end-->

		<!--end大图片-->
		<div class="banner_fill_box w_1200">

			<!--设置找老师-->

			<div class="mainProNav">
			<%
				//科目大类列表
				List<DictInfo> dictInfoList = (List<DictInfo>) request.getAttribute("dictInfoList");
				//课程列表
				List<Course> courseList = (List<Course>) request.getAttribute("courseList");

				if (dictInfoList != null) {
					for (int i = 1; i < dictInfoList.size(); i++) {
						DictInfo dictInfo = dictInfoList.get(i);
			%>
				<dl class="navM1">
					<dd>
			<%
						if (courseList != null) {
							for (int j = 0; j < courseList.size(); j++) {
								Course course = courseList.get(j);
								if (dictInfo.getDictId() == course.getKeMuDaLei()) {
			%>
				
						<li>
							<A href="javascript:void(0);"><%=course.getCourseName()%> </A>
						</li>
			<%
								}
			%>	
			<%
						  	}
			%>	
					</DD>
					<dt><%=dictInfo.getContent()%>
						<P>
			<%
					  		for (int k = 0; k < courseList.size(); k++) {
			  					Course course = courseList.get(k);
			  					if (dictInfo.getDictId() == course.getKeMuDaLei()) {
			%>
							<SPAN class="mr"><%=course.getCourseName()%></SPAN>
			<%
					  			}

					  		}
			%>
						</P>
					</dt>
				</dl>
			<%
				}
					}
				}
			%>
			
			</div>
			<SCRIPT>
				$(document).ready(function() {
					$(".mainProNav dl dt").mouseover(function() {
						$(".mainProNav dl").removeClass("dlHover");
						$(this).parent().addClass("dlHover");
					});
					$(".mainProNav").hover(function() {
						$(this).addClass("mainProNavHover");
					}, function() {
						$(this).removeClass("mainProNavHover");
						$(".mainProNav dl").removeClass("dlHover");
					})
				});
				var nav_tab = function() {
					if($('.side_small').css('display') == 'none') $('.side_small').show();
					else $('.side_small').hide();
				}
			</SCRIPT>
			<!--设置找老师end-->

			<!--star免费找教员-->
			<div class="banner_login banner_login_new">
				<h4 class="login_th"><span><b>快速请家教</b></span></h4>
				<dl class="banner_login_fill">
					<dt>
			            <div class="box clearfix">
			                <div class="r_cell">
			                    <input type="text" id="name" name="name" placeholder=" 家长姓名" value="" style="border: solid 1px #888888;height: 30px;width: 190px;font-size: 15px;" />
			                </div>
			            </div>
			            <div class="box clearfix">
			                <div class="r_cell">
			                    <input type="text"  id="phone" name="phone" placeholder=" 手机电话" value="" style="border: solid 1px #888888;height: 30px;width: 190px;font-size: 15px;" />
			                </div>
			            </div>
			            <div class="box clearfix">
			                <div class="r_cell">
			                    <!--star下拉-->
			                    <div class="divselect_box cd-popup-trigger" target="#SubjectModal" id="Subject">
			                        <cite data-id="0" id="SubjectName" name="SubjectName">请选择科目</cite>
			                    </div>
			                    <!--end下拉-->
			                </div>
			            </div>
			            <div class="box">
			                <div class="r_cell">
			                    <input type="text"  id="wxNumber" name="wxNumber"  placeholder=" 微信号（选填）" value="" style="border: solid 1px #888888;height: 30px;width: 190px;font-size: 15px;" />
			                </div>
			            </div>

        			</dt>
					<dd>
						<input type="button" id="btnFastOrderTeacher" class="login_btn transition_a" value="提交">
					</dd>
				</dl>
			</div>

			<script>
				$(function() {
				
					var regmobile = /^(13[0-9]|14[57]|15[0-35-9]|17[0678]|18[0-9])[0-9]{8}$/;
					$("#btnFastOrderTeacher").click(
		
						function() {
							var name = $.trim($("#name").val());
							var phone = $.trim($("#phone").val());
							var Subject = $("#Subject").find("cite").data("id");
							var SubjectName = $("#Subject").find("cite").text();
							var wxNumber = $.trim($("#wxNumber").val())
							
							if (name == '') {
							alert("请输入家长姓名");
							return false;
							}
							
							if (phone == ''|| !regmobile.test(phone)) {
								alert("请填写正确的手机号");
								return false;
							}
							
							if (Subject == 0) {
								alert("请选择科目");
								return false;
							}
							
							
							var $this = $(this);
							$this.val('正在提交中...').attr('disabled', true);
			
							var d = {
								IsAsync : true,
								name :name,
								phone : phone,
								teachingCourse : Subject,
								teachingCourseName : SubjectName,
								wxNumber : wxNumber
							};
							
							$.post('fastOrderTeacher.action', d, function(res) {
								if (res.success) {
									$("#name").val("");
									$("#phone").val("");
									$("#Subject").data("id",'0');
									$("#SubjectName").text("请选择科目");
									$("#wxNumber").val("")
									$("#AppointSuccessPop").ShowSelfPopMessage(res.message);
									$this.val('提 交').attr('disabled', false);
								} else {
									$this.val('提 交').attr('disabled', false);
									alert(res.message);
								}
							});
					});

					$("#btnConfirmSubject").click(function() {
						if($("#ulSelect li").length <= 0) {
							$("#Subject").find("cite").text("不限");
							$("#Subject").find("cite").data("id", 0);
						} else {
							$("#Subject").find("cite").text($($("#ulSelect li")[0]).find("a").text());
							$("#Subject").find("cite").data("id", $($("#ulSelect li")[0]).find("a").data("id"));
						}
					});

				});
			</script>
			<!--end免费找教员-->
		</div>
		
		<!--热门大学、热门学科、热门区域-->
		<div class="gray_border clearfix w_1200 box_w" >
			<div class="hide_box">
			<%
				List<Notice> topFourNoticeTypeFirstList = (List<Notice>)request.getAttribute("topFourNoticeTypeFirstList");
				List<Notice> topFourNoticeTypeSecondList = (List<Notice>)request.getAttribute("topFourNoticeTypeSecondList");
				List<Notice> topFourNoticeTypeThirdList = (List<Notice>)request.getAttribute("topFourNoticeTypeThirdList");
			%>
				<ul class="course_ul clearfix">
					<li class="li_o">
						<h3 ><a href="<%=basePath %>notice/conNoticeList.action?type=1">通知公告</a></h3>
						<ul >
						<%
						if(topFourNoticeTypeFirstList!=null){
							for(int i = 0;i < topFourNoticeTypeFirstList.size();i++){
								Notice notice = topFourNoticeTypeFirstList.get(i);
						%>
							<li>
								<a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice.getnId() %>" target="_blank"><%=notice.getTitle() %></a>
						<%
									i = i+1;
									notice = topFourNoticeTypeFirstList.get(i);
									
						%>	
								<p>
									<a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice.getnId() %>" target="_blank"><%=notice.getTitle() %></a>
								</p>

							</li>
						<%
							}
						}
						%>
						</ul>
					</li>
					<li class="li_o">
						<h3 ><a href="<%=basePath %>notice/conNoticeList.action?type=2">学员必读</a></h3>
						<ul >
							<%
							if(topFourNoticeTypeSecondList!=null){
								for(int i = 0;i < topFourNoticeTypeSecondList.size();i++){
									Notice notice = topFourNoticeTypeSecondList.get(i);
							%>
								<li>
									<a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice.getnId() %>" target="_blank"><%=notice.getTitle() %></a>
							<%
										i = i+1;
										notice = topFourNoticeTypeSecondList.get(i);
										
							%>	
									<p>
										<a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice.getnId() %>" target="_blank"><%=notice.getTitle() %></a>
									</p>
	
								</li>
							<%
								}
							}
							%>
						</ul>
					</li>

					<li class="li_o last">
						<h3 ><a href="<%=basePath %>notice/conNoticeList.action?type=3">教员必读</a></h3>
						<ul >
							<%
							if(topFourNoticeTypeThirdList!=null){
								for(int i = 0;i < topFourNoticeTypeThirdList.size();i++){
									Notice notice = topFourNoticeTypeThirdList.get(i);
							%>
								<li>
									<a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice.getnId() %>" target="_blank"><%=notice.getTitle() %></a>
							<%
										i = i+1;
										notice = topFourNoticeTypeThirdList.get(i);
										
							%>	
									<p>
										<a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice.getnId() %>" target="_blank"><%=notice.getTitle() %></a>
									</p>
	
								</li>
							<%
								}
							}
							%>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!--end热门大学、热门学科、热门区域-->

		<div class="h_tab w_1200 clearfix box_w_n">
			<dl class="tab_nav_w h_tab_nav">
				<dd class="fr">
					<a href="<%=basePath%>teacher/teachersPage.action" class="round_m transition_a more_a">更多+&nbsp;&nbsp;&nbsp;</a>
				</dd>
				<dt class="fl">
            		<h4>中小学文化课</h4>
        		</dt>
			</dl>
			<div class="gray_border clearfix tab_box_o">
				<div class="course_class">
					<dl class="course_class_dl">
						<dt class="clearfix">
                    		<span class="h_arrow png">
                    		</span>
		                    <ul class="list_2 clearfix">
		                            <li><a href="javascript:void(0);">小学陪读</a></li>
		                            <li><a href="javascript:void(0);">学前教育</a></li>
		                            <li><a href="javascript:void(0);">学龄前课..</a></li>
		                            <li><a href="javascript:void(0);">小学课程</a></li>
		                            <li><a href="javascript:void(0);">初中课程</a></li>
		                            <li><a href="javascript:void(0);">高中课程</a></li>
		                            <li><a href="javascript:void(0);">初三数学</a></li>
		                            <li><a href="javascript:void(0);">初三英语</a></li>
		                            <li><a href="javascript:void(0);">初三语文</a></li>
		                            <li><a href="javascript:void(0);">高三数学</a></li>
		                            <li><a href="javascript:void(0);">高三英语</a></li>
		                            <li><a href="javascript:void(0);">高三语文</a></li>
		                            <li><a href="javascript:void(0);">高三物理</a></li>
		                            <li><a href="javascript:void(0);">高三化学</a></li>
		                    </ul>
               			</dt>
						<dd>
							<a href="<%=basePath%>teacher/teachersPage.action">更多课程<span class="china">&gt;&gt;</span></a>
						</dd>
					</dl>
				</div>
				<!--end分类-->
				<div class="tab_box_w r_cell h_tab_box_w">
					<div class="hide_box" style="display: block;">
						<ul class="list_3 tearch_ul round_img">
							<%
								//中小学教员信息列表
								List<Teacher> zhongXiaoXueTeacherList = (List<Teacher>) request
										.getAttribute("zhongXiaoXueTeacherList");
								if (zhongXiaoXueTeacherList != null) {
									for (int i = 0; i < zhongXiaoXueTeacherList.size(); i++) {
										Teacher t = zhongXiaoXueTeacherList.get(i);
							%>
				 			<li class="li_o">
								<a href="<%=basePath%>teacher/teacherInfoPage.action?tId=<%=t.getTeacherId()%>" class="box">
									<div class="hover_div transition_a">
										<p class="hide2">
										<%
											if (t.getSelfEvaluation().length() > 50) {
										%>
											<%=t.getSelfEvaluation().substring(0, 50)%>...
										<%
												} else {
											%>
											<%=t.getSelfEvaluation()%>
										<%
											}
										%>
										</p>
										<div class="d">
											<span class="look_btn transition_a">查看详情</span>
										</div>
									</div>
									<dl>
										<dt class="fl">
										<%
											if (t.getGender() == 0 && "".equals(t.getPersonImg())) {
										%>
				                         <img src="<%=basePath%>static/img/w.png" alt="" width="100" height="100">
				                         <%
				                         	} else if (t.getGender() == 1
				                         					&& "".equals(t.getPersonImg())) {
				                         %>
				                         <img src="<%=basePath%>static/img/male1.png" alt="" width="100" height="100">
				                        <%
				                        	} else {
				                        %>
				                          <img src="<%=basePath%>static/teacherimg/personphoto/<%=t.getPersonImg()%>" alt="" width="100" height="100">  
				                        <%
  				                        	}
  				                        %>
				                        </dt>
										<dd class="r_cell">
											<h5><%=t.getTeacherName().substring(0, 1)%>教员</h5>
											<p>授课经验：<%=t.getTeachingAge()%>年</p>
											<p><%=t.getEducationName()%></p>
										</dd>
									</dl>
								</a>
							</li>
							 <%
							 	}
							 	}
							 %>
							
						</ul>
					</div>
					<!--end一对一家教-->
				</div>
				<!--end标签内容-->
			</div>
			<!--end一行内容-->
		</div>
		<!--end中小学文化课-->

		<div class="h_tab w_1200 clearfix box_w_n h_course2">
			<dl class="tab_nav_w h_tab_nav">
				<dd class="fr">
					<a href="<%=basePath%>teacher/teachersPage.action" class="round_m transition_a more_a">更多+&nbsp;&nbsp;&nbsp;</a>
				</dd>
				<dt class="fl">
            		<h4>艺术/乐器</h4>
        		</dt>
			</dl>
			<div class="gray_border clearfix tab_box_o">
				<div class="course_class">
					<dl class="course_class_dl">
						<dt class="clearfix">
                    		<span class="h_arrow png"></span>
		                    <ul class="list_2 clearfix">
		                            <li><a href="javascript:void(0);">钢琴</a></li>
		                            <li><a href="javascript:void(0);">架子鼓</a></li>
		                            <li><a href="javascript:void(0);">吉他</a></li>
		                            <li><a href="javascript:void(0);">笛子</a></li>
		                            <li><a href="javascript:void(0);">电子器</a></li>
		                            <li><a href="javascript:void(0);">美术</a></li>
		                            <li><a href="javascript:void(0);">速写</a></li>
		                            <li><a href="javascript:void(0);">水粉画</a></li>
		                            <li><a href="javascript:void(0);">书法</a></li>
		                            <li><a href="javascript:void(0);">素描</a></li>
		                            <li><a href="javascript:void(0);">街舞</a></li>
		                            <li><a href="javascript:void(0);">芭蕾舞</a></li>
		                            <li><a href="javascript:void(0);">瑜珈</a></li>
		                            <li><a href="javascript:void(0);">拉丁舞</a></li>
		                    </ul>
                		</dt>
						<dd>
							<a href="<%=basePath%>teacher/teachersPage.action">更多课程<span class="china">&gt;&gt;</span></a>
						</dd>
					</dl>
				</div>
				<!--end分类-->
				<div class="tab_box_w r_cell h_tab_box_w">
					<div class="hide_box" style="display: block;">
						<ul class="list_3 tearch_ul round_img">
							<%
								//乐器教员信息列表
								List<Teacher> yueQiTeacherList = (List<Teacher>) request
										.getAttribute("yueQiTeacherList");
								if (yueQiTeacherList != null) {
									for (int i = 0; i < yueQiTeacherList.size(); i++) {
										Teacher t = yueQiTeacherList.get(i);
							%>
							<li class="li_o">
								<a href="<%=basePath%>teacher/teacherInfoPage.action?tId=<%=t.getTeacherId()%>" class="box">
									<div class="hover_div transition_a">
										<p class="hide2">
										<%
											if (t.getSelfEvaluation().length() > 50) {
										%>
											<%=t.getSelfEvaluation().substring(0, 50)%>...
										<%
												} else {
											%>
											<%=t.getSelfEvaluation()%>
										<%
											}
										%>
										</p>
										<div class="d">
											<span class="look_btn transition_a">查看详情</span>
										</div>
									</div>
									<dl>
										<dt class="fl">
                                        <%
                                        	if (t.getGender() == 0 && "".equals(t.getPersonImg())) {
                                        %>
				                         <img src="<%=basePath%>static/img/w.png" alt="" width="100" height="100">
				                         <%
				                         	} else if (t.getGender() == 1
				                         					&& "".equals(t.getPersonImg())) {
				                         %>
				                         <img src="<%=basePath%>static/img/male1.png" alt="" width="100" height="100">
				                        <%
				                        	} else {
				                        %>
				                          <img src="<%=basePath%>static/teacherimg/personphoto/<%=t.getPersonImg()%>" alt="" width="100" height="100">  
				                        <%
  				                        	}
  				                        %>
                                    	</dt>
										<dd class="r_cell">
											<h5><%=t.getTeacherName().substring(0, 1)%>教员</h5>
											<p>授课经验：<%=t.getTeachingAge()%>年</p>
											<p><%=t.getEducationName()%></p>
										</dd>
									</dl>
								</a>
							</li>
							<%
								}
								}
							%>
							
						</ul>
					</div>
					<!--end一对一家教-->

				</div>
				<!--end标签内容-->
			</div>
			<!--end一行内容-->
		</div>
		<!--end中小学文化课-->

		<div class="h_tab w_1200 clearfix box_w_n h_course4">
			<dl class="tab_nav_w h_tab_nav">
				<dd class="fr">
					<a href="<%=basePath%>teacher/teachersPage.action" class="round_m transition_a more_a">更多+&nbsp;&nbsp;&nbsp;</a>
				</dd>
				<dt class="fl">
            <h4>棋类/体育/计算机</h4>
        </dt>
			</dl>
			<div class="gray_border clearfix tab_box_o">
				<div class="course_class">
					<dl class="course_class_dl">
						<dt class="clearfix">
		                    <span class="h_arrow png"></span>
		                    <ul class="list_2 clearfix">
		                            <li ><a href="javascript:void(0);">国际象棋</a></li>
		                            <li ><a href="javascript:void(0);">围棋</a></li>
		                            <li ><a href="javascript:void(0);">中国象棋</a></li>
		                            <li ><a href="javascript:void(0);">滑冰韩冰</a></li>
		                            <li ><a href="javascript:void(0);">空手道</a></li>
		                            <li ><a href="javascript:void(0);">跆拳道</a></li>
		                            <li ><a href="javascript:void(0);">太极</a></li>
		                            <li ><a href="javascript:void(0);">游泳</a></li>
		                            <li ><a href="javascript:void(0);">篮球</a></li>
		                            <li ><a href="javascript:void(0);">乒乓球</a></li>
		                            <li ><a href="javascript:void(0);">PS</a></li>
		                            <li ><a href="javascript:void(0);">网页设计</a></li>
		                            <li ><a href="javascript:void(0);">编程</a></li>
		                    </ul>
		                </dt>
						<dd>
							<a href="<%=basePath%>teacher/teachersPage.action">更多课程<span class="china">&gt;&gt;</span></a>
						</dd>
					</dl>
				</div>
				<!--end分类-->
				<div class="tab_box_w r_cell h_tab_box_w">
					<div class="hide_box" style="display: block;">
						<ul class="list_3 tearch_ul round_img">
							<%
								//棋类教员信息列表
								List<Teacher> qiLeiTeacherList = (List<Teacher>) request
										.getAttribute("qiLeiTeacherList");
								if (qiLeiTeacherList != null) {
									for (int i = 0; i < qiLeiTeacherList.size(); i++) {
										Teacher t = qiLeiTeacherList.get(i);
							%>
				 			<li class="li_o">
								<a href="<%=basePath%>teacher/teacherInfoPage.action?tId=<%=t.getTeacherId()%>" class="box">
									<div class="hover_div transition_a">
										<p class="hide2">
										<%
											if (t.getSelfEvaluation().length() > 50) {
										%>
											<%=t.getSelfEvaluation().substring(0, 50)%>...
										<%
												} else {
											%>
											<%=t.getSelfEvaluation()%>
										<%
											}
										%>
										</p>
										<div class="d">
											<span class="look_btn transition_a">查看详情</span>
										</div>
									</div>
									<dl>
										<dt class="fl">
                                        <%
                                        	if (t.getGender() == 0 && "".equals(t.getPersonImg())) {
                                        %>
				                         <img src="<%=basePath%>static/img/w.png" alt="" width="100" height="100">
				                         <%
				                         	} else if (t.getGender() == 1
				                         					&& "".equals(t.getPersonImg())) {
				                         %>
				                         <img src="<%=basePath%>static/img/male1.png" alt="" width="100" height="100">
				                        <%
				                        	} else {
				                        %>
				                          <img src="<%=basePath%>static/teacherimg/personphoto/<%=t.getPersonImg()%>" alt="" width="100" height="100">  
				                        <%
  				                        	}
  				                        %>
                                   		</dt>
										<dd class="r_cell">
											<h5><%=t.getTeacherName().substring(0, 1)%>教员</h5>
											<p>授课经验：<%=t.getTeachingAge()%>年</p>
											<p><%=t.getEducationName()%></p>
										</dd>
									</dl>
								</a>
							</li>
				 			
				 			<%
				 					}
				 			}
				 							 			%>
							
						</ul>
					</div>
					<!--end一对一家教-->

				</div>
				<!--end标签内容-->
			</div>
			<!--end一行内容-->
		</div>
		<!--end中小学文化课-->
		<div class="box_w_n" style="width: 1200px;height: 135px;background-image: url(<%=basePath%>static/img/enter.png);">

		</div>

		<div class="w_1200 box_w_n clearfix h_tab">
			<dl class="tab_nav_w h_tab_nav h_tab_nav2">
				<dt class="fr">
           			<a href="<%=basePath%>member/ordersPage.action" class="round_m transition_a more_a">更多+</a>
        		</dt>
				<dt class="fl">最新家教</dt>

			</dl>
			<div class="tab_box_o">
				<div class="hide_box tab_box_w">
					<div style="display: block;">
						<ul class="h_jobs list_4 clearfix hover_ul">
						
						<%
							//家教需求订单
							List<Orders> ordersList = (List<Orders>) request
									.getAttribute("ordersList");
							if (ordersList != null) {
								for (int i = 0; i < ordersList.size(); i++) {
									Orders order = ordersList.get(i);
						%>
						 <li>
								<div class="box transition_a">
									<h5 class="orange_text"><%=order.getCourseName()%></h5>
									<div class=""><%=order.getArea()%></div>
									<%
										if (order.getCoursePrice() == 0) {
									%>
									 <div style="text-align: left;margin-left: 20px; margin-top: 10px;">课酬：参照标准</div>
								  	<%
								  		} else {
								  	%>
									 <div style="text-align: left;margin-left: 20px; margin-top: 10px;">课酬：￥<%=order.getCoursePrice()%>/小时</div>
									 <%
									 	}
									 %>
									
									<div style="text-align: left;margin-left: 20px; margin-top: 10px;">身份要求：<%=order.getTeacherTypeName()%></div>
									
									<%
																			if (order.getRequirements().length() < 34) {
																		%>
									<div style="text-align: left;margin-left: 20px;margin-top: 10px;">要求：<%=order.getRequirements()%></div>
									<%
										} else {
									%>
									<div style="text-align: left;margin-left: 20px;margin-top: 10px;">要求：<%=order.getRequirements().substring(0, 34)%>...</div>
									<%
										}
									%>
									
									
									<div class="d" style="margin-top: 10px;">
										<a href="<%=basePath %>order/orderInfo.action?oId=<%=order.getoId() %>" target="_blank" class="btn_border_o transition_a">我要申请</a>
									</div>
								</div>
							</li>
						 
						<%
 							}
 							}
 						%>
						</ul>
					</div>
					<!--end个人-->
				</div>
			</div>
			<!--end标签内容-->
		</div>
		<!--end招聘教员-->
		
		<div class="w_1200 clearfix box_w_n">
			<div class="fl w_5">
				<h4 class="th_text">吉师课堂</h4>
				<ul class="list_3 ke_ul clearfix">
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">语文试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">数学试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">英语试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">物理试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">化学试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">生物试题</a>
					</li>
				</ul>
				<ul class="news_list2 list_200">
				<%
				List<Paper> paperList = (List<Paper>)request.getAttribute("paplerTopSixList");
				if(paperList!=null){
					for(int i = 0;i<paperList.size();i++){
						Paper paper = paperList.get(i);
				%>
					<li>
						<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank" class="hide1"><%=paper.getTitle() %></a>
					</li>
				<%
					}
				}
				%>
				</ul>

			</div>
			
			
			<div class="fr w_5">
				<h4 class="th_text"></h4>
				<ul class="list_3 ke_ul clearfix">
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">历史试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">地理试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">政治试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">文综试题</a>
					</li>
					<li>
						<a href="<%=basePath %>paper/paperPage.action" target="_blank" class="transition_a">理综试题</a>
					</li>
					<li><b class="orange_link"><a href="<%=basePath %>paper/paperPage.action" target="_blank">更多<span class="china">&gt;&gt;</span></a></b></li>
				</ul>
				<ul class="news_list2 list_200">
				<%
				List<News> newsList = (List<News>)request.getAttribute("newsTopSixList");
				if(paperList!=null){
					for(int i = 0;i<newsList.size();i++){
						News news = newsList.get(i);
				%>
					<li>
						<a href="<%=basePath %>news/newsInfo.action?nId=<%=news.getnId() %>" target="_blank" class="hide1"><%=news.getTitle() %></a>
					</li>
				<%
					}
				}
				%>
				</ul>
			</div>
			
		</div>
		<!--end一行-->
		
		<div class="w_1200 box_w">

			<div class="d_link_city d_link_div">
				<h4 class="fl">友情链接：</h4>
				<div class="r_cell">
					<%
					List<Link> linkList = (List<Link>)request.getAttribute("linkList");
					Link link = null;
					if(linkList!=null){
						for(int i = 0;i<linkList.size();i++){
							link = linkList.get(i);
					%>
					<a href="<%=link.getWebUrl() %>" target="_blank" rel="nofollow"><%=link.getWebName() %></a>
					<%
						}
					}
					%>
				</div>
			</div>
			<!--end友情链接-->
		</div>

		<!--star_弹框-->

		<div class="cd-popup" id="SubjectModal">
			<div class="cd-popup-container cd-popup-container_h" style="width:1200px;">
				<a href="javascript:void(0);" class="cd-popup-close f_close_btn transition_a"></a>
				<h4 class="f_code_th">求教科目<p>求教科目最多可以选择1个</p></h4>

				<ul class="select_ul_w  clearfix" id="ulSelect">

				</ul>

				<div class="tab_box_h h_tab_n gray_border">
					<dl class="tab_nav_n fl tab_nav_y">
						<dd>
						<%
							//科目大类列表
							for (int i = 0; i < dictInfoList.size(); i++) {
								DictInfo dictInfo = dictInfoList.get(i);
								if (i == 0) {
						%>
						<a href="javascript:void(0)" class="tab_light"><%=dictInfo.getContent()%></a>
						  <%
						  	} else {
						  %>
						 <a href="javascript:void(0)"><%=dictInfo.getContent()%></a>
						 <%
						 	}
						 	}
						 %>
						</dd>
					</dl>
					<div class="tab_box_n r_cell r_text">
					<%
						if (dictInfoList != null) {
							for (int i = 0; i < dictInfoList.size(); i++) {//1 幼儿
								DictInfo kemudaleiDict = dictInfoList.get(i);
					%>
            	<div class="h_340 scroll_box" style="display: block;">
            <%
            	//科目小类
            			List<DictInfo> dictInfoKeMuXiaoLeiList = (List<DictInfo>) request
            					.getAttribute("dictInfoKeMuXiaoLeiList");

            			if (dictInfoKeMuXiaoLeiList != null) {
            				for (int j = 0; j < dictInfoKeMuXiaoLeiList.size(); j++) {//65 幼儿课程 
            					DictInfo dictInfo = dictInfoKeMuXiaoLeiList.get(j);
            					if (dictInfo.getLinkDict() == kemudaleiDict
            							.getDictId()) {
            %>	
            		<h4 class="th_line_w"><span><em><%=dictInfo.getContent()%></em></span></h4>
            		<ul class="sec_subject  clearfix list_8">
	            				<%
	            					for (int k = 0; k < courseList.size(); k++) {
	            											Course course = courseList.get(k);//1	学前教育家教	65	幼儿课程家教	1	幼儿
	            											if (course.getKeMuXiaoLei() == dictInfo
	            													.getDictId()
	            													&& course.getKeMuDaLei() == kemudaleiDict
	            															.getDictId()) {//66==65 2==1
	            				%>
	            				 <li data-id="<%=course.getCourseId()%>" class=" threeli">
	                             	<a href="javascript:void(0)"><%=course.getCourseName()%></a>
	                             </li>
	            				<%
	            					}
	            										}
	            				%>
            				<%
            					}
            				%>
            		</ul>
            			<%
            				}
            			%>
            	
            	
            		<%
            	            	            			}
            	            	            		%>
            	</div>
            	<%
            		}
            	%>
           	<%
           		}
           	%>
						<!--end_所有科目-->
					</div>
					<!--end标签内容-->
				</div>
				<!--end一行-->
				<div class="btn_20">
					<a href="javascript:void(0)" id="btnConfirmSubject" class="cd-popup-close round_m submit_btn transition_a">确认提交</a>
					<a href="javascript:void(0)" class="cd-popup-close transition_a round_m btn_border_gray">取消</a>
				</div>
				<!--end按钮-->
			</div>
		</div>
		<!--end弹框-->


		<!--star_弹框-->
		<div class="cd-popup" id="AppointSuccessPop">
			<div class="cd-popup-container" style="width: 660px;">
				<a href="javascript:void(0)" class="cd-popup-close f_close_btn transition_a"></a>
				<h4 class="f_code_th">
			            预约TA
			    <p></p>
			    </h4>

				<div class="tel_box">
					<span class="tel_arrow png round_r"></span>
					<p>预约成功！</p>
					<p>您的专属课程顾问24小时以内尽快与您联系。</p>
					<p>或您也可以致电给我们：150-6033-8989</p>
				</div>
				<!--end一行-->
				<div class="wechat_note">
					如有疑问或寻求帮助，请关注微信号，客服MM为您解答
					<p>
						<img src="<%=basePath%>static/img/wechat.jpg" alt="" width="160" data-bd-imgshare-binded="1">
					</p>
					<!--end二维码-->
				</div>
			</div>
		</div>



		<script>
			$(".threeli").click(function() {
				var $this = $(this);
				if(!$this.hasClass("active") && $("#ulSelect li").length >= 1) {
					alert("最多可选1门课程");
					return false;
				}

				var text = $this.find("a").text();
				var id = $this.data("id");
				if(!$this.hasClass("active")) {
					$("#ulSelect").append("<li data-id=" + id + " class='active round_m'> <a data-id='" + id + "' href='javascript:void(0)'>" + text + "</a><span class='close_s'></span></li>");
					$this.addClass("active");
				} else {
					$("#ulSelect li[data-id='" + id + "']").remove();
					$this.removeClass("active");
				}
			});

			$("#ulSelect").on("click", "li", function() {
				var $this = $(this);
				$this.remove();
				$(".threeli[data-id='" + $this.data("id") + "']").removeClass("active");
			});
		</script>
					


	<jsp:include page="footer.jsp"></jsp:include>


		
