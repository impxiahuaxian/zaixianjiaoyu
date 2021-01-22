<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Member"%>
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
	<title>【吉师家教网】四平家教网_免费找家教_四平家教一对一在线辅导</title>
	
	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	
	<meta name="keywords" content="四平家教兼职，四平兼职网">
	<meta name="description" content="找靠谱的四平兼职网，就在家教114。真实的四平家教兼职每天更新，主动申请，机会多多。">
	<link href="<%=basePath %>static/mobile/css/css114.css" rel="stylesheet">
	<script src="<%=basePath %>static/mobile/js/jquery-1.9.1.min.js">
	</script>
	<script src="<%=basePath %>static/mobile/js/jquery.cookie.js">
	</script>
	<script src="<%=basePath %>static/mobile/js/layer.js">
	</script>
	<link rel="stylesheet" href="<%=basePath %>static/mobile/css/layer.css" id="layuicss-skinlayercss">
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
		
	</script>
	<script type="text/javascript">
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
			<h3 style="margin-top: ">
				<a href="javascript:history.back(-1)" class="fh">
					返回
				</a>
				家教订单
				<%
				Teacher teacher =  (Teacher)session.getAttribute("teacher");
				Member member =  (Member)session.getAttribute("member");
				if(teacher == null && member == null){
				%>
				<a href="<%=basePath %>mobile.action" class="tc" id="current-city">
					首页
				</a>
				<%
				} else if(teacher !=null){
				%>
				<a href="<%=basePath %>teacher/mTeacherCenterPage.action" class="tc" id="current-city">
					教员中心
				</a>
				<%
				}else if(member!=null){
				%>
				<a href="#" class="tc" id="current-city">
					个人中心
				</a>
				<%
				}
				%>
				
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
											<a href="<%=basePath %>order/mOrderList.action?courseId=<%=course.getCourseId() %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=dictInfo.getDictId() %>&location=<%=k %>">
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
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=0&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							不限
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=1&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							城厢
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=2&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							荔城
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=3&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							秀屿
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=4&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							涵江
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=5&teacherType=<%=request.getAttribute("teacherType") %>&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							仙游
						</a>
					</div>
					<div id="dx_nr" class="filter-box dx_nr" style="display:none">
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=0&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							不限
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=18&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							大学生/毕业生
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=19&gender=<%=request.getAttribute("gender") %>&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							专职老师
						</a>
					</div>
					<div id="sx_nr" class="filter-box sx_nr" style="display:none">
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=2&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							不限
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=1&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							男教员
						</a>
						<a href="<%=basePath %>order/mOrderList.action?courseId=<%=request.getAttribute("courseId") %>&areaId=<%=request.getAttribute("areaId") %>&teacherType=<%=request.getAttribute("teacherType") %>&gender=0&kmdl=<%=request.getAttribute("kmdl") %>&location=<%=request.getAttribute("location") %>">
							女教员
						</a>
					</div>
				</div>
			</div>
			
			<input type="hidden" name="pageNo" id="pageNo" value="1" />
			<input type="hidden" name="courseId" id="courseId" value="<%=request.getAttribute("courseId") %>" />
			<input type="hidden" name="areaId" id="areaId" value="<%=request.getAttribute("areaId") %>" />
			<input type="hidden" name="teacherType" id="teacherType" value="<%=request.getAttribute("teacherType") %>" />
			<input type="hidden" name="gender" id="gender" value="<%=request.getAttribute("gender") %>" />
			<input type="hidden" name="kmdl" id="kmdl" value="<%=request.getAttribute("kmdl") %>" />
			<input type="hidden" name="location" id="location" value="<%=request.getAttribute("location") %>" />
			
			<div class="xy_list" style="padding-bottom: 0;">
				<ul id="zhuijia" >
					
				</ul>
			</div>
			<p id="no-more" style="text-align: center; padding-top: 10px; color: rgb(170, 170, 170);">没有更多了...</p>
			<p class="fwdn" style="padding-top: 20px;">
				<a href="<%=basePath %>mobile.action">
					© 2019 吉师家教 版权所有
				</a>
			</p>
		</section>
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
        url : "<%=basePath%>order/mOrderListQuery.action",

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
                    	var cgender="";
                    	var sgender="";
                    	if(data[i].contactGender==1){
                    		cgender="先生";
                    	}else{
                    		cgender="女士";
                    	}
                    	
                    	if(data[i].studentGender){
                    		sgender="男";
                    	}else{
                    		sgender="女";
                    	}
                    	
                    	var title = data[i].area+data[i].contactName.substring(0, 1)+cgender+'请'+data[i].courseName+'家教';
                    	
                          content=content
                            +'<a href="mOrderInfo.action?oId='+data[i].oId+'">'
							+'	<li>'
							+'		<div class="left">'
							+'			<h3>'
							+'				<span>'
							+					title
							+'				</span>'
							+'			</h3>'
							+'			<p>'
							+				data[i].profile
							+'			</p>'
							+'			<p class="dz_tb">'
							+				data[i].address
							+'			</p>'
							+'		</div>'
							+'		<div class="right">'
							+'			<p style="padding-top: 10px;">'
							+				data[i].orderCode
							+'			</p>'
							+'			<p class="stu-gender">'
							+'				学员：'+sgender
							+'			</p>'
							+'			<p class="cs">'
							+				data[i].coursePrice+'元/时'
							+'			</p>'
							+'			<p >';
							
							if(data[i].orderStatus==22){
								content=content+'<span style="border:1px solid #3ac779;color:#3ac779;border-radius:0.3rem">发布中</span>';
							}else if(data[i].orderStatus==23){
								content=content+'教员申请中';	
							}else if(data[i].orderStatus==24){
								content=content+'授课中';	
							}else if(data[i].orderStatus==25){
								content=content+'<span style="border:1px solid red;color:red;border-radius:0.3rem">已完成</span>';	
							}
							content=content
							+'			</p>'
							+'		</div>'
							+'	</li>'
						+'	</a>'
                    }

                    $("#zhuijia").append(content);

                }else{

                    for(var i=0;i<data.length;i++){
                    	var cgender="";
                    	var sgender="";
                    	if(data[i].contactGender==1){
                    		cgender="先生";
                    	}else{
                    		cgender="女士";
                    	}
                    	
                    	if(data[i].studentGender){
                    		sgender="男";
                    	}else{
                    		sgender="女";
                    	}
                    	
                    	var title = data[i].area+data[i].contactName.substring(0, 1)+cgender+'请'+data[i].courseName+'家教';
                    	
                          content=content
                            +'<a href="mOrderInfo.action?oId='+data[i].oId+'">'
							+'	<li>'
							+'		<div class="left">'
							+'			<h3>'
							+'				<span>'
							+				title	
							+'				</span>'
							+'			</h3>'
							+'			<p>'
							+				data[i].profile
							+'			</p>'
							+'			<p class="dz_tb">'
							+				data[i].address
							+'			</p>'
							+'		</div>'
							+'		<div class="right">'
							+'			<p style="padding-top: 10px;">'
							+				data[i].orderCode
							+'			</p>'
							+'			<p class="stu-gender">'
							+'				学员：'+sgender
							+'			</p>'
							+'			<p class="cs">'
							+				data[i].coursePrice+'元/时'
							+'			</p>'
							+'			<p >';
							
							if(data[i].orderStatus==22){
								content=content+'<span style="border:1px solid #3ac779;color:#3ac779;border-radius:0.3rem">发布中</span>';
							}else if(data[i].orderStatus==23){
								content=content+'教员申请中';	
							}else if(data[i].orderStatus==24){
								content=content+'授课中';	
							}else if(data[i].orderStatus==25){
								content=content+'<span style="border:1px solid red;color:red;border-radius:0.3rem">已完成</span>';	
							}
							content=content
							+'			</p>'
							+'		</div>'
							+'	</li>'
						+'	</a>'
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
