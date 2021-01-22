<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.utils.CommonUtil"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="../static/back/assets/css/bootstrap.min.css"
			rel="stylesheet" />
		<link rel="stylesheet" href="../static/back/css/style.css" />
		<link href="../static/back/assets/css/codemirror.css" rel="stylesheet">
		<link rel="stylesheet" href="../static/back/assets/css/ace.min.css" />
		<link rel="stylesheet"
			href="../static/back/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
	  <link rel="stylesheet" href="../static/back/assets/css/font-awesome-ie7.min.css" />
	<![endif]-->
		<!--[if lte IE 8]>
	  <link rel="stylesheet" href="../static/back/assets/css/ace-ie.min.css" />
	<![endif]-->
		<script src="../static/back/assets/js/jquery.min.js"></script>
		<title>学员查看</title>
	</head>

	<body>
		<%
			Teacher teacher = (Teacher) request.getAttribute("teacher");
			if (teacher != null) {
		%>
		<div class="member_show">
			<div class="member_jbxx clearfix">
				<img class="img" src="../static/back/images/user.png">
				<dl class="right_xxln">
					<dt>
						<span class=""><%=teacher.getTeacherName()%></span>
					</dt>
					<dd class="" style="margin-left: 0">
						就读院校：<%=teacher.getSchool()%>&nbsp;&nbsp;&nbsp;&nbsp;最高学历：<%=teacher.getEducationName()%>
					</dd>
					<dd class="" style="margin-left: 0">
						最近登录时间：<%=teacher.getLastLoginTime()%>
					</dd>
					
				</dl>
			</div>
			<div class="member_content">
				<ul>
					<li>
						<label class="label_name">
							性别：
						</label>
						<%
							if (teacher.getGender() == 1) {
						%>
						<span class="name">男</span>
						<%
							} else {
						%>
						<span class="name">女</span>
						<%
							}
						%>
					</li>
					<li>
						<label class="label_name">
							手机：
						</label>
						<span class="name"><%=teacher.getPhone()%></span>
					</li>
					<li>
						<label class="label_name">
							微信号：
						</label>
						<span class="name"><%=teacher.getWxNumber()%></span>
					</li>
					<li>
						<label class="label_name">
							目前身份：
						</label>
						<span class="name"><%=teacher.getIdentityName()%></span>
					</li>
					<li>
						<label class="label_name">
							居住区域：
						</label>
						<span class="name"><%=teacher.getArea()%></span>
					</li>
					<li>
						<label class="label_name">
							具体地址：
						</label>
						<span class="name"><%=teacher.getAddress()%></span>
					</li>
					<li>
						<label class="label_name">
							授课酬薪：
						</label>
						<span class="name"><%=teacher.getCoursePrice()%>元/小时</span>
					</li>
					<li>
						<label class="label_name">
							授课区域：
						</label>
						<span class="name">
						<%
		                    String[] teachingAreas = teacher.getTeachingArea().split(",");
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
       					</span>
					</li>
					<li>
						<label class="label_name">
							授课时间：
						</label>
						<span class="name">
						 <%
		          		String[] teacherDays = teacher.getTeachingTime().split(",");
		          		for(int j=0;j<teacherDays.length;j++){
		          			String teacherDay = teacherDays[j];
		          		 %>
		          		<%=CommonUtil.getTeacherTime(teacherDay)%>
		          		<%} %>
						
						</span>
					</li>

				</ul>
			</div>
		</div>
		<%
			}
		%>

	</body>

</html>
