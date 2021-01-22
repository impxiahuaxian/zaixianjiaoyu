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
		<meta name="keywords" content="四平家教，四平家教兼职，四平兼职家教，家教">
		<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2003年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">
		
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
		<title>【吉师家教网】<%=institution.getiName()%>_四平家教网_免费找家教_四平家教一对一在线辅导 </title>
		<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
		<script type="text/javascript" src="<%=basePath%>static/js/jquery.SuperSlide.2.1.2.js"></script>



		<!-- 引用控制层插件样式 -->
		<link rel="stylesheet" href="<%=basePath%>static/css/zyUpload.css" type="text/css">
		<!-- 引用核心层插件 -->
		<script type="text/javascript" src="<%=basePath%>static/js/zyFile.js">
		</script>
		<!-- 引用控制层插件 -->
		<script type="text/javascript" src="<%=basePath%>static/js/zyUpload.js">
		</script>
		<!-- 引用初始化JS -->
		<script type="text/javascript" src="<%=basePath%>static/js/jqueryrotate.js">
		</script>
		<script type="text/javascript" src="<%=basePath%>static/js/index.js">
		</script>


  </head>
  
  <body>
		
		<div class="tearch_banner min_1200 h_415">
	      <div class="w_1200">
	        
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
	                  <a href="javascript:void(0)" class="round_m orange_btn btn_auto_50" style="margin-top: 10px;" id="uploadPhoto" target="#viewPhoto" rel="nofollow">上传相册图片</a>
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
                  
                  <li class="">
                    <img src="<%=basePath%>static/institutionimg/5.jpg" alt="" width="140" height="100" ></li>
                  <li class="on">
                    <img src="<%=basePath%>static/institutionimg/6.jpg" alt="" width="140" height="100" ></li>
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
					吉师家教网
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
	
	
	 <!--star_弹框-->
	<div class="cd-popup" id="viewPhoto">
		<div class="cd-popup-container" style="width: 660px;">
			<a href="javascript:void(0);"
				class="cd-popup-close f_close_btn transition_a"></a>
			<h4 class="f_code_th f_code_th_b">
				上传相册图片
			</h4>
			<div class="container">
		    	<div id="demo" class="demo" style="width: 650px; height: 400px;">
					
				</div>
        	</div>

		</div>
	</div>
	<!--end_弹框-->
    
    <script>
      $("#qcode").qrcode({
        width: 150,
        height: 150,
        text: '<%=basePath%>institution/institutionInfo.action?iId=<%=institution.getiId()%>'
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
      
      $("#uploadPhoto").click(function() {
        var $this = $(this);
        
        $this.showPop();
  
      });
     
    </script>
<script>
  //引用初始化JS
$(function(){
    // 初始化插件
    $("#demo").zyUpload({
        width            :   "650px",                 // 宽度
        height           :   "400px",                 // 宽度
        itemWidth        :   "120px",                 // 文件项的宽度
        itemHeight       :   "100px",                 // 文件项的高度
        url              :   "../institution/uploadPhoto.action?iId=<%=institution.getiId()%>",       // 上传文件的路径
        multiple         :   true,                    // 是否可以多个文件上传
        dragDrop         :   true,                    // 是否可以拖动上传文件
        del              :   true,                    // 是否可以删除文件
        finishDel        :   true,                   // 是否在上传文件完成后删除预览
        /* 外部获得的回调接口 */
        onSelect: function(files, allFiles){                    // 选择文件的回调方法
            console.info("当前选择了以下文件：");
            console.info(files);
            console.info("之前没上传的文件：");
            console.info(allFiles);
        },
        onDelete: function(file, surplusFiles){                     // 删除一个文件的回调方法
            console.info("当前删除了此文件：");
            console.info(file);
            console.info("当前剩余的文件：");
            console.info(surplusFiles);
        },
        onSuccess: function(file){                    // 文件上传成功的回调方法
            console.info("此文件上传成功：");
            console.info(file);
        },
        onFailure: function(file){                    // 文件上传失败的回调方法
            console.info("此文件上传失败：");
            console.info(file);
        },
        onComplete: function(responseInfo){           // 上传完成的回调方法
            console.info("文件上传完成");
            console.info(responseInfo);
        }
    });
});
   </script> 
    <script type="text/javascript" src="<%=basePath%>static/js/api"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/getscript"></script>
		
		
