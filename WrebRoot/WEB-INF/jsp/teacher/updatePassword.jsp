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
    <h4 class="r_th_y"><b>密码权限</b></h4>

    

    <dl class="pass_dl clearfix">
        <dt>
            <h5>密码设置：</h5>
            <div class="t">
                <input type="password" id="password1" style="height:55px" class="fill_text round_m" placeholder="请输入新密码">
                <p><input type="password" id="password2" style="height:55px"  class="fill_text round_m" placeholder="请确认新密码"></p>
            </div>
        </dt>
        <dd><a href="javascript:void(0)" id="btnUpdatePwd" class="round_m transition_a login_btn">确定设置</a></dd>
    </dl>

</div>
<!--end一行的右-->

<script>
    

    $('#btnUpdatePwd').click(function () {
        var p1 = $.trim($("#password1").val());
        var p2 = $.trim($("#password2").val());
        if (p1 == '') {
            alert('请输入密码');
            return false;
        }
        if (p1 != p2) {
            alert('两次密码不一致');
            return false;
        }
        $this = $(this);
        var text = $this.text();
        if ($this.hasClass('disabled')) {
            return;
        }

        $this.text('正在提交中...').attr('disabled', 'disabled');
        var param = {
        };
        param.pwd = p1;
        $.post('updatePassword.action', param, function (res) {
            if (res.success) {
                alert(res.message);
                window.location.reload();

            } else {
                alert(res.message);
            }
        });
    });
</script>
        <!--end一行的右-->
    </div>
    <!--end一行-->
    









<jsp:include page="footer.jsp"></jsp:include>   