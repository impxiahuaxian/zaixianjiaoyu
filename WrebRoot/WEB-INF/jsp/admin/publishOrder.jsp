<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.District"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<LINK rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/pageSwitch.min.css">
	
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
	<script src="<%=basePath%>static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/jquery.artDialog.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/jQuery.rTabs.js" type="text/javascript"></script>
	<script src="<%=basePath%>static/js/search_tab.js" type="text/javascript"></script>
	
  </head>
  
  <body>
    <div class="w_1200 d_center white_bj">

<div class="r_cell box_r">
    <h4 class="r_th_y"><b>发布需求</b></h4>
    <table class="fill_table font_15">
        <tbody>
            <tr>
                <th>就读年级</th>
                <td>
                    <div class="dtdropsel dtdropsel_log divselect" style="z-index: 12;" id="grade">
                        <cite id="jiudunianji">请选择</cite>
                        <ul class="dtselect_list dtselect_list_scroll">
                        
                         <li data-id="80" value="80">幼儿</li>
                         
                         <li data-id="81" value="81">一年级</li>
                         
                         <li data-id="82" value="82">二年级</li>
                         
                         <li data-id="83" value="83">三年级</li>
                         
                         <li data-id="84" value="84">四年级</li>
                         
                         <li data-id="85" value="85">五年级</li>
                         
                         <li data-id="86" value="86">六年级</li>
                         
                         <li data-id="87" value="87">初一</li>
                         
                         <li data-id="88" value="88">初二</li>
                         
                         <li data-id="89" value="89">初三</li>
                         
                         <li data-id="90" value="90">高一</li>
                         
                         <li data-id="91" value="91">高二</li>
                         
                         <li data-id="92" value="92">高三</li>
                         
                         <li data-id="93" value="93">大一</li>
                         
                         <li data-id="94" value="94">大二</li>
                         
                         <li data-id="95" value="95">大三</li>
                         
                         <li data-id="96" value="96">大四</li>
                         
                         <li data-id="97" value="97">大五</li>
                         
                         <li data-id="98" value="98">研究生</li>
                         
                         <li data-id="99" value="99">成人</li>
                         
                         <li data-id="100" value="100">其他情况</li>
                         
                        </ul>
                    </div>
                    
                </td>
            </tr>

            <tr>
                <th>学员性别</th>
                <td id="selSex">
                    <span class="sel_box_r">
                        <input type="radio" id="a-1" name="a" value="1" checked="">
                        <label for="a-1">男</label>
                    </span>
                    <span class="sel_box_r m_l_b">
                        <input type="radio" id="a-2" name="a" value="0">
                        <label for="a-2">女</label>
                    </span>
                </td>
            </tr>

            <tr>
                <th>辅导科目</th>
                <td>
                    <div class=" a_margin" id="divSubject">
                        <a href="javascript:0;" class="add_btn_r2 round_r png cd-popup-trigger" id="btnSelectSubject" target="#SubjectModal"></a>
                    </div>
                </td>
            </tr>

            <tr>
                <th>授课时间</th>
                <td>
                    <ul class="select_ul  fl">
                        
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
    <tr>
        <th>上午</th>
        <td data-id="33"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="36"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="39"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="42"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="45"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="48"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
    </tr>
    <tr>
        <th>下午</th>
        <td data-id="34"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="37"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="40"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="43"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="46"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="49"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="52"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
    </tr>
    <tr>
        <th>晚上</th>
        <td data-id="35"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="38"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="44"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="47"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="50"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
        <td data-id="53"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
    </tr>
    </tbody>
</table>
<input id="TimeListId" name="TimeListId" hidden="hidden" value="">
<input id="TimeListName" name="TimeListName" hidden="hidden" value="">
<script>
    $(".time_table td").click(function () {
        var $this = $(this);
        if ($this.find("img").attr("src") == "../static/img/ok.png") {
            $this.find("img").attr("src", "../static/img/error.png");
        } else {
            $this.find("img").attr("src", "../static/img/ok.png");
        }

        var ids = '';
        $("td img[src='../static/img/ok.png']").each(function() {
            ids += $(this).closest("td").data('id') + ",";
        });
        $("#TimeListId").val(ids);
    });
  
</script>
                    </ul>
                </td>
            </tr>

            <tr>
                <th>授课区域</th>
                <td>
                    <div class="dtdropsel dtdropsel_log divselect" style="z-index: 13;" id="AreaId">
                        <cite id="district">请选择</cite>

						<ul class="dtselect_list dtselect_list_scroll">
						
						 <li data-id="1">城厢区</li>
						 
						 <li data-id="2">荔城区</li>
						 
						 <li data-id="3">秀屿区</li>
						 
						 <li data-id="4">涵江区</li>
						 
						 <li data-id="5">仙游县</li>
						</ul>
                    </div>
                </td>
            </tr>

            <tr>
                <th><label for="TeachAddress">授课地址</label></th>
                <td><input type="text" class="fill_text" id="TeachAddress" name="TeachAddress" placeholder=""></td>
            </tr>


            <tr>
                <th><label for="contact">联系人</label></th>
                <td id="contactSex">
                 <input type="text" id="memberId" name="memberId" hidden="hidden" value="0">
                    <input type="text" class="fill_text" id="contact" name="contact" value="">
                    
                        
                     <span class="sel_box_r">
                            <input type="radio" id="aa-1" name="gender" value="1" checked="">
                            <label for="aa-1">先生</label>
                     </span>
                     <span class="sel_box_r m_l_b">
                         <input type="radio" id="aa-2" name="gender" value="0">
                         <label for="aa-2">女士</label>
                     </span>
                     
                   
                </td>
            </tr>

            <tr>
                <th><label for="mobile">联系电话</label></th>
                <td><input type="text" class="fill_text" value="" id="mobile" name="mobile"></td>
            </tr>

            <tr>
                <th><label for="wechat">微信号</label></th>
                <td><input type="text" class="fill_text" id="wechat" name="wechat" value=""></td>
            </tr>


            <tr>
                <th><label for="StuRemark">学习状况</label></th>
                <td><textarea class="fill_textarea fill_textarea_m" id="StuRemark" name="StuRemark" maxlength="200" placeholder="学习成绩、程度等"></textarea></td>
            </tr>
            

            <tr>
                <th>薪酬标准</th>
                <td><input type="text" class="fill_text" id="coursePrice" name="coursePrice" placeholder="若执行吉师家教网薪酬标准,请填写 ‘0’ ">&nbsp;&nbsp;&nbsp;&nbsp;元/小时</td>
            </tr>

            <tr>
                <th>教员性别要求</th>
                <td id="selTeacherSex">
                    <span class="sel_box_r">
                        <input type="radio" id="d-1" name="d" value="1">
                        <label for="d-1">男</label>
                    </span>
                    <span class="sel_box_r m_t_b">
                        <input type="radio" id="d-2" name="d" value="0">
                        <label for="d-2">女</label>
                    </span>
                    <span class="sel_box_r">
                        <input type="radio" id="d-3" name="d" value="2" checked="">
                        <label for="d-0">不限</label>
                    </span>
                </td>
            </tr>


            <tr>
                <th>教员身份要求</th>
                <td id="teachertype">
                    <ul class="select_ul click_ul round_m_a">
                        <li class="active" data-id="19">
                            <a href="javascript:void(0)">在校大学生/毕业生</a>
                        </li>
                        <li class="active" data-id="18">
                            <a href="javascript:void(0)">老师（在职/进修/离职/退休）</a>
                        </li>
                      
                    </ul>
                </td>
            </tr>

            <tr>
                <th>上课方式</th>
                <td id="classmode">
                    <ul class="select_ul click_ul round_m_a classmode">
                        <li class="active" data-id="20">
                            <a href="javascript:void(0)">一对一家教上门</a>
                        </li>
                        <li class="active" data-id="21">
                            <a href="javascript:void(0)">一对一学员上门</a>
                        </li>
                    </ul>
                </td>
            </tr>

            <tr>
                <th><label class="yao">对教员要求</label></th>
                <td><textarea type="text" class="fill_textarea fill_textarea_m" id="teacherrequire" name="teacherrequire" placeholder="教员的资质等,200字以内" maxlength="200"></textarea></td>
            </tr>


        </tbody><tfoot>
            <tr>
                <th></th>
                <td><input type="button" class="round_m transition_a fill_btn" id="btnPublish" value="提交"></td>
            </tr>
        </tfoot>
    </table>
</div>

<!--star_弹框-->

<div class="cd-popup" id="SubjectModal">
    <div class="cd-popup-container cd-popup-container_h" style="width:1200px;">
        <a href="http://putian.ygjj.com/user/publish#0" class="cd-popup-close f_close_btn transition_a"></a>
        <h4 class="f_code_th">求教科目<p>求教科目最多可以选择1个</p></h4>

        <ul class="select_ul_w  clearfix" id="ulSelect">
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
	            				 <li data-id="<%=course.getCourseId() %>" class=" threeli">
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

<script>
    $(".threeli").click(function () {
        var $this = $(this);
        if (!$this.hasClass("active") && $("#ulSelect li").length >= 1) {
            alert("请选择1门课程");
            return false;
        }

        var text = $this.find("a").text();
        var id = $this.data("id");
        if (!$this.hasClass("active")) {
            $("#ulSelect").append("<li data-id=" + id + " class='active round_m'> <a data-id='" + id + "' href='javascript:void(0)'>" + text + "</a><span class='close_s'></span></li>");
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


</script>
<div id="l-map" style="display:none;"></div>
<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&amp;ak=aSBzW9RUaCp3AM2dvTjR7f4lE7Tqm4wx&amp;services=&amp;t=20190123111209"></script><script type="text/javascript" src="./四平家教网_免费找家教_【吉师家教网】_四平一对一在线辅导_files/getscript"></script>

<script>
    var address = $("#TeachAddress").val();
    $(function () {
        $("#TeachAddress").attr("placeholder", address);
        $("#TeachAddress").val(address);
        //加这段代码是因为页面加载的时候 地址会被百度地图刷新掉
        
    })
    $("#TeachAddress").focus(function () {
        if ($("#TeachAddress").data("focus") == '1') {
            return false;
        }
        $("#TeachAddress").data("focus", 1);

        
        // 百度地图API功能
        function G(id) {
            return document.getElementById(id);
        }

        var map = new BMap.Map("l-map");
        //map.centerAndZoom("北京", 12);                   // 初始化地图,设置城市和地图级别。

        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {
            "input": "TeachAddress", "location": map
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
                    if ($("#TeachAddress").val() == '' && address != '') {
                        $("#TeachAddress").val(address);
                    }

                    var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                    $("#TeachAddress").data('lat', pp.lat);
                    $("#TeachAddress").data('lng', pp.lng);
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
                    $("#TeachAddress").val(address);
                    if (local.getResults().getPoi(0)) {
                        var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                        $("#TeachAddress").data('lat', pp.lat);
                        $("#TeachAddress").data('lng', pp.lng);
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
        (function () {
            $(".divselect_box").each(function () {
                var divselect = $(this),
                    citySelect = divselect.find(".citySelect"),
                    cityhd = citySelect.find(".dorpdown_province li"),
                    cityhdCur = citySelect.find(".dorpdown_province .cur"),
                    cityItem = citySelect.find(".dorpdown_city ul");
                divselect.click(function (e) {
                    !divselect.hasClass("divselect_boxopen") && !$(e.target).closest(".dorpdown_city li").length ? divselect.addClass("divselect_boxopen") : 0;
                });
                function active(el) {
                    var val = el.data("province");
                    cityItem.hide();
                    for (var i = cityItem.length - 1; i >= 0; i--) {
                        $(cityItem[i]).data("province") == val ? function () {
                            $(cityItem[i]).show();
                        }() : 0;
                    };
                }
                active(cityhdCur);
                cityhd.mouseenter(function () {
                    var ths = $(this);
                    ths.addClass("cur").siblings().removeClass("cur");
                    active(ths);
                });
                cityItem.find("li").click(function () {
                    divselect.removeClass("divselect_boxopen");
                    divselect.find("cite").text($(this).text());
                });
            });
            $(window).on("click", function (e) {
                !$(e.target).closest(".divselect_box").length ? $(".divselect_box").removeClass("divselect_boxopen") : 0;
            });
        })();

        $("#btnConfirmSubject").click(function () {
            $("#btnSelectSubject").siblings().remove();
            $("#ulSelect li").each(function (i, v, array) {
                $("#btnSelectSubject").before($($(v).find("a").clone()));
            });
        });

        var regmobile = /^(13[0-9]|14[57]|15[0-35-9]|17[0678]|18[0-9])[0-9]{8}$/;
        var r = /^\+?[1-9][0-9]*$/;
        $("#btnPublish").on("click", function () {
        
            if (typeof($("#jiudunianji").data("id")) == "undefined") {
                alert("请选择年级!")
                return false;
            }
            if ($("#divSubject a").length <= 1) {
                alert("请选择辅导科目!")
                return false;
            }
            if ($.trim($("#TimeListId").val()) == '') {
                alert("请选择授课时间!")
                return false;
            }

 			var districtId = $("#district").data("id");//授课区域

            if (typeof(districtId)== "undefined") {
                alert("请选择授课区域!")
                return false;
            }
            
            if ($.trim($("#TeachAddress").val()) == '') {
                alert("请输入授课地址!")
                return false;
            }
            if ($.trim($("#contact").val()) == '') {
                alert("请输入联系人!")
                return false;
            }
            if ($("#mobile").val() == '' || !regmobile.test($.trim($("#mobile").val()))) {
                alert("请输入正确的联系电话!")
                return false;
            }
            
            if($("#StuRemark").val().length>200){
            	alert("学习状况字数不能多于200字!")
                return false;
            }
            
            if( !r.test( $.trim($("#coursePrice").val()))  ){
            	alert("请输入正确的课酬!")
                return false;
            }
            
            var teachertype = [];
            $("#teachertype li").each(function () {
                if ($(this).hasClass("active")) {
                    teachertype.push($(this).data("id"));
                }
            })
            
            if(teachertype==""||teachertype==" "){
           		alert("请选择教员身份要求!")
                return false;
            }
            

            var classmode = [];
            $(".classmode li").each(function () {
                if ($(this).hasClass("active")) {
                    classmode.push($(this).data("id"));
                }
            });
            
            if(classmode==""||classmode==" "){
           		alert("请选择上课方式!")
                return false;
            }
            
            var subjectids = [], subjectnames = [];
            $("#divSubject a:not(:last)").each(function () {
                subjectids.push($(this).data('id'));
                subjectnames.push($(this).text());
            });
            if($("#teacherrequire").val().length>200){
            	alert("对教员要求不能多于200字!")
                return false;
            }
            
            
            //if ($.trim($("#wechat").val()) == '') {
            //    alert("请输入微信号!")
            //    return false;
            //}
            //if ($("#Salary").GetDropdownValue() == 0) {
            //    if ($("#SalaryMin").val() == '' || $("#SalaryMax").val() == '') {
            //        alert("请填写完整薪酬标准!");
            //        return false;
            //    }
            //}
             var data = {};
            data.memberId = $("#memberId").val();//学员编号
            data.grade = $("#jiudunianji").data("id");//就读年级
            data.sex = $("input[name='a']:checked").val();//学员性别
            data.subjectids = subjectids.join(",");//辅导科目编号
            data.subjectnames = subjectnames.join(",");//辅导科目名称
            data.teachdays = $("#TimeListId").val();//授课时间
            data.areaid = $("#district").data("id");//授课区域
            data.teachaddress = $("#TeachAddress").val();//授课地址
            data.lat = $("#TeachAddress").data('lat');//经纬度
            data.lng = $("#TeachAddress").data('lng');//经纬度
            data.contact = $("#contact").val();//联系人
            data.telephone = $("#mobile").val();//手机号
            data.contactGender = $("input[name='gender']:checked").val();//学员性别
            data.wexin = $("#wechat").val();//微信号
            data.sturemark = $("#StuRemark").val();//学生概况
            data.teacherrequire = $("#teacherrequire").val();//对教员要求
            data.coursePrice = $("#coursePrice").val();//课酬
            data.teachersex = $("input[name='d']:checked").val();//教员性别要求
            data.teachertype = teachertype.join(",");//教员身份要求
            data.classmode = classmode.join(",");//上课模式
            
            var $this = $("#btnPublish");
            $this.text('正在提交中...').attr('disabled', 'disabled');
            
            $.post('publishOrders.action', data, function (res) {
                if (res.success) {
                	alert(res.message);
                	//window.location.href = "member/index.action";
                } else {
                
                	alert(res.message);
                    $this.val('提交').attr('disabled', false);
                    
                }
            });
        });


        function publish() {
            if ($("#grade").GetCiteValue() <= 0) {
                alert("请选择年级!")
                return false;
            }
            if ($("#divSubject a").length <= 1) {
                alert("请选择辅导科目!")
                return false;
            }
            if ($.trim($("#TimeListId").val()) == '') {
                alert("请选择授课时间!")
                return false;
            }

            if (!$("#AreaId").GetCiteValue() || $("#AreaId").GetCiteValue() <= 0) {
                alert("请选择授课区域!")
                return false;
            }
            if ($.trim($("#TeachAddress").val()) == '') {
                alert("请输入授课地址!")
                return false;
            }
            if ($.trim($("#contact").val()) == '') {
                alert("请输入联系人!")
                return false;
            }
            if ($("#mobile").val() == '' || !regmobile.test($.trim($("#mobile").val()))) {
                alert("请输入正确的联系电话!")
                return false;
            }
            //if ($.trim($("#wechat").val()) == '') {
            //    alert("请输入微信号!")
            //    return false;
            //}

            //var payface = false;
            //if ($("#Salary").GetDropdownValue() == 0) {
            //    payface = true;
            //    if ($("#SalaryMin").val() == '' || $("#SalaryMax").val() == '') {
            //        alert("请填写完整薪酬标准!");
            //        return;
            //    }
            //}
            var teachertype = [];
            $("#teachertype li").each(function () {
                if ($(this).hasClass("active")) {
                    teachertype.push($(this).data("id"));
                }
            })

            var classmode = [];
            $(".classmode li").each(function () {
                if ($(this).hasClass("active")) {
                    classmode.push($(this).data("id"));
                }
            });

            
            var subjectids = [], subjectnames = [];
            $("#divSubject a:not(:last)").each(function () {
                subjectids.push($(this).data('id'));
                subjectnames.push($(this).text());
            });
            var data = {};
            data.grade = $("#grade").GetCiteValue();
            data.sex = $("#selSex").GetDropdownValue();
            data.contactSex = $("#contactSex").GetDropdownValue();
            data.subjectids = subjectids.join(",");
            data.subjectnames = subjectnames.join(",");
            data.teachdays = $("#TimeListId").val();
            data.areaid = $("#AreaId").GetCiteValue();
            data.teachaddress = $("#TeachAddress").val();
            data.lat = $("#TeachAddress").data('lat');
            data.lng = $("#TeachAddress").data('lng');
            data.contact = $("#contact").val();
            data.telephone = $("#mobile").val();
            data.wexin = $("#wechat").val();
            data.sturemark = $("#StuRemark").val();
            data.allowcontact = $("#selAllowContact").GetDropdownValue();
            data.needteachercount = $("#NeedTeacherCount").val();
            data.teacherrequire = $("#teacherrequire").val();
            //data.isnegotiable = payface;//是否面议
            data.salarymin = $("#SalaryMin").val();
            data.salarymax = $("#SalaryMax").val();

            data.teachersex = $("#selTeacherSex").GetDropdownValue();
            data.teachertype = teachertype;
            data.classmode = classmode;
            var $this = $("#btnPublish");
            $this.text('正在提交中...').attr('disabled', 'disabled');
            $.post('/user/Publish', data, function (res) {
                if (res.success) {
                    alert('发布成功');
                    if (res.redirect) {
                        window.location.href = res.redirect;
                    } else {
                        if (self == top) {
                            window.location.href = "/user";
                        } else {
                            top.location.href = "/user";
                        }
                    }
                } else {
                    alert(res.message);
                    $this.val('提交').attr('disabled', false);
                }
            });
        }
    });

</script>
    <!--end一行的右-->
</div>
  </body>
</html>
