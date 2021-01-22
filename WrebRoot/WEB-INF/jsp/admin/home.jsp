<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		<link href="../static/back/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../static/back/css/style.css" />
		<link rel="stylesheet" href="../static/back/assets/css/ace.min.css" />
		<link rel="stylesheet" href="../static/back/assets/css/font-awesome.min.css" />
		<link href="../static/back/assets/css/codemirror.css" rel="stylesheet">
		<!--[if IE 7]>
		  <link rel="stylesheet" href="../static/back/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="../static/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="../static/back/assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="../static/back/assets/js/html5shiv.js"></script>
		<script src="../static/back/assets/js/respond.min.js"></script>
		<![endif]-->
		<!--[if !IE]> -->
		<script src="../static/back/assets/js/jquery.min.js"></script>
		<!-- <![endif]-->
		<script src="../static/back/assets/js/bootstrap.min.js"></script>

	</head>

	<body>
		<div class="page-content clearfix">
			<div class="alert alert-block alert-success">
				<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
				<%
				Date currentTime = new Date();
     			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     			String dateString = formatter.format(currentTime);
     			String ip = CommonUtil.getIpAddress(request);// 获取客户端ip地址
				 %>
				<i class="icon-ok green"></i>欢迎使用,你本次登录时间为<%=dateString %>，登录IP:<%=ip %>
			</div>
			<div class="state-overview clearfix">
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
						<a href="javascript:void(0);" title="学员用户">
							<div class="symbol terques">
								<i class="icon-user"></i>
							</div>
							<div class="value">
								<h1><%=request.getAttribute("memberTotal") %></h1>
								<p>学员用户</p>
							</div>
						</a>
					</section>
				</div>
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
						<div class="symbol red">
							<i class="icon-tags"></i>
						</div>
						<div class="value">
							<h1><%=request.getAttribute("teacherTotal") %></h1>
							<p>教员用户</p>
						</div>
					</section>
				</div>
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
						<div class="symbol yellow">
							<i class="icon-shopping-cart"></i>
						</div>
						<div class="value">
							<h1><%=request.getAttribute("ordersTotal") %></h1>
							<p>家教总订单量</p>
						</div>
					</section>
				</div>
				<div class="col-lg-3 col-sm-6">
					<section class="panel">
						<div class="symbol blue">
							<i class="icon-bar-chart"></i>
						</div>
						<div class="value">
							<h1>￥<%=request.getAttribute("priceTotal") %></h1>
							<p>总支付</p>
						</div>
					</section>
				</div>
			</div>
			<!--实时交易记录-->
			<div class="clearfix">
			
				<div class="Order_Statistics ">
					<div class="title_name">学院统计信息</div>
					<table class="table table-bordered" style="font-size: 13px">
						<tbody>
							<tr>
								<td class="name">总学员数：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("memberTotal") %></a>&nbsp;个</td>
							</tr>
							<tr>
								<td class="name">停用学员数：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("banMemberTotal") %></a>&nbsp;个</td>
							</tr>
							
						</tbody>
					</table>
				</div>
					
				<div class="Order_Statistics ">
					<div class="title_name">教员统计信息</div>
					<table class="table table-bordered" style="font-size: 13px">
						<tbody>
							<tr>
								<td class="name">总教员数：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("teacherTotal") %></a>&nbsp;个</td>
							</tr>
							<tr>
								<td class="name">待审核教员数：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("pendingTeacherTotal") %></a>&nbsp;个</td>
							</tr>
							<tr>
								<td class="name">封号教员数：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("banTeacherTotal") %></a>&nbsp;个</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="Order_Statistics">
					<div class="title_name">家教需求统计信息</div>
					<table class="table table-bordered" style="font-size: 13px">
						<tbody>
							<tr>
								<td class="name">总家教需求量：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("ordersTotal") %></a>&nbsp;个</td>
							</tr>
							<tr>
								<td class="name">发布中快速请家教：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("publishingFastOrderTotal") %></a>&nbsp;个</td>
							</tr>
							<tr>
								<td class="name">发布中家教需求：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("publishingOrderTotal") %></a>&nbsp;个</td>
							</tr>
							<tr>
								<td class="name">预约教员中家教：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("appointmentingOrderTotal") %></a>&nbsp;个</td>
							</tr>
							<tr>
								<td class="name">退款中家教：</td>
								<td class="munber">
									<a href="javascript:void(0);"><%=request.getAttribute("refunddingOrderTotal") %></a>&nbsp;条</td>
							</tr>

						</tbody>
					</table>
				</div>
				
				<!--<div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div> -->
				<div class="news_style">
					<div class="title_name">最新消息</div>
					<ul class="list">
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">6月共处理订单3451比，作废为...</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
						<li><i class="icon-bell red"></i>
							<a href="#">后台系统找那个是开通了。</a>
						</li>
					</ul>
				</div>
			</div>
			<!--记录-->
			<!-- 
			<div class="clearfix">
				<div class="home_btn">
					<div>
						<a href="picture-add.html" title="添加商品" class="btn  btn-info btn-sm no-radius">
							<i class="bigger-200"><img src="../static/back/images/icon-addp.png" /></i>
							<h5 class="margin-top">添加商品</h5>
						</a>
						<a href="Category_Manage.html" title="产品分类" class="btn  btn-primary btn-sm no-radius">
							<i class="bigger-200"><img src="../static/back/images/icon-cpgl.png" /></i>
							<h5 class="margin-top">产品分类</h5>
						</a>
						<a href="admin_info.html" title="个人信息" class="btn  btn-success btn-sm no-radius">
							<i class="bigger-200"><img src="../static/back/images/icon-grxx.png" /></i>
							<h5 class="margin-top">个人信息</h5>
						</a>
						<a href="Systems.html" title="系统设置" class="btn  btn-info btn-sm no-radius">
							<i class="bigger-200"><img src="../static/back/images/xtsz.png" /></i>
							<h5 class="margin-top">系统设置</h5>
						</a>
						<a href="Order_handling.html" title="商品订单" class="btn  btn-purple btn-sm no-radius">
							<i class="bigger-200"><img src="../static/back/images/icon-gwcc.png" /></i>
							<h5 class="margin-top">商品订单</h5>
						</a>
						<a href="picture-add.html" title="添加广告" class="btn  btn-pink btn-sm no-radius">
							<i class="bigger-200"><img src="../static/back/images/icon-ad.png" /></i>
							<h5 class="margin-top">添加广告</h5>
						</a>
						<a href="article_add.html" title="添加文章" class="btn  btn-info btn-sm no-radius">
							<i class="bigger-200"><img src="../static/back/images/icon-addwz.png" /></i>
							<h5 class="margin-top">添加文章</h5>
						</a>
					</div>
				</div>

			</div>
 			-->	
		</div>
	</body>

</html>
<script type="text/javascript">
	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.no-radius').on('click', function() {
		var cname = $(this).attr("title");
		var chref = $(this).attr("href");
		var cnames = parent.$('.Current_page').html();
		var herf = parent.$("#iframe").attr("src");
		parent.$('#parentIframe').html(cname);
		parent.$('#iframe').attr("src", chref).ready();;
		parent.$('#parentIframe').css("display", "inline-block");
		parent.$('.Current_page').attr({
			"name": herf,
			"href": "javascript:void(0)"
		}).css({
			"color": "#4c8fbd",
			"cursor": "pointer"
		});
		//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
		parent.layer.close(index);

	});
	$(document).ready(function() {

		$(".t_Record").width($(window).width() - 640);
		//当文档窗口发生改变时 触发  
		$(window).resize(function() {
			$(".t_Record").width($(window).width() - 640);
		});
	});
</script>