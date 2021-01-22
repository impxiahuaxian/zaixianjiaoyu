<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.FastOrderTeacher"%>
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
						<a href="javascript:void(0)" class="tab_light">快速请家教</a>
					</dd>
				</dl>
				<div class="@*tab_box*@ list_tb">
					<div>
						<table class="list_table hover_table">
							<thead>
								<tr>
									<th>编号</th>
									<th>家长姓名</th>
									<th>手机号</th>
									<th>微信</th>
									<th>授课科目</th>
									<th>支付金额</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<FastOrderTeacher> fastOrderTeacherList = (List<FastOrderTeacher>)request.getAttribute("fastOrderTeacherList");
							if(fastOrderTeacherList!=null){
								for(int i=0;i<fastOrderTeacherList.size();i++){
									FastOrderTeacher fastOrderTeacher = fastOrderTeacherList.get(i);
							%>
									<tr data-id="63458" class="">
										<td><%=fastOrderTeacher.getFotId() %></td>
										<td><%=fastOrderTeacher.getName() %></td>
										<td>
										<%
										if(fastOrderTeacher.getState()==1||fastOrderTeacher.getState()==2||fastOrderTeacher.getState()==6||fastOrderTeacher.getState()==7){
										%>
											<%=fastOrderTeacher.getPhone().subSequence(0,2)%>********
										<%}else{ %>
											<%=fastOrderTeacher.getPhone()%>
										<%} %>
										</td>
										<td>
										<%
										if(fastOrderTeacher.getState()==1||fastOrderTeacher.getState()==2||fastOrderTeacher.getState()==6||fastOrderTeacher.getState()==7){
										%>
											********
										<%}else{ %>
											<%=fastOrderTeacher.getWxNumber()%>
										<%} %>
										</td>
										<td><%=fastOrderTeacher.getTeachingCourseName()%></td>
										<td><%=fastOrderTeacher.getOrderPrice()%></td>
										<td>
										<%
										int state = fastOrderTeacher.getState();
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
											<span class="blue_link" onclick="fastOrderTeacher_show('<%=fastOrderTeacher.getName() %>','fastOrderTeacherInfo.action','<%=fastOrderTeacher.getFotId() %>','650','650')">
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
				function fastOrderTeacher_show(title, url, id, w, h) {
					layer.open({
					  title:title,
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