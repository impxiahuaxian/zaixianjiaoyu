<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Teacher teacher = (Teacher) session.getAttribute("teacher");
	if(teacher==null){
		response.sendRedirect(basePath);
		return ;
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=1200">
	<title>【吉师家教网】吉师家教网_免费找家教_四平在线一对一在线辅导</title>

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/css/css.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/css/code.css">

    <script type="text/javascript" src="<%=basePath %>static/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath %>static/js/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=basePath %>static/js/tool.js"></script>
    <script type="text/javascript" src="<%=basePath %>static/js/code.js"></script>

    <script src="<%=basePath %>static/js/jQuery.rTabs.js"></script>
    <script src="<%=basePath %>static/js/search_tab.js"></script>

	<link href="<%=basePath%>static/css/ui-choose.css" rel="stylesheet"  type="text/css"/>
	<link rel="stylesheet" href="<%=basePath%>static/css/buttons.css">


    <link href="<%=basePath %>static/js/brief.css" rel="stylesheet">
    <script src="<%=basePath %>static/js/jquery.artDialog.min.js"></script>
    <script src="<%=basePath %>static/js/ajaxfileupload.js"></script>
    <script src="../static/back/assets/layer/layer.js" type="text/javascript"></script>
    
	<link href="<%=basePath %>static/css/WdatePicker.css" rel="stylesheet" type="text/css">

	<style type="text/css">
		#preview {
			width: 210px;
			height: 210px;
			border: 1px solid #000;
			overflow: hidden;
		}
		
		#imghead {
			filter: progid: DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
		}
	</style>

<script type="text/javascript">
$(function() {

      //图片上传
    $("#submit_btn").click(function () {
      
        var imgurl = document.getElementById("upload").value;

        $.ajaxFileUpload({
            url:"personPhotoUpload.action",
            fileElementId: "upload", //文件上传域的ID，这里是input的ID，而不是img的
            dataType: 'json', //返回值类型 一般设置为json
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (data) {
            	if(data.success){
                	alert(data.message);
                	window.location.reload();
            	}else{
            		alert(data.message);
            	}
               
            }

        });
	
	});

});

</script>
<!-- 图片上传 -->

		<script type="text/javascript">
			//图片上传预览    IE是用了滤镜。
			function previewImage(file) {
				var MAXWIDTH = 210;
				var MAXHEIGHT = 210;
				var div = document.getElementById('preview');
				if(file.files && file.files[0]) {
					div.innerHTML = '<img id=imghead>';
					var img = document.getElementById('imghead');
					img.onload = function() {
						var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
						img.width = rect.width;
						img.height = rect.height;
						img.style.marginTop = rect.top + 'px';
					}
					var reader = new FileReader();
					reader.onload = function(evt) {
						img.src = evt.target.result;
					}
					reader.readAsDataURL(file.files[0]);
				} else //兼容IE
				{
					var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
					file.select();
					var src = document.selection.createRange().text;
					div.innerHTML = '<img id=imghead>';
					var img = document.getElementById('imghead');
					img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
					status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
					div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
				}
			}

			function clacImgZoomParam(maxWidth, maxHeight, width, height) {
				var param = {
					top: 0,
					left: 0,
					width: width,
					height: height
				};
				if(width > maxWidth || height > maxHeight) {
					rateWidth = width / maxWidth;
					rateHeight = height / maxHeight;

					if(rateWidth > rateHeight) {
						param.width = maxWidth;
						param.height = Math.round(height / rateWidth);
					} else {
						param.width = Math.round(width / rateHeight);
						param.height = maxHeight;
					}
				}
				param.left = Math.round((maxWidth - param.width) / 2);
				param.top = Math.round((maxHeight - param.height) / 2);
				return param;
			}
			
			
		</script>
<!-- 图片上传 end-->
    <script>
        artDialog.alert = function (content, callback) {
            return artDialog({
                id: 'Alert',
                icon: 'warning',
                fixed: true,
                // lock: true,
                width: 250,
                height: 50,
                content: content,
                ok: true,
                close: callback
            })
        };

        artDialog.tips = function (content, time) {
            return artDialog({
                id: 'Tips',
                title: false,
                cancel: false,
                fixed: true,
                // lock: true,
                width: 250,
                height: 50
            })
                .content('<div style="padding: 0 1em;">' + content + '</div>')
            .time(time || 1);
        };
    </script>
    
     <script type="text/javascript">
        ; $(function () {
            //显示或隐藏
            $('.hide_a').click(function () {
                $(this).parent().parent().parent('.add_box').hide('slow');
            });
            $('.add_a').click(function () {
                $(this).parent().siblings('.add_box').fadeIn();
            });
        });
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
  
  <body>
	<!--star_弹框-->
		<div class="cd-popup" id="TeacherHead">
			<div class="cd-popup-container">
				<a href="#" class="cd-popup-close f_close_btn transition_a"></a>
				<h4 class="f_code_th">上传头像</h4>
					<div class="btn_20">
						<input type="file" name="file" class="transition_a round_m btn_border_gray" id="upload"  onchange="previewImage(this)">
						<input type="submit" id="submit_btn" class="round_m submit_btn transition_a" value="上传"> 
					</div>
					<ul class="up_box list_5 clearfix" style="height: 450px;overflow-y: auto;">
						<div class="container" style="text-align: center;">
							<div id="preview">
								<%
		                        if( teacher.getGender()==0 && "".equals(teacher.getPersonImg()) ){
		                         %>
		                         <img id="imghead" width="210" height="210" border="0" src="<%=basePath %>static/img/w.png">
		                         <%}else if( teacher.getGender()==1 && "".equals(teacher.getPersonImg()) ){ %>
		                         <img id="imghead" width="210" height="210" border="0" src="<%=basePath %>static/img/male1.png">
		                        <%}else{ %>
		                        <img id="imghead" width="210" height="210" border="0" src="<%=basePath %>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>">
		                        <%} %>
							</div>
						</div>
					</ul>
			</div>
		</div>
		<!--end_弹框-->

		<div class="header min_1200">
		    <div class="w_1200">
		        <%--<h1 class="logo fl png_img"><a href="<%=basePath %>"><img src="<%=basePath %>static/img/logo2.png" alt="云朵家教"></a></h1>--%>
				<h3 class="h_city fl">
					<span class="png city_arrow">四平</span>
					<p>
						<a href="javascript:void(0);" class="round_s city_btn" rel="nofollow">切换城市</a>
					</p>
				</h3>
	
				<img alt="云朵家教" src="<%=basePath %>static/img/logo_contact.png">
		        <div class="header_r fr">
		            <span class="font_16">客服微信：</span>
		            <img src="<%=basePath %>static/img/wechat.jpg" class="wechat_img" alt="云朵家教客服微信" width="80" height="80">
		            
		            <span class="font_13">
						<b class="orange_link">
                        	<a href="<%=basePath %>logout.action" class="heada">退出</a>
                    	</b>
                    	<em class="china"></em>
                    	<a href="<%=basePath%>teacher/index.action" class="heada">我的</a>
                    </span>
		        </div>
		        <!--end头文件右-->
		    </div>
		</div>
		<!--end头文件-->

	    <!--end头文件-->
		<div class="nav min_1200">
		    <div class="tnav w_1200" id="slideNav">
    			<span><a href="<%=basePath %>" class="current_nav">家教首页</a></span>
				<span><a href="<%=basePath %>costPage.action">资费标准</a></span>
				<span><a href="<%=basePath %>teacher/teachersPage.action">找老师</a></span>
				<span><a href="<%=basePath %>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath %>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>" target="_blank">云朵课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
		    </div>
		</div>

    <div class="tearch_banner min_1200">
        <div class="w_1200">
            <dl class="tearch_banner_dl png_img">
                <dd class="f_l">
                    <a href="javascript:void(0);" class="email_a">
                        <span class="f_num">
                            0
                        </span>
                        <img src="<%=basePath %>static/img/email.png" alt="" width="30" height="30">
                    </a>
                </dd>
                <dd class="f_r">
                    <ul class="list_ul gray_link gray_text">
                        <li>
                            <span class="font_34 eng">
                                0
                            </span>
                            <p>
                                可用查看学员次数
                            </p>
                        </li>
                        <li>
                            <span class="font_34 eng">
                                1
                            </span>
                            <p>
                                可用预约次数
                            </p>
                        </li>
                    </ul>
                </dd>
                <dt style="padding-top: 60px;"  >
                    <a input type="submit" name="submit" class="btn round_r cd-popup-trigger" value="" target="#TeacherHead">
                        <div class="pic_140 round_img img_shadow">
                        <%
                        if( teacher.getGender()==0 && "".equals(teacher.getPersonImg()) ){
                         %>
                         <img src="<%=basePath %>static/img/w.png" alt="" width="140" height="140">
                         <%}else if( teacher.getGender()==1 && "".equals(teacher.getPersonImg()) ){ %>
                         <img src="<%=basePath %>static/img/male1.png" alt="" width="140" height="140">
                        <%}else{ %>
                          <img src="<%=basePath %>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>" alt="" width="140" height="140">  
                        <%} %>
                        </div>
                        <h4>
                        <%
                        if(teacher.getTeacherName()!=null&&teacher.getTeacherName().length()>1){
                         %>
                        	<%=teacher.getTeacherName().subSequence(0,1) %>教员
                        <%} %>
                        </h4>
                    </a>
                    <div class="t">
                        ID：<%=teacher.getTeacherId() %>
                        <span class="ml_20">
                                <img src="<%=basePath %>static/img/ok_arrow_s.png" alt="ok" width="20" height="20">
								简历有效                        
						</span>
                    </div>
                    <div class="t">
                    </div>
                    <div class="t" >
						认证情况：
						<%
						if(teacher.getIsCheck()==0){
						 %>
						本站尚未审核您的真实证件 
						<img src="<%=basePath %>static/img/v.png" alt="+v认证" width="20" height="20" class="v_img">
					  <%}else if(teacher.getIsCheck()==1){ %>
					  	已核实认证
					  	<img src="<%=basePath %>static/img/v_l.png" alt="+v认证" width="20" height="20" class="v_img">
					  <%} %>
						
                    </div>
                    <div class="t">
                       	 最近登录时间:<%=teacher.getLastLoginTime() %>
                    </div>
                </dt>
            </dl>
        </div>
    </div>
    <!--end一行-->
    <!-- end nav -->
    <div class="w_1200 d_center white_bj">
		<div class="fl w_300 box_line">
		    <dl class="tearch_l_nav">
		        <dt><span>快捷操作</span></dt>
		        <dd>
		            <div class="t clearfix">
		                <h5>简历更新</h5>
		                <ul class="list_2">
		                	<li><a href="#">我的信息</a></li>
		                    <li><a href="<%=basePath %>teacher/updateInfoPage.action">修改信息</a></li>
		                    <li><a href="<%=basePath %>teacher/updatePwdPage.action">修改密码</a></li>
		                    <li><a href="<%=basePath %>teacher/idimgPage.action">身份认证</a></li>
		                </ul>
		            </div>
		
		            <div class="t clearfix">
		                <h5>家教情况</h5>
		                <ul class="list_2">
		                    <li><a href="<%=basePath %>teacher/appointTeacherList.action">预约我的家教</a></li>                
		                    <li><a href="<%=basePath %>teacher/takeOrdersList.action">我预约的家教</a></li>                
		                    <li><a href="#">学员评价</a></li>
		                </ul>
		            </div>
		
		            
		        </dd>
		    </dl>
		</div>
		<!--end一行的左-->