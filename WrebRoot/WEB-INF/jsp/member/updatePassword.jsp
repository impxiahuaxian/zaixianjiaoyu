<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
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
<div class="r_cell box_r">

    <dl class="r_tab_nav"><dd>
        <a href="<%=basePath %>member/updateMemberPage.action">基本信息</a>
        <a href="javascript:void(0)" class="tab_light">密码修改</a>
    </dd></dl>

    <dl class="admin_dl clearfix admin_dl_fill">
        <dt>
            <div class="t round_m">
                <span class="fl"><label for="password1">设置新密码</label></span><div class="r_cell">
                    <input type="password" class="fill_text_no" id="password1" name="password1" placeholder="请输入新密码">
                </div>
            </div>
            <div class="t round_m">
                <span class="fl"><label for="password2">确认新密码</label></span><div class="r_cell">
                    <input type="password" class="fill_text_no" id="password2" name="password2" placeholder="请再次输入新密码">
                </div>
            </div>
        </dt>
        <dd><input type="button" id="btnUpdatePwd" class="round_m transition_a login_btn" value="确定修改"></dd>
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
        param.password = p1;
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

<jsp:include page="../footer.jsp"></jsp:include>
