<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="header.jsp"></jsp:include>

<dl class="w_1200 site_th">
	<dd>
		当前位置：
		<a href="javascript:void(0)">首页</a><span class="china">&gt;</span>关于我们
	</dd>
</dl>

<div class="help_center font_15 w_1200 white_bj">
	<div class="fl help_l">

		<ul class="help_nav nav_ul">
			<li class="">
				<a href="aboutUs.action">关于我们</a>
			</li>
			<li class="">
				<a href="iammember.action">我是学员</a>
			</li>
			<li class="">
				<a href="iamteacher.action">我是教员</a>
			</li>
			<li class="">
				<a href="disclaimer.action">免责说明</a>
			</li>
			<li class="light">
				<a href="announcement.action">活动公告</a>
			</li>
			<li class="">
				<a href="link.action">友情链接</a>
			</li>
		</ul>
	</div>

	<!--end左边-->
	<div class="r_cell help_r">
		<h4 class="th_line_c">
			活动公告
		</h4>
		<p>&nbsp;吉师家教网客服公众号：ydjj</p>
	</div>
	<!--end右边-->
</div>
<!--end中间区域-->
<jsp:include page="../footer.jsp"></jsp:include>
