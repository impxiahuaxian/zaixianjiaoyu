<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%@page import="com.jiajiao.bean.News"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../static/back/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../static/back/css/style.css" />
		<link href="../static/back/assets/css/codemirror.css" rel="stylesheet">
		<link rel="stylesheet" href="../static/back/assets/css/ace.min.css" />
		<link rel="stylesheet" href="../static/back/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="../static/back/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="../static/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="../static/back/assets/js/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='../static/back/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../static/back/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='../static/back/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="../static/back/assets/js/bootstrap.min.js"></script>
		<script src="../static/back/assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="../static/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="../static/back/assets/js/jquery.dataTables.bootstrap.js"></script>
		<script type="text/javascript" src="../static/back/js/H-ui.js"></script>
		<script type="text/javascript" src="../static/back/js/H-ui.admin.js"></script>
		<script src="../static/back/assets/layer/layer.js" type="text/javascript"></script>
		<script src="../static/back/assets/laydate/laydate.js" type="text/javascript"></script>
		<title>用户列表</title>
	</head>

	<body>
		<div class="page-content clearfix">
			<div id="Member_Ratings">
				<div class="d_Confirm_Order_style">
					
					<div class="table_menu_list">
						<table class="table table-striped table-bordered table-hover" id="sample-table">
							<thead>
								<tr>
									<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
									<th width="80">ID</th>
									<th width="150">标题</th>
									<th width="100">学年</th>
									<th width="100">来源</th>
									<th width="100">浏览量</th>
									<th width="100">排序</th>
									<th width="140">发布时间</th>
									<th width="100">显示</th>
									<th width="200">操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<News> newsList = (List<News>)request.getAttribute("newsList");
							if(newsList!=null){
								for(int i=0;i<newsList.size();i++){
									News news = newsList.get(i);							
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=news.getnId() %></td>
									<td><a href="../news/newsInfo.action?nId=<%=news.getnId() %>" target="_blank"><%=news.getTitle() %></a></td>
									<td><%=request.getAttribute("degree") %></td>
									<td><%=news.getSource()%></td>
									<td><%=news.getViewNum()%></td>
									<td><%=news.getSort() %></td>
									<td><%=news.getPubTime() %></td>
									<td class="td-status">
									<%if(news.getDisplay()==1){ %>
										<span class="label label-success radius">已启用</span>
									<%}else{ %>
										<span class="label label-defaunt radius">已停用</span>
									<%} %>
										
									</td>
									<td class="td-manage">
									
										<%if(news.getDisplay()==1){ %>
											<a onClick="news_stop(this,<%=news.getnId() %>)" href="javascript:;" title="停用" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										<%}else{ %>
											<a style="text-decoration:none" class="btn btn-xs " onclick="news_start(this,<%=news.getnId() %>)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>
										<%} %>
										<a title="文章详细" href="../news/preUpdateNewsPage.action?nId=<%=news.getnId() %>" class="btn btn-xs btn-info Refund_detailed">详细</a>
									</td>
								</tr>
							<%
								}
							}
							%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</body>

</html>
<script>
	jQuery(function($) {
			var oTable1 = $('#sample-table').dataTable({
				"aaSorting": [
					[1, "desc"]
				], //默认第几个排序
				"bStateSave": true, //状态保存
				"aoColumnDefs": [
					//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
					{
						"orderable": false,
						"aTargets": [0,2,3,7,8,9]
					} // 制定列不参与排序
				]
			});

			$('table th input:checkbox').on('click', function() {
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function() {
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});

			});

			$('[data-rel="tooltip"]').tooltip({
				placement: tooltip_placement
			});

			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table')
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if(parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
				return 'left';
			}
		})
	
	/*用户-停用*/
	function news_stop(obj, id) {
		layer.confirm('确认要停用吗？', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			$.post('stopNews.action', d, function (res) {
		        	
	            if (res.success) {
	            	
	            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="news_start(this,'+id +')" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
					$(obj).remove();
					layer.msg('已停用!', {
						icon: 5,
						time: 1000
					});
	            	
	            } else {
	            	layer.msg('操作失败，请重试', {
						icon: 5,
						time: 1000
					});
	            }
		    });
			
		});
	}

	/*用户-启用*/
	function news_start(obj, id) {
		layer.confirm('确认要启用吗？', function(index) {
		
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('startNews.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="news_stop(this,'+id +')" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
						$(obj).remove();
						layer.msg('已启用!', {
							icon: 6,
							time: 1000
						});
		            	
		            } else {
	            		layer.msg('已启用!', {
							icon: 6,
							time: 1000
						});
		            }
		    });
			
		});
	}

	laydate({
		elem: '#start',
		event: 'focus'
	});
	

</script>