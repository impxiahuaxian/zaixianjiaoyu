<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.GradePrice"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
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

	  <title>【吉师家教网】吉师家教网_免费找家教_四平在线一对一在线辅导</title>
	  <meta name="keywords" content="吉师家教，吉师家教兼职，四平兼职家教，家教">
	  <meta name="description"
			content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<LINK rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
	
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
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
					<img src="<%=basePath%>static/img/wechat.jpg" class="wechat_img" alt="吉师家教客服微信" width="80" height="80">

					<%
					Teacher teacher = (Teacher)session.getAttribute("teacher");
					Member member =  (Member)session.getAttribute("member");
					if(member==null && teacher==null){
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
					 
					<%}else{ %>
					 <span class="font_13">
                    <b class="orange_link">
                        <a href="<%=basePath%>logout.action" class="heada"> 退出</a>
                    </b>
                    <em class="china"></em>
                    <b class="orange_link">
                        <%
	                   	if(member!=null){
	                   	%>
	                       <a href="<%=basePath%>member/index.action" class="heada">我的</a>
	                   	<%}else if(teacher!=null){ %>
	                       <a href="<%=basePath%>teacher/index.action" class="heada">我的</a>
	                   	<%} %>
                    </b>
                    </span>
					
					<%} %>
					
				</div>
				<!--end头文件右-->
			</div>
		</div>
		<!--end头文件-->

		<!--end头文件-->

		<div class="nav min_1200">
			<div class="tnav w_1200" id="slideNav">
				<span><a href="<%=basePath %>" >家教首页</a></span>
				<span><a href="<%=basePath %>costPage.action" class="current_nav">资费标准</a></span>
				<span><a href="<%=basePath %>teacher/teachersPage.action">找老师</a></span>
				<span><a href="<%=basePath %>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath %>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action" >云课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->


		<dl class="site_th w_1200">
			<dd>当前位置：
				<a href="<%=basePath %>">首页</a> 
				<span class="china">&gt;</span>吉师家教价格</dd>
		</dl>


		<div class="w_1200 i_center clearfix white_bj">
		    <div class="prit_th png_img">
		        <h2>吉师家教价格<span class="gray_text font_15">（元/小时）</span></h2>
		        <p><img src="<%=basePath %>static/img/tips_s.png" alt="" width="28" height="28">温馨提示：根据教员资质不同，价格会有浮动，具体以双方协商为准</p>
		    </div>
		    <!--end标题-->
		    <div class="table_div">
	            <table class="buy_table even_table font_16">
	                <thead>
	                    <tr>
	                        <th width="25%">家教类目</th>
	                        <th width="25%" class="th_orange">大学生家教价格</th>
	                        <th width="25%" class="th_orange">教师家教价格</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <%
	                List<GradePrice> gradePriceList = (List<GradePrice>)request.getAttribute("gradePriceList");
	                if(gradePriceList!=null){
	                	for(int i=0;i<gradePriceList.size();i++){
	                		GradePrice gradePrice = gradePriceList.get(i);
	                		if((i+1)%2!=0){
	                %>
	                 		<tr>
	                            <th><%=gradePrice.getGradeName() %></th>
	                                    <td><b class="orange_text">¥<%=gradePrice.getSminPrice() %>-<%=gradePrice.getSmaxPrice() %></b></td>
	                                    <td><b class="orange_text">¥<%=gradePrice.getTminPrice() %>-<%=gradePrice.getTmaxPrice() %></b></td>
	                        </tr>
	                 	 <%}else{ %>
	                 		<tr class="tr_even">
	                            <th><%=gradePrice.getGradeName() %></th>
	                                    <td><b class="orange_text">¥<%=gradePrice.getSminPrice() %>-<%=gradePrice.getSmaxPrice() %></b></td>
	                                    <td><b class="orange_text">¥<%=gradePrice.getTminPrice() %>-<%=gradePrice.getTmaxPrice() %></b></td>
	                        </tr>
	                <%	   }		
	                	}
	                } 
	                %>
	                </tbody>
	            </table>
		    </div>
		    <!--end一行-->
		</div>
		<!--end一行-->

	<jsp:include page="footer.jsp"></jsp:include>
