<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta chartset="utf-8">
    <title>【吉师家教】高中试题列表</title>
    
	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    
    <link href="<%=basePath %>static/mobile/css/css_old.css" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="keywords" content="家教，家教网，家教中心，吉师家教网">
    <meta name="description" content="吉师家教网是中国领先的家教门户网站，服务覆盖全国，已为10多万学员提供上百种科目的数十万兼职大学生家教、专职教师和专业人士。上门授课，免费试教。182-5380-0650">
    <meta name="author" content="[家教 家教网 家教服务]">
    <meta name="copyright" content="吉师家教网">
    <link href="<%=basePath %>static/mobile/css/news.css" rel="stylesheet">
    <script src="<%=basePath %>static/mobile/js/news_tool.js"></script>
    <script src="<%=basePath %>static/mobile/js/zepto.min.js"></script>
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
	<header class="header_wrap">
	    <section class="header">
	
	        <aside class="l_header">
	
	            <a class="go_back" style="cursor:pointer;" onclick="goBack();" title="首页"></a>
	        </aside>
	        <h1 class="g_tit">
	            高中试题列表
	        </h1>
			<aside class="r_home">
	
	            <a  href="<%=basePath %>mobile.action" title="首页">
	            <img alt="首页" src="<%=basePath %>static/mobile/img/home.png">
	            </a>
	        </aside>
	        <script>
	
	            function goBack() {
	                window.history.back();
	            }
	        </script>
	    </section>
	</header>
	<!--end全局頭部-->
	<!-- 中间 -->
	<!-- 一行 -->
	<div class="filterwrap">
	    <div class="filterbox">
			<ul class="filter_th">
				<li data-filter="grade">
					学段
					<i class="ftgt"></i>
				</li>
				<li data-filter="year">
					年级
					<i class="ftgt"></i>
				</li>
				<li data-filter="class">
					学科
					<i class="ftgt"></i>
				</li>
			</ul>
			<!--  -->
			<div class="filter_td">
				<ul class="filter_sel filter_drop" data-filter="grade">
					<li >
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=1&grade=0&course=0">小学</a>
					</li>
					<li >
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=2&grade=0&course=0">初中</a>
					</li>
					<li class="sel">
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=0&course=0">高中</a>
					</li>
				</ul>
				<ul class="filter_sel filter_drop" data-filter="year" id="gradeUl">
					<li class="sel">
					<a
						href="<%=basePath %>paper/mPaperList.action?degree=3&grade=0&course=<%=request.getAttribute("course") %>">全部</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=10&course=<%=request.getAttribute("course") %>">高一</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=11&course=<%=request.getAttribute("course") %>">高二</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=12&course=<%=request.getAttribute("course") %>">高三</a>
					</li>
				</ul>
				<ul class="filter_sel filter_drop" data-filter="class" id="courseUl">
					<li class="sel">
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=0">全部</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=1">语文</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=2">数学</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=3">英语</a>
					</li>
					
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=4">物理</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=5">生物</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=6">化学</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=7">政治</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=8">历史</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=9">地理</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=10">文综</a>
					</li>
					<li>
						<a
							href="<%=basePath %>paper/mPaperList.action?degree=3&grade=<%=request.getAttribute("grade") %>&course=11">理综</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- end 一行 -->
	<!-- 一行 -->
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<input type="hidden" name="degree" id="degree" value="<%=request.getAttribute("degree") %>" />
	<input type="hidden" name="grade" id="grade" value="<%=request.getAttribute("grade") %> "/>
	<input type="hidden" name="course" id="course" value="<%=request.getAttribute("course") %>" />
	<ul class="testlist wpbox" id="wrapper">
	</ul>

	<!-- end 一行 -->
	<!-- end 中间 -->
	
	
	</body>
	
<script>
$(function(){

	$("#gradeUl li").removeClass("sel");
	$("#courseUl li").removeClass("sel");
	
	if(<%=request.getAttribute("grade")%>!=0){
		$("#gradeUl li").eq(<%=request.getAttribute("grade")%>-9).addClass("sel");
	}else{
		$("#gradeUl li").eq(0).addClass("sel");
	}
	
	$("#courseUl li").eq(<%=request.getAttribute("course")%>).addClass("sel");
    query('1');//第一次加载

});

function query(type)

{

    $.ajax({

        url : "<%=basePath%>paper/mPaperListQuery.action",

        data : {

            pageNo : $("#pageNo").val(),
            degree : $("#degree").val(),
            grade : $("#grade").val(),
            course : $("#course").val()

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
                      content=content

                            +   '<li>'
                            +   '<a href="mPaperInfo.action?pId='+data[i].pId+'">'
                            +   '<i class="testico"></i>'+data[i].title
                            +   '</a>';
                            +   '</li>';

                    }

                    $("#wrapper").append(content);

                }else{

                    for(var i=0;i<data.length;i++)

                    {
                          content=content
                            +   '<li>'
                            +   '<a href="mPaperInfo.action?pId='+data[i].pId+'">'
                            +   '<i class="testico"></i>'+data[i].title
                            +   '</a>';
                            +   '</li>';

                    }

                    $("#wrapper").html(content);

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
	
	
	
</html>
