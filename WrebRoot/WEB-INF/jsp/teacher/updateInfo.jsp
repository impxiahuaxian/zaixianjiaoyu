<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.District"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
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

<script language="javascript" type="text/javascript" src="<%=basePath %>static/js/WdatePicker.js"></script>
<script src="<%=basePath %>static/laydate/laydate.js"></script>

<div class="w_1200">


    <table class="fill_table font_15" style="margin-bottom:0;">
        <tbody>
            <tr>
                <th width="100">身份类型</th>
                <td>
                    <dl class="tab_nav table_tab_nav round_m_a" id="TeacherType">
                        <dd>
                        <%
                        if(teacher.getTeacherType()!=null){
                        	if(teacher.getTeacherType().intValue()==19){
                         %>
                         	<a data-id="19" href="javascript:void(0)" class="tab_light">大学生</a>
                       		<a data-id="18" href="javascript:void(0)" class="">专职老师</a>
                         <%}else{ %>
                         	<a data-id="19" href="javascript:void(0)" class="">大学生</a>
                       		<a data-id="18" href="javascript:void(0)" class="tab_light">专职老师</a>
                         <%} %>
                       <%}else{ %>
                       <a data-id="19" href="javascript:void(0)" class="tab_light">大学生</a>
                       <a data-id="18" href="javascript:void(0)" class="">专职老师</a>
                       <%} %>
                            
                        </dd>
                    </dl>
                </td>
            </tr>
        </tbody>
    </table>

    <div class="tab_box">
        <div>
            <table class="fill_table font_15">
                <tbody>
                    <tr>
                        <th width="100"><label for="RealName">姓名</label></th>
                        <td><input type="text" class="fill_text" id="RealName" name="RealName" placeholder="2~10个字符" maxlength="10" minlength="2" value="<%=teacher.getTeacherName() %>"></td>
                    </tr>

                    <tr>
                        <th>性别</th>
                        <td id="Sex">
                        <%
                        if(teacher.getGender()==1){
                        %>
                       		<span class="sel_box_r">
                                <input type="radio" id="a-1" name="a" value="1" checked="">
                                <label for="a-1">男</label>
                            </span>
                            <span class="sel_box_r m_l_b">
                                <input type="radio" id="a-2" value="0" name="a">
                                <label for="a-2">女</label>
                            </span>
                      <%}else{ %>
                      		<span class="sel_box_r">
                                <input type="radio" id="a-1" name="a" value="1" >
                                <label for="a-1">男</label>
                            </span>
                            <span class="sel_box_r m_l_b">
                                <input type="radio" id="a-2" value="0" name="a" checked="">
                                <label for="a-2">女</label>
                            </span>
                      <%} %>
                        </td>
                    </tr>

                    <tr>
                        <th>出生日期</th>
                        <td>
                        	<input type="text" class="fill_text" id="birthday" name="birthday" onclick="laydate()" value="<%=teacher.getBirthday() %>"   >
                        </td>
                    </tr>

                    <tr>
                        <th>来自省份/国家</th>
                        <td>
							<div class="divselect_box divselect_box_b" style="z-index:50" id="Province">
							    <%
							    if("".equals(teacher.getProvince())){
							     %>
							    <cite id="province"  data-id=""></cite>
							     <%}else{ %>
							    <cite id="province"  data-id="<%=teacher.getProvince() %>"><%=teacher.getProvince() %></cite>
							     <%} %>
							    
							    <div class="citySelect city_box_sec">
							        <div class="dorpdown_province">
							            <ul class="city_box_ul">
							                    <li data-id="中国" class="cur" data-province="40">中国</li>
							                    <li data-id="其他国家" class="" data-province="41">其他国家</li>
							            </ul>
							        </div>
							        <div class="dorpdown_city">
							                <ul data-province="40" class="city_box_ul" style="display: block;">
							                        <li data-id="上海">上海</li>
							                        <li data-id="北京">北京</li>
							                        <li data-id="天津">天津</li>
							                        <li data-id="重庆">重庆</li>
							                        <li data-id="广东">广东</li>
							                        <li data-id="浙江">浙江</li>
							                        <li data-id="四川">四川</li>
							                        <li data-id="湖北">湖北</li>
							                        <li data-id="辽宁">辽宁</li>
							                        <li data-id="黑龙江">黑龙江</li>
							                        <li data-id="山东">山东</li>
							                        <li data-id="吉林">吉林</li>
							                        <li data-id="福建">福建</li>
							                        <li data-id="河南">河南</li>
							                        <li data-id="陕西">陕西</li>
							                        <li data-id="江苏">江苏</li>
							                        <li data-id="湖南">湖南</li>
							                        <li data-id="甘肃">甘肃</li>
							                        <li data-id="河北">河北</li>
							                        <li data-id="安徽">安徽</li>
							                        <li data-id="广西">广西</li>
							                        <li data-id="海南">海南</li>
							                        <li data-id="内蒙古">内蒙古</li>
							                        <li data-id="新疆">新疆</li>
							                        <li data-id="山西">山西</li>
							                        <li data-id="宁夏">宁夏</li>
							                        <li data-id="青海">青海</li>
							                        <li data-id="江西">江西</li>
							                        <li data-id="云南">云南</li>
							                        <li data-id="贵州">贵州</li>
							                        <li data-id="西藏">西藏</li>
							                        <li data-id="香港">香港</li>
							                        <li data-id="澳门">澳门</li>
							                        <li data-id="台湾">台湾</li>
							                </ul>
							                <ul data-province="41" class="city_box_ul" style="display: none;">
							                        <li data-id="美国">美国</li>
							                        <li data-id="俄罗斯">俄罗斯</li>
							                        <li data-id="英国">英国</li>
							                        <li data-id="德国">德国</li>
							                        <li data-id="日本">日本</li>
							                        <li data-id="韩国">韩国</li>
							                        <li data-id="西班牙">西班牙</li>
							                        <li data-id="法国">法国</li>
							                        <li data-id="意大利">意大利</li>
							                </ul>
							        </div>
							    </div>
							</div>
                        </td>
                    </tr>

                    <tr>
                        <th><label for="wechat">微信号</label></th>
                        <td><input type="text" class="fill_text" id="wechat" name="wechat" value="<%=teacher.getWxNumber() %>"></td>
                    </tr>

                    <tr>
                        <th>住址区域</th>
                        <td>
                            <div class="dtdropsel dtdropsel_s divselect" style="z-index:40" >
                                <%
                                if(teacher.getAreaId()==null){
                                 %>
                                <cite data-id="" id="area"  >请选择住址区域</cite>
                                 <%}else{ %>
                                <cite data-id="<%=teacher.getAreaId() %>" id="area"  ><%=teacher.getArea() %></cite>
                                <%} %>
                                <ul class="dtselect_list dtselect_list_scroll">
                                <%
                                List<District> districtList = (List<District>)request.getAttribute("districtList");
                                if(districtList!=null){
                                	for(int i=0;i<districtList.size();i++){
                                	District district =districtList.get(i); 
                                %>
                                	<li data-id="<%=district.getDistrictId() %>" ><%=district.getDistrict() %></li>
                                <%
                                	}
                                }
                                 %>
                                </ul>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th><label for="address">大概住址</label></th>
                        <td><input type="text" class="fill_text" id="address" name="address" placeholder="" value="<%=teacher.getAddress() %>"></td>
                    </tr>

                    <tr>
                        <th>最高学历</th>
                        <td>
                            <div class="dtdropsel dtdropsel_log divselect" style="z-index:30;" >
                            	<%
                            	if(teacher.getEducation()==null){
                            	 %>
                            	  <cite id="TopDegree" data-id="">请选择</cite>
                            	 <%}else{ %>
                            	 <cite id="TopDegree" data-id="<%=teacher.getEducation() %>"><%=teacher.getEducationName() %></cite>
                            	 <%} %>
                                <ul class="dtselect_list">
                                 <%
                                List<DictInfo> dictInfomuqianxueliList = (List<DictInfo>)request.getAttribute("dictInfomuqianxueliList");
                                if(dictInfomuqianxueliList!=null){
                                	for(int i=0;i<dictInfomuqianxueliList.size();i++){
                                	DictInfo dictInfo =dictInfomuqianxueliList.get(i); 
                                %>
                                	<li data-id="<%=dictInfo.getDictId() %>"><%=dictInfo.getContent() %></li>
                                <%
                                	}
                                }
                                 %>
                                      
                                </ul>
                            </div>
                        </td>
                    </tr>


                    <tr class="type1" style="display: table-row;">
                        <th><label class="school">就读院校</label></th>
                        <td>
                            <input type="text" class="fill_text ui-autocomplete-input" id="School" autocomplete="off" value="<%=teacher.getSchool() %>">

                        </td>
                    </tr>
                    <!--  
                    <tr class="type2" style="display: none;">
                        <th><label class="school">毕业院校</label></th>
                        <td><input type="text" class="fill_text ui-autocomplete-input" id="BiyeSchool" name="BiyeSchool" autocomplete="off"></td>
                    </tr>
                    -->
                    <tr>
                        <th><label class="ye">就读专业</label></th>
                        <td><input type="text" class="fill_text" id="Major" value="<%=teacher.getProfessional() %>"></td>
                    </tr>

                    <tr>
                        <th>现有身份</th>
                        <td>
                            <div class="dtdropsel dtdropsel_log divselect"  style="z-index: 20;" >
                            <%
                            if(teacher.getIdentity()==null){
                             %>
                                <cite id="identity" ></cite>
                             <%}else{ %>
                                <cite id="identity" data-id="<%=teacher.getIdentity() %>"><%=teacher.getIdentityName() %></cite>
                             
                             <%} %>
                                <ul class="dtselect_list dtselect_list_scroll">
                                <%
								List<DictInfo> dictInfoshenfenList = (List<DictInfo>)request.getAttribute("dictInfoshenfenList");
								if(dictInfoshenfenList!=null){
									for(int i = 0; i < dictInfoshenfenList.size();i++){
										DictInfo dictInfo = dictInfoshenfenList.get(i);
                                 %>
                                 	<li  data-id="<%=dictInfo.getDictId() %>" style="display: list-item;"><%=dictInfo.getContent() %></li>
                                 <%
                                 	} 
                                 }%>
                                        
                                </ul>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
		                <th>授课区域</th>
		                <td>
		                    <div class="a_margin" id="divArea">
		                    <%
		                    String[] teachingAreas = teacher.getTeachingArea().split(",");
		                    if(ArrayHelper.inArray(teachingAreas,"1")){
		                    %>
		                    <a data-id="1" href="javascript:void(0)" class="round_m">
			        			城厢区
			        		</a>
		                    <%} %>
		                    <%if(ArrayHelper.inArray(teachingAreas,"2")){ %> 
		                    <a data-id="2" href="javascript:void(0)" class="round_m">
			        			荔城区
			        		</a>
		                    <%} %>
		                    <%if(ArrayHelper.inArray(teachingAreas,"3")){ %> 
			        		<a data-id="3" href="javascript:void(0)" class="round_m">
        					秀屿区
        					</a>
        					<%} %>
        					<%if(ArrayHelper.inArray(teachingAreas,"4")){ %> 
		                    <a data-id="4" href="javascript:void(0)" class="round_m">
			        			涵江区
			        		</a>
			        		<%} %>
			        		<%if(ArrayHelper.inArray(teachingAreas,"5")){ %> 
			        		<a data-id="5" href="javascript:void(0)" class="round_m">
        					仙游县
        					</a>
        					<%} %>
		                        <a href="javascript:0;" class="add_btn_r round_r png cd-popup-trigger" id="btnSelectArea" target="#AreaModal"></a>
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <th>授课科目</th>
		                <td>
		                    <div class="a_margin" id="divSubject">
		                     <%//所有课程信息
		                     if(!teacher.getTeachingCource().equals("")){
								 String[] coursesId2 = teacher.getTeachingCource().split(",");
								 
								 List<Course> courseList3 = (List<Course>)request.getAttribute("courseList"); 
								 if(courseList3!=null){
								 	for(int i=0;i<coursesId2.length;i++){
									 	String strCourse =  coursesId2[i];
									 	for(int j=0;j<courseList3.size();j++){
									 		Course course = courseList3.get(j);
									 		if(course.getCourseId()==Integer.parseInt(strCourse)){
								%>
											<a data-id="<%=course.getCourseId() %>" data-kmxlid="<%=course.getKeMuXiaoLei() %>" data-kmdlid="<%=course.getKeMuDaLei() %>" href="javascript:void(0)"><%=course.getCourseName() %>
					        				</a>
											<%} %>
										<%} %>
									<%} %>
								<%} %>
		                    <%} %>
		                        <a href="javascript:0;" class="add_btn_r round_r png cd-popup-trigger" id="btnSelectSubject" target="#SubjectModal"></a>
		                    </div>
		                </td>
		            </tr>
		            
		            <tr>
		                <th>授课时间</th>
		                <td>
		                    <div class="">
								<table class="time_table png_img" style="width:675px;">
								    <thead>
								    <tr>
								        <th></th>
								        <th>周一</th>
								        <th>周二</th>
								        <th>周三</th>
								        <th>周四</th>
								        <th>周五</th>
								        <th>周六</th>
								        <th>周日</th>
								    </tr>
								    </thead>
								    <tbody>
								    <%
								    String[] teachingTimes = teacher.getTeachingTime().split(",");
								    %>
								    <tr>
								        <th>上午</th>
								        <%
								        if(ArrayHelper.inArray(teachingTimes,"33")){
								         %>
								        <td data-id="33"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="33"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"36")){
								         %>
								        <td data-id="36"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="36"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"39")){
								         %>
								        <td data-id="39"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="39"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"42")){
								         %>
								        <td data-id="42"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="42"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"45")){
								         %>
								        <td data-id="45"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="45"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"48")){
								         %>
								        <td data-id="48"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="48"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"51")){
								         %>
								        <td data-id="51"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="51"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								    </tr>
								    <tr>
								        <th>下午</th>
								         <%
								        if(ArrayHelper.inArray(teachingTimes,"34")){
								         %>
								        <td data-id="34"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="34"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"37")){
								         %>
								        <td data-id="37"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="37"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"40")){
								         %>
								        <td data-id="40"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="40"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"43")){
								         %>
								        <td data-id="43"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="43"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"46")){
								         %>
								        <td data-id="46"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="46"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"49")){
								         %>
								        <td data-id="49"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="49"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"52")){
								         %>
								        <td data-id="52"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="52"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								        
								    <tr>
								        <th>晚上</th>
								        
								         <%
								        if(ArrayHelper.inArray(teachingTimes,"35")){
								         %>
								        <td data-id="35"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="35"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"38")){
								         %>
								        <td data-id="38"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="38"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"41")){
								         %>
								        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"44")){
								         %>
								        <td data-id="44"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="44"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"47")){
								         %>
								        <td data-id="47"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="47"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"50")){
								         %>
								        <td data-id="50"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="50"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"53")){
								         %>
								        <td data-id="53"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="53"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								        
								    </tr>
								    </tbody>
								</table>
								<input id="TimeListId" name="TimeListId" type="hidden" value="<%=teacher.getTeachingTime() %>">
								<input id="TimeListName" name="TimeListName" type="hidden" value="">
								<script>
								    $(".time_table td").click(function () {
								        var $this = $(this);
								        if ($this.find("img").attr("src") == "<%=basePath %>static/img/ok.png") {
								            $this.find("img").attr("src", "<%=basePath %>static/img/error.png");
								        } else {
								            $this.find("img").attr("src", "<%=basePath %>static/img/ok.png");
								        }
								
								        var ids = '';
								        $("td img[src='<%=basePath %>static/img/ok.png']").each(function() {
								            ids += $(this).closest("td").data('id') + ",";
								        });
								        $("#TimeListId").val(ids);
								    });
								
								</script>
								<tr>
					                <th>薪酬要求</th>
					                <td>
					                    <input type="text" class="fill_text" id="coursePrice" name="coursePrice"  placeholder="若执行云朵家教网薪酬标准,请填写 ‘0’ " value="<%=teacher.getCoursePrice() %>">&nbsp;&nbsp;&nbsp;&nbsp;元/小时
					                </td>
					            </tr>
					            <tr>
					                <th>辅导方式</th>
					                <td id="classmode">
					                    <ul class="select_ul fl click_ul classmode">
					                     <%
					                     String[] teachingWays = teacher.getTeachingWay().split(",");
					                     if(ArrayHelper.inArray(teachingWays,"20")){
					                     %>
					                     <li class="active" data-id="20"><a href="javascript:void(0)" class="round_m">教员上门</a></li>
					                     <%}else{ %>
					                     <li  data-id="20"><a href="javascript:void(0)" class="round_m">教员上门</a></li>
					                     <%} %>
					                     
					                     <%if(ArrayHelper.inArray(teachingWays,"21")){ %>
					                     <li class="active" data-id="21"><a href="javascript:void(0)" class="round_m">学员上门</a></li>
					                     <%}else{ %>
					                     <li data-id="21"><a href="javascript:void(0)" class="round_m">学员上门</a></li>
					                     <%} %>
					                       
					                    </ul>
					                </td>
					            </tr>
					            <tr>
					                <th><label class="te">所获证书</label></th>
					                <td>
					                    <div class="">
					                        <input type="text" class="fill_text" id="certificate" name="certificate" value="<%=teacher.getCertificate() %>" placeholder="示例：大学六级英语/雅思8.0分">
					                    </div>
					                </td>
            					</tr>
            					<tr>
					                <th>教龄</th>
					                <td>
					                    <div class="">
					                        <div class="dtdropsel dtdropsel_s divselect" style="z-index:17">
					                            <cite id="teachyear" data-id="<%=teacher.getTeachingAge() %>"><%=teacher.getTeachingAge() %>年</cite>
					                            <ul class="dtselect_list dtselect_list_scroll">
					                                    <li data-id="0">0年</li>
					                                    <li data-id="1">1年</li>
					                                    <li data-id="2">2年</li>
					                                    <li data-id="3">3年</li>
					                                    <li data-id="4">4年</li>
					                                    <li data-id="5">5年</li>
					                                    <li data-id="6">6年</li>
					                                    <li data-id="7">7年</li>
					                                    <li data-id="8">8年</li>
					                                    <li data-id="9">9年</li>
					                                    <li data-id="10">10年</li>
					                                    <li data-id="11">11年</li>
					                                    <li data-id="12">12年</li>
					                                    <li data-id="13">13年</li>
					                                    <li data-id="14">14年</li>
					                                    <li data-id="15">15年</li>
					                                    <li data-id="16">16年</li>
					                                    <li data-id="17">17年</li>
					                                    <li data-id="18">18年</li>
					                                    <li data-id="19">19年</li>
					                                    <li data-id="20">20年</li>
					                                    <li data-id="21">20年以上</li>
					                            </ul>
					                        </div>
					                    </div>
					                </td>
					            </tr>
					            
					            <tr>
					             	<th><label class="about">授课经验</label></th>
					                <td><textarea class="fill_textarea" id="teachingCase" name="teachingCase" placeholder="描述您的教学经历，所获荣誉和授课风格！" maxlength="1000"><%=teacher.getTeachingCase() %></textarea></td>
					                
					            </tr>
					
					            <tr>
					                <th><label class="about">自我介绍</label></th>
					                <td><textarea class="fill_textarea" id="SelfIntroduce" name="SelfIntroduce" placeholder="展示实力，增加您的魅力！比如竞赛中获得奖项，取得的成绩等,1000字以内！" maxlength="1000"><%=teacher.getSelfEvaluation()%></textarea></td>
					            </tr>
		                    </div>
		                </td>
		            </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th></th>
                        <td><input type="button" class="round_m transition_a fill_btn" id="btnSave" value="提交"></td>
                    </tr>
                    
                </tfoot>
            </table>
        </div>
        <!--end大学生-->
    </div>
    <!--end标签内容-->
    
<div class="cd-popup" id="AreaModal">
    <div class="cd-popup-container" style="width:730px;">
        <a href="http://fz.ygjj.com/resume/guide2#0" class="cd-popup-close f_close_btn transition_a"></a>
        <h4 class="f_code_th">授课区域<p></p></h4>

        <ul class="select_ul click_ul select_ul_box list_5 clearfix">
        <%
         if(districtList!=null){
        	for(int i=0;i<districtList.size();i++){
        	District district =districtList.get(i); 
        %>
        	<li  class="">
        		<a data-id="<%=district.getDistrictId() %>" href="javascript:void(0)" class="round_m">
        			<%=district.getDistrict() %>
        		</a>
        	</li>
        <%
        	}
        }
         %>
        </ul>
        <!--end一行-->

        <div class="btn_20">
            <a href="javascript:void(0)" class="cd-popup-close round_m submit_btn transition_a" id="btnConfirmArea">确认提交</a>
        </div>
        <!--end按钮-->
    </div>
</div>

<!--star_弹框-->

<div class="cd-popup" id="SubjectModal">
    <div class="cd-popup-container cd-popup-container_h" style="width:1200px;">
        <a href="http://fz.ygjj.com/resume/guide2#0" class="cd-popup-close f_close_btn transition_a"></a>
        <h4 class="f_code_th">求教科目<p>求教科目最多可以选择5个</p></h4>

        <ul class="select_ul_w  clearfix" id="ulSelect">
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
						<li data-id="<%=course.getCourseId() %>" data-kmxlid="<%=course.getKeMuXiaoLei() %>" data-kmdlid="<%=course.getKeMuDaLei() %>" class="active round_m"> 
					        <a data-id="<%=course.getCourseId() %>" data-kmxlid="<%=course.getKeMuXiaoLei() %>" data-kmdlid="<%=course.getKeMuDaLei() %>" href="javascript:void(0)"><%=course.getCourseName() %>
					        </a>
					        <span class="close_s">
					        </span>
			        	</li>
						<%} %>
					<%} %>
				<%} %>
			<%} %>
	    <%} %> 
        </ul>

        <div class="tab_box_h h_tab_n gray_border">
            <dl class="tab_nav_n fl tab_nav_y">
                <dd>
                      <%
                      List<DictInfo> dictInfoKeMuDaLeiList = (List<DictInfo>)request.getAttribute("dictInfoKeMuDaLeiList");
                      if(dictInfoKeMuDaLeiList!=null){
						//科目大类列表
						for(int i = 0; i < dictInfoKeMuDaLeiList.size();i++){
							DictInfo dictInfo = dictInfoKeMuDaLeiList.get(i);
							if(i==0){
						%>
						<a href="javascript:void(0)" class="tab_light"><%=dictInfo.getContent() %></a>
						  <%}else{ %>
						 <a href="javascript:void(0)"><%=dictInfo.getContent() %></a>
						 <%
						 	}
						 } 
					   }
						 %>
                </dd>
            </dl>
            <div class="tab_box_n r_cell r_text">
            
            <%
             if(dictInfoKeMuDaLeiList!=null){
             	for(int i = 0; i < dictInfoKeMuDaLeiList.size();i++){//1 幼儿
             		DictInfo kemudaleiDict = dictInfoKeMuDaLeiList.get(i);
             %>
            	<div class="h_340 scroll_box" style="display: block;">
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
            		<h4 class="th_line_w"><span><em><%=dictInfo.getContent() %></em></span></h4>
            		<ul class="sec_subject  clearfix list_8">
	            				<%
	            				for(int k=0;k<courseList.size();k++){
	            					Course course = courseList.get(k);//1	学前教育家教	65	幼儿课程家教	1	幼儿
	            					if(course.getKeMuXiaoLei()==dictInfo.getDictId()&&
	            						course.getKeMuDaLei()==kemudaleiDict.getDictId()){//66==65 2==1
	            				%>
	            				 <li data-id="<%=course.getCourseId() %>" data-kmxlid="<%=course.getKeMuXiaoLei() %>"  data-kmdlid="<%=course.getKeMuDaLei() %>" class=" threeli">
	                             	<a href="javascript:void(0)"><%=course.getCourseName() %></a>
	                             </li>
	            				<%
	            					}
	            				} 
	            				%>
            				<%
            				}
            				%>
            		</ul>
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

                <!--end_所有科目-->
            </div>
            <!--end标签内容-->
        </div>
        <!--end一行-->
        <div class="btn_20">
            <a href="javascript:void(0)" id="btnConfirmSubject" class="cd-popup-close round_m submit_btn transition_a">确认提交</a>
            <a href="javascript:void(0)" class="cd-popup-close transition_a round_m btn_border_gray">取消</a>
        </div>
        <!--end按钮-->
    </div>
</div>
<!--end弹框-->

</div>


<div id="l-map" style="display:none;"></div>
<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>

<script>
    $(function() {
        $(".threeli").click(function () {
            var $this = $(this);
            if (!$this.hasClass("active") && $("#ulSelect li").length >= 5) {
                alert("最多可选5门课程");
                return false;
            }

            var text = $this.find("a").text();
            var id = $this.data("id");
            var kmxlid = $this.data("kmxlid");
            var kmdlid = $this.data("kmdlid");
            if (!$this.hasClass("active")) {
                $("#ulSelect").append("<li data-id=" + id + " data-kmxlid="+kmxlid+" data-kmdlid="+kmdlid+" class='active round_m'> <a data-id='" + id + "'  data-kmxlid="+kmxlid+" data-kmdlid="+kmdlid+"  href='javascript:void(0)'>" + text + "</a><span class='close_s'></span></li>");
                $this.addClass("active");
            }
            else {
                $("#ulSelect li[data-id='" + id + "']").remove();
                $this.removeClass("active");
            }
        });

        $("#ulSelect").on("click", "li", function () {
            var $this = $(this);
            $this.remove();
            $(".threeli[data-id='" + $this.data("id") + "']").removeClass("active");
        });
    })
   


</script>


<script>

	var r = /^\+?[1-9][0-9]*$/;
    $("#btnSave").click(function () {
    
   		var data = {};
        data.teacherType = $("#TeacherType a.tab_light").data("id");
        data.teacherName = $.trim($("#RealName").val());
        data.birthday = $.trim($("#birthday").val());
        data.gender = $("#Sex").GetDropdownValue();
		data.province = $("#province").data("id");
        data.wxNumber = $("#wechat").val();
        data.areaId = $("#area").data("id");
        data.area = $("#area").text();
        data.address = $("#address").val();
        data.education = $("#TopDegree").data("id");
        data.educationName = $("#TopDegree").text();
        data.school = $("#School").val();
        data.professional = $("#Major").val();
        data.identity = $("#identity").data("id");//目前身份
        data.identityName = $("#identity").text();//目前身份
        data.coursePrice = $.trim($("#coursePrice").val());
        data.teachingTime = $("#TimeListId").val();
        
        var areaids = [];
        $("#divArea a:not(:last)").each(function () {
            areaids.push($(this).data('id'));
            //areanames.push($(this).text());
        });
        
        var teachingArea="";
        for ( var i = 0; i <areaids.length; i++){
		    teachingArea = teachingArea + areaids[i]+",";
		}
        
        data.teachingArea=teachingArea;//授课区域
        
        var subjectids = [], kmxlids = [],kmdlids = [];
        $("#divSubject a:not(:last)").each(function () {
            subjectids.push($(this).data('id'));
            kmxlids.push($(this).data('kmxlid'));
            kmdlids.push($(this).data('kmdlid'));
            //subjectnames.push($(this).text());
        });
        
        var teachingCource="",keMuXiaoLei="",keMuDaLei="";
        for ( var i = 0; i <subjectids.length; i++){
		    teachingCource=teachingCource+subjectids[i]+",";
		}
		for ( var i = 0; i <kmxlids.length; i++){
		    keMuXiaoLei=keMuXiaoLei+kmxlids[i]+",";
		}
		for ( var i = 0; i <kmdlids.length; i++){
		    keMuDaLei=keMuDaLei+kmdlids[i]+",";
		}
        
        data.teachingCource = teachingCource;//授课课程编号
        data.keMuXiaoLei = keMuXiaoLei;//科目小类编号
        data.keMuDaLei = keMuDaLei;//科目大类 编号
        //data.SubjectNames = subjectnames;//授课课程名称
        
        var classmode = [];
        $(".classmode [class='active']").each(function () {
            classmode.push($(this).data('id'));
        });
        
        var teachingWay="";
        for ( var i = 0; i <classmode.length; i++){
		    teachingWay = teachingWay + classmode[i]+",";
		}
        
        data.teachingWay = teachingWay;//授课方式
        data.certificate = $.trim($("#certificate").val());//所获证书
        data.teachingAge = $("#teachyear").data("id");//教学年龄
        data.teachingCase = $.trim($("#teachingCase").val());//授课经验
        data.selfEvaluation = $.trim($("#SelfIntroduce").val());//自我评价
        
        if (data.teacherName == '') {
            alert("请填写姓名");
            return false;
        }
        if (data.birthday == '') {
            alert("请填写出生日期");
            return false;
        }
        if($("#province").data("id")==""){
        	alert("请选择省份/国家!")
            return false;
        }
        if (data.areaId == ''|| data.areaId == null) {
            alert("请选择住址区域");
            return false;
        }
        if (data.address == '') {
            alert("请填写住址");
            return false;
        }
        if (data.education == '') {
            alert("请选择最高学历");
            return false;
        }
        if (data.teacherType !=2 && data.school == '') {
            alert("请填写就读学校");
            return false;
        }
        if (data.professional == '') {
            alert("请填写就读专业");
            return false;
        }
        if (typeof(data.identity) == "undefined") {
            alert("请选择身份");
            return false;
        }
        if ($("#divArea a").length <= 1) {
            alert("请选择至少一个授课区域");
            return false;
        }
        if ($("#divSubject a").length <= 1) {
            alert("请选择至少一个授课科目");
            return false;
        }
        if (data.teachingTime == '') {
            alert("请选择至少一个授课时间");
            return false;
        }
        if( !r.test( $.trim($("#coursePrice").val()))  ){
           	alert("请输入正确的课酬!")
            return false;
        }
        if (data.teachingWay == '') {
            alert("请选择至少一个辅导方式!");
            return false;
        }
 		if (data.teachingAge == '') {
            alert("请选择教龄!");
            return false;
        }
        
         console.log(data) ;
        
        var $this = $(this);

        $this.val("正在提交中...").attr("disabled", "disabled");
        
        $.post("updateInfo.action", data, function (res) {
            if (res.success) {
            	alert(res.message);
               // window.location = "/resume/album";
            } else {
                alert(res.message);
            }
            $this.val("提交").removeAttr("disabled");
            return false;
        });
    });

    $("#btnConfirmSubject").click(function () {
        $("#btnSelectSubject").siblings().remove();
        $("#ulSelect li").each(function (i, v, array) {
            $("#btnSelectSubject").before($($(v).find("a").clone()));
        });
    });

    $("#btnConfirmArea").click(function () {
        $("#btnSelectArea").siblings().remove();
        $("#AreaModal li[class='active']").each(function (i, v, array) {
            $("#btnSelectArea").before($(v).find("a").clone());
        });
    });
    var getYM = function () {
        var date = new Date;
        var year = date.getFullYear(),
            month = date.getMonth() + 1;
        month = (month < 10 ? "0" + month : month);
        var mydate = (year.toString() + month.toString());
        return mydate;
    }
    $("#btnAddExp").click(function () {

        var html = '<div class="add_box"><div class="t" style="margin-bottom: 1em;"><input type="text" class="fill_text date_text png datetimepicker date_text_s fromdate" value="" onfocus="WdatePicker({skin:\'whyGreen\',dateFmt:\'yyyy-MM\'})"><span class="m_t">~</span><input type="text" class="fill_text date_text png datetimepicker date_text_s todate" value="" onfocus="WdatePicker({skin:\'whyGreen\',dateFmt:\'yyyy-MM\'})"> <a href="javascript:void(0)" class="delete_a png deleteexp">删除</a></div><textarea class="fill_textarea expcontent" maxlength="1000"></textarea></div>'
        $(this).parent().before(html);
    });

    $('body').on('click', '.deleteexp',function() {
        $(this).closest('.add_box').remove();
    })
</script>
    <!--end中间区域-->
<script type="text/javascript" src="<%=basePath %>static/js/api"></script>
<script type="text/javascript" src="<%=basePath %>static/js/getscript"></script>
<script>
    var address = $("#address").val();
    $(function () {
        $("#address").attr("placeholder", address);
        $("#address").val(address);
        //加这段代码是因为页面加载的时候 地址会被百度地图刷新掉
        
    })
    $("#address").focus(function () {
        if ($("#address").data("focus") == '1') {
            return false;
        }
        $("#address").data("focus", 1);

        
        // 百度地图API功能
        function G(id) {
            return document.getElementById(id);
        }

        var map = new BMap.Map("l-map");
        //map.centerAndZoom("北京", 12);                   // 初始化地图,设置城市和地图级别。

        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {
            "input": "address", "location": map
        });

        ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
            var str = "";
            var _value = e.fromitem.value;
            var value = "";
            if (e.fromitem.index > -1) {
                value = _value.province + _value.city + _value.district + _value.street + _value.business;
            }
            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

            value = "";
            if (e.toitem.index > -1) {
                _value = e.toitem.value;
                value = _value.province + _value.city + _value.district + _value.street + _value.business;
            }
            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
            G("searchResultPanel").innerHTML = str;
        });

        var myValue;
        ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
            G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

            setPlace();
        });

        function setPlace() {
            map.clearOverlays();    //清除地图上所有覆盖物
            function myFun() {
                if (local.getResults().getPoi(0)) {
                    if ($("#address").val() == '' && address != '') {
                        $("#address").val(address);
                    }

                    var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                    $("#address").data('lat', pp.lat);
                    $("#address").data('lng', pp.lng);
                    map.centerAndZoom(pp, 18);
                    map.addOverlay(new BMap.Marker(pp));    //添加标注
                }
            }
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: myFun
            });
            local.search(myValue);
        }

        if (address.length > 0) {
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: function myFun() {
                    $("#address").val(address);
                    if (local.getResults().getPoi(0)) {
                        var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                        $("#address").data('lat', pp.lat);
                        $("#address").data('lng', pp.lng);
                        map.centerAndZoom(pp, 18);
                        map.addOverlay(new BMap.Marker(pp));    //添加标注
                    }
                }
            });
            local.search(address);
        }
    });


</script>

<script>
    $(function () {
        //$(".type2").hide();
        //$(".type1").show();
        $("#TeacherType a").click(function () {
            var $this = $(this);
            $this.addClass('tab_light').siblings().removeClass('tab_light');
            //if ($this.data("id") == 2) {
            //    $(".type2").show();
            //    $(".type1").hide();
            //} else {
            //    $(".type2").hide();
            //    $(".type1").show();
            //}
           
            //身份数据切换
            //$("#identity cite").text('');
            //$("#identity li").each(function() {
            //    if ($(this).data("type") == $this.data("id")) {
            //        $(this).show();
             //   } else {
             //       $(this).hide();
            //    }
            //});
        });

       /* $("#btnSave").click(function () {
        
            var data = {};
            data.TeacherType = $("#TeacherType a.tab_light").data("id");
            data.RealName = $.trim($("#RealName").val());
            data.Sex = $("#Sex").GetDropdownValue();
            data.Born = $("#Born").val();
            data.Province = $("#Province").GetCiteValue();
            data.Wexin = $("#wechat").val();
            data.AreaId = $("#area").GetCiteValue();
            data.Connect_address = $("#address").val();
            data.Lat = $("#address").data("lat");
            data.Lng = $("#address").data("lng");
            data.Major = $("#Major").val();
            data.Identity = $("#identity").GetCiteText();
            data.TopDegree = $("#TopDegree").GetCiteText();
            data.School = $("#School").val();
            data.BiyeSchool = $("#BiyeSchool").val();
            data.HighSchool = $("#HighSchool").val();
            data.SchoolType = $("#SchoolType").GetCiteText();
            data.TeachSubject = $("#TeachSubject").GetCiteText();
            //console.log(data);
           
            if (data.RealName == '') {
                alert("请填写姓名");
                return false;
            }
            if (data.Connect_address == '') {
                alert("请填写住址");
                return false;
            }
            if (data.AreaId == '') {
                alert("请选择区域");
                return false;
            }
            if (data.Province == '') {
                alert("请选择来自省份");
                return false;
            }
            if (data.Connect_address == '') {
                alert("请填写联系地址");
                return false;
            }
            if (data.TopDegree == '') {
                alert("请选择最高学历");
                return false;
            }
            if (data.Major == '') {
                alert("请填写就读专业");
                return false;
            }
            if (data.TeacherType !=2 && data.School == '') {
                alert("请填写就读学校");
                return false;
            }
            if (data.TeacherType != 2 && data.HighSchool == '') {
                alert("请填写高中母校");
                return false;
            }
            if (data.Identity == '') {
                alert("请选择身份");
                return false;
            }
            if (data.TeacherType == 2 && data.BiyeSchool == '') {
                alert("请填写毕业学校");
                return false;
            }

            if (data.TeacherType == 2 && data.SchoolType == '') {
                alert("请选择学校类别");
                return false;
            }
            if (data.TeacherType == 2 && data.TeachSubject == '') {
                alert("请选择执教科目");
                return false;
            }
            $("#btnSave").val("正在提交中...").attr("disabled", "disabled");
            $.post("/resume/guide1", data, function (res) {
                if (res.success) {
                    window.location = "/resume/guide2";
                } else {
                    alert(res.message);
                }
                $this.val("下一步，教学信息").removeAttr("disabled");
                return false;
            });
        });*/
    })
</script>
    <!--end中间区域-->

  </div>
    <!--end一行-->



<jsp:include page="footer.jsp"></jsp:include>    
