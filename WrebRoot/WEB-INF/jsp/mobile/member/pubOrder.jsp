<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.DictInfo"%>
<%@page import="com.jiajiao.bean.Course"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.District"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Member member = (Member)session.getAttribute("member");
if(member==null){
	response.sendRedirect(basePath+"mobile.action");
	return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    
	    <title>吉师家教</title>
	    <link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   		<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
	    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
	    <meta content="yes" name="apple-mobile-web-app-capable">
	    <meta content="black" name="apple-mobile-web-app-status-bar-style">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="format-detection" content="email=no">
	    <meta name="msapplication-tap-highlight" content="no">
	    <script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js"></script>
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
			<header class="headbar">
				<div class="headl">
					<a href="javascript:history.back(-1)" id="btnGoback" class="heada">
						<i class="back_hico hico">
						</i>
					</a>
				</div>
				<h1 class="headtitle">
					发布需求
				</h1>
			</header>
			<!--end header-->
			<!-- 中间 -->
			<!-- tipsbar -->
			<div class="tipsbar">
				<a href="javascript:void(0)" class="wb">
					<i class="notify_ntico ntico">
					</i>
					<div class="al ogtxt wbw">
						每月可免费发布5个订单
					</div>
				</a>
			</div>
			<!-- end tipsbar -->
			<!-- 一行 -->
			
			<input type="hidden" value="<%=member.getMemberId() %>" id="memberId" name="memberId">
			
			<div class="wpbox">
				<div class="dtlist">
					<div class="dtitem">
						<div class="selint dl">
							<div class="dt">
								就读年级
							</div>
							<div class="dd">
								<input type="text" readonly="" value="" placeholder="请选择" class="selint_label dtint">
							</div>
							<i class="selgt">
							</i>
							<select class="selint_select" id="Grade">
							<option value=""></option>
							<%
	                        List<DictInfo> dictInfojiudunianjiliList = (List<DictInfo>)request.getAttribute("dictInfojiudunianjiliList");
	                        if(dictInfojiudunianjiliList!=null){
	                        	for(int i = 0;i  < dictInfojiudunianjiliList.size();i++){
	                        	DictInfo dict = dictInfojiudunianjiliList.get(i);
	                         %>
	                         <option value="<%=dict.getDictId() %>"><%=dict.getContent() %></option>
	                         <%
	                         	} 
	                         }
	                         %>
							</select>
						</div>
					</div>
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								学员性别
							</div>
							<div class="dd" id="Sex">
								<span class="radiospan">
									<input type="radio" checked="checked" data-id="1" id="male" name="sex"
									value="1">
									<label for="male">
										男
									</label>
								</span>
								<span class="radiospan">
									<input type="radio" id="female" data-id="0" name="sex" value="0">
									<label for="female">
										女
									</label>
								</span>
							</div>
						</div>
					</div>
					<div class="dtitem">
						<div class="selint dl" onclick="setPage(&#39;subject&#39;, &#39;&#39;, &#39;indtype&#39;, &#39;indtypename&#39;, 0, 1)">
							<div class="dt">
								辅导科目
							</div>
							<div class="dd">
								<input type="text" id="SubjectId" readonly="" placeholder="请选择" class="selint_label dtint">
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
								<input type="text" readonly="" id="TeachDate" placeholder="请选择" class="dtint">
							</div>
							<i class="rgt">
							</i>
						</div>
					</div>
					<div class="dtitem">
						<div class="call-localPop dl">
							<div class="dt">
								授课区域
							</div>
							<div class="dd">
								<input id="AreaId" type="text" readonly="" placeholder="请选择" class="dtint">
							</div>
							<i class="selgt">
							</i>
						</div>
					</div>
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								授课地址
							</div>
							<div class="dd">
								<input type="text" id="TeachAddress" placeholder="" class="dtint">
							</div>
							<i class="cleardtint">
							</i>
							<i class="oglocal_mico mico">
							</i>
						</div>
					</div>
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								联系人
							</div>
							<div class="dd">
								<input type="text" id="Contact" placeholder="请填写联系人姓名" class="dtint">
							</div>
							<i class="cleardtint">
							</i>
						</div>
					</div>
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								联系人称呼
							</div>
							<div class="dd" id="ContactSex">
								<span class="radiospan">
									<input type="radio" checked="checked" data-id="1" id="male2" name="contactsex"
									value="1">
									<label for="male2">
										先生
									</label>
								</span>
								<span class="radiospan">
									<input type="radio" id="female2" data-id="0" name="contactsex" value="0">
									<label for="female2">
										女士
									</label>
								</span>
							</div>
						</div>
					</div>
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								联系电话
							</div>
							<div class="dd">
								<input type="number" id="Mobile" value="15060338989" placeholder="请填写手机号码"
								class="dtint">
							</div>
							<i class="cleardtint">
							</i>
						</div>
					</div>
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								微信号
							</div>
							<div class="dd">
								<input type="text" id="Wexin" placeholder="请填写微信号" class="dtint" value="15060338989">
							</div>
							<i class="cleardtint">
							</i>
						</div>
					</div>
				</div>
				<div class="submitrow">
					<a href="javascript:void(0)" onclick="nextstep()" class="big_ogbtn">
						下一步
					</a>
				</div>
				<div id="l-map" style="display:none;">
				</div>
				<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;">
				</div>
				<script type="text/javascript" src="<%=basePath %>/static/mobile/js/api">
				</script>
				<script type="text/javascript" src="<%=basePath %>/static/mobile/js/getscript">
				</script>
				<script>
					var address = $("#TeachAddress").val();

					$(function() {
						$("#TeachAddress").attr("placeholder", address);
						$("#TeachAddress").val(address);
					})

					$("#TeachAddress").focus(function() {
						if ($("#TeachAddress").data("focus") == '1') {
							return false;
						}
						$("#TeachAddress").data("focus", 1);
						// 百度地图API功能
						function G(id) {
							return document.getElementById(id);
						}

						var map = new BMap.Map("l-map");
						map.centerAndZoom("北京", 12); // 初始化地图,设置城市和地图级别。
						var ac = new BMap.Autocomplete( //建立一个自动完成的对象
						{
							"input": "TeachAddress",
							"location": map
						});

						ac.addEventListener("onhighlight",
						function(e) { //鼠标放在下拉列表上的事件
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
						ac.addEventListener("onconfirm",
						function(e) { //鼠标点击下拉列表后的事件
							var _value = e.item.value;
							myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
							G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

							setPlace();
						});

						function setPlace() {
							map.clearOverlays(); //清除地图上所有覆盖物
							function myFun() {
								var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
								$("#TeachAddress").data('lat', pp.lat);
								$("#TeachAddress").data('lng', pp.lng);
								map.centerAndZoom(pp, 18);
								map.addOverlay(new BMap.Marker(pp)); //添加标注
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
										var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
										$("#TeachAddress").data('lat', pp.lat);
										$("#TeachAddress").data('lng', pp.lng);
										map.centerAndZoom(pp, 18);
										map.addOverlay(new BMap.Marker(pp)); //添加标注
									}
								}
							});
							local.search(address);
						}
					});
				</script>
			</div>
			<!-- end 一行 -->
			<!--end 中间-->
			<!-- localPop -->
			<div class="bpop" id="localPop">
				<div class="hide-localPop fade_bkbg">
				</div>
				<div class="bpopcontent">
					<ul class="locallist4 arealist">
					<%
               	 	List<District> districtList = (List<District>)request.getAttribute("districtList");
	                if(districtList != null){
	                	for(int i=0;i<districtList.size();i++){ 
	                		District district = districtList.get(i);
		           	
                	%>
               			<li data-id="<%=district.getDistrictId() %>" ><a href="javascript:void(0)" data-id="<%=district.getDistrictId() %>"><%=district.getDistrict() %></a></li>
                	<%
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
					$(".area").text(text).data('id', id);
					$("#localPop").removeClass("show");
					if (typeof searteacher === 'function') {
						searteacher();
					}
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
									全选
								</a>
							</div>
							<div class="th">上午</div>
							<div class="th">下午</div>
							<div class="th">晚上</div>
						</li>
						<li>
							<div class="th">周一</div>
							<div class="td" data-type="1" data-id="33">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="2" data-id="34">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="3" data-id="35">
								<i class="sign">
								</i>
							</div>
						</li>
						<li>
							<div class="th">周二</div>
							<div class="td" data-type="1" data-id="36">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="2" data-id="37">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="3" data-id="38">
								<i class="sign">
								</i>
							</div>
						</li>
						<li>
							<div class="th">周三</div>
							<div class="td" data-type="1" data-id="39">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="2" data-id="40">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="3" data-id="41">
								<i class="sign">
								</i>
							</div>
						</li>
						<li>
							<div class="th">周四</div>
							<div class="td" data-type="1" data-id="42">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="2" data-id="43">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="3" data-id="44">
								<i class="sign">
								</i>
							</div>
						</li>
						<li>
							<div class="th">周五</div>
							<div class="td" data-type="1" data-id="45">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="2" data-id="46">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="3" data-id="47">
								<i class="sign">
								</i>
							</div>
						</li>
						<li>
							<div class="th">周六</div>
							<div class="td" data-type="1" data-id="48">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="2" data-id="49">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="3" data-id="50">
								<i class="sign">
								</i>
							</div>
						</li>
						<li>
							<div class="th">周日</div>
							<div class="td" data-type="1" data-id="51">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="2" data-id="52">
								<i class="sign">
								</i>
							</div>
							<div class="td" data-type="3" data-id="53">
								<i class="sign">
								</i>
							</div>
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
					//$("#schedulePop div.td.checked")
					$("#schedulePop div.td.checked").removeClass("checked");
					$("#TeachDate").val('');
					//$("#schedulePop").removeClass("show");
				});
				$("#btnAllSelect").click(function() {
					//$("#schedulePop div.td.checked")
					$("#schedulePop div.td").toggleClass("checked");
					//$("#schedulePop").removeClass("show");
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

					$("#schedulePop").removeClass("show");
				});
			</script>
		</div>
		
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
                                （可选择1门）
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
					            						
					            				%>
					            						<li data-kemudalei="<%=course.getKeMuDaLei() %>" data-kemuxiaolei="<%=course.getKeMuXiaoLei() %>" data-id="<%=course.getCourseId() %>" class=""><a href="javascript:void(0)" data-kemudalei="<%=course.getKeMuDaLei() %>" data-kemuxiaolei="<%=course.getKeMuXiaoLei() %>" data-id="<%=course.getCourseId() %>"><%=course.getCourseName() %></a></li>
					            				<%
					            						
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
						if ($(".categoryitem_list>li.select").length >= 1) {
							show('最多只能选择1个辅导科目');
							return;
						}
					} else {
						if ($(".categoryitem_list>li.select").length >= 1) {
							show('最多只能选择1个辅导科目');
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
				$(".scatelog_list>li").each(function(index, item) {
					text += $(item).text() + ',';
					ids += $(item).data('id') + ',';
				});
				text = text.trimEnd(',');
				$("#SubjectId").val(text);
				$("#SubjectId").data('id', ids);
				$(".subject").text(text);
				$(".subject").attr('id', ids);
				pclose();
			});
		</script>
		<!-- ntextpop -->
		<div class="ntextpop" id="messagebox">
			<span class="ntextpop_content">
			</span>
		</div>
		<!-- end ntextpop -->
		<div id="page2" style="display:none;">
			<header class="headbar">
		        <div class="headl" onclick="pclose();"><a href="javascript:void(0)" class="heada"><i class="back_hico hico"></i></a></div>
		        <h1 class="headtitle">发布需求</h1>
		    </header>
			<!-- 中间 -->
			<!-- 一行 -->
			<div class="wpbox">
				<div class="dtlist">
					<div class="dtitem">
						<div class="dltop">
							<div class="dt">
								学员状况
							</div>
							<div class="dd">
								<textarea placeholder="请输入学员成绩状态等" id="StuRemark" class="textint dtint"></textarea>
								<div class="textint_limit">
									字数要求
									<span class="ogtxt">
										<span class="textint_limit_num">
											0
										</span>
										/200
									</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								薪酬
							</div>
							<div class="dd" >
								<input type="number" value=""  id="Salary" name="Salary" class="sm_dtint"
                             	onkeyup="if (this.value.length == 1) {this.value = this.value.replace(/[^1-9]/g, &#39;&#39;)} else {this.value = this.value.replace(/\D/g, &#39;&#39;)}"
                             	>
                                        
                                        元/小时
							</div>
						</div>
					</div>
					
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								教员性别
							</div>
							<div class="dd" id="TeacherSex">
								<span class="radiospan">
									<input type="radio" data-id="0" id="nomale" name="TeacherSex" value="0"
									checked="checked">
									<label for="nomale">
										不限
									</label>
								</span>
								<span class="radiospan">
									<input type="radio" data-id="1" id="male1" name="TeacherSex" value="1">
									<label for="male1">
										男
									</label>
								</span>
								<span class="radiospan">
									<input type="radio" id="female1" data-id="0" name="TeacherSex" value="0">
									<label for="female1">
										女
									</label>
								</span>
							</div>
						</div>
					</div>
					<div class="dtitem">
						<div class="dl">
							<div class="dt">
								教员身份
							</div>
							<div class="dd">
								<span class="chespan">
									<input type="checkbox" value="19" checked="checked" id="jobche01" name="jobche">
									<label for="jobche01">
										在校大学生
									</label>
								</span>
								<span class="chespan">
									<input type="checkbox" value="18" checked="checked" id="jobche02" name="jobche">
									<label for="jobche02">
										专职老师
									</label>
								</span>
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
									<li data-id="20" class="che classmode">
										一对一家教上门
									</li>
									<li data-id="21" class="che classmode">
										一对一学员上门
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="dtitem">
						<div class="dltop">
							<div class="dt">
								教员要求
							</div>
							<div class="dd">
								<textarea placeholder="请输入对教员具体要求" id="teacherrequire" class="textint dtint"></textarea>
								<div class="textint_limit">
									字数要求
									<span class="ogtxt">
										<span class="textint_limit_num">
											0
										</span>
										/200
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="submitrow">
					<button class="big_ogbtn" id="btnPublish">
						提交
					</button>
				</div>
			</div>
			<!-- end 一行 -->
			<!--end 中间-->
			
		</div>

		<script type="text/javascript" src="<%=basePath %>static/mobile/js/api">
		</script>
		<script type="text/javascript" src="<%=basePath %>static/mobile/js/getscript">
		</script>
		<script>
			$(function() {

				//教师类型
				$("#jobche01,#jobche02").click(function() {
					var attr = $(this).attr('checked');
					if (typeof(attr) == 'undefined') {
						$(this).attr('checked', 'checked');

					} else {
						$(this).removeAttr('checked');
					}
				});

			});
			var regmobile = /^(13[0-9]|14[57]|15[0-35-9]|17[0678]|18[0-9])[0-9]{8}$/;
 			var data = {};
 			
			function nextstep() {
			
				if(!$.trim($("#Grade").val())){
					show("请选择年级!"); 
					return false;
				}
				
				if(!$("#SubjectId").data('id') || !$("#SubjectId").val()) {
					show("请选择辅导科目!"); 
					return;
				}
				
				if(!$("#TeachDate").data('id')){
					show("请选择授课时间!"); 
					return;
				}
				
				if(!$("#AreaId").data('id')|| !$("#AreaId").val()){
					show("请选择授课区域!"); 
					return;
				}
				
				if(!$("#TeachAddress").val()){
					show("请输入授课地址!"); 
					return;
				}
				
				if(!$("#Contact").val()){
					show("请输入联系人!"); 
					return;
				}
				
				if(!$("#Mobile").val() || !regmobile.test($("#Mobile").val())){
					show("请输入正确的联系电话!"); 
					return;
				}
				
				var data = $(this).getForm();
				console.log(data);

				setPage('page2', '', 'indtype', 'indtypename', 0, 1);
			}

			$("#btnPublish").on("click",
			function() {
				var data = $(this).getForm();
				console.log(data);
				
				if(!$("#Salary").val()){
					show("请输入薪酬!"); 
					return;
				}
				
				var teachertype = [];
				
				if ($("#jobche01")) {
			        
			        if ($("#jobche01").attr('checked')) {
			            teachertype.push(19);
			        }
			        if ($("#jobche02").attr('checked')) {
			            teachertype.push(18);
			        }
			    }
			    
			    if(teachertype==""||teachertype==" "){
		        	show("请选择教员身份要求!"); 
					return;
		        }
				
				var classmode = [];
				if ($(".classmode")) {
			        
			        $(".classmode.che").each(function () {
			            classmode.push($(this).data('id'));
			        });
			    }
				
				if(classmode==""||classmode==" "){
		        	show("请选择上课方式!"); 
					return;
		        }
				
				var $this = $("#btnPublish");
				if ($this.attr('disabled')) {
					return false;
				}
				
				data.memberId = $("#memberId").val();//学员编号
	            data.grade = $.trim($("#Grade").val());//就读年级
	            data.sex = $.trim($("#Sex").GetRadioValue());//学员性别
	            data.subjectids = $("#SubjectId").data('id').split(",")[0];//辅导科目编号
	            data.teachdays = $("#TeachDate").data('id');//授课时间
	            data.areaid = $("#AreaId").data('id');//授课区域
	            data.teachaddress = $("#TeachAddress").val();//授课地址
	            data.lat = $("#TeachAddress").data('lat');//经纬度
	            data.lng = $("#TeachAddress").data('lng');//经纬度
	            data.contact = $("#Contact").val();//联系人
	            data.telephone = $("#Mobile").val();//手机号
	            data.contactGender = $.trim($("#ContactSex").GetRadioValue());//联系人性别
	            data.wexin = $("#Wexin").val();//微信号
	            data.sturemark = $("#StuRemark").val();//学生概况
	            data.teacherrequire = $("#teacherrequire").val();//对教员要求
	            data.coursePrice = $("#Salary").val();//课酬
	            data.teachersex = $.trim($("#TeacherSex").GetRadioValue());//教员性别要求
	            data.teachertype = teachertype.join(",");//教员身份要求
	            data.classmode = classmode.join(",");//上课模式
				
				$this.text('正在提交中...').attr('disabled', 'disabled');
				
				$.post('publishOrders.action', data,
				function(res) {
					if (res.success) {
						show(res.message);
						$this.text('提交成功').attr('disabled', false);
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