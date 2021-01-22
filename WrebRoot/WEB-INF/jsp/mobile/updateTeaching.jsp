<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.District"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
<%@page import="com.jiajiao.utils.CommonUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Teacher teacher = (Teacher)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect(basePath+"mobile.action");
	return ;
}
List<District> districtList = (List<District>)request.getAttribute("districtList");
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
        <link href="<%=basePath %>static/mobile/css/main.css" rel="stylesheet">
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
        
        <!-- ntextpop -->
        <div class="ntextpop" id="messagebox">
            <span class="ntextpop_content">
            </span>
        </div>
        <!-- end ntextpop -->

        <div class="page1">
            <header>
				<h3>
					<a href="javascript:history.go(-1);" class="fh">
						返回
					</a>
					 授课信息
				</h3>
			</header>
            <!--end header-->
            <!-- 中间 -->
            <!-- 一行 -->
            <div class="wpbox">
                <div class="dtlist">
                    <div class="dtitem">
                        <div class="call-localPop dl">
                            <div class="dt">
                                授课区域
                            </div>
                            <div class="dd">
                            
                            <%
                            String teachingArea = "";
                            
                            String[] teachingAreas = teacher.getTeachingArea().split(",");
                            
                            if(teacher.getTeachingArea().length()!=0){
                            
	                            if(districtList!=null){
	                            	for(int i=0;i<teachingAreas.length;i++){
	                            		for(int j = 0 ; j < districtList.size();j++){
	                            			District district = districtList.get(j);
	                            			 
	                            			if( Integer.parseInt(teachingAreas[i]) == district.getDistrictId() ){
	                            				if(i==teachingAreas.length-1){
	                            					teachingArea+=district.getDistrict();
	                            				}else{
	                            					teachingArea+=district.getDistrict()+",";
	                            				}
	                            				
	                            				break;
	                            			}
	                            		}
	                            	}
	                            }
                            }
                            %>
                                <input type="text" id="AreaId" value="<%=teachingArea %>" area="<%=teacher.getTeachingArea() %>" readonly=""
                                placeholder="请选择" class="dtint">
                            </div>
                            <i class="selgt">
                            </i>
                        </div>
                    </div>
                    <div class="dtitem">
                        <div class="selint dl">
                            <div class="dt">
                                授课科目
                            </div>
                            <div class="dd">
                            <%
                            String teachingCourse = "";
					        if(!teacher.getTeachingCource().equals("")){
						        //所有课程信息
								 String[] coursesId = teacher.getTeachingCource().split(",");
								 
								 List<Course> courseList2 = (List<Course>)request.getAttribute("courseList"); 
								 if(courseList2!=null){
								 	for(int i=0;i<coursesId.length;i++){
									 	String strCourse =  coursesId[i];
									 	for(int j=0;j<courseList2.size();j++){
									 		Course course = courseList2.get(j);
									 		if(course.getCourseId()==Integer.parseInt(strCourse)){
									 			if(i==coursesId.length-1){
									 				teachingCourse+=course.getCourseName();
			                                	}else{
									 				teachingCourse+=course.getCourseName() +",";
                            					}
			               %>
											<%} %>
										<%} %>
									<%} %>
								<%} %>
						    <%} %>
                            
                            
                                <input type="text" id="SubjectId" value="<%=teachingCourse %>" subjectid="<%=teacher.getTeachingCource()%>"
                                kemudalei="<%=teacher.getKeMuDaLei() %>" kemuxiaolei="<%=teacher.getKeMuXiaoLei() %>"
                                readonly="" onclick="setPage(&#39;subject&#39;, &#39;&#39;, &#39;indtype&#39;, &#39;indtypename&#39;, 0, 1)"
                                placeholder="请选择" class="selint_label dtint">
                            </div>
                            <i class="rgt">
                            </i>
                        </div>
                    </div>
                    <div class="dtitem">
                        <div class="call-schedulePop dl">
                            <div class="dt">
                                授课时间
                            </div>
                            <div class="dd">
                            	<%
                            	String teachingDay = "";
                            	
                        		String[] teacherDays = teacher.getTeachingTime().split(",");
                        		
                        		if(teacher.getTeachingTime().length()!=0){
                        		
	                        		for(int j=0;j<teacherDays.length;j++){
	                        			teachingDay +=CommonUtil.getTeacherTime(teacherDays[j])+",";
	                        		} 
                        		}
                        		%>
                                <input type="text" id="TeachDate" value="<%=teachingDay %>"
                                teachid="<%=teacher.getTeachingTime() %>" readonly="" placeholder="请选择"
                                class="dtint">
                            </div>
                            <i class="selgt">
                            </i>
                        </div>
                    </div>
                    <div class="dtitem">
                        <div class="dl">
                            <div class="dt">
                                薪  酬
                            </div>
                            <div class="dd" id="Salary">
                             <input type="number" value="<%=teacher.getCoursePrice() %>"  id="SalaryMin" class="sm_dtint"
                             onkeyup="if (this.value.length == 1) {this.value = this.value.replace(/[^1-9]/g, &#39;&#39;)} else {this.value = this.value.replace(/\D/g, &#39;&#39;)}"
                             >
                                        
                                        元/小时
                            </div>
                        </div>
                    </div>

                    <div class="dtitem">
                        <div class="dl">
                            <div class="dt">
                                上课方式
                            </div>
                            <div class="dd">
                                <ul class="dtspanselabel">
                                <%
                                
                                String[] teachingWay = teacher.getTeachingWay().split(",");
                                
                                List<DictInfo> shoukefangshiList = (List<DictInfo>)request.getAttribute("shoukefangshiList");
                                if(shoukefangshiList!=null){
                                	for(int i = 0 ; i < shoukefangshiList.size(); i++){
                                		DictInfo sk = shoukefangshiList.get(i);
                                		if( ArrayHelper.inArray(teachingWay,""+sk.getDictId()) ){
                                %>
                                	<li data-id="<%=sk.getDictId() %>" class="che classmode"><%=sk.getContent()%></li>
                                <%
                                		}else{
                                %>
                                	<li data-id="<%=sk.getDictId() %>" class="classmode"><%=sk.getContent()%></li>
                                <%
                                		}
                                	}
                                }
                                %>
                                </ul>
                            </div>
                        </div>
                    </div>
                 
                    <div class="dtitem">
                        <div class="dl">
                            <div class="dt">
                                所获证书
                            </div>
                            <div class="dd">
                                <input type="text" value="<%=teacher.getCertificate() %>" id="certificate" placeholder="示例：大学六级英语/雅思8.0分" class="dtint">
                            </div>
                            <i class="cleardtint">
                            </i>
                        </div>
                    </div>
                    <div class="dtitem">
                        <div class="selint dl">
                            <div class="dt">
                                教  龄
                            </div>
                            <div class="dd">
                                <input type="text" id="TeachYears" value="<%=teacher.getTeachingAge() %>年" placeholder="请选择教龄" class="selint_label dtint">
                            </div>
                            <i class="selgt">
                            </i>
                            <select class="selint_select">
                                <option value="0" selected="&#39;selected&#39;">
                                    0年
                                </option>
                                <option value="1">
                                    1年
                                </option>
                                <option value="2">
                                    2年
                                </option>
                                <option value="3">
                                    3年
                                </option>
                                <option value="4">
                                    4年
                                </option>
                                <option value="5">
                                    5年
                                </option>
                                <option value="6">
                                    6年
                                </option>
                                <option value="7">
                                    7年
                                </option>
                                <option value="8">
                                    8年
                                </option>
                                <option value="9">
                                    9年
                                </option>
                                <option value="10">
                                    10年
                                </option>
                                <option value="11">
                                    11年
                                </option>
                                <option value="12">
                                    12年
                                </option>
                                <option value="13">
                                    13年
                                </option>
                                <option value="14">
                                    14年
                                </option>
                                <option value="15">
                                    15年
                                </option>
                                <option value="16">
                                    16年
                                </option>
                                <option value="17">
                                    17年
                                </option>
                                <option value="18">
                                    18年
                                </option>
                                <option value="19">
                                    19年
                                </option>
                                <option value="20">
                                    20年
                                </option>
                                <option value="21">
                                    20年以上
                                </option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="dtitem">
                        <div class="dltop">
                            <div class="dt">
                                教学案例
                            </div>
                        </div>
                        <div class="db">
                            <textarea id="teachingCase" placeholder="请填写授课描述"
                            class="textint dtint"><%=teacher.getTeachingCase() %></textarea>
                        </div>
                    </div>
                    <div class="dtitem">
                        <div class="dltop">
                            <div class="dt">
                                自我介绍
                            </div>
                        </div>
                        <div class="db">
                            <textarea id="SelfIntroduce" placeholder="展示实力，增加你的魅力！比如你竞赛中获得过什么奖项，取得过什么出色的成绩，有哪些过硬的证书..."
                            class="textint dtint"><%=teacher.getSelfEvaluation() %></textarea>
                        </div>
                    </div>
                </div>
                <div class="ac tipsrow">
                    <i class="light_ntico ntico">
                    </i>
                    10-500字,不要填写电话、QQ、微信等联系方式哦
                </div>
                <div class="submitrow">
                    <button id="btnPublish" class="big_ogbtn">
                        保存
                    </button>
                </div>
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
        <!-- localPop -->
        <div class="bpop" id="localPop">
            <div class="hide-localPop fade_bkbg">
            </div>
            <div class="bpopcontent">
                <ul class="locallistmulity arealist">
               	 <%
               	 	teachingAreas = teacher.getTeachingArea().split(",");
               	 
	                if(districtList != null){
	                	for(int i=0;i<districtList.size();i++){ 
	                		District district = districtList.get(i);
	                		if(ArrayHelper.inArray(teachingAreas,""+district.getDistrictId())){
		                %>
		                		<li data-id="<%=district.getDistrictId() %>" class="sel"><a href="javascript:void(0)" data-id="<%=district.getDistrictId() %>"><%=district.getDistrict() %></a></li>
		                <%		
	                		}else{
	                	%>
	                			<li data-id="<%=district.getDistrictId() %>" ><a href="javascript:void(0)" data-id="<%=district.getDistrictId() %>"><%=district.getDistrict() %></a></li>
	                	<%
	                		}
	                	}
	                }
	              %>
                </ul>
                <div class="bpopcontrol">
                    <a href="javascript:;" class="hide-localPop close_ctlbtn" id="btnClearArea">
                    </a>
                    <a href="javascript:;" class="yes_ctlbtn" id="btnSelectArea">
                    </a>
                </div>
            </div>
        </div>
        <!-- end localPop -->
        <script>
            $("#btnSelectArea").click(function() {
                var text = '';
                var id = '';
                $(".arealist [class=sel]").each(function(index, item) {
                    text += $(item).text() + ",";
                    id += $(item).data('id') + ",";
                });
                $("#AreaId").val(text.trimEnd(','));
                $("#AreaId").data("id", id.trimEnd(','));
                $("#AreaId").attr('area',id.trimEnd(','));

                $("#localPop").removeClass("show");
            });

            $("#btnClearArea").click(function() {
                //$("#schedulePop div.td.checked")
                //$("#localPop li.sel").removeClass("sel");
                $("#localPop").removeClass("show");
            });
        </script>
        <!-- schedulePop -->
        <div class="bpop" id="schedulePop">
            <div class="hide-schedulePop fade_bkbg">
            </div>
            <div class="bpopcontent">
                <ul class="schedulelist">
                    <li>
                        <div class="th">
                            <a href="javascript:void(0)" class="schedulelist_selbtn" id="btnAllSelect">
                                反选
                            </a>
                        </div>
                        <div class="th">上午</div>
                        <div class="th">下午</div>
                        <div class="th">晚上</div>
                    </li>
                    <li>
	                    <% String[] teachingTimes = teacher.getTeachingTime().split(","); %>
                        <div class="th">周一</div>
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"33")){
				        %>
				        <div class="td checked" data-type="1" data-id="33"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="1" data-id="33"><i class="sign"></i></div>
				        <%} %>
                        
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"34")){
				        %>
				        <div class="td checked" data-type="2" data-id="34"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="2" data-id="34"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"35")){
				        %>
				        <div class="td checked" data-type="3" data-id="35"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="3" data-id="35"><i class="sign"></i></div>
				        <%} %>
                    </li>
                    <li>
                        <div class="th"> 周二</div>
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"36")){
				        %>
				        <div class="td checked" data-type="1" data-id="36"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="1" data-id="36"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"37")){
				        %>
				        <div class="td checked" data-type="2" data-id="37"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="2" data-id="37"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"38")){
				        %>
				        <div class="td checked" data-type="3" data-id="38"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="3" data-id="38"><i class="sign"></i></div>
				        <%} %>
                        
                    </li>
                    <li>
                        <div class="th">周三</div>
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"39")){
				        %>
				        <div class="td checked" data-type="1" data-id="39"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="1" data-id="39"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"40")){
				        %>
				        <div class="td checked" data-type="2" data-id="40"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="2" data-id="40"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"41")){
				        %>
				        <div class="td checked" data-type="3" data-id="41"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="3" data-id="41"><i class="sign"></i></div>
				        <%} %>
                        
                    </li>
                    <li>
                        <div class="th">周四</div>
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"42")){
				        %>
				        <div class="td checked" data-type="1" data-id="42"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="1" data-id="42"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"43")){
				        %>
				        <div class="td checked" data-type="2" data-id="43"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="2" data-id="43"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"44")){
				        %>
				        <div class="td checked" data-type="3" data-id="44"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="3" data-id="44"><i class="sign"></i></div>
				        <%} %>
                        
                    </li>
                    <li>
                        <div class="th">周五</div>
                        
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"45")){
				        %>
				        <div class="td checked" data-type="1" data-id="45"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="1" data-id="45"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"46")){
				        %>
				        <div class="td checked" data-type="2" data-id="46"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="2" data-id="46"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"47")){
				        %>
				        <div class="td checked" data-type="3" data-id="47"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="3" data-id="47"><i class="sign"></i></div>
				        <%} %>
                    </li>
                    <li>
                        <div class="th">周六</div>
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"48")){
				        %>
				        <div class="td checked" data-type="1" data-id="48"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="1" data-id="48"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"49")){
				        %>
				        <div class="td checked" data-type="2" data-id="49"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="2" data-id="49"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"50")){
				        %>
				        <div class="td checked" data-type="3" data-id="50"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="3" data-id="50"><i class="sign"></i></div>
				        <%} %>
                    </li>
                    <li>
                        <div class="th">周日</div>
                        <%
				        if(ArrayHelper.inArray(teachingTimes,"51")){
				        %>
				        <div class="td checked" data-type="1" data-id="51"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="1" data-id="51"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"52")){
				        %>
				        <div class="td checked" data-type="2" data-id="52"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="2" data-id="52"><i class="sign"></i></div>
				        <%} %>
				        
				        <%
				        if(ArrayHelper.inArray(teachingTimes,"53")){
				        %>
				        <div class="td checked" data-type="3" data-id="53"><i class="sign"></i></div>
				        <%}else{ %>
				        <div class="td " data-type="3" data-id="53"><i class="sign"></i></div>
				        <%} %>
                    </li>
                </ul>
                <div class="bpopcontrol">
                    <a href="javascript:;" class="hide-schedulePop close_ctlbtn" id="btnClear">
                    </a>
                    <a href="javascript:;" class="yes_ctlbtn" id="btnYes">
                    </a>
                </div>
            </div>
        </div>
        <!-- end schedulePop -->
        <script>
            //
            $("#schedulePop div.td").click(function() {
                if ($(this).hasClass("checked")) {
                    $(this).removeClass("checked");
                } else {
                    $(this).toggleClass("checked");
                }
            });

            $("#btnClear").click(function() {
                $("#schedulePop div.td.checked").removeClass("checked");
                $("#TeachDate").val('');
            });
            $("#btnAllSelect").click(function() {
                $("#schedulePop div.td").toggleClass("checked");
            });

            $("#btnYes").click(function() {
                var text = '',
                ids = '';

                $("#schedulePop li:not(:first)").each(function(index, item) {
                    var label = $($(item).children('div').get(0)).text();
                    if ($(item).children('div').hasClass("checked")) {
                        $(item).children('div').each(function(i, v) {
                            if ($(v).hasClass("checked")) {
                                if ($(v).data('type') == 1) {
                                    label += "上午";
                                } else if ($(v).data('type') == 2) {
                                    label += "下午";
                                } else {
                                    label += "晚上";
                                }
                                ids += ($(v).data('id')) + ",";
                            }
                        });

                        text += label + ",";
                    }
                });
                text = text.trimEnd(',');
                $("#TeachDate").val(text);
                $("#TeachDate").data("id", ids);
                $("#TeachDate").attr("teachid", ids);

                $("#schedulePop").removeClass("show");
            });
        </script>
        <div id="subject" style="display:none;">
            <header class="headbar">
                <div class="headl" onclick="pclose();">
                    <a href="javascript:void(0)" class="heada">
                        <i class="back_hico hico">
                        </i>
                    </a>
                </div>
                <h1 class="headtitle">
                    选择科目
                </h1>
                <div class="headr">
                    <a href="javascript:void(0)" id="btnConfirmSubject" class="headbtn">
                        确定
                    </a>
                </div>
            </header>
            <!--end header-->
            <!-- 中间 -->
            <!-- 一行 -->
            <div class="wpbox">
                <div class="boxmt">
                    <span class="fz24">
                        已选科目：
                    </span>
                    <div class="wbw">
                        <div class="scatelog">
                            <ul class="scatelog_list">
                            <%
					        if(!teacher.getTeachingCource().equals("")){
						        //所有课程信息
								 String[] coursesId = teacher.getTeachingCource().split(",");
								 
								 List<Course> courseList2 = (List<Course>)request.getAttribute("courseList"); 
								 if(courseList2!=null){
								 	for(int i=0;i<coursesId.length;i++){
									 	String strCourse =  coursesId[i];
									 	for(int j=0;j<courseList2.size();j++){
									 		Course course = courseList2.get(j);
									 		if(course.getCourseId()==Integer.parseInt(strCourse)){
							%>
											<li data-kemudalei="<%=course.getKeMuDaLei() %>" data-kemuxiaolei="<%=course.getKeMuXiaoLei() %>" data-id="<%=course.getCourseId() %>"><a href="javascript:void(0)" data-id="<%=course.getCourseId() %>"><%=course.getCourseName() %></a></li>
											<%} %>
										<%} %>
									<%} %>
								<%} %>
						    <%} %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end 一行 -->
            <!-- 一行 -->
            <div class="mb0 wbox">
                <div class="boxmt">
                    <div class="wbw">
                        <h3 class="ogtitle">
                            请选择授课科目
                            <span class="small">
                                （可选择5门）
                            </span>
                        </h3>
                    </div>
                    <a href="javascript:void(0)" class="ogtxt" id="btnClearSubject">
                        <i class="ogclear_smico smico">
                        </i>
                        清空所选
                    </a>
                </div>
                <div id="category" class="category" style="height: 718px;">
                    <div class="category_nav">
                        <div id="categoryNavList" class="category_navlist categoryScorllItem"
                        style="transition-duration: 0ms; transform: translateY(0px);">
                            <ul>
                            
                            <%
		                      List<DictInfo> dictInfoKeMuDaLeiList = (List<DictInfo>)request.getAttribute("dictInfoKeMuDaLeiList");
		                      if(dictInfoKeMuDaLeiList!=null){
								//科目大类列表
								for(int i = 0; i < dictInfoKeMuDaLeiList.size();i++){
									DictInfo dictInfo = dictInfoKeMuDaLeiList.get(i);
									if(i==0){
								%>
								<li class=" cur" data-class=" <%=dictInfo.getDictId() %>"><a href="javascript:void(0)"><%=dictInfo.getContent() %></a></li>
                                
								  <%}else{ %>
								 <li class=" " data-class=" <%=dictInfo.getDictId() %>"><a href="javascript:void(0)"><%=dictInfo.getContent() %></a></li>
								 <%
								 	}
								 } 
							   }
							 %>
                            </ul>
                        </div>
                    </div>
                    <div class="category_content">
                        <div id="categoryCont">
	                        <%
	                        String[] coursesId = teacher.getTeachingCource().split(",");
	                        
				             if(dictInfoKeMuDaLeiList!=null){
				             	for(int i = 0; i < dictInfoKeMuDaLeiList.size();i++){//1 幼儿
				             		DictInfo kemudaleiDict = dictInfoKeMuDaLeiList.get(i);
				            %>
				            	<div data-class=" <%=kemudaleiDict.getDictId() %>" class="categoryitem" style="display: block; transition-duration: 0ms; transform: translateY(0px);">
                                	
				            <%
						            //所有课程信息
						            List<Course> courseList = (List<Course>)request.getAttribute("courseList");
						            //科目小类
				                    List<DictInfo> dictInfoKeMuXiaoLeiList = (List<DictInfo>)request.getAttribute("dictInfoKeMuXiaoLeiList");
				                    
				                    if(dictInfoKeMuXiaoLeiList!=null){
				                    	for(int j=0;j<dictInfoKeMuXiaoLeiList.size();j++){//65 幼儿课程 
						           			DictInfo dictInfo = dictInfoKeMuXiaoLeiList.get(j);
						           			if(dictInfo.getLinkDict()==kemudaleiDict.getDictId()){
				            %>	
				            		<section class="categoryitem_section">
					            		<h3 class="categoryitem_title"><%=dictInfo.getContent() %></h3>
					            		<ul class="categoryitem_list">
					            				<%
					            				for(int k=0;k<courseList.size();k++){
					            					Course course = courseList.get(k);
					            					if(course.getKeMuXiaoLei()==dictInfo.getDictId()&&
					            						course.getKeMuDaLei()==kemudaleiDict.getDictId()){//66==65 2==1
					            						
					            						
					            						if(  ArrayHelper.inArray(coursesId,""+course.getCourseId())   ){
					            				%>
							            				<li data-kemudalei="<%=course.getKeMuDaLei() %>" data-kemuxiaolei="<%=course.getKeMuXiaoLei() %>" data-id="<%=course.getCourseId() %>" class="select"><a href="javascript:void(0)" data-kemudalei="<%=course.getKeMuDaLei() %>" data-kemuxiaolei="<%=course.getKeMuXiaoLei() %>" data-id="<%=course.getCourseId() %>"><%=course.getCourseName() %></a></li>
					            				<%
					            						}else{
					            				%>
					            						<li data-kemudalei="<%=course.getKeMuDaLei() %>" data-kemuxiaolei="<%=course.getKeMuXiaoLei() %>" data-id="<%=course.getCourseId() %>" class=""><a href="javascript:void(0)" data-kemudalei="<%=course.getKeMuDaLei() %>" data-kemuxiaolei="<%=course.getKeMuXiaoLei() %>" data-id="<%=course.getCourseId() %>"><%=course.getCourseName() %></a></li>
					            				<%
					            						}
					            					}
					            				} 
					            				%>
				            				<%
				            				}
				            				%>
				            			</ul>
				            	    </section>
				            			<%
				            			} 
				            			%>
				            		<%			
				            		}
				            		%>
				            	</div>
				            	<%
				            	}
				            	%>
				           	<%
				            } 
				            %>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end 一行 -->
            <!--end 中间-->
        </div>
        <script src="<%=basePath %>static/mobile/js/fun_m.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/datadict_m.js">
        </script>
        <script>
            //选择科目
            $(".categoryitem_list>li").click(function() {
                var _item = this;
                if ($(this).hasClass("select")) {
                    $(this).removeClass("select");
                    $(".scatelog_list>li").each(function(index, item) {
                        if ($(item).data('id') == $(_item).data('id')) {
                            $(item).remove();
                        }
                    });
                } else {
                    if (window.location.href.toLowerCase().indexOf('resume') < 0) {
                        if ($(".categoryitem_list>li.select").length >= 5) {
                            show('最多只能选择5个辅导科目');
                            return;
                        }
                    } else {
                        if ($(".categoryitem_list>li.select").length >= 5) {
                            show('最多只能选择5个辅导科目');
                            return;
                        }
                    }
                    $(this).toggleClass("select");
                    $(".scatelog_list").append('<li data-kemudalei='+$(this).data('kemudalei')+' data-kemuxiaolei='+$(this).data('kemuxiaolei')+' data-id=' + $(this).data('id') + '><a href="javascript:void(0)" data-kemudalei='+$(this).data('kemudalei')+' data-kemuxiaolei='+$(this).data('kemuxiaolei')+' data-id=' + $(this).data('id') + '>' + $(this).text() + '</a></li>');
                }
            });
            //清空所选科目
            $("#btnClearSubject").click(function() {
                $(".categoryitem_list>li.select").removeClass("select");
                $(".scatelog_list>li").remove();
            });
            $(".scatelog_list").on('click', 'li',
            function() {
                var _item = $(this);
                $(".categoryitem_list>li").each(function(index, item) {
                    if ($(item).data('id') == $(_item).data('id')) {
                        $(item).removeClass("select");
                    }
                });
                $(_item).remove();
            });
            //确认所选科目
            $("#btnConfirmSubject").click(function() {
                var text = '',
                ids = '';
                kemudaleis = '';
                kemuxiaoleis = '';
                
                $(".scatelog_list>li").each(function(index, item) {
                    text += $(item).text() + ',';
                    ids += $(item).data('id') + ',';
                    kemudaleis += $(item).data('kemudalei') + ',';
                    kemuxiaoleis += $(item).data('kemuxiaolei') + ',';
                });
                text = text.trimEnd(',');
                $("#SubjectId").val(text);
                $("#SubjectId").data('id', ids);
                $(".subject").text(text);
                $(".subject").attr('id', ids);
                $("#SubjectId").attr('subjectid', ids);
                
                $("#SubjectId").attr('kemudalei', kemudaleis);
                $("#SubjectId").attr('kemuxiaolei', kemuxiaoleis);
                pclose();
            });
        </script>
        <script>
            
            function validateYear(obj) {
                if (!/^\d{4}$/.test(obj.value)) {
                    $(obj).val('');
                    return false;
                }
                return true;
            }

            $("#btnPublish").on("click",
            function() {
                var $this = $(this);
                
                if ($.trim($("#AreaId").val()) == '') {
                    show("请选择授课区域!"); 
                    return;
                }
                if ($.trim($("#SubjectId").val()) == '') {
                    show("请选择授课科目!"); 
                    return;
                }
                if ($.trim($("#TeachDate").val()) == '') {
                    show("请选择授课时间!");
                    return;
                }
				if ($("#SalaryMin").val() == '') {
                    show("请填写完整薪酬标准!");
                    return;
                }
                
                if ($.trim($("#TeachYears").val()) == '') {
                    show("请选择教龄!"); 
                    return;
                }
                
                if ($.trim($("#SelfIntroduce").val()) == '') {
                    show("请输入自我介绍!"); 
                    return;
                }

                var classmode = "";
                $(".classmode.che").each(function() {
                	classmode+=$(this).data('id')+",";
                });
                classmode.trimEnd(",");
                
                $("#saveresumethree").attr("disabled", "disabled");
                var param = {};
                
                param.teachingArea = $.trim($("#AreaId").attr('area'));
                param.teachingCource = $.trim($("#SubjectId").attr('subjectid'));
                param.keMuXiaoLei = $.trim($("#SubjectId").attr('kemuxiaolei'));
                param.keMuDaLei = $.trim($("#SubjectId").attr('kemudalei'));
                param.teachingTime = $.trim($("#TeachDate").attr('teachid'));
                param.coursePrice = $("#SalaryMin").val();
                param.teachingWay = classmode;
                param.certificate = $.trim($("#certificate").val());
                param.teachingAge = $.trim($("#TeachYears").val()).trimEnd('年');
                param.teachingCase = $.trim($("#teachingCase").val());
                param.selfEvaluation = $.trim($("#SelfIntroduce").val());

				console.log(param);

                $this.text('正在提交中...').attr('disabled', 'disabled');
                $.post('mUpdateTeaching.action', param,
                function(res) {
                    if (res.success) {
                        show(res.message);
	                    window.location.href="mUpdateTeachingPage.action";
	                    
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
