<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.FastOrderTeacher"%>
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
									<th width="100">家长姓名</th>
									<th width="120">手机号码</th>
									<th width="100">微信号</th>
									<th width="100">授课科目</th>
									<th width="50">授课教员</th>
									<th width="100">发布时间</th>
									<th width="70">状态</th>
									<th width="200">备注</th>
									<th width="80">金额</th>
									<th width="70">操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<FastOrderTeacher> fastOrderTeacherList = (List<FastOrderTeacher>)request.getAttribute("fastOrderTeacherList");
							if(fastOrderTeacherList!=null){
								for(int i=0;i < fastOrderTeacherList.size();i++){
									FastOrderTeacher fastOrderTeacher = fastOrderTeacherList.get(i);
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=fastOrderTeacher.getFotId() %></td>
									<td><%=fastOrderTeacher.getName() %></td>
									<td><%=fastOrderTeacher.getPhone() %></td>
									<td><%=fastOrderTeacher.getWxNumber() %></td>
									<td><%=fastOrderTeacher.getTeachingCourseName()%></td>
									<td><u style="cursor:pointer" class="text-primary" onclick="teacher_show('<%=fastOrderTeacher.getTeacherName() %>','teacherShow.action','<%=fastOrderTeacher.getTeacherId()%>','600','600')"><%=fastOrderTeacher.getTeacherName() %></u></td>
									<td><%=fastOrderTeacher.getPublicTime()%></td>
									<td>
									<%
										int state = fastOrderTeacher.getState();
										if(state==1){ 
										%>
										发布中
										<%}else if(state==2){ %>
										学员联系中
										<%}else if(state==3){ %>
										教员联系中
										<%}else if(state==4){ %>
										试授课中
										<%}else if(state==5){ %>
										已完成
										<%}else if(state==6){ %>
										请家教失败
										<%}else if(state==7){ %>
										 退款中
										<%} %>
									</td>
									<td class="td-status"><%=fastOrderTeacher.getRemark() %></td>
									<td class="td-price"><%=fastOrderTeacher.getOrderPrice() %></td>
									<td class="td-manage">
										<a title="编辑" onclick="member_edit('<%=fastOrderTeacher.getFotId() %>')" href="javascript:;" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
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
		<div style="font-size: 15px;">
		提示：<br/>
		1) 未注册的学员发布的快速请家教信息，都会在这边进行显示。<br/>
		2) 后台管理人员查看快速请家教订单信息，联系学员（电话、微信等）咨询具体的家教需求，<font color="red">并在备注中写上具体的家教需求。</font><br/>
		3) 后台管理人员在<font color="red">云朵家教群跟网站后台发布家教需求信息。</font><br/>
		4) 后台管理人员在后台发布家教需求订单后，需要在<font color="red">备注中记录订单编号。</font><br/>
		</div>
		<!--添加用户图层-->
		<div class="add_menber" id="add_menber_style" style="display:none">
					
			<ul class=" page-content">
				<li><label class="label_name">家长姓名：</label><span class="add_name"><input id="name" value="" name="学员姓名" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">教员编号：</label><span class="add_name"><input id="teacherId" name="教员编号" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</label><span class="add_name"><input id="phone" name="手机" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">支付金额：</label><span class="add_name"><input id="price" name="支付金额" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">微&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信：</label><span class="add_name"><input id="wxNumber" name="微信" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">预约状态：</label>
					<span class="add_name">
						<select id="state"  name="预约状态" style=" width:170px">
							<option  value ="1">发布中</option>
							<option  value ="2">学员联系中</option>
							<option  value ="3">教员联系中</option>
							<option  value ="4">试授课</option>
							<option  value ="5">已完成</option>
							<option  value ="6">预订失败</option>
							<option  value ="7">退款中</option>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li class="adderss"><label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label><span class="add_name"><textarea id="remark" name="备注" style="width: 600px;height: 100px;"></textarea></span>
					<div class="prompt r_f"></div>
				</li>
				
			</ul>
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
						"aTargets": [0,2,3,4,5,6,7,8,9]
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
		/*用户-添加*/
	$('#member_add').on('click', function() {
		layer.open({
			type: 1,
			title: '添加用户',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area: ['800px', '500px'],
			content: $('#add_menber_style'),
			btn: ['提交', '取消'],
			yes: function(index, layero) {
				var num = 0;
				var str = "";
				$(".add_menber input[type$='text']").each(function(n) {
					if($(this).val() == "") {

						layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
							title: '提示框',
							icon: 0,
						});
						num++;
						return false;
					}
				});
				if(num > 0) {
					return false;
				} else {
					layer.alert('添加成功！', {
						title: '提示框',
						icon: 1,
					});
					layer.close(index);
				}
			}
		});
	});
	/*学员用户-查看*/
	function member_show(title, url, id, w, h) {
		layer_show(title, url + '?id=' + id, w, h);
	}


	/*教员用户-查看*/
	function teacher_show(title, url, id, w, h) {
		layer_show(title, url + '?id=' + id, w, h);
	}


	/*用户-编辑*/
	function member_edit(id) {
		layer.open({
			type: 1,
			title: '快速请教员信息编辑',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['800px', '500px'],
			content: $('#add_menber_style'),
			btn: ['提交', '取消'],
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
		       
		        $.post('fastOrderTeacherInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#name').val(res.message.name);
		            	$('#phone').val(res.message.phone);
		            	$('#wxNumber').val(res.message.wxNumber);
		            	$('#teacherId').val(res.message.teacherId);
		            	$('#price').val(res.message.orderPrice);
		            	$('#remark').val(res.message.remark);
		            	$("#state").val(res.message.state);
		            	
		            } else {
		            	alert(res.message);
		            	
		            }
		        });


  			},
			yes: function(index, layero) {
				var num = 0;
				var str = "";
				
				var d = {
		            IsAsync: true,
		            fotId: id,
		            name:$('#name').val(),
		            phone:$('#phone').val(),
		            wxNumber:$('#wxNumber').val(),
		            teacherId:$('#teacherId').val(),
		            orderPrice:$('#price').val(),
		            state:$("#state").val(),
		            remark:$("#remark").val(),
		        };
		        
		        $.post('updateFastOrderTeacherInfo.action', d, function (res) {
		        	
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
