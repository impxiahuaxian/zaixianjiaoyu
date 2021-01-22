<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>网站后台管理系统</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
		
		<link href="../static/back/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../static/back/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="../static/back/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="../static/back/assets/css/ace.min.css" />
		<link rel="stylesheet" href="../static/back/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="../static/back/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="../static/back/css/style.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="../static/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="../static/back/assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="../static/back/assets/js/html5shiv.js"></script>
		<script src="../static/back/assets/js/respond.min.js"></script>
		<![endif]-->
		<!--[if !IE]> -->
		<script src="../static/back/js/jquery-1.9.1.min.js"></script>
		<!-- <![endif]-->
		<!--[if IE]>
         <script type="text/javascript">window.jQuery || document.write("<script src='../static/back/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");</script>
        <![endif]-->
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='../static/back/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="../static/back/assets/js/bootstrap.min.js"></script>
		<script src="../static/back/assets/js/typeahead-bs2.min.js"></script>
		<!--[if lte IE 8]>
		  <script src="../static/back/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="../static/back/assets/js/ace-elements.min.js"></script>
		<script src="../static/back/assets/js/ace.min.js"></script>
		<script src="../static/back/assets/layer/layer.js" type="text/javascript"></script>
		<script src="../static/back/assets/laydate/laydate.js" type="text/javascript"></script>
		<script src="../static/back/js/jquery.nicescroll.js" type="text/javascript"></script>

		<script type="text/javascript">	
 $(function(){ 
 var cid = $('#nav_list> li>.submenu');
	  cid.each(function(i){ 
       $(this).attr('id',"Sort_link_"+i);
   
    })  
 })
 jQuery(document).ready(function(){ 	
    $.each($(".submenu"),function(){
	var $aobjs=$(this).children("li");
	var rowCount=$aobjs.size();
	var divHeigth=$(this).height();
    $aobjs.height(divHeigth/rowCount);	  	
  }); 
    //初始化宽度、高度

    $("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140); 
	 
	$(".sidebar").height($(window).height()-99); 
    var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
	
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140);
	$(".sidebar").height($(window).height()-99); 
	
	var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
  });
    $(document).on('click','.iframeurl',function(){
                var cid = $(this).attr("name");
				var cname = $(this).attr("title");
                $("#iframe").attr("src",cid).ready();
				$("#Bcrumbs").attr("href",cid).ready();
				$(".Current_page a").attr('href',cid).ready();	
                $(".Current_page").attr('name',cid);
				$(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();	
				$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();	
				$("#parentIfour").html(''). css("display","none").ready();		
      });
	 
    
		
});
 /******/
  $(document).on('click','.link_cz > li',function(){
	$('.link_cz > li').removeClass('active');
	$(this).addClass('active');
});
/*******************/


/*********************点击事件*********************/
$( document).ready(function(){
  $('#nav_list,.link_cz').find('li.home').on('click',function(){
	$('#nav_list,.link_cz').find('li.home').removeClass('active');
	$(this).addClass('active');
  });												
//时间设置
  function currentTime(){ 
    var d=new Date(),str=''; 
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+= d.getSeconds()+'秒'; 
    return str; 
} 

setInterval(function(){$('#time').html(currentTime)},1000); 
//修改密码
$('.change_Password').on('click', function(){
    layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{			  
			  layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  }); 
			  layer.close(index);      
		  }	 
	}
    });
});
  $('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="login.html";
        
    });
});
});
function link_operating(name,title){
                var cid = $(this).name;
				var cname = $(this).title;
                $("#iframe").attr("src",cid).ready();
				$("#Bcrumbs").attr("href",cid).ready();
				$(".Current_page a").attr('href',cid).ready();	
                $(".Current_page").attr('name',cid);
				$(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();	
				$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();	
				$("#parentIfour").html(''). css("display","none").ready();		
      
    
}
</script>
	</head>
	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
			<div class="navbar-container" id="navbar-container">
				<!-- /.navbar-header -->
				<div class="navbar-header operating pull-left">

				</div>
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle"> <span
								class="time"><em id="time"></em> </span><span class="user-info"><small>欢迎光临,</small>超级管理员</span>
								<i class="icon-caret-down"></i> </a>
							<ul
								class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="javascript:void(0" name="Systems.html" title="系统设置"
										class="iframeurl"><i class="icon-cog"></i>网站设置</a>
								</li>
								<li>
									<a href="javascript:void(0)" name="admin_info.html"
										title="个人信息" class="iframeurl"><i class="icon-user"></i>个人资料</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="javascript:ovid(0)" id="Exit_system"><i
										class="icon-off"></i>退出</a>
								</li>
							</ul>
						</li>
						<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#"><i
								class="icon-bell-alt"></i><span class="badge badge-important">8</span>
							</a>
							<ul
								class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-warning-sign"></i>8条通知
								</li>
								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left"> <i
												class="btn btn-xs no-hover btn-pink icon-comments-alt"></i>
												最新消息 </span>
											<span class="pull-right badge badge-info">+12</span>
										</div> </a>
								</li>

								<li>
									<a href="#"> <i class="btn btn-xs btn-primary icon-user"></i>
										切换为编辑登录.. </a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left"> <i
												class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
												新订单 </span>
											<span class="pull-right badge badge-success">+8</span>
										</div> </a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left"> <i
												class="btn btn-xs no-hover btn-info icon-twitter"></i> 用户消息
											</span>
											<span class="pull-right badge badge-info">+11</span>
										</div> </a>
								</li>

								<li>
									<a href="#"> 查看所有通知 <i class="icon-arrow-right"></i> </a>
								</li>
							</ul>
						</li>


					</ul>
					
				</div>
			</div>
		</div>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#"> <span
					class="menu-text"></span> </a>
				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<a class="btn btn-success"> <i class="icon-signal"></i> </a>

							<a class="btn btn-info"> <i class="icon-pencil"></i> </a>

							<a class="btn btn-warning"> <i class="icon-group"></i> </a>

							<a class="btn btn-danger"> <i class="icon-cogs"></i> </a>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div>
					<!-- #sidebar-shortcuts -->
					<div id="menu_style" class="menu_style">
						<ul class="nav nav-list" id="nav_list">
							<li class="home">
								<a href="javascript:void(0)" name="home.action" class="iframeurl"
									title=""><i class="icon-home"></i><span class="menu-text">
										系统首页 </span> </a>
							</li>
							<li>
								<a href="#" class="dropdown-toggle"><i class="icon-user"></i><span
									class="menu-text"> 用户信息管理 </span><b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="memberList.action"
											title="会员信息" class="iframeurl"><i
											class="icon-double-angle-right"></i>会员信息</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="teacherList.action"
											title="教员信息" class="iframeurl"><i
											class="icon-double-angle-right"></i>教员信息</a>
									</li>

								</ul>
							</li>
							<li>
								<a href="#" class="dropdown-toggle"><i class="icon-credit-card "></i><span
									class="menu-text"> 订单信息管理 </span><b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="fastAppointTeacherList.action" title="快速请家教列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>快速请家教列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="publishOrderPage.action"
											title="发布家教需求" class="iframeurl"><i class="icon-double-angle-right"></i>发布家教需求</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="orderList.action" title="家教需求列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>家教需求列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="takeOrderList.action" title="教员接单列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>教员接单列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="appointTeacherList.action" title="预约教员列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>预约教员列表</a>
									</li>
									
								</ul>
							</li>
							<li>
								<a href="#" class="dropdown-toggle"><i
									class="icon-user"></i><span class="menu-text">
										辅导机构管理 </span><b class="arrow icon-angle-down"></b> </a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="../institution/pubInstitutionPage.action"
											title="发布辅导机构" class="iframeurl"><i
											class="icon-double-angle-right"></i>发布辅导机构</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="../institution/institutionList.action"
											title="辅导机构列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>辅导机构列表</a>
									</li>
								</ul>
							</li>
							<!--<li>
								<a href="#" class="dropdown-toggle"><i class="icon-user"></i><span
									class="menu-text"> 会员管理 </span><b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="user_list.html"
											title="会员列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>会员列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="member-Grading.html"
											title="等级管理" class="iframeurl"><i
											class="icon-double-angle-right"></i>等级管理</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="integration.html"
											title="会员记录管理" class="iframeurl"><i
											class="icon-double-angle-right"></i>会员记录管理</a>
									</li>

								</ul>
							</li>
							--><!--<li>
								<a href="#" class="dropdown-toggle"><i class="icon-laptop"></i><span
									class="menu-text"> 店铺管理 </span><b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="Shop_list.html"
											title="店铺列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>店铺列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="Shops_Audit.html"
											title="店铺审核" class="iframeurl"><i
											class="icon-double-angle-right"></i>店铺审核<span
											class="badge badge-danger">5</span> </a>
									</li>
								</ul>
							</li>
							--><!--<li>
								<a href="#" class="dropdown-toggle"><i
									class="icon-comments-alt"></i><span class="menu-text">
										消息管理 </span><b class="arrow icon-angle-down"></b> </a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="Guestbook.html"
											title="留言列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>留言列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="Feedback.html" title="意见反馈"
											class="iframeurl"><i class="icon-double-angle-right"></i>意见反馈</a>
									</li>
								</ul>
							</li>
							-->
							<li>
								<a href="#" class="dropdown-toggle"><i class="icon-bookmark"></i><span
									class="menu-text"> 试题管理 </span><b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="../paper/pubPaperPage.action"
											title="上传试题" class="iframeurl"><i
											class="icon-double-angle-right"></i>试题上传</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="paperList.action?degree=1"
											title="小学试题列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>小学试题列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="paperList.action?degree=2"
											title="初中试题列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>初中试题列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="paperList.action?degree=3"
											title="高中试题列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>高中试题列表</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#" class="dropdown-toggle"><i
									class="icon-comments-alt"></i><span class="menu-text">
										教育资讯管理 </span><b class="arrow icon-angle-down"></b> </a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="../news/pubNewsPage.action"
											title="文章上传" class="iframeurl"><i
											class="icon-double-angle-right"></i>文章上传</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="../news/degreeNewsList.action?degree=1" title="小学教育资讯列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>小学教育资讯列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="../news/degreeNewsList.action?degree=2" title="初中教育资讯列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>初中教育资讯列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="../news/degreeNewsList.action?degree=3" title="高中教育资讯列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>高中教育资讯列表</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#" class="dropdown-toggle"><i
									class="icon-desktop"></i><span class="menu-text">
										通知公告管理 </span><b class="arrow icon-angle-down"></b> </a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="../notice/pubNoticePage.action"
											title="公告上传" class="iframeurl"><i
											class="icon-double-angle-right"></i>公告上传</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="../notice/noticeList.action" title="通知公告列表"
											class="iframeurl"><i class="icon-double-angle-right"></i>通知公告列表</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span
									class="menu-text"> 友情链接管理 </span><b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<li class="home">
										<a href="javascript:void(0)" name="../link/linkList.action"
											title="友情链接列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>友情链接列表</a>
									</li>
									
								</ul>
							</li>
							<%--<li>--%>
								<%--<a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span--%>
									<%--class="menu-text">基础数据管理 </span><b class="arrow icon-angle-down"></b>--%>
								<%--</a>--%>
								<%--<ul class="submenu">--%>
									<%--<li class="home">--%>
										<%--<a href="javascript:void(0)" name="Systems.html" title="科目小类设置"--%>
											<%--class="iframeurl"><i class="icon-double-angle-right"></i>科目小类设置</a>--%>
									<%--</li>--%>
									<%--<li class="home">--%>
										<%--<a href="javascript:void(0)" name="System_section.html"--%>
											<%--title="资费标准管理" class="iframeurl"><i--%>
											<%--class="icon-double-angle-right"></i>资费标准管理</a>--%>
									<%--</li>--%>

									<%--<li class="home">--%>
										<%--<a href="javascript:void(0)" name="System_Logs.html"--%>
											<%--title="系统日志" class="iframeurl"><i--%>
											<%--class="icon-double-angle-right"></i>系统日志</a>--%>
									<%--</li>--%>
								<%--</ul>--%>
							<%--</li>--%>
							<%--<li>
								<a href="#" class="dropdown-toggle"><i class="icon-group"></i><span
									class="menu-text"> 管理员管理 </span><b
									class="arrow icon-angle-down"></b> </a>
								<ul class="submenu">

									<li class="home">
										<a href="javascript:void(0)" name="admin_Competence.html"
											title="权限管理" class="iframeurl"><i
											class="icon-double-angle-right"></i>权限管理</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="administrator.html"
											title="管理员列表" class="iframeurl"><i
											class="icon-double-angle-right"></i>管理员列表</a>
									</li>
									<li class="home">
										<a href="javascript:void(0)" name="admin_info.html"
											title="个人信息" class="iframeurl"><i
											class="icon-double-angle-right"></i>个人信息</a>
									</li>
								</ul>--%>
							</li>
						</ul>
					</div>
					<script type="text/javascript">
           $("#menu_style").niceScroll({  
	        cursorcolor:"#888888",  
	        cursoropacitymax:1,  
         	touchbehavior:false,  
	        cursorwidth:"5px",  
	        cursorborder:"0",  
	        cursorborderradius:"5px"  
            }); 
          </script>
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left"
							data-icon1="icon-double-angle-left"
							data-icon2="icon-double-angle-right"></i>
					</div>
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
					<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="index.html">首页</a>
							</li>
							<li class="active">
								<span class="Current_page iframeurl"></span>
							</li>
							<li class="active" id="parentIframe">
								<span class="parentIframe iframeurl"></span>
							</li>
							<li class="active" id="parentIfour">
								<span class="parentIfour iframeurl"></span>
							</li>
						</ul>
					</div>

					<iframe id="iframe"
						style="border: 0; width: 100%; background-color: #FFF;"
						name="iframe" frameborder="0" src="home.action">
					</iframe>


					<!-- /.page-content -->
				</div>
				<!-- /.main-content -->

				
				<!-- /#ace-settings-container -->
			</div>
			<!-- /.main-container-inner -->

		</div>
		<!--底部样式-->

		<div class="footer_style" id="footerstyle">
			<script type="text/javascript">try{ace.settings.check('footerstyle' , 'fixed')}catch(e){}</script>
			<p class="l_f">
				版权所有：版权号
			</p>
			<p class="r_f">
				地址：吉林省四平市
				<a href="<%=basePath %>" target="_blank">吉师家教网</a>
			</p>
		</div>
		<!--修改密码样式-->
		<div class="change_Pass_style" id="change_Pass">
			<ul class="xg_style">
				<li>
					<label class="label_name">
						原&nbsp;&nbsp;密&nbsp;码
					</label>
					<input name="原密码" type="password" class="" id="password">
				</li>
				<li>
					<label class="label_name">
						新&nbsp;&nbsp;密&nbsp;码
					</label>
					<input name="新密码" type="password" class="" id="Nes_pas">
				</li>
				<li>
					<label class="label_name">
						确认密码
					</label>
					<input name="再次确认密码" type="password" class="" id="c_mew_pas">
				</li>
			</ul>
		</div>

	</body>
</html>

