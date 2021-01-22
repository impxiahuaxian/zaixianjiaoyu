<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.Member"%>
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

	</head>

	<body>
		<%
			MemberOrderTeacher memberOrderTeacher = (MemberOrderTeacher) request
					.getAttribute("memberOrderTeacher");
			Member member = (Member) request.getAttribute("member");
			if (memberOrderTeacher != null) {
		%>
		<div class="member_show">
			<div class="member_jbxx clearfix">
				<img class="img" src="../static/back/images/user.png">
				<dl class="right_xxln">
					<dt>
						<span class=""><%=memberOrderTeacher.getName()%></span>
					</dt>
					<dd class="" style="margin-left: 0">
						发布时间：<%=memberOrderTeacher.getPublicTime() %>
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
							if (memberOrderTeacher.getGender() == 1) {
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
						<span class="name">
						<%
						if(memberOrderTeacher.getState()==1||memberOrderTeacher.getState()== 2|| memberOrderTeacher.getState()== 6){
						%>
							<%=member.getPhone().substring(0,3)%>********
						<%
						}else{
						%>
							<%=member.getPhone()%>
						<%} %>
						</span>
					</li>
					<li>
						<label class="label_name">
							支付金额：
						</label>
						<span class="name">￥<%=memberOrderTeacher.getPrice()%></span>
					</li>
					<li>
						<label class="label_name">
							备注：
						</label>
						<span class="name"><%=memberOrderTeacher.getRemark()%></span>
					</li>
					<li>
						<label class="label_name">
							支付方式：
						</label>
						<span class="name">
							<img src="../static/img/wxpay.jpg" style="padding-right: 40px">
							<img src="../static/img/zfbpay.jpg" style="padding-left: 40px">
							</span>
					</li>
				</ul>
			</div>
		</div>
		<%
			}
		%>

		<br>
	</body>
</html>
