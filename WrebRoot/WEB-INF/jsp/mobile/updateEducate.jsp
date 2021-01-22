<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
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
			【吉师家教】教师个人中心
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
				<a href="javascript:history.go(-1);" class="fh">
					返回
				</a>
				个人教育信息
			</h3>
		</header>
		
		<!--end header-->
		<!-- 中间 -->
		<!-- 一行 -->
		<div class="wpbox">
			<div class="dtlist">
				
				<div class="dtitem">
					<div class="dl">
						<div class="dt">
							就读学校
						</div>
						<div class="dd">
							<input type="text" id="School" value="<%=teacher.getSchool() %>" placeholder="请输入就读学校" class="dtint ui-autocomplete-input"
							autocomplete="off">
						</div>
						<i class="cleardtint">
						</i>
					</div>
				</div>
				<div class="dtitem">
					<div class="dl">
						<div class="dt">
							就读专业
						</div>
						<div class="dd">
							<input type="text" id="Major" value="<%=teacher.getProfessional() %>" placeholder="请输入就读专业名称"
							class="dtint">
						</div>
						<i class="cleardtint">
						</i>
					</div>
				</div>
				
				<div class="dtitem">
					<div class="selint dl">
						<div class="dt">
							最高学历
						</div>
						<div class="dd">
						<%
						String educationName = "";
						String education = "";
						if(teacher.getEducationName()!=null){
							educationName = teacher.getEducationName();
							education = ""+teacher.getEducation();
						}
						%>
							<input type="text" value="<%=educationName %>" placeholder="请选择" class="selint_label dtint">
							<input type="hidden" id="TopDegree"  value="<%=education %>" class="selint_label2 dtint">
						</div>
						<i class="selgt">
						</i>
						<select class="selint_select">
						<%
						List<DictInfo> muqianxueDictList = (List<DictInfo>)request.getAttribute("muqianxueDictList");
						if(muqianxueDictList!=null){
							for(int i = 0; i < muqianxueDictList.size();i++){
								DictInfo dictInfo = muqianxueDictList.get(i);
						%>
							<option value="<%=dictInfo.getDictId() %>">
							<%=dictInfo.getContent() %>
							</option>
						<%
							}
						}
						%>
						</select>
					</div>
				</div>
				<div class="dtitem">
					<div class="selint dl">
						<div class="dt">
							现有身份
						</div>
						<div class="dd">
						<%
						String identityName = "";
						String identity = "";
						if(teacher.getIdentityName()!=null){
							identityName = teacher.getIdentityName();
							identity = ""+teacher.getIdentity();
						}
						%>
							<input type="text"  value="<%=identityName %>" placeholder="请选择" class="selint_label dtint">
							<input type="hidden" id="Identity" value="<%=identity %>"   class="selint_label2 dtint">
						</div>
						<i class="selgt">
						</i>
						<select class="selint_select">
							<%
						List<DictInfo> sfDictList = (List<DictInfo>)request.getAttribute("sfDictList");
						if(sfDictList!=null){
							for(int i = 0; i < sfDictList.size();i++){
								DictInfo dictInfo = sfDictList.get(i);
						%>
							<option value="<%=dictInfo.getDictId() %>">
							<%=dictInfo.getContent() %>
							</option>
						<%
							}
						}
						%>
						</select>
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

$(function(){ 

	var $$ = document.querySelectorAll.bind(document);
	var ForEach = function (array, fn) {
	    [].forEach.call(array, fn);
	};
	
	function closest(el, selector) {
	    const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector;
	
	    while (el) {
	        if (matchesSelector.call(el, selector)) {
	            return el;
	        } else {
	            el = el.parentElement;
	        }
	    }
	    return null;
	}
	
	
// select
    ForEach($$(".selint_select"), function (el) {
        if (el.id != 'RsumeStatus') {
            el.addEventListener("change", function () {
                var selint = closest(this, ".selint"),
                    selintLabel = selint.querySelector(".selint_label");
                    selintLabel2 = selint.querySelector(".selint_label2");
                if (selintLabel.nodeName == "INPUT") {
                    selintLabel.value = this.options[this.options.selectedIndex].text;
                    selintLabel2.value = this.options[this.options.selectedIndex].value;
                }
            });
        }

    });
});
    // end select
</script>

		<script>
			$("#btnPublish").on("click",
			function() {
				var $this = $(this);
				
				if ($.trim($("#TopDegree").val()) == '') {
					show("请填写最高学历!");
					 return;
				}
				if ($.trim($("#School").val()) == '') {
					show("请填写就读学校!"); 
					return;
				}
				if ($.trim($("#Identity").val()) == '') {
					show("请选择现有身份!"); 
					return;
				}
				if ($.trim($("#Major").val()) == '') {
					show("请填写就读专业!"); 
					return;
				}
				
				var param = {};
				param.education = $.trim($("#TopDegree").val());
				param.school = $.trim($("#School").val());
				param.identity = $.trim($("#Identity").val());
				param.professional = $.trim($("#Major").val());
				$this.text('正在提交中...').attr('disabled', 'disabled');
				$.post('mUpdateEducate.action', param,
				function(res) {
					if (res.success) {
						show(res.message);
	                    window.location.href="mUpdateEducatePage.action";
					} else {
						show(res.message);
						$this.text('提交').attr('disabled', false);
					}
				});
			});
		</script>
		    <script src="<%=basePath %>static/mobile/js/tool.js"></script>
	</body>

</html>
