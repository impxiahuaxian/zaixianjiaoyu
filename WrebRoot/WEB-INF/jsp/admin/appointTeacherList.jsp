<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
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
									<th width="120">学员姓名</th>
									<th width="120">教员姓名</th>
									<th width="100">授课科目</th>
									<th width="120">授课区域</th>
									<th width="180">授课地址</th>
									<th width="130">发布时间</th>
									<th width="70">状态</th>
									<th width="180">备注</th>
									<th width="80">金额</th>
									<th width="70">操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<MemberOrderTeacher> memberOrderTeacherList = (List<MemberOrderTeacher>)request.getAttribute("memberOrderTeacherList");
							if(memberOrderTeacherList!=null){
								for(int i=0;i < memberOrderTeacherList.size();i++){
									MemberOrderTeacher memberOrderTeacher = memberOrderTeacherList.get(i);
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=memberOrderTeacher.getMosId() %></td>
									<td><u style="cursor:pointer" class="text-primary" onclick="member_show('<%=memberOrderTeacher.getName() %>','memberShow.action','<%=memberOrderTeacher.getMemberId() %>','500','400')"><%=memberOrderTeacher.getName() %></u></td>
									<td><u style="cursor:pointer" class="text-primary" onclick="teacher_show('<%=memberOrderTeacher.getTeacherName() %>','teacherShow.action','<%=memberOrderTeacher.getTeacherId()%>','600','600')"><%=memberOrderTeacher.getTeacherName() %></u></td>
									<td><%=memberOrderTeacher.getTeachingCourseName() %></td>
									<td><%
									if(memberOrderTeacher.getAreaId()==1){
									%>
									城厢区
									<%}else if(memberOrderTeacher.getAreaId()==2){%>
									荔城区
									<%}else if(memberOrderTeacher.getAreaId()==3){%>
									秀屿区
									<%}else if(memberOrderTeacher.getAreaId()==4){%>
									涵江区
									<%}else if(memberOrderTeacher.getAreaId()==5){%>
									仙游县
									<%} %></td>
									<td class="text-l"><%=memberOrderTeacher.getAddress() %></td>
									<td><%=memberOrderTeacher.getPublicTime()%></td>
									<td>
									<%
										int state = memberOrderTeacher.getState();
										if(state==1){ 
										%>
										预约中
										<%}else if(state==2){ %>
										学员联系中
										<%}else if(state==3){ %>
										教员联系中
										<%}else if(state==4){ %>
										试授课中
										<%}else if(state==5){ %>
										已完成
										<%}else if(state==6){ %>
										预约失败
										<%}else if(state==7){ %>
										 退款中
										<%} %>
									</td>
									<td class="td-status"><%=memberOrderTeacher.getRemark() %></td>
									<td class="td-price"><%=memberOrderTeacher.getPrice() %></td>
									<td class="td-manage">
										<a title="编辑" onclick="member_edit('<%=memberOrderTeacher.getMosId() %>')" href="javascript:;" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
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
		1) 注册学员在找老师页面进行预约的教员信息都会在这边显示。<br/>
		2) 后台管理人员联系学员（电话、微信等）咨询具体的家教需求，<font color="red">并在备注中写上具体的家教需求</font>，更改预约状态为<font color="red">学员联系中</font>。<br/>
		3) 后台管理人员联系教员（电话、微信等）咨询是否有满足该家教订单需求以及是否有意向接单。<br/>
		4) 待该教员支付完成后，编辑该预约信息的状态为<font color="red">教员联系中。(此时，教员可以查看到本次预约信息的联系电话等信息)</font><br/>
		5) 教员在规定时间内自行联系学员（电话、微信等），确认试授课时间，<font color="red">并与本平台客服人员反馈结果。</font><br/>
		6) 若反馈结果学员觉得教员试授课满意，编辑该预约信息的状态为<font color="red">已完成</font><br/>
		</div>
		
		
		<!--添加用户图层-->
		<div class="add_menber" id="add_menber_style" style="display:none">
					
			<ul class=" page-content">
				<li><label class="label_name">学员姓名：</label><span class="add_name"><input id="name" value="" name="学员姓名" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">教员编号：</label><span class="add_name"><input id="teacherId" name="教员编号" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
					<span class="add_name">
     				<label><input name="form-field-radio" type="radio" class="ace" value="1"><span class="lbl">先生</span></label>&nbsp;&nbsp;&nbsp;
					<label><input name="form-field-radio" type="radio" class="ace" value="0"><span class="lbl">女士</span></label>&nbsp;&nbsp;&nbsp;
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">支付金额：</label><span class="add_name"><input id="price" name="支付金额" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">授课区域：</label>
					<span class="add_name">
						<select id="areaId" name="授课区域" style=" width:170px">
							<option  value ="1">城厢区</option>
							<option  value ="2">荔城区</option>
							<option  value ="3">秀屿区</option>
							<option  value ="4">涵江区</option>
							<option  value ="5">仙游县</option>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">预约状态：</label>
					<span class="add_name">
						<select id="state"  name="预约状态" style=" width:170px">
							<option  value ="1">预约中</option>
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
				<li class="adderss"><label class="label_name">授课住址：</label><span class="add_name"><input id="address" name="授课住址" type="text"  class="text_add" style=" width:350px"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li class="adderss"><label class="label_name">备注：</label><span class="add_name"><textarea id="remark" name="备注" style="width: 600px;height: 100px;"></textarea></span>
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
						"aTargets": [0,2,3,4, 6,9, 10,11]
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
	function member_edit(id) {
		layer.open({
			type: 1,
			title: '预约教员信息编辑',
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
		       
		        $.post('../orderTeacherInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#name').val(res.message.name);
		            	$('#teacherId').val(res.message.teacherId);
		            	$('#price').val(res.message.price);
		            	$('#address').val(res.message.address);
		            	$('#remark').val(res.message.remark);
		            	
		            	if(1==res.message.gender){
		            		$("input[name='form-field-radio']").get(0).checked=true;
		            	}else{
		            		$("input[name='form-field-radio']").get(1).checked=true;
		            	}
		            	
		            	$("#areaId").val(res.message.areaId);
		            	$("#state").val(res.message.state);
		            	
		            } else {
		            	alert(res.message);
		            	
		            }
		        });


  			},
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
				
					var d = {
			            IsAsync: true,
			            mosId: id,
			            name:$('#name').val(),
			            gender:$("input[name='form-field-radio']:checked").val(),
			            teacherId:$('#teacherId').val(),
			            price:$('#price').val(),
			            areaId:$("#areaId").val(),
			            state:$("#state").val(),
			            address:$("#address").val(),
			            remark:$("#remark").val(),
		
			        };
			        $.post('../updateOrderTeacherInfo.action', d, function (res) {
			        	
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
			}
		});
	}
	
	laydate({
		elem: '#start',
		event: 'focus'
	});
</script>
