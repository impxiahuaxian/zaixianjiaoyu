<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.utils.CommonUtil"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="../static/back/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../static/back/css/style.css" />
		<link href="../static/back/assets/css/codemirror.css" rel="stylesheet">
		<link rel="stylesheet" href="../static/back/assets/css/ace.min.css" />
		<link rel="stylesheet" href="../static/back/font/css/font-awesome.min.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="../static/back/js/jquery-1.9.1.min.js"></script>
		<script src="../static/back/assets/js/bootstrap.min.js"></script>
		<script src="../static/back/assets/js/typeahead-bs2.min.js"></script>
		<script src="../static/back/assets/layer/layer.js" type="text/javascript"></script>
		<script src="../static/back/assets/laydate/laydate.js" type="text/javascript"></script>
		
		 	<link href="<%=basePath %>static/css/WdatePicker.css" rel="stylesheet" type="text/css">
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
		<title>教员信息</title>
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
            url:"../teacher/personPhotoUpload.action",
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

<script type="text/javascript">
			//图片上传预览    IE是用了滤镜。
			function previewImage2(file) {
				var MAXWIDTH = 360;
				var MAXHEIGHT = 270;
				var div = document.getElementById('preview2');
				if(file.files && file.files[0]) {
					div.innerHTML = '<img id=imghead2>';
					var img = document.getElementById('imghead2');
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
					div.innerHTML = '<img id=imghead2>';
					var img = document.getElementById('imghead2');
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
	</head>

	<body>
	
	<%
	Teacher teacher = (Teacher)request.getAttribute("teacher");
	if(teacher!=null){
	%>
		<div class="margin clearfix">
			<div class="detailed_style clearfix">
				
				
					 <a input style="z-index: 999;float: left;margin-right: 10px;position: absolute;background-color: rgb(255, 255, 255)!important;border-color: rgb(255, 255, 255);"  type="submit" name="submit" class="btn round_r cd-popup-trigger" value="" target="#TeacherHead">
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
                    </a>
				
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
				
				
				<ul class="shop_content clearfix">
					<li class="shop_name">
						<label class="label_name">
							教员姓名：
						</label>
						<span class="info"><%=teacher.getTeacherName() %></span>
						<div class="Authenticate">
							<i class="icon-yxrz"></i><i class="icon-yhk"></i><i
								class="icon-sjrz"></i><i class="icon-grxx"></i>
						</div>
					</li>
					<li>
						<label class="label_name">
							性&nbsp;&nbsp;&nbsp;&nbsp;别：
						</label>
						<span class="info">
						<%
							if (teacher.getGender() == 1) {
						%>
						男
						<%
							} else {
						%>
						女
						<%
							}
						%></span>
					</li>
					<li>
						<label class="label_name">
							手机号：
						</label>
						<span class="info"><%=teacher.getPhone() %></span>
					</li>
					<li>
						<label class="label_name">
							微信号：
						</label>
						<span class="info"><%=teacher.getWxNumber() %></span>
					</li>
					<li>
						<label class="label_name">
							审核状态：
						</label>
						<span class="info">
						<%
							if (teacher.getIsCheck() == 1) {
						%>
						已通过
						<%
							} else {
						%>
						待审核
						<%
							}
						%>
						</span>
					</li>
					<li>
						<label class="label_name">
							账号状态：
						</label>
						<span class="info">
						<%
							if (teacher.getIsUse() == 1) {
						%>
						启用
						<%
							} else {
						%>
						停用
						<%
							}
						%></span>
					</li>
					<li>
						<label class="label_name">
							省&nbsp;&nbsp;&nbsp;&nbsp;份：
						</label>
						<span class="info"><%=teacher.getProvince() %></span>
					</li>
					<li>
						<label class="label_name">
							区&nbsp;&nbsp;&nbsp;&nbsp;域：
						</label>
						<span class="info"><%=teacher.getArea() %></span>
					</li>
					<li>
						<label class="label_name">
							出生日期：
						</label>
						<span class="info"><%=teacher.getBirthday() %></span>
					</li>
					<li>
						<label class="label_name">
							最高学历：
						</label>
						<span class="info"><%=teacher.getEducationName() %></span>
					</li>
					<li>
						<label class="label_name">
							身&nbsp;&nbsp;&nbsp;&nbsp;份：
						</label>
						<span class="info"><%=teacher.getIdentityName() %></span>
					</li>
					<li>
						<label class="label_name">
							住&nbsp;&nbsp;&nbsp;&nbsp;址：
						</label>
						<span class="info"><%=teacher.getAddress() %></span>
					</li>
					<li>
						<label class="label_name">
							院&nbsp;&nbsp;&nbsp;&nbsp;校：
						</label>
						<span class="info"><%=teacher.getSchool() %></span>
					</li>
					<li>
						<label class="label_name">
							专&nbsp;&nbsp;&nbsp;&nbsp;业：
						</label>
						<span class="info"><%=teacher.getProfessional()%></span>
					</li>
					<li>
						<label class="label_name">
							注册日期：
						</label>
						<span class="info"><%=teacher.getRegistTime()%></span>
					</li>
					<li>
						<label class="label_name">
							最近登录：
						</label>
						<span class="info"><%=teacher.getLastLoginTime()%></span>
					</li>
				</ul>
			</div>
			<div class="Store_Introduction">
				<div class="title_name">
					授课信息
				</div>
				<div class="info" style="width: 1000px">
					<ul >
					<li style="float: left;width: 330px;" >
						<label class="label_name">
							课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;酬：
						</label>
						<span class="info">￥<%=teacher.getCoursePrice() %>元/小时</span>
					</li >
					<li style="float: left;width: 330px;">
						<label class="label_name">
							教&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：
						</label>
						<span class="info">
						<%=teacher.getTeachingAge()%>年
						</span>
					</li>
					<li style="float: left;width: 330px;">
						<label class="label_name">
							授课区域：
						</label>
						<span class="info">
						<%
		                    String[] teachingAreas = teacher.getTeachingArea().split(",");
		                    if(ArrayHelper.inArray(teachingAreas,"1")){
		                    %>
		                    	城厢区
		                    <%} %>
		                    <%if(ArrayHelper.inArray(teachingAreas,"2")){ %> 
		                    	荔城区
		                    <%} %>
		                    <%if(ArrayHelper.inArray(teachingAreas,"3")){ %> 
		                    	秀屿区
        					<%} %>
        					<%if(ArrayHelper.inArray(teachingAreas,"4")){ %> 
        						涵江区
			        		<%} %>
			        		<%if(ArrayHelper.inArray(teachingAreas,"5")){ %> 
			        			仙游县
        					<%} %>
						</span>
					</li>
					<li style="float:left;width: 330px;">
						<label >
							授课方式：
						</label>
						<span class="info"><%
							String[] teachingWays = teacher.getTeachingWay().split(",");
							if(teachingWays.length>=2){
							 %>
							 一对一家教上门、一对一学生上门
							 <%}else{
							 		if("20".equalsIgnoreCase(teachingWays[0])){ 
							 %>
							 一对一家教上门
							 	<%
							 		} else{
							 	%>
							 	一对一学生上门
							 	<%
							 		}
							 	 %>
							 		
							 <%} %></span>
					</li>
					<li style="">
						<label >
							授课科目：
						</label>
						<span class="info">
						<%//所有课程信息
		                     if(!teacher.getTeachingCource().equals("")){
								 String[] coursesId2 = teacher.getTeachingCource().split(",");
								 
								 List<Course> courseList3 = (List<Course>)request.getAttribute("courseList"); 
								 if(courseList3!=null){
								 	for(int i=0;i<coursesId2.length;i++){
									 	String strCourse =  coursesId2[i];
									 	for(int j=0;j<courseList3.size();j++){
									 		Course course = courseList3.get(j);
									 		if(course.getCourseId()==Integer.parseInt(strCourse)){
								%>
											<%=course.getCourseName() %>
											
											<%} %>
										<%} %>
									<%} %>
								<%} %>
		                    <%} %>
						</span>
					</li>
					<li style="float: left;width: 330px;">
						<label >
							教员类型：
						</label>
						<span class="info">
						<%
						if(teacher.getTeacherType()==19){
						%>
						在校大学生/毕业生
						<%}else{ %>
						老师（在职/进修/离职/退休）
						<%}%>
						</span>
					</li>
					<li>
						<label class="label_name">
							授课时间：
						</label>
						<span class="info"> 
						<%
		          		String[] teacherDays = teacher.getTeachingTime().split(",");
		          		for(int j=0;j<teacherDays.length;j++){
		          			String teacherDay = teacherDays[j];
		          		 %>
		          		<%=CommonUtil.getTeacherTime(teacherDay)%>
		          		<%} %>
		          		</span>
					</li>
					
					<li style="margin-top: 20px;">
						<label class="label_name">
							自我评价：
						</label>
						<span class="info"> 
						<%=teacher.getSelfEvaluation() %>
		          		</span>
					</li>
					<li style="margin-top: 20px;">
						<label class="label_name">
							教学案例：
						</label>
						<span class="info"> 
						<%=teacher.getTeachingCase()%>
		          		</span>
					</li>
					
				</ul>
				</div>
			</div>
			<form name="Form2" action="personIDUpload.action" method="post" enctype="multipart/form-data">
				<div class="Store_Introduction">
					<div class="title_name">
						其他认证
					</div>
					<div class="info">
	
							<h5>身份证</h5>
							<h6 style="color: red;">
							<%if(request.getAttribute("message")!=null){%>
								<%=request.getAttribute("message") %>
							<%}%>
							</h6>
							<div id="preview2" >
								<%
		                        if(  "".equals(teacher.getIdPhoto()) ){
		                         %>
		                        <img id="imghead2" width="360" height="270" border="0" src="../static/img/photo.png">
		                         <%}else{ %>
		                         <img id="imghead2" width="360" height="270" border="0" src="../static/teacherimg/idimg/<%=teacher.getIdPhoto() %>">
		                        <%} %>
							</div>
							<div class="file-box file-box_book" style="text-align: center;">
								
								<label for="file" ><img src="../static/img/upload.png" style="border:0px"></label>
								<input type="file"  id="file" name="file" style="display: none" onchange="previewImage2(this)">
								
								<label for="btnSave" ><img src="../static/img/save.png" style="border:0px" ></label>
								<input type="submit" id="btnSave" value="upload" style="display: none" />
							</div>
					</div>
				</div>
			</form>
			<div class="At_button">
				<button onclick="through_save('this',<%=teacher.getTeacherId() %>);"
					class="btn btn-primary radius" type="submit">
					通 过
				</button>
				<button onclick="pwdReset('this',<%=teacher.getTeacherId() %>);" class="btn btn-danger  btn-warning"
					type="button">
					密码重置
				</button>
				<button onclick="return_close();" class="btn btn-default radius"
					type="button">
					返回上一步
				</button>
			</div>
		</div>
		<%} %>
	</body>
</html>
<script>
//通过
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
 function through_save(obj,id){
	 layer.confirm('确认审核通过吗？',function(index){
	 
	 	var d = {
            IsAsync: true,
            id: id
        };
      
        $.post('auditTeacher.action', d, function (res) {
        	
            if (res.success) {
            	
            	layer.msg('已通过!',{icon:1,time:1000});
				location.href="teacherList.action";
				parent.$('#parentIframe').css("display","none");
				parent.$('.Current_page').css({"color":"#333333"});
            	
            } else {
            	alert(res.message);
            	
            }
        });
	 	
	 
	 
	 
		
	});
	 
	 
	 }
	 
	 //返回操作
function pwdReset(obj,id){
	 layer.confirm('确定要重置密码吗？',function(index){
	 
	 	var d = {
            IsAsync: true,
            id: id
        };
      
        $.post('pwdReset.action', d, function (res) {
        	
            if (res.success) {
            	
            	layer.msg('已重置!',{icon:1,time:1000});
				location.href="teacherList.action";
				parent.$('#parentIframe').css("display","none");
				parent.$('.Current_page').css({"color":"#333333"});
            	
            } else {
            	alert(res.message);
            	
            }
        });
	 	
	 
	 
	 
		
	});
	
}

		/*字数限制*/
function checkLength(which) {
	var maxChars = 500; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //减去当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
</script>
