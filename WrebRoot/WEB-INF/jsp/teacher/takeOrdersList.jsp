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
						<a  href="<%=basePath %>teacher/appointTeacherList.action"  >预约我的学员</a>
						<a href="javascript:void(0)"class="tab_light">我预约的家教</a>
					</dd>
				</dl>
				<div class="@*tab_box*@ list_tb">
					<div>
						<table class="list_table hover_table">
							<thead>
								<tr>
									<th>编号</th>
									<th>联系人</th>
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
							List<TakeOrders> takeOrdersList = (List<TakeOrders>)request.getAttribute("takeOrdersList");
							if(takeOrdersList!=null){
								for(int i=0;i<takeOrdersList.size();i++){
									TakeOrders takeOrders = takeOrdersList.get(i);
							%>
									<tr data-id="63458" class="">
										<td><%=takeOrders.getToId() %></td>
										<%
			                            String contactGender = "先生";
			                            int gender = takeOrders.getContactGender();
			                            if(gender==0){
			                            	contactGender="女士";
			                            }
			                            %>
										<td><%=takeOrders.getContactName().substring(0,1) %><%=contactGender %></td>
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
										<td>
											<%=takeOrders.getCourcePrice() %>
										</td>
										<td>
										<%
										int state = takeOrders.getTakeStatus();
										if(state==1){ 
										%>
										待支付
										<%}else if(state==2){ %>
										已支付
										<%}else if(state==3){ %>
										试授课
										<%}else if(state==4){ %>
										已完成
										<%}else if(state==5){ %>
										退款中
										<%}else if(state==6){ %>
										预约失败
										<%} %>
										</td>
										<td>
											<span class="blue_link" onclick="memberOrder_show('家教订单需求','orderInfo.action','<%=takeOrders.getoId() %>','<%=takeOrders.getToId() %>','800','700')">
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
				function memberOrder_show(title, url, id,toid, w, h) {
					layer.open({
						title:title,
					  type: 2, 
					  content: url+'?id='+id+'&toid='+toid,
					  area: [w, h] ,
					  offset: '200px'
					}); 
				}
				
			</script>

			<!--end一行的右-->
		</div>
		<!--end一行-->


<jsp:include page="footer.jsp"></jsp:include>   