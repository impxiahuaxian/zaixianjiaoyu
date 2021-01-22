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

	<meta name="keywords" content="吉师家教，吉师家教兼职，四平兼职家教">
	<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">


	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<LINK rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/pageSwitch.min.css">
	
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
	
	<script src="<%=basePath%>static/js/jquery.artDialog.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/jQuery.rTabs.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/search_tab.js" type="text/javascript"></script>
	
	<STYLE>
			* {
				padding: 0;
				margin: 0;
			}
			
			html,
			body {
				height: 100%;
			}
			
			#container {
				width: 100%;
				height: 500px;
				overflow: hidden;
			}
			
			.sections,
			.section {
				height: 100%;
			}
			
			#container,
			.sections {
				position: relative;
			}
			
			.section {
				background-color: #000;
				background-size: cover;
				background-position: 50% 50%;
				text-align: center;
				color: white;
			}
			

			
			.mainProNav {
				background: rgba(0, 0, 0, .7);
				width: 230px;
				height: 500px;
			}
			
			.mainProNav dt {
				color: #fff;
			}
			
			.mainProNav dt {
				padding-top: 15px;
				height: 80px;
				line-height: 18px;
				font-size: 16px;
			}
			
			.mainProNav .dlHover dt {
				padding-left: 24px;
				background: #000;
				line-height: 18px;
				padding-top: 15px;
				height: 80px;
			}
			
			.mainProNav p {
				height: 28px;
				padding-top: 10px;
				font-size: 12px;
				font-weight: 100;
				width: 180px;
			}
			
			.mainProNav dd {
				left: 230px;
				border-left: none
			}
		</STYLE>
  </head>
  
  <body>
	<%
	Orders order =  (Orders)request.getAttribute("order");
	if(order!=null){
	 %>


<div>
    <div class="fl  font_15" style="margin: 10px">
            <h4 class="th_line_d">学员信息</h4>
            <ul class="clearfix list_text_ul list_2" >
             	<li>订单编号：<%=order.getOrderCode() %></li>
                <li>求教科目：<%=order.getCourseName() %></li>
                <li>联系人：<%=order.getContactName().substring(0,1) %>
                <%if(order.getContactGender()==1){%>
                先生
                <%}else{ %>
                女士
                <%} %>
                </li>
				<li>联系电话：<%=order.getContactPhone() %></li>
			    <li>微信号：<%=order.getWxNumber() %></li>    
                	
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
                      		 参照云朵家教网标准
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
                <li>就读学校：asdfdsafasdfdsaf</li>
                <li>学员状态：<%=order.getProfile() %></li>
                <li></li>
            </ul>
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
            <div class="map_box shadow_box_light" style="margin: 1.5em 0 1em 0">
                <h5>居住位置：<%=order.getAddress() %></h5>
                <div id="allmap" class="map-container" data-long-lat="116.4886,40.00707" style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;"><div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: url(&quot;http://api0.map.bdimg.com/images/openhand.cur&quot;) 8 8, default;"><div class="BMap_mask" style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; user-select: none; width: 858px; height: 220px;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 19px; height: 25px; left: 419px; top: 85px; z-index: -6054898;" title=""></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"><label class="BMapLabel" unselectable="on" style="position: absolute; display: none; cursor: inherit; background-color: rgb(190, 190, 190); border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: -20000; color: rgb(190, 190, 190);">shadow</label></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"><span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 419px; top: 85px; z-index: -6054898;"><div style="position: absolute; margin: 0px; padding: 0px; width: 19px; height: 25px; overflow: hidden;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/marker_red_sprite.png" style="display: block; border:none;margin-left:0px; margin-top:0px; "></div></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"><span unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 20px; height: 11px; left: 423px; top: 99px;"><div style="position: absolute; margin: 0px; padding: 0px; width: 20px; height: 11px; overflow: hidden;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/marker_red_sprite.png" style="display: block; border:none;margin-left:-19px; margin-top:-13px; "></div></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;"><div style="position: absolute; overflow: visible; z-index: -100; left: 429px; top: 110px; display: block; transform: translate3d(0px, 0px, 0px);"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource" style="position: absolute; border: none; width: 256px; height: 256px; left: -7px; top: -73px; max-width: none; opacity: 1;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource(1)" style="position: absolute; border: none; width: 256px; height: 256px; left: -263px; top: -73px; max-width: none; opacity: 1;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource(2)" style="position: absolute; border: none; width: 256px; height: 256px; left: 249px; top: -73px; max-width: none; opacity: 1;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource(3)" style="position: absolute; border: none; width: 256px; height: 256px; left: -7px; top: -329px; max-width: none; opacity: 1;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource(4)" style="position: absolute; border: none; width: 256px; height: 256px; left: -519px; top: -73px; max-width: none; opacity: 1;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource(5)" style="position: absolute; border: none; width: 256px; height: 256px; left: -263px; top: -329px; max-width: none; opacity: 1;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource(6)" style="position: absolute; border: none; width: 256px; height: 256px; left: 249px; top: -329px; max-width: none; opacity: 1;"><img src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/saved_resource(7)" style="position: absolute; border: none; width: 256px; height: 256px; left: -519px; top: -329px; max-width: none; opacity: 1;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: none;"><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: none;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div></div><div class="pano_close" title="退出全景" style="z-index: 1201; display: none;"></div><a class="pano_pc_indoor_exit" title="退出室内景" style="z-index: 1201; display: none;"><span style="float:right;margin-right:12px;">出口</span></a><div class=" anchorBL" style="height: 32px; position: absolute; z-index: 30; text-size-adjust: none; bottom: 20px; right: auto; top: auto; left: 1px;"><a title="到百度地图查看此区域" target="_blank" href="http://map.baidu.com/?sr=1" style="outline: none;"><img style="border:none;width:77px;height:32px" src="./福州自然科学家教信息_杭州市余杭区西园家教【阳光家教网】_files/copyright_logo.png"></a></div><div id="zoomer" style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:url(http://api0.map.bdimg.com/images/openhand.cur) 8 8,default"><div class="BMap_zoomer" style="top:0;left:0;"></div><div class="BMap_zoomer" style="top:0;right:0;"></div><div class="BMap_zoomer" style="bottom:0;left:0;"></div><div class="BMap_zoomer" style="bottom:0;right:0;"></div></div><div unselectable="on" class=" BMap_cpyCtrl BMap_noprint anchorBL" style="cursor: default; white-space: nowrap; color: black; background: none; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 11px; line-height: 15px; font-family: arial, sans-serif; bottom: 2px; right: auto; top: auto; left: 2px; position: absolute; z-index: 10; text-size-adjust: none;"><span _cid="1" style="display: inline;"><span style="background: rgba(255, 255, 255, 0.701961);padding: 0px 1px;line-height: 16px;display: inline;height: 16px;">©&nbsp;2019 Baidu - GS(2018)5572号 - 甲测资字1100930 - 京ICP证030173号 - Data © 长地万方</span></span></div></div>
            </div>
            <!--end地图-->
             <h2 style="margin: 1.5em 0 1em 0">扫一扫，手机支付本订单：</h2>
            <div id="qcode" style="text-align: center;">		
            	<img src="../static/img/wxpay.jpg" style="padding-right: 40px">
				<img src="../static/img/zfbpay.jpg" style="padding-left: 40px">
			</div>
    </div>
    <!--end一行的左-->
</div>
<%} %>
<!--end一行-->


<script>
    //百度地图API功能
    function loadJScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://api.map.baidu.com/api?v=2.0&ak=aSBzW9RUaCp3AM2dvTjR7f4lE7Tqm4wx&callback=init";
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


</script>
</body>		
		
		
		
		
		
		
		