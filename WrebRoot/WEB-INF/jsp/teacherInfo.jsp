<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
<%@page import="com.jiajiao.bean.Course"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="width=1200">
		<meta name="keywords" content="四平家教，四平家教兼职，四平兼职家教，家教">
		<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		
		<link rel="stylesheet" type="text/css" href="<%=basePath %>static/css/css.css">
		
		<script type="text/javascript" src="<%=basePath %>static/js/jquery-1.9.1.min.js"></script>

		<link href="<%=basePath %>static/css/brief.css" rel="stylesheet">
		<script src="<%=basePath%>static/js/jquery.qrcode.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>static/css/code.css">
		<script type="text/javascript" src="<%=basePath %>static/js/code.js"></script>
		<%Teacher teacherInfo = (Teacher)request.getAttribute("teacherInfo"); %>
		<title>【四平家教网】<%=teacherInfo.getTeacherName().substring(0,1) %>老师 </title>
		<script type="text/javascript" src="<%=basePath %>static/js/tool.js"></script>
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
  <body class="gray_body">
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
						alt="四平家教客服微信" width="80" height="80">

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
					<span class="font_13"> <b class="orange_link"> <a
							href="<%=basePath%>logout.action" class="heada"> 退出</a> </b> <em
						class="china"></em> <b class="orange_link"> <%
                        	if (member != null) {
                        %> <a href="<%=basePath%>member/index.action"
							class="heada">我的</a> <%
	                   		} else if (teacher != null) {
	                   	%> <a href="<%=basePath%>teacher/index.action"
							class="heada">我的</a> <%
	                   		}
	                   	%> </b> </span>

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
				<span><a href="<%=basePath %>" >家教首页</a></span>
				<span><a href="<%=basePath %>costPage.action" >资费标准</a></span>
				<span><a href="<%=basePath %>teacher/teachersPage.action" class="current_nav">找老师</a></span>
				<span><a href="<%=basePath %>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath %>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action">云课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->
		<%
		
		if(teacherInfo!=null){
		 %>
		<div class="tearch_banner min_1200 h_270">
			<div class="w_1200">
				<dl class="dis_th clearfix tearch_th">
					<dt class="fr">
                </dt>
					<dd class="r_cell"></dd>
				</dl>
				<dl class="clearfix tearch_d_nav">
					<dt class="round_img img_shadow fl">
	                    <a href="javascript:void(0)">
	                    <%
						if(!"".equals(teacherInfo.getPersonImg())){
						 %>
						<img src="<%=basePath %>static/teacherimg/personphoto/<%=teacherInfo.getPersonImg() %>" alt="" width="140" height="140" > 
						 <%
						 }else{
						 	if(teacherInfo.getGender()==1){
						 %>
						 	<img src="<%=basePath %>static/img/male.png" alt="" width="140" height="140" > 
						 	<%
						 	}else{
						 	%>
						 	<img src="<%=basePath %>static/img/w.png" alt="" width="140" height="140" > 
							 <%
							 }
							 %>
						 <%
						 }
						 %>
	                    </a>
                	</dt>
					<dd class="r_cell">
						<div class="t">
							<h4 class="fl font_24">
                            <%=teacherInfo.getTeacherName().substring(0,1) %>老师
                        	</h4>
							<span class="round_m text_box_border"><%=teacherInfo.getIdentityName() %></span>
							<span class="m_t">
                            	<a href="javascript:void(0)" class="png map_a">四平-<%=teacherInfo.getArea() %></a>
                        	</span>
							<span style="margin-left: 10px;">教龄<%=teacherInfo.getTeachingAge() %>年
                        	</span>
	                        <span style="float: right;">编号：
	                        	<span class="font_24 eng"><%=teacherInfo.getTeacherId() %>
	                            	<input type="hidden" id="TeacherId" name="TeacherId" value="<%=teacherInfo.getTeacherId() %>">
	                        	</span>
	                        </span>
						</div>
						<ul class="d" id="js_nav">
							<li class="current">
								<a href="#step_1">主页</a>
							</li>
							<li>
								<a href="#step_2">家教经验</a>
							</li>
							<li>
								<a href="#step_3">学员评价</a>
							</li>
						</ul>
					</dd>
				</dl>
			</div>
		</div>
		<!--end一行-->

		<div class="w_1200 d_center white_bj">
			<div class="fl w_300 box_line">
				<dl class="tearch_l_data js_fix_light" id="js_nav_l">
					<dt>
	                    <h4>
	                    	<span class="tearch_arrow_a png font_22"><%=teacherInfo.getTeacherName().substring(0,1) %>老师</span>
	                    	<span class="font_14 gray_text m_l">(编号:<%=teacherInfo.getTeacherId() %>)</span>
	                    </h4>
	                    <div class="t_o">
	                        <span style="display: inline-block;">上次登录时间:<%=teacherInfo.getLastLoginTime() %></span>
	                    </div>
                	</dt>
					<dd>
						<ul class="list_2">
							<li class="fl">
								<a href="javascript:void(0)">
									<span class="font_24 eng"><%=request.getAttribute("successJJ") %></span>
									<p>成功授课</p>
								</a>
							</li>
							<li>
								<a href="javascript:void(0)">
									<span class="font_24 eng">0</span>
									<p>学员评价</p>
								</a>
							</li>
						</ul>
					</dd>
					<dd style="margin-top: 90px">
	                    <h5>扫一扫，手机浏览本页</h5>
	                    <div id="qcode"></div>
	                </dd>
				</dl>
			</div>
			<!--end一行的左-->
			<div class="fr box_r_w">
				<div class="div_div clearfix font_15" id="step_1">
					<h4 class="th_line_d">教员信息</h4>
					<ul class="clearfix list_text_ul list_2 blue_link">
						<li>出生年月：<%=teacherInfo.getBirthday() %></li>
						<li>省份/国家：<%=teacherInfo.getProvince() %></li>
						<li>就读学校：<%=teacherInfo.getSchool() %></li>
						<li>最高学历：<%=teacherInfo.getEducationName() %></li>
						<li>所学专业：<%=teacherInfo.getProfessional() %></li>
						<li>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
						<%if(teacherInfo.getGender()==1){%>
						男
						<%}else{ %>
						女
						<%} %>
						</li>
						<li>所获证书：<%=teacherInfo.getCertificate() %></li>
						<li class="li_w clearfix">薪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;酬：
							<b class="orange_text">
							<%if(teacherInfo.getCoursePrice()==0){ %>
							执行四平家教薪酬标准
							<%}else{ %>
							<%=teacherInfo.getCoursePrice() %>/小时
							<%} %>
							</b>
						</li>
						<li class="clearfix li_w">
							<span class="fl">授课科目：</span>
							<div class="r_cell a_margin">
							<%//所有课程信息
		                     if(!teacherInfo.getTeachingCource().equals("")){
								 String[] coursesId2 = teacherInfo.getTeachingCource().split(",");
								 
								 List<Course> courseList3 = (List<Course>)request.getAttribute("courseList"); 
								 if(courseList3!=null){
								 	for(int i=0;i<coursesId2.length;i++){
									 	String strCourse =  coursesId2[i];
									 	for(int j=0;j<courseList3.size();j++){
									 		Course course = courseList3.get(j);
									 		if(course.getCourseId()==Integer.parseInt(strCourse)){
								%>
											<a href="javascript:void(0)"><%=course.getCourseName() %></a>
											
											<%} %>
										<%} %>
									<%} %>
								<%} %>
		                    <%} %>
							</div>
						</li>

						<li class="clearfix li_w">
							<span class="fl">辅导区域：</span>
							<div class="r_cell a_margin">
							<%
		                    String[] teachingAreas = teacherInfo.getTeachingArea().split(",");
		                    if(ArrayHelper.inArray(teachingAreas,"1")){
		                    %>
		                    	<a href="javascript:void(0)">城厢区</a>
		                    <%} %>
		                    <%if(ArrayHelper.inArray(teachingAreas,"2")){ %> 
		                    	<a href="javascript:void(0)">荔城区</a>
		                    <%} %>
		                    <%if(ArrayHelper.inArray(teachingAreas,"3")){ %> 
		                    	<a href="javascript:void(0)">秀屿区</a>
        					<%} %>
        					<%if(ArrayHelper.inArray(teachingAreas,"4")){ %> 
        						<a href="javascript:void(0)">涵江区</a>
			        		<%} %>
			        		<%if(ArrayHelper.inArray(teachingAreas,"5")){ %> 
			        			<a href="javascript:void(0)">仙游县</a>
        					<%} %>

							</div>
						</li>

						<li class="clearfix li_w">
							<span class="fl">大概住址：</span>
							<div class="r_cell"><%=teacherInfo.getAddress() %></div>
						</li>

						<li class="clearfix li_w">
							<span class="fl">授课方式：</span>
							<div class="r_cell">
							<%
							String[] teachingWays = teacherInfo.getTeachingWay().split(",");
							if(teachingWays.length>=2){
							%>
							 一对一家教上门、一对一学生上门
							 <%}else{
							 		if("20".equalsIgnoreCase(teachingWays[0])){ 
							 %>
							 一对一家教上门
							 	<%
							 		} else{
							 	%>
							 	一对一学生上门
							 	<%
							 		}
							 	 %>
							 		
							 <%} %>
							</div>
						</li>

						<li class="clearfix li_w">
							<span class="fl">授课时间：</span>
							<div class="r_cell">
								<table class="time_table png_img" style="width:675px;">
									<thead>
										<tr>
											<th></th>
											<th>周一</th>
											<th>周二</th>
											<th>周三</th>
											<th>周四</th>
											<th>周五</th>
											<th>周六</th>
											<th>周日</th>
										</tr>
									</thead>
									<tbody>
									<%
								    String[] teachingTimes = teacherInfo.getTeachingTime().split(",");
								    %>
										 <tr>
								        <th>上午</th>
								        <%
								        if(ArrayHelper.inArray(teachingTimes,"33")){
								         %>
								        <td data-id="33"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="33"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"36")){
								         %>
								        <td data-id="36"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="36"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"39")){
								         %>
								        <td data-id="39"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="39"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"42")){
								         %>
								        <td data-id="42"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="42"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"45")){
								         %>
								        <td data-id="45"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="45"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"48")){
								         %>
								        <td data-id="48"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="48"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"51")){
								         %>
								        <td data-id="51"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="51"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								    </tr>
								    <tr>
								        <th>下午</th>
								         <%
								        if(ArrayHelper.inArray(teachingTimes,"34")){
								         %>
								        <td data-id="34"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="34"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"37")){
								         %>
								        <td data-id="37"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="37"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"40")){
								         %>
								        <td data-id="40"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="40"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"43")){
								         %>
								        <td data-id="43"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="43"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"46")){
								         %>
								        <td data-id="46"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="46"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"49")){
								         %>
								        <td data-id="49"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="49"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"52")){
								         %>
								        <td data-id="52"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="52"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								        
								    <tr>
								        <th>晚上</th>
								        
								         <%
								        if(ArrayHelper.inArray(teachingTimes,"35")){
								         %>
								        <td data-id="35"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="35"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"38")){
								         %>
								        <td data-id="38"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="38"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"41")){
								         %>
								        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"44")){
								         %>
								        <td data-id="44"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="44"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"47")){
								         %>
								        <td data-id="47"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="47"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"50")){
								         %>
								        <td data-id="50"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="50"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"53")){
								         %>
								        <td data-id="53"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="53"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								        
								    </tr>
									</tbody>
								</table>
								<input id="TimeListId" name="TimeListId" type="hidden" value="<%=teacherInfo.getTeachingTime() %>">
								<input id="TimeListName" name="TimeListName" type="hidden" value="">

							</div>
						</li>
					</ul>
				</div>
				<!--end右一行-->

				<div class="div_div clearfix font_15" id="step_2">
					<h4 class="th_line_d">家教经验</h4>
					<ul class="clearfix list_text_ul">
						<li class="clearfix">
							<div class="text_sec"><%=teacherInfo.getTeachingCase() %></div>
						</li>
					</ul>
				</div>
				<!--end右一行-->

				<div class="div_div clearfix font_15">
					<h4 class="th_line_d">自我描述</h4>
					<div class="text_sec"><%=teacherInfo.getSelfEvaluation() %></div>
				</div>
				<!--end右一行-->

				<div class="div_div clearfix" id="step_3">
					<h4 class="th_line_d">学员评价<span class="round_m mes_num m_l">0</span></h4>
				</div>
				<!--end右一行-->
			</div>
			<!--end一行的右-->
		</div>
		<%} %>
		<!--end一行-->
		<!--返回顶部-->
		<div class="ftool_top">
			<a href="#" class="top_ftoolab transition_a" id="ftoolTop" style="display: block;"></a>
		</div>
		<!--返回顶部-->
		<!--star固定底部-->
		<div class="box_bottom_fixed">
			<span class="png_img f_people" style="margin-right: 6em;"><img src="<%=basePath %>static/img/pic.png" alt="" width="190" height="150" ></span>

			<span class="btn_tt">
	            <a onclick="return false;" href="javascript:void(0);" class="round_m btn_50 orange_btn" id="btnAppoint" target="#AppointSuccessPop" rel="nofollow">
	                <span class="png btn_arrow btn_yu"></span>预约TA授课
				</a>
			</span>
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
					<p>预约成功</p>
					<p>您的专属课程顾问24小时以内尽快与您联系。</p>
					<p>或您也可以致电给我们：182-5380-0650</p>
				</div>
				<div class="wechat_note">
					如有疑问或寻求帮助，请关注微信公众号，客服MM为您解答
					<p>
						<img src="<%=basePath %>static/img/wechat.jpg" alt="" width="160" >
					</p>
				</div>
			</div>
		</div>

		<div class="cd-popup " id="AppointPop">
			<div class="cd-popup-container" style="width: 660px;">
				<a href="javascript:void(0);" class="cd-popup-close f_close_btn transition_a"></a>
				<h4 class="f_code_th">
		            	预约授课
		            <p>请填写预约信息</p>
		        </h4>
				<table class="fill_table fill_table_input">
					<tbody>
						<tr>
							<th>授课科目：</th>
							<td>
								<div class="dtdropsel dtdropsel_log divselect" style="z-index:3">
									<cite id="SubjectIds_app"></cite>
									<ul class="dtselect_list dtselect_list_scroll">
									<%//所有课程信息
				                     if(!teacherInfo.getTeachingCource().equals("")){
										 String[] coursesId2 = teacherInfo.getTeachingCource().split(",");
										 
										 List<Course> courseList3 = (List<Course>)request.getAttribute("courseList"); 
										 if(courseList3!=null){
										 	for(int i=0;i<coursesId2.length;i++){
											 	String strCourse =  coursesId2[i];
											 	for(int j=0;j<courseList3.size();j++){
											 		Course course = courseList3.get(j);
											 		if(course.getCourseId()==Integer.parseInt(strCourse)){
										%>
													<li data-id="<%=course.getCourseId() %>"><%=course.getCourseName() %></li>
													<%} %>
												<%} %>
											<%} %>
										<%} %>
				                    <%} %>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<th><label for="fill_1">联系人：</label></th>
							<%if(member==null){ %>
							<td id="ContactSex_app">
								<input type="text" id="Contact_app" class="fill_text" value="" style="width: 200px;">
								<span class="sel_box_r">
		                        	<input type="radio" id="aaa-1" name="aaa" value="1" checked="">
		                        	<label for="aaa-1">先生</label>
		                    	</span>
								<span class="sel_box_r m_l_b">
		                        	<input type="radio" id="aaa-2" name="aaa" value="0">
		                        	<label for="aaa-2">女士</label>
                    			</span>
                    			
							</td>
							<%}else{ %>
							<td id="ContactSex_app">
								<input type="text" id="Contact_app" class="fill_text" value="<%=member.getName() %>" style="width: 200px;">
								<%if(member.getGender()==1){ %>
								<span class="sel_box_r">
		                        	<input type="radio" id="aaa-1" name="aaa" value="1" checked="">
		                        	<label for="aaa-1">先生</label>
		                    	</span>
								<span class="sel_box_r m_l_b">
		                        	<input type="radio" id="aaa-2" name="aaa" value="0">
		                        	<label for="aaa-2">女士</label>
                    			</span>
                    			<%}else{ %>
                    			<span class="sel_box_r">
		                        	<input type="radio" id="aaa-1" name="aaa" value="1" >
		                        	<label for="aaa-1">先生</label>
		                    	</span>
								<span class="sel_box_r m_l_b">
		                        	<input type="radio" id="aaa-2" name="aaa" value="0" checked="">
		                        	<label for="aaa-2">女士</label>
                    			</span>
                    			<%} %>
							</td>
							<%} %>
						</tr>
						<tr>
							<th>授课区域：</th>
							<td>
								<div class="dtdropsel dtdropsel_log divselect" style="z-index: 2">
									<cite id="AreaId_app" data-id="0"></cite>

									<ul class="dtselect_list dtselect_list_scroll">
									<%
				                    String[] teachingAreas = teacherInfo.getTeachingArea().split(",");
				                    if(ArrayHelper.inArray(teachingAreas,"1")){
				                    %>
				                    	<li data-id="1">城厢区</li>
				                    <%} %>
				                    <%if(ArrayHelper.inArray(teachingAreas,"2")){ %> 
				                    	<li data-id="2">荔城区</li>
				                    <%} %>
				                    <%if(ArrayHelper.inArray(teachingAreas,"3")){ %> 
				                   		<li data-id="3">秀屿区</li>
		        					<%} %>
		        					<%if(ArrayHelper.inArray(teachingAreas,"4")){ %> 
		        						<li data-id="4">涵江区</li>
					        		<%} %>
					        		<%if(ArrayHelper.inArray(teachingAreas,"5")){ %> 
					        			<li data-id="5">仙游县</li>
		        					<%} %>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<th><label for="TeachAddress_app">大概地址：</label></th>
							<td><input type="text" id="TeachAddress_app" class="fill_text" value="" style="width: 420px;" placeholder=""></td>
						</tr>

					</tbody>
				</table>
				<!--end列表-->

				<div class="btn_20">
					<a href="javascript:void(0)" class="cd-popup-close transition_a round_m btn_border_gray">取消</a>
					<a href="javascript:void(0)" class="round_m submit_btn transition_a" id="btnAppointSubmit">确认提交</a>
				</div>
				<!--end按钮-->
			</div>
		</div>

		
		<div id="l-map" style="display:none;"></div>
		<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>

		<script type="text/javascript" src="<%=basePath %>static/js/api"></script>
		<script type="text/javascript" src="<%=basePath %>static/js/getscript"></script>
		<script>
			var address = $("#TeachAddress_app").val();
			$(function() {
				$("#TeachAddress_app").attr("placeholder", address);
				$("#TeachAddress_app").val(address);
				//加这段代码是因为页面加载的时候 地址会被百度地图刷新掉

			})
			$("#TeachAddress_app").focus(function() {
				if($("#TeachAddress_app").data("focus") == '1') {
					return false;
				}
				$("#TeachAddress_app").data("focus", 1);

				// 百度地图API功能
				function G(id) {
					return document.getElementById(id);
				}

				var map = new BMap.Map("l-map");
				//map.centerAndZoom("北京", 12);                   // 初始化地图,设置城市和地图级别。

				var ac = new BMap.Autocomplete( //建立一个自动完成的对象
					{
						"input": "TeachAddress_app",
						"location": map
					});

				ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
					var str = "";
					var _value = e.fromitem.value;
					var value = "";
					if(e.fromitem.index > -1) {
						value = _value.province + _value.city + _value.district + _value.street + _value.business;
					}
					str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

					value = "";
					if(e.toitem.index > -1) {
						_value = e.toitem.value;
						value = _value.province + _value.city + _value.district + _value.street + _value.business;
					}
					str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
					G("searchResultPanel").innerHTML = str;
				});

				var myValue;
				ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
					var _value = e.item.value;
					myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
					G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

					setPlace();
				});

				function setPlace() {
					map.clearOverlays(); //清除地图上所有覆盖物
					function myFun() {
						if(local.getResults().getPoi(0)) {
							if($("#TeachAddress_app").val() == '' && address != '') {
								$("#TeachAddress_app").val(address);
							}

							var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
							$("#TeachAddress_app").data('lat', pp.lat);
							$("#TeachAddress_app").data('lng', pp.lng);
							map.centerAndZoom(pp, 18);
							map.addOverlay(new BMap.Marker(pp)); //添加标注
						}
					}
					var local = new BMap.LocalSearch(map, { //智能搜索
						onSearchComplete: myFun
					});
					local.search(myValue);
				}

				if(address.length > 0) {
					var local = new BMap.LocalSearch(map, { //智能搜索
						onSearchComplete: function myFun() {
							$("#TeachAddress_app").val(address);
							if(local.getResults().getPoi(0)) {
								var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
								$("#TeachAddress_app").data('lat', pp.lat);
								$("#TeachAddress_app").data('lng', pp.lng);
								map.centerAndZoom(pp, 18);
								map.addOverlay(new BMap.Marker(pp)); //添加标注
							}
						}
					});
					local.search(address);
				}
			});
		</script>

		<jsp:include page="footer.jsp"></jsp:include>
		<script>
			$(function() {
				(function() {
					$(".divselect_box").each(function() {
						var divselect = $(this),
							citySelect = divselect.find(".citySelect"),
							cityhd = citySelect.find(".dorpdown_province li"),
							cityhdCur = citySelect.find(".dorpdown_province .cur"),
							cityItem = citySelect.find(".dorpdown_city ul");
						divselect.click(function(e) {
							!divselect.hasClass("divselect_boxopen") && !$(e.target).closest(".dorpdown_city li").length ? divselect.addClass("divselect_boxopen") : 0;
						});

						function active(el) {
							var val = el.data("province");
							cityItem.hide();
							for(var i = cityItem.length - 1; i >= 0; i--) {
								$(cityItem[i]).data("province") == val ? function() {
									$(cityItem[i]).show();
								}() : 0;
							};
						}

						active(cityhdCur);
						cityhd.mouseenter(function() {
							var ths = $(this);
							ths.addClass("cur").siblings().removeClass("cur");
							active(ths);
						});
						cityItem.find("li").click(function() {
							divselect.removeClass("divselect_boxopen");
							divselect.find("cite").text($(this).text());
						});
					});
					$(window).on("click", function(e) {
						!$(e.target).closest(".divselect_box").length ? $(".divselect_box").removeClass("divselect_boxopen") : 0;
					});
				})();
			});
		</script>
	

		<script>

		$("#qcode").qrcode({
	        width: 150,
	        height: 150,
	        text: '<%=basePath%>teacher/mTeacherInfo.action?tId=<%=teacherInfo.getTeacherId()%>&isTeacherCenter=0'
	      });



			$("#btnAppointSubmit").click(function() {
				var contact = $.trim($("#Contact_app").val()),
					areaname = $.trim($("#AreaId_app").text()),
					areaid = $("#AreaId_app").data("id"),
					teachAddress = $.trim($("#TeachAddress_app").val()),
					subjectName = $.trim($("#SubjectIds_app").text()),
					subjectIds = $("#SubjectIds_app").data("id");

				if(subjectName == '') {
					alert("请选择科目!")
					return;
				}
				if(contact == '') {
					alert("请输入联系人!")
					return;
				}

				if(areaname == '') {
					alert("请选择授课区域!")
					return;
				}

				if(teachAddress == '') {
					alert("请输入大概住址!")
					return;
				}

				var $this = $(this);
				var data = {};
				data.teacherId = $("#TeacherId").val();
				data.name = contact;
				data.areaId = areaid;
				data.address = teachAddress;
				data.lat = $("#TeachAddress_app").data("lat");
				data.lng = $("#TeachAddress_app").data("lng");
				data.teachingCourse = subjectIds;
				data.teachingCourseName = subjectName;
				data.gender = $("#ContactSex_app").GetDropdownValue();
				if($this.attr('disabled')) {
					return false;
				}
				$this.text('正在提交中...').attr('disabled', 'disabled');
				var url = '../member/addAppointTeacher.action';
				$.post(url, data, function(res) {
					if(res.success) {
						$("#AppointPop").HideSelfPop();
						$("#btnAppoint").showPop(res.message);
					} else {
						alert(res.message);
					}
					$this.val('确认提交').attr('disabled', false);
				});
			});
			
			
			$("#btnAppoint").click(function() {
			
				var param = {};
				param.teacherId = $("#TeacherId").val();
				$.post('../member/showAppointPop.action', param, function(res) {
					if(res.state==1) {
						alert(res.message);
						return;
					}else if(res.state==2){
						$("#AppointPop").ShowSelfPop();
						return;
					}else{
						$("#AppointSuccessPop").ShowSelfPopMessage(res.message);
					}
					
				});
			});
			
		</script>