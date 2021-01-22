<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.District"%>
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
				<a href="javascript:history.go(-1);" class="fh">
					返回
				</a>
				教员详情
			</h3>
		</header>
        <!-- 中间 -->
        <!-- ubn -->
        <div class="ubn">
            
            <div class="cshowubn">
                <div class="tr">
                    <div class="cshowubn_photo">
                        <span class="cshowubn_photobox">
                        	<%
							if(teacher.getGender()==1 && "".equals( teacher.getPersonImg() ) ){
							%>
							<img src="../static/img/male.png" >
							<%
							}else if(teacher.getGender()==0 && "".equals( teacher.getPersonImg() )){
							%>
							<img src="../static/img/w.png" >
							<%
							}else{
							%>
								<img src="<%=basePath %>static/teacherimg/personphoto/<%=teacher.getPersonImg() %>" >
							<%
							}
							%>
							<%
							if(teacher.getGender()==1){
							%>
                            <i class="male_mico mico"></i>
                            <%
                            }else{
                            %>
                            <i class="female_mico mico"></i>
                            <%
                            } 
                            %>
                        </span>
                    </div>
                    <div class="cshowubn_name">
                        <%=teacher.getTeacherName() %>
                    </div>
                </div>
                <div class="cshowubn_infitm tr">
                    <span class="itm">
                        <i class="whcake_mico mico">
                        </i>
                        <%=teacher.getBirthday() %>
                    </span>
                    <span class="itm">
                        <i class="whlocal_mico mico">
                        </i>
                        <%=teacher.getProvince() %>
                    </span>
                </div>
            </div>
        </div>
        <!-- end ubn -->
        <!-- 一行 -->
        <div class="wpbox">
            <div class="dtlist">
            
            	<div class="dtitem">
                    <a href="javascript:void(0);" class="dl">
                        <div class="dt">
                            真实姓名
                        </div>
                        <div class="dd">
                            <input type="text" id="teacherName" value="<%=teacher.getTeacherName() %>" placeholder="请填写真实姓名" class="dtint">
                        </div>
                        <i class="cleardtint">
                        </i>
                    </a>
                </div>
		        
                <div class="dtitem">
                    <a href="javascript:void(0);" class="dl">
                        <div class="dt">
                            联系电话
                        </div>
                        <div class="dd">
                            <input type="text" id="Mobile" value="<%=teacher.getPhone() %>" disabled="disabled"
                            placeholder="" class="dtint">
                        </div>
                    
                    </a>
                </div>
                
                
	            <div class="dtitem">
		            <div class="dl">
		                <div class="dt">性别</div>
		                <div class="dd" id="sex">
		                <%
		                if(teacher.getGender()==1){
		                %>
		                    <span class="radiospan"><input type="radio" checked="checked" data-id="1" id="male" name="gender" value="1"><label for="male">男</label></span>
		                    <span class="radiospan"><input type="radio" id="female" data-id="0" name="gender" value="0"><label for="female">女</label></span>
		                <%
		                }else{
		                %>
		                	<span class="radiospan"><input type="radio" data-id="1" id="male" name="gender" value="1"><label for="male">男</label></span>
		                    <span class="radiospan"><input type="radio" checked="checked"  id="female" data-id="0" name="gender" value="0"><label for="female">女</label></span>
		                <%
		                }
		                %>

		                </div>
		            </div>
		        </div>
                
                
                <div class="dtitem">
                    <div class="dl">
                        <div class="dt">
                            微信号
                        </div>
                        <div class="dd">
                            <input type="text" id="Wexin" value="<%=teacher.getWxNumber() %>" placeholder="请填写微信号" class="dtint">
                        </div>
                        <i class="cleardtint">
                        </i>
                    </div>
                </div>
                
                <div class="dtitem">
		            <div class="selint dl">
		                <div class="dt">出生日期</div>
		                <div class="dd">
		                    <input type="date" id="birthday" value="<%=teacher.getBirthday() %>" placeholder="请选择" class="selint_label dtint">
		                </div>
		            </div>
		        </div>
                
                
                <div class="dtitem">
		            <div class="call-provincePop dl">
		                <div class="dt">省份/国家</div>
		                <div class="dd"><input type="text" id="Province" value="<%=teacher.getProvince() %>" data-id="" readonly="" placeholder="请选择" class="dtint"></div>
		                <i class="selgt"></i>
		            </div>
		        </div>
		        
                <div class="dtitem">
                    <div class="call-localPop dl">
                        <div class="dt">
                            住址区域
                        </div>
                        <div class="dd">
                        <%
                        String area = "";
                        if(teacher.getArea()!=null){
                        	area = teacher.getArea();
                        }
                        %>
                            <input type="text" id="AreaId" value="<%=area %>" data-id="<%=teacher.getAreaId() %>"  readonly="" placeholder="请选择"
                            class="dtint">
                        </div>
                        <i class="selgt">
                        </i>
                    </div>
                </div>
                <div class="dtitem">
                    <div class="dl">
                        <div class="dt">
                            大概住址
                        </div>
                        <div class="dd">
                            <input type="text" id="Connect_address" value="<%=teacher.getAddress() %>"  placeholder="请输入或定位大概地址" class="dtint">
                        </div>
                        <i class="cleardtint">
                        </i>
                        <i class="oglocal_mico mico">
                        </i>
                    </div>
                </div>
            </div>
            <div class="submitrow">
                <a href="javascript:void(0)" id="btnPublish" class="big_ogbtn">
                    保存
                </a>
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
        
        
        <!-- provincePop -->
		<div class="bpop" id="provincePop">
		    <div class="hide-provincePop fade_bkbg"></div>
		    <div class="bpopcontent">
		        <ul class="bpopcontent_tabhd">
		            <li data-id="1" class="on"><a href="javascript:void(0)">中国</a></li>
		            <li data-id="2"><a href="javascript:void(0)">其他国家</a></li>
		        </ul>
		        <ul class="locallist4 provincelist" id="country1">
		                <li data-id="6"><a href="javascript:void(0)">上海</a></li>
		                <li data-id="7"><a href="javascript:void(0)">北京</a></li>
		                <li data-id="8"><a href="javascript:void(0)">天津</a></li>
		                <li data-id="9"><a href="javascript:void(0)">重庆</a></li>
		                <li data-id="10"><a href="javascript:void(0)">广东</a></li>
		                <li data-id="11"><a href="javascript:void(0)">浙江</a></li>
		                <li data-id="12"><a href="javascript:void(0)">四川</a></li>
		                <li data-id="13"><a href="javascript:void(0)">湖北</a></li>
		                <li data-id="14"><a href="javascript:void(0)">辽宁</a></li>
		                <li data-id="15"><a href="javascript:void(0)">黑龙江</a></li>
		                <li data-id="16"><a href="javascript:void(0)">山东</a></li>
		                <li data-id="17"><a href="javascript:void(0)">吉林</a></li>
		                <li data-id="18"><a href="javascript:void(0)">福建</a></li>
		                <li data-id="19"><a href="javascript:void(0)">河南</a></li>
		                <li data-id="20"><a href="javascript:void(0)">陕西</a></li>
		                <li data-id="21"><a href="javascript:void(0)">江苏</a></li>
		                <li data-id="22"><a href="javascript:void(0)">湖南</a></li>
		                <li data-id="23"><a href="javascript:void(0)">甘肃</a></li>
		                <li data-id="24"><a href="javascript:void(0)">河北</a></li>
		                <li data-id="25"><a href="javascript:void(0)">安徽</a></li>
		                <li data-id="26"><a href="javascript:void(0)">广西</a></li>
		                <li data-id="27"><a href="javascript:void(0)">海南</a></li>
		                <li data-id="28"><a href="javascript:void(0)">内蒙古</a></li>
		                <li data-id="29"><a href="javascript:void(0)">新疆</a></li>
		                <li data-id="30"><a href="javascript:void(0)">山西</a></li>
		                <li data-id="31"><a href="javascript:void(0)">宁夏</a></li>
		                <li data-id="32"><a href="javascript:void(0)">青海</a></li>
		                <li data-id="33"><a href="javascript:void(0)">江西</a></li>
		                <li data-id="34"><a href="javascript:void(0)">云南</a></li>
		                <li data-id="35"><a href="javascript:void(0)">贵州</a></li>
		                <li data-id="36"><a href="javascript:void(0)">西藏</a></li>
		                <li data-id="37"><a href="javascript:void(0)">香港</a></li>
		                <li data-id="38"><a href="javascript:void(0)">澳门</a></li>
		                <li data-id="39"><a href="javascript:void(0)">台湾</a></li>
		        </ul>
		        <ul class="locallist4 provincelist" id="country2" style="display: none;">
		                <li data-id="42"><a href="javascript:void(0)">美国</a></li>
		                <li data-id="43"><a href="javascript:void(0)">俄罗斯</a></li>
		                <li data-id="44"><a href="javascript:void(0)">英国</a></li>
		                <li data-id="45"><a href="javascript:void(0)">德国</a></li>
		                <li data-id="46"><a href="javascript:void(0)">日本</a></li>
		                <li data-id="47"><a href="javascript:void(0)">韩国</a></li>
		                <li data-id="48"><a href="javascript:void(0)">西班牙</a></li>
		                <li data-id="49"><a href="javascript:void(0)">法国</a></li>
		                <li data-id="50"><a href="javascript:void(0)">意大利</a></li>
		        </ul>
		        <div class="bpopcontrol">
		            <a href="javascript:;" class="hide-provincePop close_ctlbtn"></a>
		            <a href="javascript:;" id="btnSelectProvince" class="yes_ctlbtn"></a>
		        </div>
		    </div>
		</div>
		<!-- end provincePop -->
		<script>
		
		    $("#provincePop .bpopcontent_tabhd li").on("click", function () {
		        var $this = $(this);
		        $this.addClass("on").siblings().removeClass("on");
		        if ($this.data("id") == 1) {
		            $("#country1").show();
		            $("#country2").hide();
		        } else {
		            $("#country2").show();
		            $("#country1").hide();
		        }
		    });
		</script>
		<!-- end provincePop -->        
        
        <!-- localPop -->
        <div class="bpop" id="localPop">
            <div class="hide-localPop fade_bkbg">
            </div>
            <div class="bpopcontent">
                <ul class="locallist4 arealist">
                <%
                List<District> districtList = (List<District>)request.getAttribute("districtList");
                if(districtList!=null){
                	for(int i=0;i<districtList.size();i++){
                		District district = districtList.get(i);
                		if( teacher.getAreaId()!=null && teacher.getAreaId()==district.getDistrictId()){
                %>
	               		<li data-id="<%=district.getDistrictId() %>" class="sel"><a href="javascript:void(0)" data-id="<%=district.getDistrictId() %>"><%=district.getDistrict() %></a></li>
                <%
                		}else{
                %>
	                	<li data-id="<%=district.getDistrictId() %>" class=""><a href="javascript:void(0)" data-id="<%=district.getDistrictId() %>"><%=district.getDistrict() %></a></li>
                <%
                		}
                	}
                }
                %>
                </ul>
                <div class="bpopcontrol">
                    <a href="javascript:;" class="hide-localPop close_ctlbtn">
                    </a>
                    <a href="javascript:;" class="yes_ctlbtn" id="btnSelectArea">
                    </a>
                </div>
            </div>
        </div>
        <!-- end localPop -->
    <script>
            $("#btnSelectArea").click(function() {
                var text = $(".arealist [class=sel]").text();
                var id = $(".arealist [class=sel]").data('id');
                
                $("#AreaId").val(text);
                $("#AreaId").data("id", id);
           
                $("#localPop").removeClass("show");
                if (typeof searteacher === 'function') {
                    searteacher();
                }
            });
            
            
                   //选择省份
            $("#btnSelectProvince").click(function () {
                var text = $(".provincelist [class=sel]").text();
                var id = $(".provincelist [class=sel]").data('id');
                $("#Province").val(text);
                $("#Province").data("id", id);

                $("#provincePop").removeClass("show");
            });
            
              $("#TeacherSex span.rdo,#sex span.rdo,#AllowContact span.rdo").click(function () {
                if ($(this).hasClass("on")) {
                    return false;
                } else {
                    $(this).toggleClass("on");
                    $(this).siblings().removeClass("on");
                }
            });
        </script>
      
        <script>
            $("#btnPublish").on("click",
	            function() {
	            	
	                var $this = $(this);
	                
	                if ($.trim($("#teacherName").val()) == '') {
	                    show("请输入真实姓名");
	                    return;
	                }
	                
	                if ($.trim($("#Wexin").val()) == '') {
	                    show("请输入微信号");
	                    return;
	                }
	                
	                if ($.trim($("#birthday").val()) == '') {
	                    show("请输入出生日期");
	                    return;
	                }
	                
	                if ($.trim($("#Province").val()) == '') {
	                    show("请选择省份/国家");
	                    return;
	                }
	                
	                if ($.trim($("#AreaId").val()) == 'null') {
	                    show("请选择住址区域!"); 
	                    return;
	                }
	                
	                if ($.trim($("#AreaId").val()) == '') {
	                    show("请选择住址区域!"); 
	                    return;
	                }
	                
	                if ($.trim($("#Connect_address").val()) == '') {
	                    show("请填写地址!") ;
	                    return;
	                }
	
	                var data = {};
	                data.teacherName = $.trim($("#teacherName").val());
	                data.gender =$('input[name="gender"]').filter(':checked').val(); 
	                data.wxNumber = $.trim($("#Wexin").val());
	                data.birthday = $.trim($("#birthday").val());
	                data.province = $("#Province").val();
	                data.areaId = $("#AreaId").data("id");
	                data.address = $.trim($("#Connect_address").val());
	 
	
	                $this.text('正在提交中...').attr('disabled', 'disabled');
	                $.post('mUpdatePersonal.action', data,
	                function(res) {
	                    if (res.success) {
	                        show(res.message);
	                        
	                        window.location.href="mUpdateTeacherInfoPage.action";
	                    } else {
	                        show(res.message);
	                        $this.text('提交').attr('disabled', false);
	                    }
	                });
	            });
        </script>
        <script src="<%=basePath %>static/mobile/js/tool.js">
        </script>
        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/LCalendar.min.css">
    </body>

</html>