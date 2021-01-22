<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Orders"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.District"%>
<%@page import="com.jiajiao.utils.CommonUtil"%>
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
			content="吉师家教网是莆田家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<LINK rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
	
	<link href="<%=basePath%>static/css/ui-choose.css" rel="stylesheet"  type="text/css"/>
	<link rel="stylesheet" href="<%=basePath%>static/css/buttons.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/jquery.selectlist.css">
	
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
		<div class="nav min_1200">
			<div class="tnav w_1200" id="slideNav">
				<span><a href="<%=basePath %>" >家教首页</a></span>
				<span><a href="<%=basePath %>costPage.action" >资费标准</a></span>
				<span><a href="<%=basePath %>teacher/teachersPage.action">找老师</a></span>
				<span><a href="<%=basePath %>member/ordersPage.action" class="current_nav">最新家教</a></span>
				<span><a href="<%=basePath %>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action" >云课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->
		
		<dl class="site_th w_1200">
		    <dd>当前位置：<a href="<%=basePath %>">首页</a><span class="china">&gt;</span>最新家教</dd>
		</dl>

		<form action="orderListPage.action" method="post">
			<div class="w_1200 box_w_s clearfix white_bj">
			    <ul class="filter_ul clearfix">
			        <li class="clearfix">
			            <h4 class="fl">授课科目：</h4>
			            <div class="r_cell r_text round_m_a click_a_o">
		            		<select class="ui-choose" id="course" name="course" >
					          <option value="0" style="margin: 30px; ">不限</option>
					          
					          	<%
								List<DictInfo> dictInfoList = (List<DictInfo>)request.getAttribute("dictInfoList");
			                    if(dictInfoList!=null){
			                    	for(int i=0;i<dictInfoList.size();i++){
			                    		DictInfo dictInfo = dictInfoList.get(i);
								%>
								<option value="<%=dictInfo.getDictId() %>"><%=dictInfo.getContent() %></option>
								 <%
		                    	}
		                    } 
		                    %>
					        </select>
			            </div>
			        </li>
			
			        <li class="clearfix">
			            <h4 class="fl">授课区域：</h4>
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
			            <h4 class="fl">其它筛选：</h4>
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

		<h4 class="l_th w_1200 l_th_w">
		    <b class="fl th_b">四平学员家教需求单</b>
		</h4>
		<!--end标题-->

	    <div class="w_1200 box_w_s clearfix white_bj">
	        <ul class="clearfix studen_list">
				<%
					List<Orders> ordersList	= (List<Orders>)request.getAttribute("ordersList");
					if(ordersList!=null){
					for(int i=0;i<ordersList.size();i++){
						Orders order = ordersList.get(i);
				 %>
				 <li class="clearfix li_o transition_a">
	                    <div class="box">
	                        <div class="fr">
	                            <a href="<%=basePath %>order/orderInfo.action?oId=<%=order.getoId() %>" target="_blank" class="round_m btn_40" rel="nofollow">更多详情</a>
	                        </div>
	                        <div class="r_cell">
	                            <h5>
	                                <a href="<%=basePath %>order/orderInfo.action?oId=<%=order.getoId() %>" target="_blank">
	                                <%=order.getArea() %><%=order.getContactName().substring(0,1)%><%if(order.getContactGender()==1){%>先生<%}else{%>女士<%}%>请<%=order.getCourseName() %>家教
	                                </a>
	                                    <span class="text_box_border text_box_border_green round_m">个人</span>
	                                
	                                <span class="gray_text font_14 m_l_b">编号<%=order.getOrderCode() %></span>
	                            </h5>
	                            <ul class="d">
	                                <li>
	                                    <a href="#" target="_blank" class="png map_a" rel="nofollow">
	                                        	上课区域：<%=order.getArea() %>
	                                    </a>
	                                </li>
	                                <li>课酬：
	                                <%
	                                if(order.getCoursePrice()!=0){
	                                 %>
	                                 <b class="orange_text"><%=order.getCoursePrice() %>元/小时</b>
	                              <%}else{ %>
	                          		 <b class="orange_text">参照四平家教网标准</b>
	                               <%} %>
	                                </li>
	                                <li>
	                                	教员类型：
	                                	<%
	                                	if(order.getTeacherType()==18){
	                                	 %>
	                                	 老师（在职/进修/离职/退休）
	                                	 <%}else if(order.getTeacherType()==19){ %>
	                                	 在校大学生/毕业生
	                                	 <%}else if(order.getTeacherType()==0){ %>
	                                	 不限
	                                	 <%} %>
									</li>
	                                <li>
	                                   	 状态：
	                                   	 <%
	                                   	 if(order.getOrderStatus()==22||order.getOrderStatus()==23){
	                                   	  %>
	                                   	  <b class="green_text">
	                                       	  发布中
	                                      </b>
	                                   	 
	                                   	 <%}else if(order.getOrderStatus()==24){ %>
	                                   	 <b class="green_text">
	                                       	授课中
	                                      </b>
	                                   	 <%}else if(order.getOrderStatus()==25){ %>
	                                   	  <b class="red_text">
	                                       	 已完成
	                                      </b>
	                                   	 <%} %>
	                                       
	                                </li>
	                            </ul>
	                            <div style="float: left;padding-left:2em;padding-top:1em;">
	                            	<div style="float: left;width: 400px;padding-right: 5em;">
	                            		授课时间：
	                            		<%
	                            		String[] teacherDays = order.getTeachingTime().split(",");
	                            		for(int j=0;j<teacherDays.length;j++){
	                            			String teacherDay = teacherDays[j];
	                            		 %>
	                            		<%=CommonUtil.getTeacherTime(teacherDay)%>
	                            		<%} %>
	                            		
	                            	</div>
	                            	<div style="float: left;width: 400px;">
	                            		老师要求：
	                            		<%
	                            		if(order.getRequirements().length()>45){
	                            		 %>
	                            		 <%=order.getRequirements().substring(0,45) %>...
	                            		 <%}else{ %>
	                            		<%=order.getRequirements() %>
	                            		<%} %>
	                            	</div>
	                            </div>
	                        </div>
	                    </div>
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
	    <!--end一行-->
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
			<jsp:include page="footer.jsp"></jsp:include>