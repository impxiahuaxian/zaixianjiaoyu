<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.FastOrderTeacher"%>
<%@page import="com.jiajiao.bean.TakeOrders"%>
<%@page import="com.jiajiao.bean.Orders"%>
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
									<th width="100">家教编号</th>
									<th width="120">家长姓名</th>
									<th width="120">电话</th>
									<th width="100">微信</th>
									<th width="120">区域</th>
									<th width="100">授课地址</th>
									<th width="70">授课科目</th>
									<th width="70">发布时间</th>
									<th width="70">状态</th>
									<th width="100">授课教员</th>
									<th width="200">备注</th>
									<th width="70">操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Orders> orderList = (List<Orders>)request.getAttribute("orderList");
							if(orderList!=null){
								for(int i=0;i < orderList.size();i++){
									Orders order = orderList.get(i);
							%>
								<tr>
									<td><a href="../order/orderInfo.action?oId=<%=order.getoId() %>" target="_blank"> <%=order.getOrderCode() %></a></td>
									<td><u style="cursor:pointer" class="text-primary" onclick="member_show('<%=order.getContactName()%>','memberShow.action','<%=order.getPublisher1()%>','600','600')"><%=order.getContactName() %></u></td>
									<td><%=order.getContactPhone()%></td>
									<td><%=order.getWxNumber()%></td>
									<td><%
									if(order.getAreaId()==1){
									%>
									城厢区
									<%}else if(order.getAreaId()==2){%>
									荔城区
									<%}else if(order.getAreaId()==3){%>
									秀屿区
									<%}else if(order.getAreaId()==4){%>
									涵江区
									<%}else if(order.getAreaId()==5){%>
									仙游县
									<%} %></td>
									<td><%=order.getAddress()%></td>
									<td><%=order.getCourseName() %></td>
									<td><%=order.getPublicTime()%></td>
									<td>
									<%
										int state = order.getOrderStatus();
										if(state==22){ 
										%>
										发布中
										<%}else if(state==23){ %>
										教员申请
										<%}else if(state==24){ %>
										授课中
										<%}else if(state==25){ %>
										已完成
										<%}else if(state==26){ %>
										订单失败
										<%}
										 %>
									</td>
									<td ><u style="cursor:pointer" class="text-primary" onclick="teacher_show('<%=order.getTeacherName()%>','teacherShow.action','<%=order.getTeacherId()%>','600','600')"><%=order.getTeacherName() %></u></td>
									<td class="td-status"><%=order.getRemark() %></td>
									<td class="td-manage">
										<a title="派单" onclick="sendOrder('<%=order.getoId() %>','<%=order.getOrderCode() %>','<%=order.getPublisher1() %>')" href="javascript:;">派单</a>
										<a title="编辑" onclick="member_edit('<%=order.getoId() %>','<%=order.getOrderCode() %>')" href="javascript:;">编辑</a>
										<a title="删除"  href="javascript:;" >删除</a>
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
			1)发布家教需求：<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;1.1 学员发布的家教需求信息都会在这边显示。<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;1.2 后台管理人员发布的家教信息也在显示在这边。后台管理人员通过<font color="red">微信、电话等</font>接收到家教需求信息，需要在发布家教信息中进行发布。<br/>
			2)派单：<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;2.1 后台管理人员通过<font color="red">微信、电话等</font>接收到教员预约家教信息， 可对订单进行派单操作，将该家教订单派发给一位或多位有意向教员。<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;2.2 在派单页面，可以看到该家教需求订单的派单信息。  派发之后，后台管理人员可在教员接单列表中查看到该派发家教信息。<br/>
			3)编辑：<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;3.1  后台管理人员可对该家教需求订单的家长姓名、手机号码、微信号、备注进行修改操作。<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;3.2  备注信息只有后台管理人员能够看到，用于方便记录订单信息各个状态下的情况反馈。<br/>
			4)备注：<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;4.1 如果是快速请家教列表的订单信息，发布后的家教需求订单备注要记录上快速请家教订单的编号。
		</div>
		
		<!--添加用户图层-->
		<div class="add_menber" id="add_menber_style" style="display:none">
			<ul class=" page-content">
				<li><label class="label_name">家长姓名：</label><span class="add_name"><input id="contactName" name="家长姓名" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">手机号码：</label><span class="add_name"><input id="contactPhone" name="手机号码" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">微信号：</label><span class="add_name"><input id="wxNumber" name="微信号" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				
				<li class="adderss"><label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label><span class="add_name"><textarea id="remark" name="备注" style="width: 600px;height: 100px;"></textarea></span>
					<div class="prompt r_f"></div>
				</li>
				
			</ul>
		</div>
		
		
		<!--派单图层-->
		<div id="take_order_style" style="display: none">
			<ul class=" page-content">
				<li style="margin-bottom: 20px; margin-top: 30px;">
					<label class="label_name">
						教员编号：
					</label>
					<span class="add_name"><input id="teacherId" name="教员编号"
							type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li>
					<label class="label_name">
						教员姓名：
					</label>
					<span class="add_name"><input id="teacherName" name="教员姓名"
							type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
			</ul>
			<div>
				<div style="margin: 20px 15px 20px"><h3>接单教员：</h3></div>
				<div id="takeOrderTeacherList" name="takeOrderTeacherList" style="margin: 10px 15px 20px"></div>
			</div>
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
	function member_edit(id,orderCode) {
		layer.open({
			type: 1,
			title: '学员家教需求订单（编号：'+orderCode+'）',
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
		       
		        $.post('orderInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#contactName').val(res.message.contactName);
		            	$('#contactPhone').val(res.message.contactPhone);
		            	$('#wxNumber').val(res.message.wxNumber);
		            	$("#remark").val(res.message.remark);
		            	
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
		            oId:id,
		            contactName:$('#contactName').val(),
		            contactPhone:$("#contactPhone").val(),
		            wxNumber:$('#wxNumber').val(),
		            remark:$("#remark").val(),
		        };
		        
		        $.post('updateOrderInfo.action', d, function (res) {
		        	
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
	
	
	/*派单列表*/
	function sendOrder(id,orderCode,memberId) {
	
		layer.open({
			type: 1,
			title: '学员家教需求订单（编号：'+orderCode+'）',
			maxmin: true,
			shadeClose: false, //点击遮罩关闭层
			area: ['650px', '500px'],
			content: $('#take_order_style'),
			btn: ['提交', '取消'],
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
		       
		        $.post('takeOrderInfoList.action', d, function (res) {
		            
		            for(var i = 0; i < res.message.length; ++i){
                		$("#takeOrderTeacherList").append(res.message[i].teacherId+
                			"&nbsp;&nbsp;&nbsp;&nbsp;"+res.message[i].teacherName+
                				"&nbsp;&nbsp;&nbsp;&nbsp;"+res.message[i].courcePrice+
                					"元/小时&nbsp;&nbsp;&nbsp;&nbsp;"+res.message[i].takeTime+
                						"&nbsp;&nbsp;&nbsp;&nbsp;");
                		if(res.message[i].takeStatus==1){
                			$("#takeOrderTeacherList").append("待支付"+"<br/>");
                		}else if(res.message[i].takeStatus==2){
                			$("#takeOrderTeacherList").append("已支付"+"<br/>");
                		}else if(res.message[i].takeStatus==3){
                			$("#takeOrderTeacherList").append("试授课中"+"<br/>");
                		}else if(res.message[i].takeStatus==4){
                			$("#takeOrderTeacherList").append("已完成"+"<br/>");
                		}else if(res.message[i].takeStatus==5){
                			$("#takeOrderTeacherList").append("退款中"+"<br/>");
                		}else if(res.message[i].takeStatus==6){
                			$("#takeOrderTeacherList").append("预约失败"+"<br/>");
                		}
                						
            		}
            		
		        });

  			},
			yes: function(index, layero) {
				var d = {
		            IsAsync: true,
		            oId:id,
		            teacherId:$('#teacherId').val(),
		            memberId:memberId,
		            teacherName:$("#teacherName").val()
		        };
		        
		        $.post('sendOrder.action', d, function (res) {
		        	
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
					
			},
			cancel: function(){ 
			    $("#takeOrderTeacherList").empty();
			}
			
		});
	}
	
	laydate({
		elem: '#start',
		event: 'focus'
	});
</script>
