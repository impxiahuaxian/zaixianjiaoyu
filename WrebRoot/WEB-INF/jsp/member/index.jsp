<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	Member member = (Member) session.getAttribute("member");
	if(member==null){
		response.sendRedirect(basePath);
		return ;
	}
%>

<jsp:include page="header.jsp"></jsp:include>

	<div class="r_cell box_r">
		<h4 class="r_th_y">
			<b>个人中心首页</b>
		</h4>

		<h4 class="th_line_d" style="margin-top: 1.2em;">
			快速找到家教
		</h4>

		<ul class="studen_adv clearfix list_3">
			<li>
				<span class="round_r studen_arrow png"></span>
				<h5>
					发布需求
				</h5>
				<p class="orange_text">
					每月免费发布5次
				</p>
				<div class="d">
					<a href="<%=basePath %>member/publishOrderPage.action"
						class="round_m btn_40 btn_border_orange">立即发布</a>
				</div>
			</li>
			<li>
				<span class="round_r studen_arrow studen_arrow2 png"></span>
				<h5>
					预约教员
				</h5>
				<p class="orange_text">
					免费
				</p>
				<div class="d">
					<a href="<%=basePath %>teacher/teachersPage.action"
						class="round_m btn_40 btn_border_orange" >前去预约</a>
				</div>
			</li>
			<li>
				<span class="round_r studen_arrow studen_arrow3 png"></span>
				<h5>
					完善联系信息
				</h5>
				<p class="orange_text">
					免费
				</p>
				<div class="d">
					<a href="<%=basePath %>member/updateMemberPage.action"
						class="round_m btn_40 btn_border_orange">前去完善</a>
				</div>
			</li>
		</ul>

		<div class="adv_r">
			<a href="<%=basePath %>"><img
					src="<%=basePath%>static/img/01.png" alt="托班/辅导班版块上线了"> </a>
		</div>

	</div>
	<!--end一行的右-->
</div>
<!--end一行-->

<jsp:include page="../footer.jsp"></jsp:include>