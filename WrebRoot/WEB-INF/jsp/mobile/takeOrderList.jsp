<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.TakeOrders"%>
<%@page import="com.jiajiao.bean.District"%>
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
        <title>
            【吉师家教】教员中心-预约记录
        </title>
        
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
        
        
        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
        name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta name="format-detection" content="telephone=no">
        <meta name="format-detection" content="email=no">
        <meta name="msapplication-tap-highlight" content="no">
        <script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
        </script>
        <script src="<%=basePath %>static/js/jquery-ui.js">
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
  
    <body class="whbg" style="">
        
        <!-- ntextpop -->
        <div class="ntextpop" id="messagebox">
            <span class="ntextpop_content">
            </span>
        </div>
        <!-- end ntextpop -->
        
        <header class="headbar">
            <div class="headl">
                <a href="javascript:history.go(-1);" class="heada">
                    <i class="back_hico hico">
                    </i>
                </a>
            </div>
            <h1 class="headtitle">
                我的预约
            </h1>
        </header>
        <!--end header-->
        <!-- 中间 -->
        <!-- 一行 -->
        <ul class="yelinehd">
            <li>
                <a href="mAppointTeacherList.action">
                    预约我的学员
                </a>
            </li>
            <li class="on">
                <a href="javascript:void(0)">
                    我预约的学员
                </a>
            </li>
        </ul>
        <!-- end 一行 -->
        <!-- 一行 -->
        <ul class="TranslateList cflist">
           
            <%
            List<District> districtList = (List<District>)request.getAttribute("districtList");
            
            List<TakeOrders> takeOrdersList = (List<TakeOrders>)request.getAttribute("takeOrdersList");
            if(takeOrdersList!=null){
            	for(int i = 0; i < takeOrdersList.size(); i++){
            		TakeOrders takeOrder = takeOrdersList.get(i);
            %>
            
            <li class="cfitem">
	            <a href="../order/mAppointOrderInfo.action?oId=<%=takeOrder.getoId() %>&toid=<%=takeOrder.getToId() %>">
	            	<div class="cfface" style="transition-duration: 300ms;">
	                    <div class="cfface_content">
	                        <div class="cfface_chead">
	                            <div class="cfface_title">
	                            <%
	                            String contactGender = "先生";
	                            int gender = takeOrder.getContactGender();
	                            if(gender==0){
	                            	contactGender="女士";
	                            }
	                            %>
	                                <%=takeOrder.getContactName().substring(0,1) %><%=contactGender %>请<%=takeOrder.getCourseName() %>家教
	                            </div>
	                            <span class="inf">
	                            (订单编号:<%=takeOrder.getOrderCode() %>)
	                            
	                            </span>
	                        </div>
	                        <div class="cfface_info">
	                            <div class="cfface_info_mc">
	                            <%
	                             if(districtList!=null){
	                             	for(int j = 0 ; j < districtList.size(); j++){
	                             		District district = districtList.get(j);
	                             		if(takeOrder.getAreaId()==district.getDistrictId()){
	                              %>
	                               授课地址：<%=district.getDistrict() %> <%=takeOrder.getAddress() %>
	                              <%
	                              		}
	                              	}
	                              }
	                              %>
	                               
	                            </div>
	                            <span class="inf">
	                                <%
								int state = takeOrder.getTakeStatus();
								if(state==1){ 
								%>
								(订单状态:待支付)
								<%}else if(state==2){ %>
								(订单状态:已支付)
								<%}else if(state==3){ %>
								(订单状态:试授课)
								<%}else if(state==4){ %>
								(订单状态:已完成)
								<%}else if(state==5){ %>
								(订单状态:退款中)
								<%}else if(state==6){ %>
								(订单状态:预约失败)
								<%} %>
	                            </span>
	                        </div>
	                        <div class="cfface_info">
	                            <div class="cfface_info_mc">
	                              支付金额：¥<%=takeOrder.getCourcePrice()%>
	                            </div>
	                            <span class="inf">
	                                <%=takeOrder.getTakeTime() %>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	                <div class="cfitem_tool">
	                    <div class="cfitem_del">
	                        删除
	                    </div>
	                </div>
                </a>
            </li>
            <%
            	}
            }
            %>
        </ul>
        
        <!-- end 一行 -->
        <!--end 中间-->
        <!-- gotop -->
        <a href="javascript:void(0)" onclick="$(&#39;#imagePop&#39;).addClass(&#39;show&#39;);"
        style="bottom: 8.3rem; background-color: rgba(255,138,0,.9);position: fixed; z-index: 18; right: 1rem; display: block; text-align: center; padding-top: .3rem; width: 4rem; height: 4rem; line-height: 1rem; font-size: .9rem; color: #fff; box-sizing: border-box; border-radius: 20%; -webkit-box-sizing: border-box;  background-image: url(../static/mobile/img/a.png); background-repeat: no-repeat; background-size: 2rem auto;background-size:100% 100%;">
        </a>
        
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
        
        <!-- gotop -->
        <a href="javascript:void(0)" class="gotop_toolbtn toolbtn" style="display: none;">
            顶部
        </a>
        <!-- end gotop -->
        <script src="<%=basePath %>static/mobile/js/tool.js">
        </script>
    </body>

</html>
