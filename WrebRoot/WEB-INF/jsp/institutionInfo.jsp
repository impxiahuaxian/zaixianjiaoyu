<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Institution"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="width=1200">
		<meta name="keywords" content="吉师家教，四平家教兼职，吉师兼职家教，家教">
		<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2019年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
		<link href="<%=basePath%>static/css/brief.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
		
		<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
		<script src="<%=basePath%>static/js/jquery.qrcode.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
		<%
			Institution institution = (Institution) request
					.getAttribute("institution");
		%>
		<title>【吉师家教网】<%=institution.getiName()%>_吉师家教网_免费找家教_四平家教一对一在线辅导 </title>
		<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
		<script type="text/javascript" src="<%=basePath%>static/js/jquery.SuperSlide.2.1.2.js"></script>
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

				<img alt="" src="<%=basePath%>static/img/logo_contact.png">
				<div class="header_r fr">
					<span class="font_16">客服微信：</span>
					<img src="<%=basePath%>static/img/wechat.jpg" class="wechat_img"
						alt="吉师家教客服微信" width="80" height="80">

					<%
						Teacher teacher = (Teacher) session.getAttribute("teacher");
						Member member = (Member) session.getAttribute("member");
						if (member == null && teacher == null) {
					%>
					<span class="font_13"> <b class="orange_link"> <a
							href="<%=basePath%>loginPage.action" class="heada"> 登录</a> </b> <em
						class="china"></em> <b class="orange_link"> <a
							href="<%=basePath%>registerPage.action" class="heada">注册</a> </b> </span>

					<%
						} else {
					%>
					<span class="font_13"> <b class="orange_link"> <a
							href="<%=basePath%>logout.action" class="heada"> 退出</a> </b> <em
						class="china"></em> <b class="orange_link"> <%
						 	if (member != null) {
						 %> <a href="<%=basePath%>member/index.action"
													class="heada">我的</a> <%
						 	} else if (teacher != null) {
						 %> <a href="<%=basePath%>teacher/index.action"
													class="heada">我的</a> <%
						 	}
						 %> </b> </span>
	
						<%
							}
						%>

				</div>
				<!--end头文件右-->
			</div>
		</div>
		<!--end头文件-->

		<div class="nav min_1200">
			<div class="tnav w_1200" id="slideNav">
				<span><a href="<%=basePath%>" >家教首页</a></span>
				<span><a href="<%=basePath%>costPage.action" >资费标准</a></span>
				<span><a href="<%=basePath%>teacher/teachersPage.action" >找老师</a></span>
				<span><a href="<%=basePath%>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath%>institution/institutionPage.action" class="current_nav">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action" >云课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->
		
		<div class="tearch_banner min_1200 h_415">
	      <div class="w_1200">
	        <dl class="site_th">
	          <dd>当前位置：
	            <a href="<%=basePath%>">首页</a>
	            <span class="china">&gt;</span>
	            <a href="<%=basePath%>institution/institutionPage.action"">辅导班</a>
	            <span class="china">&gt;</span>课程详情</dd></dl>
	        <div class="about_box clearfix">
	          <div class="fr about_box_r w_300">
	            <dl class="company_about_t round_img img_border">
	              <dt>
	                <a href="javascript:void(0)">
	                  <img src="<%=basePath%>static/institutionimg/<%=institution.getLogo()%>" alt="" width="150px" height="150px" >
	                  <h2><%=institution.getiName()%></h2></a>
	                <p>注册时间：<%=institution.getPubTime()%></p>
	              </dt>
	              <dd>
	                <h5>
	                  <span>联系我吧</span></h5>
	                <div class="d">
	                  <a href="javascript:void(0)" class="round_m orange_btn btn_auto_50" id="btnView" target="#ContactModal" rel="nofollow">查看联系方式</a></div>
	              </dd>
	            </dl>
	          </div>
	          <div class="r_cell">
	            <dl class="dis_th clearfix">
	              <dd>
	                <h2><%=institution.getiName()%></h2></dd>
	              <div class="fl text">编号：
	                <span class="font_24 eng"><%=institution.getiId()%></span>
	                <span class="ml_20">发布时间：
	                  <span class="font_24 eng"><%=institution.getPubTime()%></span></span>
	                <span class="ml_20">浏览次数：
	                  <span class="font_24 eng"><%=institution.getViewNum()%></span></span>
	              </div>
	              </dt>
	            </dl>
	            <dl class="about_text_d font_15">
	              <dt>
	                <ul class="list_2">
	                  <li>教学学段：
		                 <%
	                  	List<DictInfo> dictList = (List<DictInfo>) request
	                  			.getAttribute("dictList");
	                  	String[] kemudaleis = institution.getKemudalei().split(",");

	                  	for (int k = 0; k < kemudaleis.length; k++) {
	                  		for (int j = 0; j < dictList.size(); j++) {
	                  			if (dictList.get(j).getDictId() == Integer
	                  					.parseInt(kemudaleis[k])) {
	                  %>
								<a href="javascript:void(0)"><%=dictList.get(j).getContent()%></a>
								<%
									break;
											}
										}
									}
								%>
	                  </li>
	                  <li>教学科目：<%=institution.getCourse()%></li>
	                  <li>价 格：<%=institution.getTeachingPrice()%></li>
	                  <li>授课形式：<%=institution.getTeachingType()%></li>
	                  <li>免费试听：
	                  <%
	                  	if (institution.getIsListen() == 1) {
	                  %>
	                  支持
	                  <%
	                  	} else {
	                  %>
	                  不支持
	                  <%
	                  	}
	                  %>
	                  </li>
	                  <li>地址：<%=institution.getAddress()%></li>
	                  <li>联系QQ：<%=institution.getQq()%></li>
	                </ul>
	              </dt>
	              <dd></dd>
	            </dl>
	          </div>
	        </div>
	        <!--end一行-->
	        </div>
    	</div>
    <!--end一行-->
    
    <div class="w_1200 clearfix center_box">
      <div class="fl w_830 font_15">
        <h4 class="th_line_d">扫一扫，手机浏览本页：</h4>
        <div id="qcode">
          <canvas width="150" height="150"></canvas>
        </div>
        <br>
        <h4 class="th_line_d">课程介绍</h4>
        <div class="about_text_t"><%=institution.getIntroduce()%></div>
        <!--end文字-->
        <dl class="tab_nav d_tab_nav do-ajax">
          <dt class="fl">该辅导班</dt></dl>
        <div class="tab_box" style="padding-bottom: 4em;">
          <div style="display: block;">
            <!--star图片播放-->
            <div class="picdp_focus focusDp">
              <a href="javascript:;" class="prev">&lt;</a>
              <a href="javascript:;" class="next nextStop">&gt;</a>
              <div class="picdp_focus_big">
                <div class="tempWrap" style="overflow:hidden; position:relative; width:830px">
                  <ul class="bigImg" style="width: 2490px; left: -1167.89px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">
                  	<%
                  		String[] photos = institution.getPhoto().split(",");
                  		for (int i = 0; i < photos.length; i++) {
                  			String photo = photos[i];
                  	%>
                  	<li style="float: left; width: 830px;">
                      <a href="javascript:void(0)">
                        <img src="<%=basePath%>static/institutionimg/<%=photo%>" alt="" width="830" height="590" ></a>
                    </li>
                  	<%
                  		}
                  	%>
                    
                    <li style="float: left; width: 830px;">
                      <a href="javascript:void(0)">
                        <img src="<%=basePath%>static/institutionimg/5.jpg" alt="" width="830" height="590" ></a>
                    </li>
                    <li style="float: left; width: 830px;">
                      <a href="javascript:void(0)">
                        <img src="<%=basePath%>static/institutionimg/6.jpg" alt="" width="830" height="590" ></a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="picdp_focus_nav smallScroll">
                <a href="javascript:;" class="sPrev transition_a prevStop">&lt;</a>
                <ul class="picdp_focus_small smallImg">
                <%
                	for (int i = 0; i < photos.length; i++) {
                		String photo = photos[i];
                %>
              		<li class="">
                    	<img src="<%=basePath%>static/institutionimg/<%=photo%>" alt="" width="140" height="100" >
                    </li>
                <%
                	}
                %>  	
                  
                </ul>
                <a href="javascript:;" class="sNext transition_a nextStop">&gt;</a></div>
            </div>
            <!--end图片播放--></div>
          <!--end相册--></div>
        <h4 class="th_line_d">该辅导班地理位置</h4>
        <div class="map_box shadow_box_light">
          <h5>授课地址：<%=institution.getAddress()%></h5>
          <div id="allmap" class="map-container" data-long-lat="<%=institution.getLng()%>,<%=institution.getLat()%>" 
          	style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;">
          </div>
        </div>
        <!--end地图-->
      </div>
      <!--end一行的左-->
      
      <div class="fr w_270">
			<div class="f_btn free_box_f">
				<a href="javascript:void(0)" id="btnGotoPub"
					class="fill_btn_orange transition_a" rel="nofollow"> <span
					class="png">我也要发布</span>
				</a>
			</div>
			<!--end按钮-->
			<div class="white_bj clearfix box_d" style="padding-top: 1em;">
				<h4 class="th_arrow_y2">
					热门机构
				</h4>
				<ul class="r_guide_hot">
				<%
				List<Institution> institutionList = (List<Institution>)request.getAttribute("institutionList");
				if(institutionList!=null){
					for(int i = 0 ; i < institutionList.size();i++){
						Institution institution2 = institutionList.get(i);
				%>
					<li class="transition_a">
						<div class="transition_a">
							<a href="<%=basePath %>institution/institutionInfo.action?iId=<%=institution2.getiId() %>" target="_blank"
								class="pic_a" rel="nofollow"> <img
									src="<%=basePath %>static/institutionimg/<%=institution2.getLogo() %>"
									alt="<%=institution2.getiName() %>" width="250" height="160" class="transition_a">
							</a>
							<h5>
								<a href="<%=basePath %>institution/institutionInfo.action?iId=<%=institution2.getiId() %>" target="_blank"
									rel="nofollow"><%=institution2.getiName() %></a>
							</h5>
							<div class="t"></div>
							<p>
								地址：<%
				                    if(institution.getAreaId()==1){
				                    %>
				                    	城厢区
				                    <%} %>
				                    <%if(institution.getAreaId()==2){ %> 
				                    	荔城区
				                    <%} %>
				                    <%if(institution.getAreaId()==3){ %> 
				                    	秀屿区
		        					<%} %>
		        					<%if(institution.getAreaId()==4){ %> 
		        						涵江区
					        		<%} %>
					        		<%if(institution.getAreaId()==5){ %> 
					        			仙游县
		        					<%} %>-<%=institution2.getAddress() %>
							</p>
						</div>
					</li>
				<%
					}
				}
				%>
					
				</ul>
			</div>
			<!--end热门机构-->
        </div>
      <!--end一行右-->
      </div>
    <!--end一行-->
    
    <!--star_弹框-->
	<div class="cd-popup" id="ContactModal">
		<div class="cd-popup-container" style="width: 660px;">
			<a href="javascript:void(0);"
				class="cd-popup-close f_close_btn transition_a"></a>
			<h4 class="f_code_th f_code_th_b">
				查看联系方式
			</h4>
			<div class="tel_box">
				<span class="tel_arrow png round_r"></span>
				<p><%=institution.getContactPhone()%></p><%=institution.getContactName().subSequence(0, 1)%>老师
				<div class="d">
					云朵家教网
				</div>
			</div>
			<!--end一行-->
			<div class="wechat_note">
				如有疑问或寻求帮助，请关注微信公众号，客服MM为您解答
				<p>
					<img src="<%=basePath%>static/img/wechat.jpg" alt="" width="160">
				</p>
				<!--end二维码-->
			</div>
		</div>
	</div>
	<!--end_弹框-->
    <script>
      $("#qcode").qrcode({
        width: 150,
        height: 150,
        text: '<%=basePath%>institution/mInstitutionInfo.action?id=<%=institution.getiId()%>'
      });

      //百度地图API功能
      function loadJScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "https://api.map.baidu.com/api?v=2.0&ak=aSBzW9RUaCp3AM2dvTjR7f4lE7Tqm4wx&callback=init";
        document.body.appendChild(script);
      }
      function init() {
        var map = new BMap.Map("allmap"); // 创建Map实例
        if (30.274497 <= 0) {
          var address = encodeURI('<%=institution.getAddress()%>');
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
          var point = new BMap.Point('<%=institution.getLng()%>', '<%=institution.getLat()%>'); // 创建点坐标
          map.centerAndZoom(point, 16);
          var marker = new BMap.Marker(point); // 创建标注
          map.addOverlay(marker); // 将标注添加到地图中
        }

        map.enableScrollWheelZoom(); //启用滚轮放大缩小
      }
      window.onload = loadJScript; //异步加载地图
      $("#btnView").click(function() {
        var $this = $(this);
        var param = {};
        param.CourseId = $("#CourseId").val();
        param.ClassId = $("#ClassId").val();
        $this.showPop();
      });

      $("#btnGotoPub").click(function() {
        $.post('/home/CheckLoginStatus', {},
        function(res) {
          if (res.success) {
            window.location.href = res.redirect;
          } else {
            alert(res.message);
          }
        });
      });
    </script>
    <script type="text/javascript" src="<%=basePath%>static/js/api"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/getscript"></script>
		
		
	<jsp:include page="footer.jsp"></jsp:include>

