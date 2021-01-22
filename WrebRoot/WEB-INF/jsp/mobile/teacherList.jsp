<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Course"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-transform">
	<meta http-equiv="Cache-Control" content="no-siteapp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
	<title>
		【吉师家教网】四平家教网_免费找家教_四平家教一对一在线辅导
	</title>
	
	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	
	<meta name="keywords" content="四平家教中心,四平家教机构">
	<meta name="description" content="吉师家教-始终在您身边的四平家教中心。全市各区教员上门一对一辅导，名校生、专业老师、才艺教员一应俱全。">
	<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet">
	<script src="<%=basePath %>static/mobile/js/jquery-1.8.3.min.js">
	</script>
	<script src="<%=basePath %>static/mobile/js/jquery.cookie.js">
	</script>
	<script src="<%=basePath %>static/mobile/js/layer.js">
	</script>
	<link rel="stylesheet" href="<%=basePath %>static/mobile/css/layer.css" id="layuicss-skinlayercss">
	<script type="text/javascript" src="<%=basePath %>static/mobile/js/jweixin-1.3.2.js">
	</script>
	<script src="<%=basePath %>static/mobile/js/zepto.min.js"></script>
	<script>
		function setTab(name, cursel, n,m) {
			for (i = 1; i <= n; i++) {
				if(i!=5){
					var menu = document.getElementById(name + i);
					var con = document.getElementById("con_" + name + "_" + i);

					
					menu.className = i == cursel ? "hover": "";
					con.style.display = i == cursel ? "block": "none";
				}
				
			}
			$("#kmdl").val(m);
		}
		$(document).ready(function() {
			$("#jj_km").click(function() {
				$("#jj_nr").slideToggle(200);
				$(".filter-box").not(".jj_nr").hide();
			});
			$("#sk_qy").click(function() {
				$("#sk_nr").slideToggle(200);
				$(".filter-box").not(".sk_nr").hide();
			});
			$("#jy_sf").click(function() {
				$("#dx_nr").slideToggle(200);
				$(".filter-box").not(".dx_nr").hide();
			});
			$("#jy_sx").click(function() {
				$("#sx_nr").slideToggle(200);
				$(".filter-box").not(".sx_nr").hide();
			});

		});
		function imageLoadError(image, gender) {
			if (gender == 1) {
				image.src = '/Public/style/_css/001.png';
			} else {
				image.src = '/Public/style/_css/002.png';
			}
		}
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
    	<header>
			<h3>
				<a href="javascript:history.back(-1)" class="fh">
					返回
				</a>
				教员列表
	            <a style="float: right;color: white;" href="<%=basePath %>mobile.action" title="首页">
	          	 首页
	            </a>
			</h3>

		</header>
		<section style="padding:0;">
			<div class="fl_top">
				<ul>
					<li id="jj_km">
						<span>
							科目
						</span>
					</li>
					<li id="sk_qy">
						<span>
							区域
						</span>
					</li>
					<li id="jy_sf">
						<span>
							身份
						</span>
					</li>
					<li id="jy_sx">
						<span>
							性别
						</span>
					</li>
				</ul>
			
				<div id="jj_nr" class="filter-box jj_nr" style="display:none;">
					<div id="lib_Tab1_sx">
						<div class="lib_Menubox_sx">
							<ul class="clearfix" id="kmdlUl">
							<%
							List<DictInfo> kemudaleiList = (List<DictInfo>)request.getAttribute("kemudaleiList");
							if(kemudaleiList!=null){
								for(int i = 0 ; i < kemudaleiList.size();i++){
									DictInfo dictInfo = kemudaleiList.get(i);
									if(i!=kemudaleiList.size()-1){
										if(i==1){
							%>
								<li id="one<%=dictInfo.getDictId() %>" class="hover"   onclick="setTab(&#39;one&#39;,<%=dictInfo.getDictId() %>,7,<%=dictInfo.getDictId() %>)">
										<%=dictInfo.getContent() %>
								</li>
							<%			}else{
							%>
								<li id="one<%=dictInfo.getDictId() %>" onclick="setTab(&#39;one&#39;,<%=dictInfo.getDictId() %>,7,<%=dictInfo.getDictId() %>)">
										<%=dictInfo.getContent() %>
								</li>
							
							<%			}
							%>
								<%}else{ %>
								<li id="one<%=dictInfo.getDictId() %>" onclick="setTab(&#39;one&#39;,<%=dictInfo.getDictId() %>,7,<%=dictInfo.getDictId() %>)" style="border-bottom: none;">
									其他
								</li>
								<%} %>
							<%
								}
							}
							%>
								
							</ul>
						</div>
						<div class="lib_Contentbox_sx">
						<%
							//课程列表
							List<Course> courseList = (List<Course>) request.getAttribute("courseList");
							int kmdl = (Integer)request.getAttribute("kmdl");
							if (kemudaleiList != null) {
								for (int i = 0; i < kemudaleiList.size(); i++) {
									DictInfo dictInfo = kemudaleiList.get(i);//1 幼儿 0
									if(dictInfo.getDictId()==kmdl){ 
						%>
									<div id="con_one_<%=dictInfo.getDictId() %>" style="display: block;" class="clearfix">
						<%
									}else{
						%>
									<div id="con_one_<%=dictInfo.getDictId() %>" style="display:none" class="clearfix">
						<%			}
									if (courseList != null) {
										int k=0;
										for (int j = 0; j < courseList.size(); j++) {
											Course course = courseList.get(j);
											if (dictInfo.getDictId() == course.getKeMuDaLei()) {
						%>
											<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=course.getCourseId() %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=dictInfo.getDictId() %>&location=<%=k %>">
												<%=course.getCourseName() %>
											</a>
						
						<%						k++;
											}
									
										}
									}
						%>
									</div>
						<%
								}
							}
						%>
						
									</div>
						</div>
					</div>
					<div id="sk_nr" class="filter-box sk_nr" style="display:none">
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=0&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							不限
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=1&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							城厢
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=2&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							荔城
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=3&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							秀屿
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=4&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							涵江
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=5&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							仙游
						</a>
					</div>
					<div id="dx_nr" class="filter-box dx_nr" style="display:none">
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=0&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							不限
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=18&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							大学生/毕业生
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=19&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							专职老师
						</a>
					</div>
					<div id="sx_nr" class="filter-box sx_nr" style="display:none">
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=2&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							不限
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=1&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							男教员
						</a>
						<a href="<%=basePath %>teacher/mTeacherList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=0&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							女教员
						</a>
					</div>
				</div>
			</div>
			<div class="index_list">
				<input type="hidden" name="pageNo" id="pageNo" value="1" />
				<input type="hidden" name="courseId" id="courseId" value="<%=request.getAttribute("courseId") %>" />
				<input type="hidden" name="areaId" id="areaId" value="<%=request.getAttribute("areaId") %>" />
				<input type="hidden" name="teacherType" id="teacherType" value="<%=request.getAttribute("teacherType") %>" />
				<input type="hidden" name="gender" id="gender" value="<%=request.getAttribute("gender") %>" />
				<input type="hidden" name="kmdl" id="kmdl" value="<%=request.getAttribute("kmdl") %>" />
				<input type="hidden" name="location" id="location" value="<%=request.getAttribute("location") %>" />
				
				<div id="zhuijia">
				
				</div>
				<p id="no-more" style="text-align: center;padding-top: 10px;color: #aaa;display: none;">
					没有更多了...
				</p>
				<p>
				</p>
			</div>
			<p style="clear:both; height:3rem;">
			</p>
		</section>
	
		<nav>
			<ul>
				<li class="cs">
					<a href="<%=basePath %>mFastAppointTeacher.action" >
						<span>
							快速请家教
						</span>
					</a>
				</li>
				<li class="ls">
					<a href="tel:150-6033-8989">
						<span>
							拨打客服电话
						</span>
					</a>
				</li>
			</ul>
		</nav>
<script>
$(function(){
	$("#kmdlUl li").removeClass("hover");
	if(<%=request.getAttribute("kmdl")%>==1 ){
		$("#kmdlUl li").eq(0).addClass("hover");
	}else if(<%=request.getAttribute("kmdl")%>==2 ){
		$("#kmdlUl li").eq(1).addClass("hover");
	}else if(<%=request.getAttribute("kmdl")%>==3 ){
		$("#kmdlUl li").eq(2).addClass("hover");
	}else if(<%=request.getAttribute("kmdl")%>==4 ){
		$("#kmdlUl li").eq(3).addClass("hover");
	}else if(<%=request.getAttribute("kmdl")%>==6 ){
		$("#kmdlUl li").eq(4).addClass("hover");
	}else if(<%=request.getAttribute("kmdl")%>==7 ){
		$("#kmdlUl li").eq(5).addClass("hover");
	}
	
	
	$("#con_one_1 a").removeClass("hover");
	$("#con_one_2 a").removeClass("hover");
	$("#con_one_3 a").removeClass("hover");
	$("#con_one_4 a").removeClass("hover");
	$("#con_one_6 a").removeClass("hover");
	$("#con_one_7 a").removeClass("hover");
	$("#con_one_<%=request.getAttribute("kmdl") %> a").eq(<%=request.getAttribute("location")%>).addClass("hover");	
	
	
	
	
	$("#sk_nr a").removeClass("hover");
	$("#sk_nr a").eq(<%=request.getAttribute("areaId")%>).addClass("hover");
	
	$("#dx_nr a").removeClass("hover");
	if(<%=request.getAttribute("teacherType")%>==0 ){
		$("#dx_nr a").eq(0).addClass("hover");
	}else if(<%=request.getAttribute("teacherType")%>==18){
		$("#dx_nr a").eq(1).addClass("hover");
	}else if(<%=request.getAttribute("teacherType")%>==19){
		$("#dx_nr a").eq(2).addClass("hover");
	}
	
	$("#sx_nr a").removeClass("hover");
	if(<%=request.getAttribute("gender")%>==1 ){
		$("#sx_nr a").eq(<%=request.getAttribute("gender")%>).addClass("hover");
	}else if(<%=request.getAttribute("gender")%>==0){
		$("#sx_nr a").eq(2).addClass("hover");
	}else if(<%=request.getAttribute("gender")%>==2){
		$("#sx_nr a").eq(0).addClass("hover");
	}
	
    query('1');//第一次加载

});

function query(type)

{

    $.ajax({
        url : "<%=basePath%>teacher/mTeacherListQuery.action",

        data : {

            pageNo : $("#pageNo").val(),
            courseId : $("#courseId").val(),
            areaId : $("#areaId").val(),
            teacherType : $("#teacherType").val(),
            gender : $("#gender").val(),
            kmdl : $("#kmdl").val()
        },

        cache : false,

        success : function(data) {

            loading=true;

            if(data==null){
                $("#pageNo").val(parseInt($("#pageNo").val())-1);   
            }else{       
                var content="";
                
                if(type=="00"){

                    if(data.length==0){

                         $("#pageNo").val(parseInt($("#pageNo").val())-1);  

                         return "";

                    }

                    for(var i=0;i<data.length;i++){
                    
                    	var teacherTypeName = "";
                
                    	if(data[i].teacherType==18){
                    		teacherTypeName="老师（在职/进修/离职/退休）";
                    	}else{
                    		teacherTypeName="在校大学生/毕业生";
                    	}
                    
                          content=content
                           +'<div class="item">'
							+'<div class="left">'
							+'	<a href="<%=basePath%>teacher/mTeacherInfo.action?tId='+data[i].teacherId+'&isTeacherCenter=0">';
							
							if(data[i].gender==1 && data[i].personImg==''){
								content=content
									+'		<img src="../static/img/male.png" >';
							}else if(data[i].gender==2 && data[i].personImg==''){
								content=content
									+'		<img src="../static/img/w.png" >';
							}else{
								content=content
									+'		<img src="../static/teacherimg/personphoto/'+data[i].personImg+'" >';
							}
							
							content=content
							+'	</a>'
							+'</div>'
							+'<div class="right">'
							+'	<a href="<%=basePath%>teacher/mTeacherInfo.action?tId='+data[i].teacherId+'&isTeacherCenter=0">'
							+'		<p style="font-size:15px;color:#333333;" class="title1">'
							+data[i].teacherName
							+'			<span class="sex">'
							+data[i].teacherId
							+'			</span>'
							+'			&nbsp;&nbsp;'
							+'			<span class="indent">'
							+data[i].identityName
							+'			</span>'
							+'			<span class="date">'
							+data[i].teachingAge
							+'			年教龄</span>'
							+'		</p>'
							+'		<p style="margin-top:8px;font-size:14px;color:#333333;">'
							+data[i].school
							+'		</p>'
							+'		<p style="width: 50%;float: left;color: #666666;font-size:12px;margin-top:8px;">'
							+'			<span class="tag tag-full-7">'
							+'				身'
							+'			</span>'
							+teacherTypeName
							+'		</p>'
							+'		<p style="width: 50%;float: left;width: 50%;color: #666666;font-size:12px;margin-top:8px;">'
							+'			<span class="tag tag-full-5">'
							+'			证'
							+'			</span>'
							+'			已认证'
							+'		</p>'
							+'		<p style="clear:both;">'
							+'		</p>'
							+'		<p style="font-size:13px;color:#666666;margin-bottom:6px;">'
							+data[i].selfEvaluation
							+'		</p>'
							+'	</a>'
						+'	</div>'
				        +'</div>';

                    }

                    $("#zhuijia").append(content);

                }else{

                    for(var i=0;i<data.length;i++)

                    {
                    	var teacherTypeName = "";
                
                    	if(data[i].teacherType==18){
                    		teacherTypeName="老师（在职/进修/离职/退休）";
                    	}else{
                    		teacherTypeName="在校大学生/毕业生";
                    	}
                    
                  
                          content=content
                           +'<div class="item">'
							+'<div class="left">'
							+'	<a href="<%=basePath%>teacher/mTeacherInfo.action?tId='+data[i].teacherId+'&isTeacherCenter=0">';
							
							if(data[i].gender==1 && data[i].personImg==''){
								content=content
									+'		<img src="../static/img/male.png" >';
							}else if(data[i].gender==0 && data[i].personImg==''){
								content=content
									+'		<img src="../static/img/w.png" >';
							}else{
								content=content
									+'		<img src="../static/teacherimg/personphoto/'+data[i].personImg+'" >';
							}
							
							content=content
							+'	</a>'
							+'</div>'
							+'<div class="right">'
							+'	<a href="<%=basePath%>teacher/mTeacherInfo.action?tId='+data[i].teacherId+'&isTeacherCenter=0">'
							+'		<p style="font-size:15px;color:#333333;" class="title1">'
							+data[i].teacherName
							+'			<span class="sex">'
							+data[i].teacherId
							+'			</span>'
							+'			&nbsp;&nbsp;'
							+'			<span class="indent">'
							+data[i].identityName
							+'			</span>'
							+'			<span class="date">'
							+data[i].teachingAge
							+'			年教龄</span>'
							+'		</p>'
							+'		<p style="margin-top:8px;font-size:14px;color:#333333;">'
							+data[i].school
							+'		</p>'
							+'		<p style="width: 50%;float: left;color: #666666;font-size:12px;margin-top:8px;">'
							+'			<span class="tag tag-full-7">'
							+'				身'
							+'			</span>'
							+teacherTypeName
							+'		</p>'
							+'		<p style="width: 50%;float: left;width: 50%;color: #666666;font-size:12px;margin-top:8px;">'
							+'			<span class="tag tag-full-5">'
							+'			证'
							+'			</span>'
							+'			已认证'
							+'		</p>'
							+'		<p style="clear:both;">'
							+'		</p>'
							+'		<p style="font-size:13px;color:#666666;margin-bottom:6px;">'
							+data[i].selfEvaluation
							+'		</p>'
							+'	</a>'
						+'	</div>'
				        +'</div>';

                    }

                    $("#zhuijia").html(content);

                }

            }

        },

        error : function(){

            loading=true;

            $("#pageNo").val(parseInt($("#pageNo").val())-1);   

            _alert("查询数据出错啦，请刷新再试");

        }

    });

}

 var loading=false;

 Zepto(function($){

     $(window).scroll(function(){

     if(($(window).scrollTop()+$(window).height()>$(document).height()-10)&&loading){

            loading=false;

            $("#pageNo").val(parseInt($("#pageNo").val())+1);

            query("00");

           }

        });

     })

      

     var ua = navigator.userAgent.toLowerCase();    

     if (/android/.test(ua)) {

        $('.date>div>img:last').css({"margin-left":"-25px"});

     }

</script>
	</body>

</html>