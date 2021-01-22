<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Orders"%>
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
	<script src="<%=basePath%>static/js/jquery.qrcode.min.js"></script>
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
				<span><a href="<%=basePath %>paper/paperPage.action" >朵课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->
	<%
	Orders order =  (Orders)request.getAttribute("order");
	if(order!=null){
	 %>
	<div class="tearch_banner min_1200 h_355">
	    <div class="w_1200">
	        <dl class="site_th">
	            <dd>
	                当前位置：
	                <a href="<%=basePath %>">首页</a><span class="china">&gt;</span>订单详情页
	            </dd>
	        </dl>
	
	        <dl class="dis_th clearfix">
	            <dt class="fr">
	                <div class="fl text">
	                    编号：
	                    <span class="font_24 eng">
	                        <%=order.getOrderCode() %>
	                    </span>
	                    <span class="ml_20">
	                        发布时间：
	                        <span class="font_24 eng"><%=order.getPublicTime().subSequence(0,10) %></span>
	                    </span>
	                </div>
	               
	            </dt>
	            <dd class="r_cell">
	                <h2>
	                <%=order.getArea() %><%=order.getContactName().substring(0,1)%><%if(order.getContactGender()==1){%>先生<%}else{%>女士<%}%>请<%=order.getCourseName() %>家教
	                </h2>
	
	                <p>
	                    订单状态：
	                        
							 <%
	                      	 if(order.getOrderStatus()==22||order.getOrderStatus()==23){
	                      	  %>
	                      	  <span class="text_box_s round_m">
	                          	  发布中
	                      	 <%}else if(order.getOrderStatus()==24){ %>
	                      	 <span class="text_box_s round_m">
	                          	授课中
	                      	 <%}else if(order.getOrderStatus()==25){ %>
	                      	 <span class="text_box_s text_box_s_gray round_m">
	                          	 已完成
	                      	 <%} %>
	                        </span>
	                        
	                </p>
	            </dd>
	        </dl>
	            <ul class="clearfix step_ul list_6">
	                <div class="step_line"></div>
	                <li class="frist active">
	                    <div class="step_line"></div><span class="round_r png step_arrow stap_a1"></span>
	                    <p>发布需求</p>
	                </li>
	                <li <%if(order.getOrderStatus()>=23){ %>class="active" <%} %> >
	                    <div class="step_line"></div><span class="round_r png step_arrow stap_a2"></span>
	                    <p>教员申请</p>
	                </li>
	                <li <%if(order.getOrderStatus()>=24){ %>class="active" <%} %>>
	                    <div class="step_line"></div><span class="round_r png step_arrow stap_a3"></span>
	                    <p>联系沟通</p>
	                </li>
	                <li <%if(order.getOrderStatus()>=24){ %>class="active" <%} %>>
	                    <div class="step_line"></div><span class="round_r png step_arrow stap_a4"></span>
	                    <p>确认教员</p>
	                </li>
	                <li <%if(order.getOrderStatus()>=25){ %>class="active" <%} %>>
	                    <div class="step_line"></div><span class="round_r png step_arrow stap_a5"></span>
	                    <p>正式授课</p>
	                </li>
	                <li >
	                    <div class="step_line"></div><span class="round_r png step_arrow stap_a6"></span>
	                    <p>授课评价</p>
	                </li>
	            </ul>
	    </div>
	</div>
	<!--end一行-->

	<div class="w_1200 clearfix center_box">
	    <div class="fl w_860 font_15">
            <h4 class="th_line_d">学员信息</h4>
            <ul class="clearfix list_text_ul list_2">
                <li>求教科目：<%=order.getCourseName() %></li>
                    <li>联系人：<%=order.getContactName().substring(0,1) %>
                    <%if(order.getContactGender()==1){%>
                    先生
                    <%}else{ %>
                    女士
                    <%} %>
                    </li>
                <li>学员性别： <%if(order.getStudentGender()==1){%>
                    男
                    <%}else{ %>
                    女
                    <%} %>
               </li>
                <li>薪酬标准：<%
                            if(order.getCoursePrice()!=0){
                             %>
                            <%=order.getCoursePrice() %>元/小时
                          <%}else{ %>
                      		 参照吉师家教网标准
                           <%} %>
                </li>
                <li>授课时间：
                <%
          		String[] teacherDays = order.getTeachingTime().split(",");
          		for(int j=0;j<teacherDays.length;j++){
          			String teacherDay = teacherDays[j];
          		 %>
          		<%=CommonUtil.getTeacherTime(teacherDay)%>
          		<%} %>
				</li>
                <li>年级：<%=order.getStudentGradeName() %></li>
                <li>就读学校：</li>
                <li>学员状态：<%=order.getProfile() %></li>
                <li></li>
            </ul>
            
            <h4>扫一扫，手机浏览本页：</h4>
            <div id="qcode"></div>
            <h4 class="th_line_d">教员要求</h4>
            <ul class="clearfix list_text_ul list_2">
                <li>性别要求：<%if(order.getTeacherGender()==0){%>
                女
                			<%}else if(order.getTeacherGender()==1){ %>
                			男
                			<%}else if(order.getTeacherGender()==2){ %>
                			不限
                			<%} %>
                </li>
                <li>身份要求：<%=order.getTeacherTypeName()%>
                </li>
                <li>需求人数：1 人</li>
                <li>上课方式：<%=order.getTeachingWayName() %></li>
                <li class="li_w">其他要求：<%=order.getRequirements() %></li>
            </ul>
            <div class="map_box shadow_box_light">
                <h5>居住位置：<%=order.getAddress() %></h5>
					<div id="allmap" class="map-container"
						style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;">
						<div id="zoomer"
							style="position: absolute; z-index: 0; top: 0px; left: 0px; overflow: hidden; visibility: hidden; cursor: url(https://api0.map.bdimg.com/images/openhand.cur) 8 8, default">
							<div class="BMap_zoomer" style="top: 0; left: 0;"></div>
							<div class="BMap_zoomer" style="top: 0; right: 0;"></div>
							<div class="BMap_zoomer" style="bottom: 0; left: 0;"></div>
							<div class="BMap_zoomer" style="bottom: 0; right: 0;"></div>
						</div>
					</div>
			</div>
            <!--end地图-->
	    </div>
	    
	    <!--end一行的左-->
	    <div class="fr w_250">
	        <div class="free_box clearfix shadow_box_light">
	            <div class="clearfix free_box_t">
	                <dl class="free_box_dl">
		            	<%
		                if(order.getOrderStatus()==22||order.getOrderStatus()==23){
		                 %>
		                 <dt>
		                     <a onclick="return false;" href="javascript:void(0);" class="round_m btn_44 green_btn" target="#AppointPop" id="btnAppoint">
		                         <span class="png btn_arrow btn_yu"></span>预约授课
		                     </a>
		                 </dt>
		               <%} %>
	                   
	                    <dd>
	                        <h5>还没有登录？</h5>
	                        <p><a href="<%=basePath %>loginPage.action" class="round_m btn_border_44" rel="nofollow">立即登录</a>
	                        </p>
	                        
	                    </dd>
	                    <dd>
	                        <h5>还没有帐号？</h5>
	                        <p><a href="<%=basePath %>registerPage.action" class="round_m btn_border_44" rel="nofollow">免费注册</a>
	                        </p>
	                    </dd>
	                </dl>
	            </div>
	        </div>
	        <!--end预约-->
	    </div>
	    <!--end一行的右-->
	</div>
	<%} %>
	<!--end一行-->

	<!--star_弹框-->
	<div class="cd-popup" id="AppointSuccessPop">
	    <div class="cd-popup-container" style="width: 660px;">
	        <a href="javascript:void(0);" class="cd-popup-close f_close_btn transition_a"></a>
	        <h4 class="f_code_th">
	            预约TA
	            <p></p>
	        </h4>
	
	        <div class="tel_box">
	            <span class="tel_arrow png round_r"></span><p>预约成功</p>
	        </div>
	        <!--end一行-->
	        <div class="wechat_note">
	            如有疑问或寻求帮助，请关注微信公众号，客服MM为您解答
	            <p>
	                <img src="../static/img/wechat.jpg" alt="" width="160" >
	            </p>
	            <!--end二维码-->
	        </div>
	    </div>
	</div>
	
	<!--end_弹框-->
	<input id="orderId" name="orderId" type="hidden" value="<%=order.getoId() %>">
	<input id="memberId" name="memberId" type="hidden" value="<%=order.getPublisher1() %>">
	<script>
	
		$("#qcode").qrcode({
	        width: 150,
	        height: 150,
	        text: '<%=basePath%>order/mOrderInfo.action?oId=<%=order.getoId()%>'
	      });
	
	
	    //百度地图API功能
	    function loadJScript() {
	        var script = document.createElement("script");
	        script.type = "text/javascript";
	        script.src = "https://api.map.baidu.com/api?v=2.0&ak=aSBzW9RUaCp3AM2dvTjR7f4lE7Tqm4wx&callback=init";
	        document.body.appendChild(script);
	    }
	    function init() {
	        var map = new BMap.Map("allmap");            // 创建Map实例
	        if (30.274497 <= 0) {
	            var address = encodeURI('<%=order.getAddress()%>');
	            var myGeo = new BMap.Geocoder();
	            myGeo.getPoint(address,
	                function(point) {
	                    if (point) {
	                        map.centerAndZoom(point, 16);
	                        map.addOverlay(new BMap.Marker(point));
	                    }
	                },
	                "all");
	        } else {
	            var point = new BMap.Point(<%=order.getLng()%>,<%=order.getLat()%>); // 创建点坐标
	            map.centerAndZoom(point,16);
	            var marker = new BMap.Marker(point);// 创建标注
	            map.addOverlay(marker);             // 将标注添加到地图中
	        }
	
	
	        map.enableScrollWheelZoom();                 //启用滚轮放大缩小
	    }
	    window.onload = loadJScript;  //异步加载地图
	
	
	    $(function() {
	        
	        $("#btnAppoint").click(function () {
	            var $this = $(this);
	            var param = {};
	            param.oId = $("#orderId").val();
	            param.memberId = $("#memberId").val();
	            $.post('../teacher/takeOrder.action', param, function (res) {
	                if (!res.success) {
	                    alert(res.message);
	                    return;
	                }
	                if (res.success) {
	                    $("#AppointSuccessPop").ShowSelfPopMessage(res.message);
	                    return;
	                }
	            });
	        });
	    })
	</script>
	
	<jsp:include page="footer.jsp"></jsp:include>	