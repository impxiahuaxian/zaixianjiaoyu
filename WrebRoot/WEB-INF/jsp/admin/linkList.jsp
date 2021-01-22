<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Link"%>
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
									<th width="50">ID</th>
									<th width="140">网站名称</th>
									<th width="130">网站链接</th>
									<th width="200">描述</th>
									<th width="100">联系人</th>
									<th width="150">联系电话</th>
									<th width="80">显示</th>
									<th width="80">排序</th>
									<th width="100">申请时间</th>
									<th width="100">操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Link> linkList = (List<Link>)request.getAttribute("linkList");
							if(linkList!=null){
								for(int i=0;i<linkList.size();i++){
									Link link = linkList.get(i);					
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=link.getLid() %></td>
									<td><%=link.getWebName() %></td>
									<td><%=link.getWebUrl() %></td>
									<td><%=link.getWebDescribe() %></td>
									<td><%=link.getContactName() %></td>
									<td><%=link.getWebPhone() %></td>
									<td class="td-status">
									<%if(link.getDisplay()==1){ %>
										<span class="label label-success radius">显示</span>
									<%}else{ %>
										<span class="label label-defaunt radius">不显示</span>
									<%} %>
									</td>
									<td><%=link.getSort() %></td>
									<td><%=link.getPubTime() %></td>
									<td class="td-manage">
										<%if(link.getDisplay()==1){ %>
											<a onClick="member_stop(this,<%=link.getLid() %>)" href="javascript:;" title="停用" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										<%}else{ %>
											<a style="text-decoration:none" class="btn btn-xs " onclick="member_start(this,<%=link.getLid() %>)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>
										<%} %>
										<a title="编辑" onclick="link_edit(<%=link.getLid() %>)" href="javascript:;" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
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
		<!--添加用户图层-->
		<div class="add_menber" id="add_menber_style" style="display:none">
				<input value="" id="lid"  type="hidden"  class="text_add"/>
			<ul class=" page-content">
				<li><label class="label_name">网站名称：</label><span class="add_name"><input value="" id="webName" name="网站名称" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">网站链接：</label><span class="add_name"><input name="网站链接" id="webUrl" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">联系姓名：</label><span class="add_name"><input name="联系人姓名" id="contactName" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">联系电话：</label><span class="add_name"><input name="联系电话" id="webPhone" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">显&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;示：</label>
					<span class="add_name">
						<select id="display"  name="显示" style=" width:170px">
							<option  value ="1">显示</option>
							<option  value ="0">不显示</option>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">排&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序：</label><span class="add_name"><input name="排序" id="sort" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li class="adderss"><label class="label_name">网站描述：</label>
					<textarea cols="80" rows="5" id="webDescribe" name="网站描述" ></textarea>
				</li>
			</ul>
		</div>
	</body>

</html>
<script>
	jQuery(function($) {
			var oTable1 = $('#sample-table').dataTable({
				"aaSorting": [
					[7, "desc"]
				], //默认第几个排序
				"bStateSave": true, //状态保存
				"aoColumnDefs": [
					//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
					{
						"orderable": false,
						"aTargets": [0,2,3,4,5,6,10]
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
	function member_stop(obj, id) {
		layer.confirm('确认要不显示吗？', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('noDisplayLink.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,'+id +')" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">不显示</span>');
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
	function member_start(obj, id) {
		layer.confirm('确认要显示吗？', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('displayLink.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,'+id +')" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已显示</span>');
						$(obj).remove();
						layer.msg('已显示!', {
							icon: 6,
							time: 1000
						});
		            	
		            } else {
	            		layer.msg('已显示!', {
							icon: 6,
							time: 1000
						});
		            }
		    });
			
		});
	}
	/*用户-编辑*/
	function link_edit(id) {
		layer.open({
			type: 1,
			title: '修改友情链接信息',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['800px', '400'],
			content: $('#add_menber_style'),
			btn: ['提交', '取消'],
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
	       
		        $.post('linkInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#lid').val(res.message.lid);
		            	$('#webName').val(res.message.webName);
		            	$('#webUrl').val(res.message.webUrl);
		            	$('#contactName').val(res.message.contactName);
		            	$('#webPhone').val(res.message.webPhone);
		            	$('#sort').val(res.message.sort);
		            	$('#display').val(res.message.display);
		            	$("#webDescribe").val(res.message.webDescribe);
		            } else {
		            	alert(res.message);
		            	
		            }
		        });

  			},
			yes: function(index, layero) {
				
				var d = {
			            IsAsync: true,
			            lid:id,
			            webName:$('#webName').val(),
		            	webUrl:$('#webUrl').val(),
		            	contactName:$('#contactName').val(),
		            	webPhone:$("#webPhone").val(),
		            	display:$("#display").val(),
		            	sort:$("#sort").val(),
			            webDescribe:$("#webDescribe").val()
		
			        };
			        $.post('updateLinkInfo.action', d, function (res) {
			        	
			            if (res.success) {
			            	layer.alert(res.message, {
								title: '提示框',
								icon: 1,
							});
							layer.close(index);
							
							 var _body = window.parent;
				            var _iframe1=_body.document.getElementById('iframe');
				            _iframe1.contentWindow.location.reload(true);
			            	
			            } else {
			            	layer.alert(res.message, {
								title: '提示框',
								icon: 0,
							});
							layer.close(index);
			            }
			        });
			}
		});
	}

	laydate({
		elem: '#start',
		event: 'focus'
	});
</script>