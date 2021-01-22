<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.District"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.Orders"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	Member member = (Member) session.getAttribute("member");
	if (member == null) {
		response.sendRedirect(basePath);
		return;
	}
%>

<jsp:include page="header.jsp"></jsp:include>



			<!--end一行的左-->
			<div class="r_cell box_r">

				<dl class="tab_nav r_tab_nav">
					<dd>
						<a href="javascript:void(0)" class="tab_light">我的家教订单</a>
					</dd>
				</dl>
				<div class="@*tab_box*@ list_tb">
					<div>
						<table class="list_table hover_table">
							<thead>
								<tr>
									<th>订单编号</th>
									<th>授课科目</th>
									<th>授课教员</th>
									<th>发布时间</th>
									<th>预约状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Orders> orderList = (List<Orders>)request.getAttribute("orderList");
							if(orderList!=null){
								for(int i=0;i<orderList.size();i++){
									Orders order = orderList.get(i);
							%>
									<tr >
										<td>
											
	                                    <%=order.getOrderCode()%>
	                                
										</td>
										<td><%=order.getCourseName() %></td>
										<td data-id="63458" class="">
											<span class="blue_link">
												<a target="_blank" href="../teacher/teacherInfoPage.action?tId=<%=order.getTeacherId() %>">
													<%=order.getTeacherName() %>
												</a>
											</span>
										</td>
										<td>
											<span class="data_2">
	                                    		<%=order.getPublicTime().substring(0,10) %>
	                                    		<p><%=order.getPublicTime().substring(10,18) %></p>
	                                		</span>
										</td>
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
										<%}%>
										</td>
										<td>
											<span class="blue_link">
	                                    <a href="../order/orderInfo.action?oId=<%=order.getoId() %>" target="_blank" class="btndel">查看</a>
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
			</div>
		</div>
		<!--end一行-->




<jsp:include page="../footer.jsp"></jsp:include>