<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Orders"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher teacher = (Teacher)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect(basePath+"mobile.action");
	return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<%
    	MemberOrderTeacher memberOrderTeacher =  (MemberOrderTeacher)request.getAttribute("memberOrderTeacher");
    	%>
        <title>
            【吉师家教】教员中心-预约我的学员
        </title>
		<meta name="keywords" content="四平家教，四平家教兼职，四平兼职家教，家教">
		<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2003年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">

		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/css114.css">
        
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta name="format-detection" content="telephone=no">
        <meta name="format-detection" content="email=no">
        <meta name="msapplication-tap-highlight" content="no">

        <script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/api">
        </script>
        <script type="text/javascript" src="<%=basePath %>static/mobile/js/getscript">
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
  
  <body style="">
       
        <header>
			<h3>
				<a href="javascript:history.go(-1);" class="fh">
					返回
				</a>
				家教详情
			</h3>
		</header>
        
        <!--end header-->
        <!-- 中间 -->
        <!-- 一行 -->
        
        <div class="wpbox">
            <div class="boxmt">
                <div class="wbw">
                    <h3 class="ogtitle">
                        联系信息
                    </h3>
                </div>
            </div>
            <div class="showdlist">
            	<div class="dl">
                    <div class="dt">
                        联  系  人
                    </div>
                    <div class="dd">
                       <%=memberOrderTeacher.getName()%>
                    </div>
                </div>
                <div class="align dl">
                    <div class="dt">
                        性  别
                    </div>
                    <div class="dd">
                       <%if(memberOrderTeacher.getGender()==0){%>
               			 女
               			<%}else if(memberOrderTeacher.getGender()==1){ %>
               			男
               			<%} %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        联系电话
                    </div>
                    <div class="dd">
                    	<a href="tel:<%=request.getAttribute("phone")%>" style="color: #3ac779;"><strong><%=request.getAttribute("phone")%></strong>(点击联系)</a>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        订单金额
                    </div>
                    <div class="dd">
                       ¥<%=memberOrderTeacher.getPrice()%>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="wpbox">
        	<div class="boxmt">
                <div class="wbw">
                    <h3 class="ogtitle">
                        家教信息
                    </h3>
                </div>
            </div>
            <div class="boxmt">
                <div class="wbw">
                    <div class="boxmtitle">
                        编号
                        <a href="javascript:void(0)" class="ogtxt">
                            <%=memberOrderTeacher.getMosId() %>
                        </a>
                    </div>
                </div>
                <span>
                    <i class="lastime_ntico ntico">
                    </i>
                    发布时间：<%=memberOrderTeacher.getPublicTime() %>
                </span>
            </div>
            <div class="showdlist">
                <div class="dl">
                    <div class="dt">
                        科  目
                    </div>
                    <div class="dd">
                        <%=memberOrderTeacher.getTeachingCourseName() %>
                    </div>
                </div>
                
                
                <div class="align dl">
                    <div class="dt">
                        地  址
                    </div>
                    <div class="dd">
                        <%=memberOrderTeacher.getAddress() %>
                    </div>
                    <a href="<%=basePath %>order/mMap.action?address=<%=memberOrderTeacher.getAddress() %>&lat=<%=memberOrderTeacher.getLat() %>&lng=<%=memberOrderTeacher.getLng() %>" class="oglinebtn">
                        <i class="ogsite_smico">
                        </i>
                        查看地图
                    </a>
                </div>
                <div class="dl">
                    <div class="dt">
                        备  注
                    </div>
                    <div class="dd">
                        <%=memberOrderTeacher.getRemark()%>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- end 一行 -->
        <!-- 一行 -->
        <!-- 底部 -->
        
        <!-- end 底部 -->
 	<div class="fbottom">
            <div class="ftoolbar">
                <div class="ftoolbar_wbw">
                    <a href="tel:150-6033-8989" id="btnView" class="big_gnbtn">
                        联系客服
                    </a>
                </div>
                <div class="ftoolbar_wbw">
                    <a href="javascript:void(0)" onclick="$(&#39;#zfbpayPop&#39;).addClass(&#39;show&#39;);" class="big_ogbtn">
                        支付宝支付
                    </a>
                </div>
                <div class="ftoolbar_wbw">
                    <a href="javascript:void(0)" onclick="$(&#39;#payPop&#39;).addClass(&#39;show&#39;);" class="big_ogbtn">
                        微信支付
                    </a>
                </div>
            </div>
        </div>
        
        <div class="cpop" id="payPop">
            <div class="cpopcontent">
                <div class="ntpop">
                    <i class="hide-payPop cpop_close">
                    </i>
                    <div class="ntpop_head">
                    请选择支付方式
                    </div>
                    <div class="ntpop_content">
                        <img src="<%=basePath %>static/img/wxpay.jpg">
                        <br>
                        <span>
                            关注微信，优秀简历、优惠活动实时推送。
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="cpop" id="zfbpayPop">
            <div class="cpopcontent">
                <div class="ntpop">
                    <i class="hide-zfbpayPop cpop_close" onclick="$(&#39;#zfbpayPop&#39;).removeClass(&#39;show&#39;);">
                    </i>
                    <div class="ntpop_head">
                    请选择支付方式
                    </div>
                    <div class="ntpop_content">
                        <img src="<%=basePath %>static/img/zfbpay.jpg">
                        <br>
                        <span>
                            关注微信，优秀简历、优惠活动实时推送。
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="cpop" id="imagePop">
            <div class="cpopcontent">
                <div class="ntpop">
                    <i class="hide-imagePop cpop_close">
                    </i>
                    <div class="ntpop_head">
                    长按识别图中二维码
                    </div>
                    <div class="ntpop_content">
                        <img src="<%=basePath %>static/img/wechat.jpg">
                        <br>
                        <span>
                            关注微信，优秀简历、优惠活动实时推送。
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- end beditPop -->
        <!-- ntextpop -->
        <div class="ntextpop" id="messagebox">
            <span class="ntextpop_content">
            </span>
        </div>
        <!-- end ntextpop -->
        
        <script src="<%=basePath %>static/mobile/js/TouchSlide.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/tool.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/geolocation.js">
        </script>
        
    </body>

</html>