<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="header.jsp"></jsp:include>


<dl class="w_1200 site_th">
	<dd>
		当前位置：
		<a href="javascript:void(0)">首页</a><span class="china">&gt;</span>我是学员
	</dd>
</dl>

<div class="help_center font_15 w_1200 white_bj">
	<div class="fl help_l">

		<ul class="help_nav nav_ul">
			<li class="">
				<a href="aboutUs.action">关于我们</a>
			</li>
			<li class="">
				<a href="iammember.action">我是学员</a>
			</li>
			<li class="">
				<a href="iamteacher.action">我是教员</a>
			</li>
			<li class="light">
				<a href="disclaimer.action">免责说明</a>
			</li>
			<li class="">
				<a href="announcement.action">活动公告</a>
			</li>
			<li class="">
				<a href="link.action">友情链接</a>
			</li>
		</ul>
	</div>

	<!--end左边-->
	<div class="r_cell help_r">
		<h4 class="th_line_c">
			免责声明
		</h4>
		<br />
		<p style="background: white; line-height: 26px; margin-bottom: 0px;">
			<span
				style="color: rgb(85, 85, 85); font-family: 宋体; font-size: 14px;">&nbsp;
				&nbsp;</span>
		</p>
		<p>
			如发生以下情况，吉师家教不对用户的直接或间接损失承担法律责任:
		</p>
		<br />
		<p>
			1、不可抗力事件导致的服务中断或吉师家教无法控制的原因所导致的用户损失，吉师家教不承担任何责任。
		</p>
		<br />
		<p>
			2、吉师家教系信息服务平台，不保证该等信息的准确性、有效性、及时性或 完整性。提供信息的真实性、合法性等由信息提供者承担相关法律责任。
		</p>
		<br />
		<p>
			3、由于用户将个人注册账号信息告知他人或与他人共享注册帐号，由此导致的任何风险或损失，由用户自行承担。
		</p>
		<br />
		<p>
			4、用户使用吉师家教站（包括链接到第三方网站或自第三方网站链接）而可能产生的计算机病毒、黑客入侵、系统失灵或功能紊乱等导致的用户损失，吉师家教网不承担任何责任。
		</p>
		<br />
		<p>
			5、教师与学员间或与任何第三人间的违约行为、侵权责任等，由有关当事人自行承担法律责任。
		</p>
		<br />
		<p>
			6、吉师家教对于任何信息和其他通信或其他本服务所保留或传输的内容的删
			除或存储失败，不承担任何责任。吉师家教对于那些经过延长期限仍未重新使用的暂停帐户保留取消的权利，并可随时自主决定，发出或无须通知。
		</p>
		<br/>
		<p>
			7、如因系统维护或升级而需要暂停网络服务，吉师家教将尽可能事先在网站进行通知。
		</p>
		<br />
		<p>
			8、吉师家教平台主张次结课时费，若教员与家长之间因协商非次结而导致的 经济纠纷吉师家教平台概不负责。
		</p>
		<br />
		<p>
			9、吉师家教仅负责提供家教信息，不承担家教信息以外的其它责任。
		</p>
		<br/>
		<p>
			10、在本公司同意接家教的在职老师大学生研究生教员即表示同意所有免责条例，公司保留以上条款解释权。
		</p>
		<br />
		<p
			style="background: white; line-height: 26px; text-indent: 25px; margin-bottom: 0px;">
			<br>
		</p>
		<p style="line-height: 26px; margin-bottom: 0px; background: white;">
			<span
				style="color: rgb(85, 85, 85); font-family: 宋体; font-size: 14px;"></span>
		</p>
	</div>
	<!--end右边-->
</div>
<!--end中间区域-->

<jsp:include page="../footer.jsp"></jsp:include>
