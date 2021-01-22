<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.FastOrderTeacher"%>
<%@page import="com.jiajiao.bean.TakeOrders"%>
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
									<th width="50">ID</th>
									<th width="100">家教编号</th>
									<th width="120">学员姓名</th>
									<th width="120">教员姓名</th>
									<th width="100">授课科目</th>
									<th width="120">授课区域</th>
									<th width="100">授课地址</th>
									<th width="70">预约时间</th>
									<th width="70">状态</th>
									<th width="200">备注</th>
									<th width="80">金额</th>
									<th width="70">操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<TakeOrders> takeOrderList = (List<TakeOrders>)request.getAttribute("takeOrderList");
							if(takeOrderList!=null){
								for(int i=0;i < takeOrderList.size();i++){
									TakeOrders takeOrders = takeOrderList.get(i);
							%>
								<tr>
									<td><%=takeOrders.getToId() %></td>
									<td><a href="../order/orderInfo.action?oId=<%=takeOrders.getoId() %>" target="_blank"> <%=takeOrders.getOrderCode() %></a></td>
									<td><%=takeOrders.getContactName() %></td>
									<!-- <td><%=takeOrders.getTeacherName() %></td> -->
									<td><u style="cursor:pointer" class="text-primary" onclick="teacher_show('<%=takeOrders.getTeacherName() %>','teacherShow.action','<%=takeOrders.getTeacherId()%>','600','600')"><%=takeOrders.getTeacherName() %></u></td>
									<td><%=takeOrders.getCourseName() %></td>
									<td><%
									if(takeOrders.getAreaId()==1){
									%>
									城厢区
									<%}else if(takeOrders.getAreaId()==2){%>
									荔城区
									<%}else if(takeOrders.getAreaId()==3){%>
									秀屿区
									<%}else if(takeOrders.getAreaId()==4){%>
									涵江区
									<%}else if(takeOrders.getAreaId()==5){%>
									仙游县
									<%} %></td>
									<td><%=takeOrders.getAddress()%></td>
									<td><%=takeOrders.getTakeTime()%></td>
									<td>
									<%
										int state = takeOrders.getTakeStatus();
										if(state==1){ 
										%>
										待支付
										<%}else if(state==2){ %>
										已支付
										<%}else if(state==3){ %>
										试授课中
										<%}else if(state==4){ %>
										已完成
										<%}else if(state==5){ %>
										退款中
										<%}else if(state==6){ %>
										预约失败
										<%}
										 %>
									</td>
									<td class="td-status"><%=takeOrders.getRemark() %></td>
									<td class="td-price"><%=takeOrders.getCourcePrice() %></td>
									<td class="td-manage">
										<a title="编辑" onclick="member_edit('<%=takeOrders.getToId() %>','<%=takeOrders.getOrderCode() %>','<%=takeOrders.getoId() %>')" href="javascript:;" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
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
		1) 通过搜索框输入家教需求订单编号，筛选出所有预约该家教订单的接单信息。<br/>
		2) 后台管理人员电话联系教员，咨询是否有满足该家教订单需求以及是否有意向接单。<br/>
		3) 该教员满足家教需求条件并且有意向接单，编辑该接单信息的价格、备注。<br/>
		4) 待该教员支付完成后，编辑该接单信息的状态为<font color="red">已支付(此时，教员可以查看到本次家教信息的联系电话等信息)</font>。<br/>
		5) 修改其他该家教需求订单编号下的接单信息的状态为<font color="red">预约失败</font>。<br/>
		6) 教员在规定时间内自行联系学员（电话、微信等），确认试授课时间，<font color="red">并与本平台客服人员反馈结果。</font><br/>
		7) 若反馈结果学员觉得教员试授课满意，编辑该接单信息的状态为<font color="red">已完成</font><br/>
		8) 备注信息只有后台管理人员能够看到，用于方便记录接单信息各个状态下的情况反馈。<br/>
		</div>
		
		
		<!--添加用户图层-->
		<div class="add_menber" id="add_menber_style" style="display:none">
					<input id="toId" name="toId" value="" type="hidden">
			<ul class=" page-content">
				<li><label class="label_name">支付金额：</label><span class="add_name"><input id="price" name="支付金额" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">预约状态：</label>
					<span class="add_name">
						<select id="state"  name="预约状态" style=" width:170px">
							<option  value ="1">待支付</option>
							<option  value ="2">已支付</option>
							<option  value ="3">试授课中</option>
							<option  value ="4">已完成</option>
							<option  value ="5">退款中</option>
							<option  value ="6">预约失败</option>
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
						"aTargets": [0,1,2,3,4,5,6,8,9,10,11]
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
	
	/*学员用户-查看*/
	function member_show(title, url, id, w, h) {
		layer_show(title, url + '?id=' + id, w, h);
	}


	/*教员用户-查看*/
	function teacher_show(title, url, id, w, h) {
		layer_show(title, url + '?id=' + id, w, h);
	}


	/*用户-编辑*/
	function member_edit(id,orderCode,oId) {
		layer.open({
			type: 1,
			title: '教员接单信息(编号：'+orderCode+')',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['750px', '400px'],
			content: $('#add_menber_style'),
			btn: ['提交', '取消'],
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
		       
		        $.post('takeOrderInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#toId').val(res.message.toId);
		            	$('#price').val(res.message.courcePrice);
		            	$('#remark').val(res.message.remark);
		            	$("#state").val(res.message.takeStatus);
		            	
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
		            toId: id,
		            oId:oId,
		            courcePrice:$('#price').val(),
		            takeStatus:$("#state").val(),
		            remark:$("#remark").val(),
		        };
		        
		        $.post('updateTakeOrderInfo.action', d, function (res) {
		        	
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
