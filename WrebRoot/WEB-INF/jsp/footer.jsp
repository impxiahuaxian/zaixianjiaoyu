<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="clearfix d_link min_1200">
			<div class="clearfix w_1200 d_link">
				<div class="d_link_t clearfix">
					<div class="d_link_tel fl">
						<h4>服务热线</h4>
						<p>(工作日9:00~18:00)</p>
						<div class="d orange_text big_num font_34">182-5380-0650</div>
					</div>
					<div class="r_cell">
						<ul class="d_link_ul list_4 fl">
							<li>
								<h4>会员指南</h4>
								<p>
									<a href="<%=basePath %>aboutUs.action" >关于我们</a>
								</p>
								<p>
									<a href="<%=basePath %>iamteacher.action" >我是教员</a>
								</p>
								<p>
									<a href="<%=basePath %>iammember.action" >我是学员</a>
								</p>
								<p>
									<a href="<%=basePath %>disclaimer.action" >免责声明</a>
								</p>
								
							</li>

							<li>
								<h4>帮助中心</h4>
								<p>
									<a href="<%=basePath %>notice/conNoticeList.action?type=1" >通知公告</a>
								</p>
								<p>
									<a href="<%=basePath %>notice/conNoticeList.action?type=2" >学员必读</a>
								</p>
								<p>
									<a href="<%=basePath %>notice/conNoticeList.action?type=3" >教员必读</a>
								</p>
								
							</li>

							<li>
								<h4>支付方式</h4>
								<p>
									<a href="<%=basePath %>notice/noticeInfo.action?nId=30" >在线支付</a>
								</p>
								<p>
									<a href="<%=basePath %>costPage.action" >资费标准</a>
								</p>
								<p>
									<a href="<%=basePath %>notice/noticeInfo.action?nId=29" >退款说明</a>
								</p>
							</li>

							<li>
								<h4>合作</h4>
								<p>
									<a href="<%=basePath %>link.action" rel="nofollow">友情链接</a>
								</p>
								<p>
									<a href="<%=basePath %>announcement.action" rel="nofollow">活动公告</a>
								</p>
							</li>
						</ul>
						<div class="r_cell d_link_wechat">
							<h4>关注微信</h4>
							<p><img src="<%=basePath%>static/img/wechat.jpg" alt="" width="120" height="120"></p>
						</div>
					</div>
				</div>
				<!--end一行-->
				<div class="d_link_city">
					<h4 class="fl">版权所有</h4>
					<div class="r_cell">
						<!-- <a href="#" rel="nofollow">上海家教</a> -->
						
					</div>
				</div>
				<!--end热门城市-->
			</div>
		</div>
		<!--end链接-->

<!--返回顶部-->
<div class="ftool_top">
	<a href="#" class="top_ftoolab transition_a" id="ftoolTop" style="display: none;">
		
	</a>
	
</div>
<!--返回顶部-->





  </body>
</html>
