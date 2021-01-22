<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
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
    <h4 class="r_th_y"><b>个人中心首页</b></h4>

    <dl class="tearch_1 clearfix">
        <dt class="fr">
                <a  href="javascript:void(0);" class="round_m btn_40 btn_border_orange m_r">
                    请完善个人信息！
                </a>
        </dt>
        <dd class="r_cell font_16">
            您当前接到家教的概率：
            <span class="step_o round_m">
                    <span class="round_m step_i w_40"></span>
                                            </span>
                <b class="red_text font_14">低</b>
        </dd>
    </dl>


    <div class="clearfix tearch_step">
        <h4 class="r_th_y"><b>快速接到家教的技巧</b></h4>
       	<div style="margin-top: 25px;">
       	<h2 style="color:#31ab68;font-weight:bold ">1. 加微信，随时接单</h5>
       	<p style="font-size: 18px;margin-top: 10px">扫一扫，加好友，及时查看家教订单，接单快人一步！还可随时申请订单。<img style="margin-top: -50px;margin-left: 10px;" width="100px" height="100px" src="<%=basePath %>static/img/wechat.jpg"/></p>
       	</div>
       	<div  style="margin-top: 25px;">
       	<h2 style="color:#31ab68;font-weight:bold ">2. 上传形象照，更出彩</h5>
       	<p style="font-size: 18px;margin-top: 10px">阳光、健康、专业的形象照，增加您的第一印象分，让家长一眼就选定你，马上动手吧。</p>
       	</div>
       	<div  style="margin-top: 25px;">
       	<h2 style="color:#31ab68;font-weight:bold ">3. 简历详尽，突出优势</h5>
       	<p style="font-size: 18px;margin-top: 10px;margin-bottom: 15px;">尽量将您的资料填写详细，并突出您的特长和家教相关经验，以方便家长及家教114工作人员选择、推荐。好的简历，事半功倍，可以大大增加您的接单率！</p>
       		<a style="font-size:20px;color: #999;" href="updateInfoPage.action">修改简历</a>
       	</div>
       	<div  style="margin-top:25px;">
       	<h2 style="color:#31ab68;font-weight:bold ">4. 网上认证，机会更多</h5>
       	<p style="font-size: 18px;margin-top: 10px;margin-bottom: 15px;">请您尽快将证件（如身份证、学生证、毕业证、家教资料证或相关的在职证明等）到网站上传进行身份验证，认证的教员我们将优先推荐家教。</p>
       		<a style="font-size:20px;color: #999;" href="idimgPage.action">身份认证</a>
       	</div>
    </div>
    <!--快速接到家教的技巧-->

    

</div>

        <!--end一行的右-->
    </div>
    <!--end一行-->
    
    
<jsp:include page="footer.jsp"></jsp:include>      