<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.District"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
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
						<a href="javascript:void(0)" class="tab_light">我预约的教员</a>
					</dd>
				</dl>
				<div class="@*tab_box*@ list_tb">
					<div>
						<table class="list_table hover_table">
							<thead>
								<tr>
									<th>教员编号</th>
									<th>教员姓名</th>
									<th>预约科目</th>
									<th>预约时间</th>
									<th>预约状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<%
							String teacherName = "";
                            String teacher_Id = "";
							List<MemberOrderTeacher> memberOrderTeacherList = (List<MemberOrderTeacher>)request.getAttribute("memberOrderTeacherList");
							if(memberOrderTeacherList!=null){
								for(int i=0;i<memberOrderTeacherList.size();i++){
									MemberOrderTeacher orderTeacher = memberOrderTeacherList.get(i);
							%>
									<%
			                            
			                            if(!"".equals(orderTeacher.getTeacherName())){
			                            	teacherName = orderTeacher.getTeacherName().substring(0,1)+"教师";
			                            	teacher_Id = ""+orderTeacher.getTeacherId();
			                            }
			                         %>
									<tr  class="">
										<td>
											<span class="blue_link">
	                                    		<a target="_blank" href="../teacher/teacherInfoPage.action?tId=<%=orderTeacher.getTeacherId() %>"><%=teacher_Id %></a>
	                                		</span>
										</td>
										<td>
										<%=teacherName %>
										</td>
										<td><%=orderTeacher.getTeachingCourseName() %></td>
										<td>
											<span class="data_2">
	                                    		<%=orderTeacher.getPublicTime().subSequence(0,10) %>
	                                    		<p><%=orderTeacher.getPublicTime().subSequence(10,18) %></p>
	                                		</span>
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
										<%}else if(state==6 || state==7){ %>
										预约失败
										<%} %>
										</td>
										<td>
											<span class="blue_link">
	                                    		<a target="_blank" href="<%=basePath %>teacher/teacherInfoPage.action?tId=<%=orderTeacher.getTeacherId() %>" class="btndel">查看</a>
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
		</div>
		<!--end一行-->

<jsp:include page="../footer.jsp"></jsp:include>