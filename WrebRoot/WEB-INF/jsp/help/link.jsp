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
		<a href="javascript:void(0)">首页</a><span class="china">&gt;</span>关于我们
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
			<li class="">
				<a href="disclaimer.action">免责说明</a>
			</li>
			<li class="">
				<a href="announcement.action">活动公告</a>
			</li>
			<li class="light">
				<a href="link.action">友情链接</a>
			</li>
		</ul>
	</div>

	<!--end左边-->
	<div class="r_cell help_r">
		<h4 class="th_line_c">
			友情链接
		</h4>
		<div class="r_cell box_r">

			<dl class="admin_dl clearfix admin_dl_fill" style="width: 80%">
				<dt>
					<div class="t round_m">
						<span class="fl"><label for="webName">
								网站名称
							</label> </span>
						<div class="r_cell">
							<input type="text" class="fill_text_no" id="webName"
								name="webName" placeholder="网站名称">
						</div>
					</div>
					<div class="t round_m">
						<span class="fl"><label for="webUrl">
								网站链接
							</label> </span>
						<div class="r_cell">
							<input type="text" class="fill_text_no" id="webUrl" name="webUrl"
								placeholder="网站链接">
						</div>
					</div>
					<div class="t round_m">
						<span class="fl"><label for="webDescribe">
								网站描述
							</label> </span>
						<div class="r_cell">
							<textarea cols="50" rows="5" class="fill_text_no" id="webDescribe"
								name="webDescribe" placeholder="网站描述"></textarea>
						</div>
					</div>
					<div class="t round_m">
						<span class="fl"><label for="contactName">
								联系人
							</label> </span>
						<div class="r_cell">
							<input type="text" class="fill_text_no" id="contactName" name="contactName"
								placeholder="联系人">
						</div>
					</div>
					<div class="t round_m">
						<span class="fl"><label for="webPhone">
								联系电话
							</label> </span>
						<div class="r_cell">
							<input type="text" class="fill_text_no" id="webPhone" name="webPhone"
								placeholder="联系电话">
						</div>
					</div>
				</dt>
				<dd style="text-align: center;">
					<input type="button" id="btnPubLinkInfo" style="width: 35%;"
						class="round_m transition_a login_btn" value="提交">
				</dd>
			</dl>
		</div>
	</div>
	<!--end右边-->
</div>
<!--end中间区域-->
<script>

    $('#btnPubLinkInfo').click(function () {
        var webName = $.trim($("#webName").val());
        var webUrl = $.trim($("#webUrl").val());
        var webDescribe = $.trim($("#webDescribe").val());
        var contactName = $.trim($("#contactName").val());
        var webPhone = $.trim($("#webPhone").val());
        
        if (webName == '') {
            alert('请输入网站名称');
            return false;
        }
        
        if (webUrl == '') {
            alert('请输入网站链接');
            return false;
        }
        
        if (webDescribe == '') {
            alert('请输入网站描述');
            return false;
        }
        
        if (contactName == '') {
            alert('请输入联系人');
            return false;
        }
        
        if (webPhone == '') {
            alert('请输入联系电话');
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
        param.webName = webName;
        param.webUrl = webUrl;
        param.webDescribe = webDescribe;
        param.contactName = contactName;
        param.webPhone = webPhone;
        $.post('<%=basePath%>link/pubLinkInfo.action', param, function (res) {
            if (res.success) {
                alert(res.message);
               // window.location.reload();

            } else {
                alert(res.message);
            }
        });
    });
</script>
<jsp:include page="../footer.jsp"></jsp:include>
