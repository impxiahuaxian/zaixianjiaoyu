<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.District"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Course"%>
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

		<title>【吉师家教网】吉师家教网_免费找家教_四平在线一对一在线辅导</title>
		<meta name="keywords" content="吉师家教，吉师家教兼职，四平兼职家教，家教">
		<meta name="description"
			content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650">

		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>static/css/css.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>static/css/code.css">
		<LINK rel="stylesheet" type="text/css"
			href="<%=basePath%>static/css/base.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>static/css/brief.css">
	
		<link href="<%=basePath%>static/css/ui-choose.css" rel="stylesheet"  type="text/css"/>
		<link rel="stylesheet" href="<%=basePath%>static/css/buttons.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/jquery.selectlist.css">

		<script type="text/javascript"
			src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>static/js/jquery-ui.js"></script>
		<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
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

		<div class="header min_1200">
			<div class="w_1200">
				<h3 class="h_city fl">
					<span class="png city_arrow">四平</span>
					<p>
						<a href="javascript:void(0);" class="round_s city_btn" rel="nofollow">切换城市</a>
					</p>
				</h3>

				 <img alt="" src="<%=basePath %>static/img/logo_contact.png">
				<div class="header_r fr">
					<span class="font_16">客服微信：</span>
					<img src="<%=basePath%>static/img/wechat.jpg" class="wechat_img"
						alt="吉师家教客服微信" width="80" height="80">

					<%
						Teacher teacher = (Teacher) session.getAttribute("teacher");
						Member member = (Member) session.getAttribute("member");
						if (member == null && teacher == null) {
					%>
					<span class="font_13"> <b class="orange_link"> <a
							href="<%=basePath%>loginPage.action" class="heada"> 登录</a> </b> <em
						class="china"></em> <b class="orange_link"> <a
							href="<%=basePath%>registerPage.action" class="heada">注册</a> </b> </span>

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

		<!--end头文件-->

		<div class="nav min_1200">
			<div class="tnav w_1200" id="slideNav">
				<span><a href="<%=basePath %>">家教首页</a></span>
				<span><a href="<%=basePath %>costPage.action">资费标准</a></span>
				<span><a href="<%=basePath %>teacher/teachersPage.action" class="current_nav">找老师</a></span>
				<span><a href="<%=basePath %>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath %>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action">吉师课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->

		<dl class="site_th w_1200">
			<dd>
				当前位置：
				<a href="<%=basePath%>">首页</a><span class="china">&gt;</span>找老师
			</dd>
		</dl>

		<form action="teacherListPage.action" method="post">
			<div class="w_1200 box_w_s clearfix white_bj">
				<ul class="filter_ul clearfix">
					<li class="clearfix">
						<h4 class="fl">
							授课科目：
						</h4>
						<div  class="r_cell r_text round_m_a click_a_o">
						
							<select class="ui-choose" id="course" name="course" >
					          <option value="0" style="margin: 30px; ">不限</option>
					          
					          <%
								List<DictInfo> dictInfokemuxiaoleiList = (List<DictInfo>) request.getAttribute("dictInfoList");
								if (dictInfokemuxiaoleiList != null) {
									for (int i = 0; i < dictInfokemuxiaoleiList.size(); i++) {
										DictInfo dictInfo = dictInfokemuxiaoleiList.get(i);
							%>
							<option value="<%=dictInfo.getDictId() %>" style="margin: 30px; "><%=dictInfo.getContent()%></option>
							<%
									}
								}
							%>
					        </select>
						</div>
					</li>
	
					<li class="clearfix">
						<h4 class="fl">
							授课区域：
						</h4>
						<div class="r_cell r_text round_m_a click_a_o">
							<select class="ui-choose" id="areaId" name="areaId" >
					          <option value="0" style="margin: 30px; ">不限</option>
					          <%
								List<District> districtList = (List<District>) request.getAttribute("districtList");
								if (districtList != null) {
									for (int i = 0; i < districtList.size(); i++) {
										District district = districtList.get(i);
							%>
							<option value="<%=district.getDistrictId() %>" style="margin: 30px; "><%=district.getDistrict()%></option>
								<%
		 						}
		 						}
		 					%>
					        </select>
						</div>
					</li>
	
					<li class="clearfix">
						<h4 class="fl">
							其它筛选：
						</h4>
						<div class="r_cell">
							<select id="teacherType" name="teacherType">
							  <option value="0">--不限老师身份--</option>
							  <option value="18">大学生/毕业生</option>
							  <option value="19">专职老师</option>
							</select>
							<select id="gender" name="gender">
							  <option value="2">--不限老师性别--</option>
							  <option value="1">男</option>
							  <option value="0">女</option>
							</select>
							<button type="submit" class="button button-action button-box" style="width: 150px;float: right;">查询</button>
						</div>
					</li>
				</ul>
			</div>
			<!--end筛选-->
		</form>

		<div class="w_1200 box_w_s clearfix">
			<div class="fl w_890">
				<h4 class="l_th">
					<b class="fl th_b">四平家教</b>
				</h4>
				<!--end标题-->
				<div class="clearfix white_bj box_t_o">
					<ul class="tearch_list_ul round_img">
					<%
					List<Course> courseList = (List<Course>)request.getAttribute("courseList");
					List<Teacher> teacherList = (List<Teacher>)request.getAttribute("teacherList");
					if(teacherList!=null){
						for(int i=0;i<teacherList.size();i++){
							Teacher teacher2 = teacherList.get(i);
					%>
					<li class="clearfix li_o transition_a">
						<dl>
							<dt class="fl">
								<a href="<%=basePath %>teacher/teacherInfoPage.action?tId=<%=teacher2.getTeacherId() %>" target="_blank"
									rel="nofollow"> 
									<%
									if(!"".equals(teacher2.getPersonImg())){
									 %>
									<img src="<%=basePath %>static/teacherimg/personphoto/<%=teacher2.getPersonImg() %>" alt="" width="100" height="100"> 
									 <%
									 }else{
									 	if(teacher2.getGender()==1){
									 %>
									 	<img src="<%=basePath %>static/img/male.png" alt="" width="100" height="100"> 
									 	<%
									 	}else{
									 	%>
									 	<img src="<%=basePath %>static/img/w.png" alt="" width="100" height="100"> 
										 <%
										 }
										 %>
									 <%
									 }
									  %>
									<p> 编号 <%=teacher2.getTeacherId() %> </p> 
									<span class="btn_24 round_m btn_green">免费试讲</span> 
								</a>
							</dt>
							<dd class="r_cell">
								<div class="fr r_text font_13">
									<%=teacher2.getSelfEvaluation() %>
								</div>
								<div class="r_cell l_text">
									<h5>
										<a href="<%=basePath %>teacher/teacherInfoPage.action?tId=<%=teacher2.getTeacherId() %>" target="_blank"
											rel="nofollow"> <%=teacher2.getTeacherName().substring(0,1) %>教师 </a>
										<span class="round_m text_box_border"> <%=teacher2.getIdentityName() %> </span>
										<a href="<%=basePath %>teacher/teacherInfoPage.action?tId=<%=teacher2.getTeacherId() %>" class="map_a png"
											target="_blank" rel="nofollow"> <%=teacher2.getArea() %> </a>
									</h5>
									<p>
										授课经验：<%=teacher2.getTeachingAge() %>年
									</p>
									<p>
										授课科目：
										<%
										String[] teachingCourses = teacher2.getTeachingCource().split(",");//1,2,5,6,
										if(teachingCourses!=null){
											for(int j=0;j<teachingCourses.length;j++){
												int courseId = Integer.parseInt(teachingCourses[j]);//1
												for(int k=0;k<courseList.size();k++){
													if(courseId==courseList.get(k).getCourseId()){
										%>
													<%=courseList.get(k).getCourseName() %>
										<%			
													break;
													}
												}
										%>
											<%
											if(j!=(teachingCourses.length-1)){
											 %>
											 ,
											 <%
											 }
											 %>
											
										<%
											}
										}
										%>
									</p>
									<div class="d">
										<a href="<%=basePath %>teacher/teacherInfoPage.action?tId=<%=teacher2.getTeacherId() %>" class="btn_40 round_m transition_a" target="_blank">联系TA</a>
									</div>
								</div>
							</dd>
						</dl>
					</li>
					<%
						}
					}
					%>
					</ul>
					<dl class="page_o page_c" style="padding:2.5em 0;">
	             		<%=request.getAttribute("pageTool")%>
	       			</dl>
				</div>
				<!--end左列表-->
			</div>

			<div class="fr w_270">
				<div class="free_box_f clearfix white_bj">
					<!--end一行左-->
					<div class="banner_login banner_login_new" style="border: 1px solid #eee; ">
						<h4 class="login_th" style="background-color:#3ac779;">
							<span><b>快速请家教</b> </span>
						</h4>
						<dl class="banner_login_fill" style="text-align: center;">
							<dt>
								<div class="box clearfix">
					                <div class="r_cell">
					                    <input type="text" placeholder="家长姓名" id="name" name="name"  value="" style="border: solid 1px #eaeaea;height: 40px;width: 220px;font-size: 15px;" />
					                </div>
					            </div>
								<div class="box clearfix">
					                <div class="r_cell">
					                    <input type="text" placeholder=" 手机电话"  id="phone" name="phone" value="" style="border: solid 1px #eaeaea;height: 40px;width: 220px;font-size: 15px;" />
					                </div>
					            </div>

								<div class="box clearfix">
									<div class="r_cell">
										<!--star下拉-->
										<div class="divselect_box cd-popup-trigger" style="width: 220px;height: 40px"
											target="#SubjectModal" id="Subject">
											<cite data-id="0">请选择科目</cite>
										</div>
										<!--end下拉-->
									</div>
								</div>
								<div class="box">
					                <div class="r_cell">
					                    <input type="text" placeholder="微信号（选填）"  id="wxNumber" name="wxNumber"   value="" style="border: solid 1px #eaeaea;height: 40px;width: 220px;font-size: 15px;" />
					                </div>
					            </div>

							</dt>
							<dd>
								<input type="button" id="btnFastOrderTeacher"
									class="login_btn transition_a" value="提交">
							</dd>
						</dl>
					</div>
					<!--star_弹框-->
					<div class="cd-popup" id="AppointSuccessPop">
						<div class="cd-popup-container" style="width: 660px;">
							<a href="javascript:void(0);" class="cd-popup-close f_close_btn transition_a"></a>
							<h4 class="f_code_th">
			            	预约TA
			            	<p></p>
			        		</h4>
			
							<div class="tel_box">
								<span class="tel_arrow png round_r"></span>
								<p>预约成功！</p>
								<p>您的专属课程顾问24小时以内尽快与您联系。</p>
								<p>或您也可以致电给我们：182-5380-0650</p>
							</div>
							<!--end一行-->
							<div class="wechat_note">
								如有疑问或寻求帮助，请关注微信号，客服MM为您解答
								<p>
									<img src="<%=basePath %>static/img/wechat.jpg" alt="" width="160" data-bd-imgshare-binded="1">
								</p>
								<!--end二维码-->
							</div>
						</div>
					</div>
					<!--end一行左-->
				</div>
				<!--end快速找家教-->
			</div>
			<!--end一行左-->
		</div>
		<!--end一行-->

		<!--star_弹框-->
		<div class="cd-popup" id="SubjectModal">
			<div class="cd-popup-container cd-popup-container_h" style="width:1200px;">
				<a href="javascript:void(0);" class="cd-popup-close f_close_btn transition_a"></a>
				<h4 class="f_code_th">求教科目<p>求教科目最多可以选择1个</p></h4>
				<ul class="select_ul_w  clearfix" id="ulSelect"></ul>

				<div class="tab_box_h h_tab_n gray_border">
					<dl class="tab_nav_n fl tab_nav_y">
						<dd>
						<%
						List<DictInfo> dictInfokemudaleiList = (List<DictInfo>)request.getAttribute("dictInfokemudaleiList");
						//科目大类列表
						for(int i = 0; i < dictInfokemudaleiList.size();i++){
							DictInfo dictInfo = dictInfokemudaleiList.get(i);
							if(i==0){
						%>
						<a href="javascript:void(0)" class="tab_light"><%=dictInfo.getContent() %></a>
						  <%}else{ %>
						 <a href="javascript:void(0)"><%=dictInfo.getContent() %></a>
						 <%
						 	}
						 } 
						 %>
						</dd>
					</dl>
					<div class="tab_box_n r_cell r_text">
					<%
		             if(dictInfokemudaleiList!=null){
		             	for(int i = 0; i < dictInfokemudaleiList.size();i++){//1 幼儿
		             		DictInfo kemudaleiDict = dictInfokemudaleiList.get(i);
             		%>
            			<div class="h_340 scroll_box" style="display: block;">
            		<%
				            //科目小类
		                    List<DictInfo> dictInfoKeMuXiaoLeiList = (List<DictInfo>)request.getAttribute("dictInfoKeMuXiaoLeiList");
		                    if(dictInfoKeMuXiaoLeiList!=null){
		                    	for(int j=0;j<dictInfoKeMuXiaoLeiList.size();j++){//65 幼儿课程 
				           			DictInfo dictInfo = dictInfoKeMuXiaoLeiList.get(j);
				           			if(dictInfo.getLinkDict()==kemudaleiDict.getDictId()){
		            %>	
		            		<h4 class="th_line_w"><span><em><%=dictInfo.getContent() %></em></span></h4>
		            		<ul class="sec_subject  clearfix list_8">
			            				<%
			            				for(int k=0;k<courseList.size();k++){
			            					Course course = courseList.get(k);//1	学前教育家教	65	幼儿课程家教	1	幼儿
			            					if(course.getKeMuXiaoLei()==dictInfo.getDictId()&&
			            						course.getKeMuDaLei()==kemudaleiDict.getDictId()){//66==65 2==1
			            				%>
		            				 <li data-id="<%=course.getCourseId() %>" class=" threeli">
		                             	<a href="javascript:void(0)"><%=course.getCourseName() %></a>
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
		
		<!-- 授课科目跟授课区域 -->
		<script src="<%=basePath %>static/js/ui-choose.js"></script>
		
		<script>
		// 将所有.ui-choose实例化
		$('.ui-choose').ui_choose();
		$(function(){ 
			var areaId = $('#areaId').data('ui-choose');
		　　  areaId.val('<%=request.getAttribute("areaId")%>');
			var course = $('#course').data('ui-choose');
		　　  course.val('<%=request.getAttribute("course")%>');
			$("#teacherType").val(<%=request.getAttribute("teacherType")%>);
			$("#gender").val(<%=request.getAttribute("gender")%>);
		});
		
		</script>
		<!-- 授课科目跟授课区域 -->
		
		<script src="../static/js/jquery.selectlist.js"></script>
		<script type="text/javascript">
			$(function(){
				$('#gender').selectlist({
					zIndex: 100,
					width: 160,
					height: 35
				});	
				$('#teacherType').selectlist({
					zIndex: 100,
					width: 160,
					height: 35
				});		
			})
		</script>
		<script>
			var regmobile = /^(13[0-9]|14[57]|15[0-35-9]|17[0678]|18[0-9])[0-9]{8}$/;
			
			//弹出科目选择
			$("#p_subject").on("click", function() {
				$(this).showPop();
			});
		
			//选择科目
			$("#btnConfirmSubject").click(
					function() {
						if ($("#ulSelect li").length <= 0) {
							$("#p_subject").val("");
							$("#p_subject").data("id", 0);
						} else {
							$("#p_subject").val(
									$($("#ulSelect li")[0]).find("a").text());
							$("#p_subject").data("id",
									$($("#ulSelect li")[0]).find("a").data("id"));
						}
					});
		
		
		</script>

	<script>
		var regmobile = /^(13[0-9]|14[57]|15[0-35-9]|17[0678]|18[0-9])[0-9]{8}$/;
		$(function() {
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
						
						$.post('../fastOrderTeacher.action', d, function(res) {
							if (res.success) {
								$("#AppointSuccessPop").ShowSelfPopMessage(res.message);
							} else {
								$this.val('提 交').attr('disabled', false);
								alert(res.message);
							}
						});
					});
					
			$("#btnConfirmSubject").click(
					function() {
						if ($("#ulSelect li").length <= 0) {
							$("#Subject").find("cite").text("不限");
							$("#Subject").find("cite").data("id", 0);
						} else {
							$("#Subject").find("cite").text(
									$($("#ulSelect li")[0]).find("a").text());
							$("#Subject").find("cite").data("id",
									$($("#ulSelect li")[0]).find("a").data("id"));
						}
					});
					
					
		});
	</script>

		<jsp:include page="footer.jsp"></jsp:include>