<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.Member"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Integer isTeacherCenter = (Integer)request.getAttribute("isTeacherCenter");//是否是教员中心查看教员信息 0否 1是
Teacher teacher2 = (Teacher)session.getAttribute("teacher");
if( isTeacherCenter==1 && teacher2==null){
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
		<%
		Teacher teacher = (Teacher)request.getAttribute("teacher");
		%>
		<title>
			【吉师家教】<%=teacher.getTeacherName() %>莆田家教网_免费找家教_莆田家教一对一在线辅导
		</title>
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		
		<meta name="description" content="家教114-就在您身边的莆田大学生家教。全市各区教员上门一对一辅导，名校生、专业老师、才艺教员一应俱全。">
		<meta name="keywords" content="大学生莆田家教">
		<link href="<%=basePath %>static/mobile/css/mobilecss.css" rel="stylesheet">
		<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet">
		<script type="text/javascript" src="<%=basePath %>static/mobile/js/jweixin-1.3.2.js">
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
		<style>
			.no-style{ line-height: 16px; } .no-style .level{ background: #FB0100
			none repeat scroll 0 0; border-radius: 3px; color: #fff; font-size: 12px;
			padding: 1px 5px; vertical-align: middle; } .no-style .mxjs{ background:
			#ff9000 none repeat scroll 0 0; border-radius: 3px; color: #fff; font-size:
			12px; padding: 1px 5px; vertical-align: middle; } .no-style .rz{ background:
			#2ccb76 none repeat scroll 0 0; border-radius: 3px; color: #fff; font-size:
			12px; padding: 1px 5px; vertical-align: middle; } #player{width: 100%;height:
			210px; /*object-fit: fill;*/ background: #333; } .more{font-size: 14px;text-align:
			right;margin-right: 5%;} .more a{text-decoration: underline;color: #f78400;}
			#gdls{position: fixed;left:80%;bottom:15%;width: 40px;} #gdls img{width:
			40px;}
		</style>
		<script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
		</script>
		<script src="<%=basePath %>static/mobile/js/jquery.cookie.js">
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
    <header>
		<h3>
			<a href="javascript:history.go(-1);" class="fh">
				返回
			</a>
			教员详情
		</h3>
	</header>
	
	<section style="padding:0;">
		<div class="jy_tx">
			<%
			if(teacher.getGender()==1 && "".equals( teacher.getPersonImg() ) ){
			%>
			<img src="../static/img/male.png" >
			<%
			}else if(teacher.getGender()==2 && "".equals( teacher.getPersonImg() )){
			%>
			<img src="../static/img/w.png" >
			<%
			}else{
			%>
				<img src="<%=basePath %>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>" >
			<%
			}
			%>
			
			<div>
				<p>
					<span style="float:left;margin-left:0;">
						学员评价：0
					
					<span>
							成功记录：
						</span>
						<font style="height:13px;width:13px;background:#f78400;color:#fff;line-height:13px;text-align:center;float:right;margin-top:12px;  ">
							<%=request.getAttribute("successJJ") %>
						</font>
					</span>
				</p>
				<p>
					最近登录时间：
					<font color="#000">
						<%=teacher.getLastLoginTime().substring(0,10) %>
					</font>
				</p>
				<p>
					<span style="margin-left:0;float:left;">
						认证：
					</span>
					<span style="float:left;height:21px;width:70px;border:#2ccb76 1px solid;color:#2ccb76;margin-top:7px;line-height:21px;text-align:center;margin:left:0;border-radius:5px;margin-left:0;">
						证件已认证
					</span>
					<span style="float:left;height:21px;width:70px;border:#2ccb76 1px solid;color:#2ccb76;margin-top:7px;line-height:21px;text-align:center;margin:left:5px;border-radius:5px;margin-left:5px;">
						免费试讲
					</span>
				</p>
				<p>
					ID：
					<font color="#000">
						<%=teacher.getTeacherId() %>
					</font>
				</p>
			</div>
		</div>
		<div class="wzxx">
			<h3>
				基本信息
				<span>
				</span>
			</h3>
			<dl>
				<dd class="dddp">
					<p style="margin-left:5%;float:left;">
						<span>
							姓名：
						</span>
						<%=teacher.getTeacherName().substring(0,1) %>教员&nbsp;&nbsp;
						<span>
						<%
						if(teacher.getGender()==1){
						%>
						[男]
						<%
						}else{
						%>
						[女]
						<%} %>
							
						</span>
					</p>
					<p style="margin-right:5%;float:right;">
						<span>
							籍贯：
						</span>
						<%=teacher.getProvince() %>
					</p>
					<p style="margin-left:5%;float:left;">
						<span>
							高校：
						</span>
						<%=teacher.getSchool() %>
					</p>
					<p style="margin-right:5%;float:right;">
						<span>
							目前身份：
						</span>
						<%=teacher.getIdentityName() %>
					</p>
					<p style="margin-left:5%;float:left;">
						<span>
							专业：
						</span>
						<%=teacher.getProfessional() %>
					</p>
					<p style="margin-right:5%;float:right;">
						<span>
							最高学历：
						</span>
						<%=teacher.getEducationName() %>
						
					</p>
					<p style="margin-left:5%;float:left;">
						<span>
							教龄：
						</span>
						<%=teacher.getTeachingAge() %>年
					</p>
					<p style="margin-right:5%;float:right;border-bottom: 1px #dddddd solid;">
						<span>
							出生年月：
						</span>
						<%=teacher.getBirthday() %>
					</p>
					<p style="width: 90%;margin-left:5%;margin-right:5%;">
						<span>
							家庭住址：
						</span>
						<%=teacher.getAddress() %>
					</p>
				</dd>
			</dl>
			<h3>
				家教信息
			</h3>
			<h4>
				家教经验
			</h4>
			<dl>
				<dt class="other_dt">
					<p>
					<%=teacher.getTeachingCase() %>
					</p>
				</dt>
			</dl>
			<h4>
				可授科目
			</h4>
			<dl>
				<dt class="other_dt">
				<%//所有课程信息
                 if(!teacher.getTeachingCource().equals("")){
					 String[] coursesId2 = teacher.getTeachingCource().split(",");
					 
					 List<Course> courseList3 = (List<Course>)request.getAttribute("courseList"); 
					 if(courseList3!=null){
					 	for(int i=0;i<coursesId2.length;i++){
						 	String strCourse =  coursesId2[i];
						 	for(int j=0;j<courseList3.size();j++){
						 		Course course = courseList3.get(j);
						 		if(course.getCourseId()==Integer.parseInt(strCourse)){
					%>
								<%=course.getCourseName() %>
								
								<%} %>
							<%} %>
						<%} %>
					<%} %>
                <%} %>
				</dt>
				<p style="clear:both;">
				</p>
			</dl>
			<h4>
				可授区域
			</h4>
			<dl>
				<dt class="other_dt">
					<%
                    String[] teachingAreas = teacher.getTeachingArea().split(",");
                    if(ArrayHelper.inArray(teachingAreas,"1")){
                    %>
                    	城厢区
                    <%} %>
                    <%if(ArrayHelper.inArray(teachingAreas,"2")){ %> 
                    	荔城区
                    <%} %>
                    <%if(ArrayHelper.inArray(teachingAreas,"3")){ %> 
                    	秀屿区
   					<%} %>
   					<%if(ArrayHelper.inArray(teachingAreas,"4")){ %> 
   						涵江区
	        		<%} %>
	        		<%if(ArrayHelper.inArray(teachingAreas,"5")){ %> 
        				仙游县
   					<%} %>
				</dt>
			</dl>
			<h4>
				授课时间
			</h4>
			<dl>
				<dt class="other_dt">
					<table class="time_table png_img" >
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
								    String[] teachingTimes = teacher.getTeachingTime().split(",");
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
				</dt>
			</dl>
			<h4>
				所获证书
			</h4>
			<dl>
				<dt class="other_dt">
					<p>
					<%=teacher.getCertificate() %>
					</p>
				</dt>
			</dl>
			<h4>
				辅导方式
			</h4>
			<dl>
				<dt class="other_dt">
				<%
				String[] teachingWays = teacher.getTeachingWay().split(",");
				if(teachingWays.length>=2){
				%>
				 一对一家教上门、一对一学生上门
				<%
				}else{
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
				<%
				} 
				%>
					
				</dt>
				<p style="clear:both;">
				</p>
			</dl>
			<h4>
				薪资要求
			</h4>
			<dl style="border:none;">
				<dt class="other_dt">
					<p>
						<%=teacher.getCoursePrice() %>/小时
					</p>
					<a href="<%=basePath %>mCost.action" style="color:#f78400;text-decoration:underline;">
						吉师家教薪水参考标准
					</a>
				</dt>
			</dl>
			<h4>
				自我描述
			</h4>
			<dl>
				<dt class="other_dt">
					<p>
					<%=teacher.getSelfEvaluation() %>
					</p>
				</dt>
			</dl>
			
			<%
			
			if(isTeacherCenter==null || isTeacherCenter==0){
			%>
			<div style="box-sizing: border-box;padding: 0 20px;">
				<a href="javascript:void(0)" onclick="jump2(383057)" class="sydd">
					预约此教员
				</a>
			</div>
			<%
			}
			%>
		</div>
		<div style="background:#f2f2f2">
			<p style="font-size:14px;color:#666666;text-align: center;padding-top:20px;">
				© 吉师家教版权所有
			</p>
			<p style="text-align: center;font-size: 14px;color: #ff6600;">
				请家教热线：
				<a href="tel:4006-179-958" style="font-size: 16px;color: #ff6600;">
					150-6033-8989
				</a>
			</p>
			<p style="text-align: center;font-size: 14px;color: #666666;">
				(点击拨打，时间：9:00 - 20:00，节假无休)
			</p>
			<p style="text-align: center;font-size: 14px;color: #666666;">
				微信公众号：莆田吉师家教(ydjj)
			</p>
			<p style="text-align: center;font-size: 14px;color: #666666;margin-top:10px;padding-bottom: 50px;">
				<img width="80%" src="<%=basePath %>static/img/wechat.jpg" alt="">
			</p>
		</div>
	</section>
	<%
	if(isTeacherCenter==null || isTeacherCenter==0){
	%>
	<div style="background:#f2f2f2;position:fixed;left:0;bottom:0;width:100%;border-top:1px solid #dddddd;">
		<div style="display:flex;justify-content:space-between;width:90%;margin-left:5%;height:38px;line-height:38px;"
		class="new_footer">
			
			<div style="width:30%;height:28px;background:#2ccb76;text-align:center;border-radius:3px;margin-top:5px;line-height:28px;">
				<a style="color:#fff;width:100%;" href="<%=basePath %>mFastAppointTeacher.action" >
					快速请家教
				</a>
			</div>
			<div style="width:30%;height:28px;background:#f78400;text-align:center;border-radius:3px;margin-top:5px;line-height:28px;">
				<a style="color:#fff;width:100%;" href="javascript:;" id="btnAppoint">
					预约此教员
				</a>
			</div>
			<div>
				<a style="color:#777777;text-decoration:underline;" href="tel:150-6033-8989">
					客服电话预约
				</a>
			</div>
		</div>
	</div>
	<%
	}
	%>
	

	
	<div class="cpop" id="AppointPop" >
	    <div class="cpopcontent">
	        <div class="ntpop">
	            <i class="hide-AppointPop cpop_close"></i>
	            <div class="ntpop_head">请填写以下信息</div>
	            <div class="ntpop_content">
	                <div>
	                    <div class="wpbox">
	                        <div class="dtlist">
	                        <input type="hidden" id="TeacherId" value="<%=teacher.getTeacherId() %>" >
		                        <%
		                        Member member = (Member) session.getAttribute("member");
		                        if(member==null){
		                        %>
		                        <div class="dtitem Ifoucs">
	                                <div class="dl">
	                                    <div class="dt">联系人</div>
	                                    <div class="dd">
	                                        <input type="text" id="Contact_app" value="" placeholder="请填写联系人姓名" class="dtint">
	                                    </div>
	                                    <i class="cleardtint"></i>
	                                </div>
	                            </div>
	                            <div class="dtitem">
	                                <div class="dl">
	                                    <div class="dt">称呼</div>
	                                    <div class="dd">
	                                        <p style="text-align: right;" id="ContactSex_app">
	                                            <span class="rdo on" value="1">先生</span>
	                                            <span class="rdo " value="2">女士</span>
	                                        </p>
	                                    </div>
	                                </div>
	                            </div>
		                        <%
		                        }else{
		                        %>
		                        <div class="dtitem Ifoucs">
	                                <div class="dl">
	                                    <div class="dt">联系人</div>
	                                    <div class="dd">
	                                        <input type="text" id="Contact_app" value="<%=member.getName() %>" placeholder="请填写联系人姓名" class="dtint">
	                                    </div>
	                                    <i class="cleardtint"></i>
	                                </div>
	                            </div>
	                            <div class="dtitem">
	                                <div class="dl">
	                                    <div class="dt">称呼</div>
	                                    <div class="dd">
	                                        <p style="text-align: right;" id="ContactSex_app">
	                                        <%if(member.getGender()==1){ %>
	                                        	<span class="rdo on" value="1">先生</span>
	                                            <span class="rdo " value="0">女士</span>
	                                        <%
	                                        }else{
	                                        %>
	                                        	<span class="rdo" value="1">先生</span>
	                                            <span class="rdo on" value="0">女士</span>
	                                        <%
	                                        }
	                                        %>
	                                            
	                                        </p>
	                                    </div>
	                                </div>
	                            </div>
		                        <%
		                        }
		                        %>  
	                            
	                            
	                            <div class="dtitem">
	                                <div class="selint dl">
	                                    <div class="dt">授课区域</div>
	                                    <div class="dd">
	                                        <input type="text" readonly="" value="" placeholder="请选择" class="selint_label dtint">
	                                    </div>
	                                    <i class="selgt"></i>
	                                    <select class="selint_select" id="AreaId_app">
	                                        <option value=""></option>
	                                        <%
						                    if(ArrayHelper.inArray(teachingAreas,"1")){
						                    %>
						                    	<option value="1">城厢区</option>
						                    <%} %>
						                    <%if(ArrayHelper.inArray(teachingAreas,"2")){ %> 
						                    	<option value="2">荔城区</option>
						                    <%} %>
						                    <%if(ArrayHelper.inArray(teachingAreas,"3")){ %> 
						                    	<option value="3">秀屿区</option>
						   					<%} %>
						   					<%if(ArrayHelper.inArray(teachingAreas,"4")){ %> 
						   						<option value="4">涵江区</option>
							        		<%} %>
							        		<%if(ArrayHelper.inArray(teachingAreas,"5")){ %> 
						        				<option value="5">仙游县</option>
						   					<%} %>
	                                            
	                                    </select>
	                                </div>
	                            </div>
	                            <div class="dtitem">
	                                <div class="dl">
	                                    <div class="dt">大概住址</div>
	                                    <div class="dd">
	                                        <input type="text" id="TeachAddress_app" value="" placeholder="" class="dtint">
	                                    </div>
	                                    <i class="cleardtint"></i>
	                                    <i class="oglocal_mico mico"></i>
	                                </div>
	                            </div>
	
	                            <div class="dtitem">
	                                <div class="selint dl">
	                                    <div class="dt">求教科目</div>
	                                    <div class="dd">
	                                        <input type="text" readonly="" placeholder="请选择" class="selint_label dtint">
	                                    </div>
	                                    <i class="selgt"></i>
	                                    <select class="selint_select" id="SubjectIds_app">
	                                        <option value=""></option>
                                      <%//所有课程信息
			                     if(!teacher.getTeachingCource().equals("")){
									 String[] coursesId2 = teacher.getTeachingCource().split(",");
									 
									 List<Course> courseList3 = (List<Course>)request.getAttribute("courseList"); 
									 if(courseList3!=null){
									 	for(int i=0;i<coursesId2.length;i++){
										 	String strCourse =  coursesId2[i];
										 	for(int j=0;j<courseList3.size();j++){
										 		Course course = courseList3.get(j);
										 		if(course.getCourseId()==Integer.parseInt(strCourse)){
									%>
												<option value="<%=course.getCourseId() %>"><%=course.getCourseName() %></option>
												<%} %>
											<%} %>
										<%} %>
									<%} %>
			                    <%} %>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="tr">
	                    <a href="javascript:void(0)" id="btnAppointSubmit" class="md_oglinebtn">确定</a>
	                    <a href="javascript:void(0)" class="md_oglinebtn hide-AppointPop">取消</a>
	                </div>
	
	            </div>
	        </div>
	    </div>
	</div>
	
<!-- ntextpop -->
<div class="ntextpop" id="messagebox"><span class="ntextpop_content"></span></div>
<!-- end ntextpop -->
	
	
    <script src="<%=basePath %>static/mobile/js/TouchSlide.js"></script>
    <script src="<%=basePath %>static/mobile/js/tool.js"></script>
    <script src="<%=basePath %>static/mobile/js/geolocation.js"></script>
    <script>

        function show(msg) {
            $(".ntextpop_content").text(msg);
            //$(".ntextpop").addClass("show");
            $(".ntextpop").fadeIn(1000).fadeOut(0);
        }
    </script>
    <div id="l-map" style="display:none;"></div>
	<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
	<script>
		$(function() {
			var list = $.cookie("listid");
			if (list != null && list != "") {
				$("#beixuan_count").html(list.split("||").length);
			} else {
				$("#beixuan_count").html("0");
			}

			var video = $('#player').attr('src');
			var p = video + '?x-oss-process=video/snapshot,t_1000,f_jpg';
			
			$('#player').attr('poster', p);

		})
	
	</script>
	<script src="<%=basePath %>static/mobile/js/api(1)"></script>
    <script type="text/javascript" src="<%=basePath %>static/mobile/js/getscript(1)"></script>
	<script>
    var address = $("#TeachAddress_app").val();

    $(function () {
        $("#TeachAddress_app").attr("placeholder", address);
        $("#TeachAddress_app").val(address);
    })


    $("#TeachAddress_app").focus(function () {
        if ($("#TeachAddress_app").data("focus") == '1') {
            return false;
        }
        $("#TeachAddress_app").data("focus", 1);
        // 百度地图API功能
        function G(id) {
            return document.getElementById(id);
        }

        var map = new BMap.Map("l-map");
        map.centerAndZoom("北京", 12);                   // 初始化地图,设置城市和地图级别。

        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {
            "input": "TeachAddress_app", "location": map
        });

        ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
            var str = "";
            var _value = e.fromitem.value;
            var value = "";
            if (e.fromitem.index > -1) {
                value = _value.province + _value.city + _value.district + _value.street + _value.business;
            }
            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

            value = "";
            if (e.toitem.index > -1) {
                _value = e.toitem.value;
                value = _value.province + _value.city + _value.district + _value.street + _value.business;
            }
            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
            G("searchResultPanel").innerHTML = str;
        });

        var myValue;
        ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
            G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

            setPlace();
        });

        function setPlace() {
            map.clearOverlays();    //清除地图上所有覆盖物
            function myFun() {
                var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                $("#TeachAddress_app").data('lat', pp.lat);
                $("#TeachAddress_app").data('lng', pp.lng);
                map.centerAndZoom(pp, 18);
                map.addOverlay(new BMap.Marker(pp));    //添加标注
            }
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: myFun
            });
            local.search(myValue);
        }

        if (address.length > 0) {
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: function myFun() {
                    $("#TeachAddress_app").val(address);
                    if (local.getResults().getPoi(0)) {
                        var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                        $("#TeachAddress_app").data('lat', pp.lat);
                        $("#TeachAddress_app").data('lng', pp.lng);
                        map.centerAndZoom(pp, 18);
                        map.addOverlay(new BMap.Marker(pp));    //添加标注
                    }
                }
            });
            local.search(address);
        }
    });
</script>
	
	<script type="text/javascript">

		$("#btnAppoint").click(function () {
			var param = {};
			param.teacherId = $("#TeacherId").val();
			$.post('../member/showAppointPop.action', param, function(res) {
				if(res.state==1) {
					show(res.message);
					return;
				}else if(res.state==2){
					$("#AppointPop").addClass("show");
					
					return;
				}else{
					show("预约成功，请等待教员回复!");
				}
				
			});

        });
        
        
        $("#btnAppointSubmit").click(function () {
            var contact = $.trim($("#Contact_app").val()),
                areaname = $.trim($("#AreaId_app").find('option:selected').text()),
                areaid = $.trim($("#AreaId_app").val()),
                teachAddress = $.trim($("#TeachAddress_app").val()),
                subjectName = $.trim($("#SubjectIds_app").find('option:selected').text()),
                subjectIds = $.trim($("#SubjectIds_app").val());


            if (contact == '') {
                show("请输入联系人!");
                return;
            }

            if (areaname == '') {
                show("请选择授课区域!");
                return;
            }

            if (subjectName == '') {
                show("请选择科目!");
                return;
            }
            if (teachAddress == '') {
                show("请输入大概住址!");
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
            data.gender = $("#ContactSex_app").GetSexValue();
            
            if ($this.attr('disabled')) {
                return false;
            }
            $this.text('正在提交中...').attr('disabled', 'disabled');
            
            var url = '../member/addAppointTeacher.action';
			$.post(url, data, function(res) {
				if(res.success) {
					$("#AppointPop").removeClass("show");
                    show("预约成功，请等待教员回复!");
				} else {
					show(res.message);
				}
				$this.val('确认提交').attr('disabled', false);
			});
            
           
        });
        
	</script>
</body>

</html>