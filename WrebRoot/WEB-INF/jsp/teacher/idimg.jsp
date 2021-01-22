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
<style type="text/css">
#preview2 {
	width: 360px;
	height: 270px;
	border: 1px solid #E0E0E0;
	overflow: hidden;
}

#imghead {
	filter: progid: DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
.demo-table {
        border-collapse: collapse;
        width: 100%;
    }
    .demo-table caption {
        border-bottom: 1px dashed #ccc;
        height: 40px;
        margin-bottom: 20px;
        font: 18px/1.2 normal 'microsoft yahei';
    }
    .demo-table tr td {
        padding: 8px 10px;
        font: 16px/1.8 normal 'microsoft yahei';
        vertical-align: top;
    }
    .ui-input {
        vertical-align: top;
        height: 18px;
        font-size: 16px;
        line-height: 20px;
        border: 1px solid #aaa;
        padding: 6px 8px;
        border-radius: 3px;
    }
</style>
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

<jsp:include page="header.jsp"></jsp:include>  

			<!--end一行的左-->
			<div class="r_cell box_r">
				<h4 class="r_th_y">
       				 <b>证件上传</b>
       				 <span class="font_14 m_t_b"></span>
    			</h4>

				<div class="hide_box">
					<ul class="book_up_ul list_2 img_border round_s_img">
						<li >
							<form name="Form2" action="personIDUpload.action" method="post" enctype="multipart/form-data">
								<div class="box" style="float: left;">
	
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
							</form>	
						</li>
					</ul>
				</div>
				<!--end列表-->

				<div class="clearfix tips_box gray_bj">
					<span class="fl png_img"><img src="../static/img/tip.png" alt="提示" width="60" height="60"></span>
					<ul class="tips_ol num_ol r_cell orange_link link_line">
						<li>大小不超过5M，支持格式有JPG,GIF,PNG等。</li>
						<li>请务必上传真实证件</li>
					</ul>
				</div>
				<!--end提示-->

			</div>
			<!--end一行的右-->
			
		</div>
		<!--end一行-->


<jsp:include page="footer.jsp"></jsp:include>   