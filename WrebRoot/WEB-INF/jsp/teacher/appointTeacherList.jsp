<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.TakeOrders"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Teacher teacher = (Teacher) session.getAttribute("teacher");
	if(teacher==null){
		response.sendRedirect(basePath);
		return ;
	}
%>
<jsp:include page="header.jsp"></jsp:include>  

			<!--end一行的左-->
			<div class="r_cell box_r">

				<dl class="tab_nav r_tab_nav">
					<dd>
						<a href="javascript:void(0)" class="tab_light">预约我的学员</a>
						<a  href="<%=basePath %>teacher/takeOrdersList.action" >我预约的家教</a>
					</dd>
				</dl>
				<div class="@*tab_box*@ list_tb">
					<div>
						<table class="list_table hover_table">
							<thead>
								<tr>
									<th>编号</th>
									<th>学员姓名</th>
									<th>预约科目</th>
									<th>授课区域</th>
									<th>授课地址</th>
									<th>支付金额</th>
									<th>预约状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							
							<%
							List<MemberOrderTeacher> memberOrderTeacherList = (List<MemberOrderTeacher>)request.getAttribute("memberOrderTeacherList");
							if(memberOrderTeacherList!=null){
								for(int i=0;i<memberOrderTeacherList.size();i++){
									MemberOrderTeacher orderTeacher = memberOrderTeacherList.get(i);
							%>
									<tr data-id="63458" class="">
										<td><%=orderTeacher.getMosId() %></td>
										<td><%=orderTeacher.getName() %></td>
										<td><%=orderTeacher.getTeachingCourseName() %></td>
										<td><%
									if(orderTeacher.getAreaId()==1){
									%>
									城厢区
									<%}else if(orderTeacher.getAreaId()==2){%>
									荔城区
									<%}else if(orderTeacher.getAreaId()==3){%>
									秀屿区
									<%}else if(orderTeacher.getAreaId()==4){%>
									涵江区
									<%}else if(orderTeacher.getAreaId()==5){%>
									仙游县
									<%} %></td>
										<td><%=orderTeacher.getAddress()%></td>
										<td>
											<%=orderTeacher.getPrice() %>
										</td>
										<td>
										<%
										int state = orderTeacher.getState();
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
										<td>
											<span class="blue_link" onclick="memberOrderTeacher_show('<%=orderTeacher.getName() %>','memberOrderTeacherInfo.action','<%=orderTeacher.getMosId() %>','600','600')">
	                                    		<a href="javascript:void(0)"  class="btndel">查看</a>
	                         	       		</span>
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
				<!--end标签内容-->

			</div>
			<!--end一行的右-->

			<script>
				/*学员用户-查看*/
				function memberOrderTeacher_show(title, url, id, w, h) {
					layer.open({
					  type: 2, 
					  content: url+'?id='+id,
					  area: [w, h] ,
					  offset: '200px'
					}); 
				}
				
			</script>

			<!--end一行的右-->
		</div>
		<!--end一行-->


<jsp:include page="footer.jsp"></jsp:include>   