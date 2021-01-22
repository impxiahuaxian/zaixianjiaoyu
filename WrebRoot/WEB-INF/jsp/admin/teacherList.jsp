<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
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
									<th width="100">姓名</th>
									<th width="80">手机号</th>
									<th width="150">微信号</th>
									<th width="90">性别</th>
									<th width="">区域</th>
									<th width="">地址</th>
									<th width="140">身份</th>
									<th width="100">授课数</th>
									<th width="120">最近登录时间</th>
									<th width="70">审核</th>
									<th width="100">状态</th>
									<th width="200">操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Teacher> teacherList = (List<Teacher>)request.getAttribute("teacherList");
							if(teacherList!=null){
								for(int i=0;i<teacherList.size();i++){
									Teacher teacher = teacherList.get(i);							
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=teacher.getTeacherId() %></td>
									<td><%=teacher.getTeacherName() %></td>
									<td><%=teacher.getPhone() %></td>
									<td><%=teacher.getWxNumber()%></td>
									<td>
									<%
									if(teacher.getGender()==1){
									%>
										男
									<%
									}else{
									%>
										女
									<%
									}
									%>
									</td>
									<td class="text-l"><%=teacher.getArea()%></td>
									<td><%=teacher.getAddress()%></td>
									<td><%=teacher.getIdentityName() %></td>
									<td><%=teacher.getTeachingNum() %></td>
									<td><%=teacher.getLastLoginTime() %></td>
									<td>
									<%if(teacher.getIsCheck()==1){%>
									通过
									<%}else{%>
									<font color="red">待审核</font>
									<%} %></td>
									<td class="td-status">
									<%if(teacher.getIsUse()==1){ %>
										<span class="label label-success radius">已启用</span>
									<%}else{ %>
										<span class="label label-defaunt radius">已停用</span>
									<%} %>
										
									</td>
									<td class="td-manage">
									
										<%if(teacher.getIsUse()==1){ %>
											<a onClick="teacher_stop(this,<%=teacher.getTeacherId() %>)" href="javascript:;" title="停用" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										<%}else{ %>
											<a style="text-decoration:none" class="btn btn-xs " onclick="teacher_start(this,<%=teacher.getTeacherId() %>)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>
										<%} %>
										<a title="教员详细" href="teacherInfo.action?tId=<%=teacher.getTeacherId() %>" class="btn btn-xs btn-info Refund_detailed">详细</a>   
										<a title="编辑" href="preUpdateTeacher.action?tId=<%=teacher.getTeacherId() %>"  class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
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
						"aTargets": [0,1,2,3,4,5,6,7, 8,10,11,12,13]
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
	function teacher_stop(obj, id) {
		layer.confirm('确认要停用吗？', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('stopTeacher.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="teacher_start(this,'+id +')" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
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
	function teacher_start(obj, id) {
		layer.confirm('确认要启用吗？', function(index) {
		
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('startTeacher.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="teacher_stop(this,'+id +')" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
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
	/*用户-编辑*/
	function teacher_edit(id) {
		layer.open({
			type: 1,
			title: '修改教员信息',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['800px', ''],
			content: $('#add_menber_style'),
			btn: ['提交', '取消'],
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
	       
		        $.post('memberInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#memberId').val(res.message.memberId);
		            	$('#name').val(res.message.name);
		            	$('#phone').val(res.message.phone);
		            	$('#address').val(res.message.address);
		            	$('#password').val(res.message.password);
		            	
		            	if(1==res.message.gender){
		            		$("input[name='form-field-radio']").get(0).checked=true;
		            	}else{
		            		$("input[name='form-field-radio']").get(1).checked=true;
		            	}
		            	
		            	$("#areaId").val(res.message.areaId);
		            	$("#wxNumber").val(res.message.wxNumber);
		            	$("#areaId").val(res.message.districtId);
		            } else {
		            	alert(res.message);
		            	
		            }
		        });

  			},
			yes: function(index, layero) {
				
				var d = {
			            IsAsync: true,
			            memberId:$('#memberId').val(),
			            name:$('#name').val(),
		            	phone:$('#phone').val(),
		            	password:$('#password').val(),
		            	districtId:$("#areaId").val(),
		            	gender:$("input[name='form-field-radio']:checked").val(),
		            	address:$("#address").val(),
			            wxNumber:$("#wxNumber").val()
		
			        };
			        $.post('updateMemberInfo.action', d, function (res) {
			        	
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
	
	

var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Refund_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
</script>