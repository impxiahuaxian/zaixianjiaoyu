<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher teacher = (Teacher)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect(basePath+"mobile.action");
	return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
      【吉师家教】修改密码
    </title>

		<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">	 
   
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/css114.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
    name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="email=no">
    <meta name="msapplication-tap-highlight" content="no">
    <script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
    </script>
    <script src="<%=basePath %>static/js/jquery-ui.js">
    </script>
    <script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?20766a1a5bc02124297ce7be22ff84b1";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>
  </head>
  
  <body class="whbg" style="">
    
    <header>
		<h3>
			<a href="javascript:history.back(-1)" class="fh">
				返回
			</a>
			修改密码
			<a href="<%=basePath %>" class="tc">
				最新学员
			</a>
		</h3>
	</header>
    <!--end header-->
    <!-- 一行 -->
    <div class="wpbox">
      <div class="dtlist">
        <div class="dtitem">
          <div class="dl">
            <div class="dt">
              手机号
            </div>
            <div class="dd">
              <input type="text" value="<%=teacher.getPhone() %>" disabled="disabled" placeholder="请填写用户名"
              class="dtint">
            </div>
            <i class="cleardtint">
            </i>
          </div>
        </div>
        <div class="dtitem">
          <div class="dl">
            <div class="dt">
              旧密码
            </div>
            <div class="dd">
              <input type="password" id="Password" placeholder="请输入旧密码" class="dtint">
            </div>
            <i class="cleardtint">
            </i>
          </div>
        </div>
        <div class="dtitem">
          <div class="dl">
            <div class="dt">
              新密码
            </div>
            <div class="dd">
              <input type="password" id="NewPassword" placeholder="请输入新密码，6~12位字母名数字"
              class="dtint">
            </div>
            <i class="cleardtint">
            </i>
          </div>
        </div>
        <div class="dtitem">
          <div class="dl">
            <div class="dt">
              确认新密码
            </div>
            <div class="dd">
              <input type="password" id="NewPasswordConirm" placeholder="请重复输入新密码" class="dtint">
            </div>
            <i class="cleardtint">
            </i>
          </div>
        </div>
      </div>
      <div class="submitrow">
        <button id="btnPublish" class="big_ogbtn">
          保存
        </button>
      </div>
    </div>
    <!-- end 一行 -->
    <!--end 中间-->
    <!-- ntextpop -->
    <div class="ntextpop" id="messagebox">
      <span class="ntextpop_content">
      </span>
    </div>
    <!-- end ntextpop -->
    <script>
      $("#btnPublish").on("click",
      function() {
        var $this = $(this);
        if ($.trim($("#Password").val()) == '') {
          show("请输入旧密码");
          return;
        }
        if ($.trim($("#NewPassword").val()) == '' || $.trim($("#NewPasswordConirm").val()) == '') {
          show("请输入新密码");
          return;
        }
        if ($.trim($("#NewPassword").val()) != $.trim($("#NewPasswordConirm").val())) {
          show("两次输入的密码不一致");
          return;
        }
        var data = {};
        data.password = $.trim($("#Password").val());
        data.newPassword = $.trim($("#NewPassword").val());
        $this.text('正在提交中...').attr('disabled', 'disabled');
        $.post('mUpdatePassword.action', data,
        function(res) {
          if (res.success) {
           	show(res.message);
           	$this.text('密码已修改').attr('disabled', 'disabled');
          } else {
            show(res.message);
            $this.text('提交').attr('disabled', false);
          }
        });
      });
    </script>
    <script src="<%=basePath %>static/mobile/js/tool.js">
    </script>

  </body>

</html>
