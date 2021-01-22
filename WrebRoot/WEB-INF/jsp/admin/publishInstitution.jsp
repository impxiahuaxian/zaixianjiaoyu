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
	
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/code.js"></script>
	
		<script type="text/javascript">
			//图片上传预览    IE是用了滤镜。
			function previewImage2(file) {
				var MAXWIDTH = 280;
				var MAXHEIGHT = 240;
				var div = document.getElementById('preview2');
				if(file.files && file.files[0]) {
					div.innerHTML = '<img id=imghead2>';
					var img = document.getElementById('imghead2');
					img.onload = function() {
						var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
						img.width = rect.width;
						img.height = rect.height;
						img.style.marginTop = rect.top + 'px';
					}
					var reader = new FileReader();
					reader.onload = function(evt) {
						img.src = evt.target.result;
					}
					reader.readAsDataURL(file.files[0]);
				} else //兼容IE
				{
					var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
					file.select();
					var src = document.selection.createRange().text;
					div.innerHTML = '<img id=imghead2>';
					var img = document.getElementById('imghead2');
					img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
					status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
					div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
				}
			}

			function clacImgZoomParam(maxWidth, maxHeight, width, height) {
				var param = {
					top: 0,
					left: 0,
					width: width,
					height: height
				};
				if(width > maxWidth || height > maxHeight) {
					rateWidth = width / maxWidth;
					rateHeight = height / maxHeight;

					if(rateWidth > rateHeight) {
						param.width = maxWidth;
						param.height = Math.round(height / rateWidth);
					} else {
						param.width = Math.round(width / rateHeight);
						param.height = maxHeight;
					}
				}
				param.left = Math.round((maxWidth - param.width) / 2);
				param.top = Math.round((maxHeight - param.height) / 2);
				return param;
			}
		</script>
  </head>
  
  <body>
    <div class="w_1200 d_center white_bj">
    
	<form action="pubInstitution.action" id="form" name="form" method="post" enctype="multipart/form-data">
		<div class="r_cell box_r">
		    <h4 class="r_th_y"><b>发布辅导机构</b></h4>
		    <table class="fill_table font_15">
		        <tbody>
		            <tr>
		                <th><label for="logo">LOGO</label></th>
		                <td>
		                	<div id="preview2" >
		                        <img id="imghead2" width="280" height="240" border="0" src="../static/img/photo.png">
							</div>
							<label for="file" ><img src="../static/img/upload.png" style="border:0px" ></label>
							<input type="file"  id="file" name="file" style="display: none" onchange="previewImage2(this)">
		                </td>
		            </tr>
		            
		            <tr>
		                <th><label for="iName">机构名称</label></th>
		                <td><input type="text" class="fill_text" value="" id="iName" name="iName"></td>
		            </tr>
		
		            <tr>
		                <th>免费听课</th>
		                <td id="selSex">
		               		<input type="radio" name="isListen" value="1" checked="checked" />是
		               		<input type="radio" name="isListen" value="0"/>否
		                </td>
		            </tr>
					<tr>
		                <th>教学阶段</th>
		                <td >
			                <%
			                    List<DictInfo> dictList = (List<DictInfo>)request.getAttribute("dictList");
			                    for(int i = 0 ; i < dictList.size(); i++){
			                    	DictInfo dictInfo = dictList.get(i);
			              	%>
			              		<input name="kemudalei"  id="kemudalei" type="checkbox" value="<%=dictInfo.getDictId() %>" />
			              		<%=dictInfo.getContent() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   <%
		                    }
		                  	%>
		                </td>
		            </tr>
		            
		            <tr>
		                <th>教学科目</th>
		                <td>
		                	<input type="text" class="fill_text" value="" id="course" name="course">
		                </td>
		            </tr>
		
		            <tr>
		                <th>授课区域</th>
		                <td>
			                <select name="areaId" id="areaId">
							  <option value = "1">城厢区</option>
							  <option value = "2">荔城区</option>
							  <option value = "3">秀屿区</option>
							  <option value = "4">涵江区</option>
							  <option value = "5">仙游县</option>
							</select>
		                </td>
		            </tr>
		 			
		            <tr>
		                <th><label for="TeachAddress">授课地址</label></th>
		                <td>
		                <input type="text" class="fill_text" id="TeachAddress" name="TeachAddress" placeholder="">
		                <input type="hidden"  id="lat" name="lat" value="">
		                <input type="hidden"  id="lng" name="lng" value="">
		                
		                </td>
		            </tr>
		            <tr>
		                <th>授课方式</th>
		                <td>
		                	<input type="text" class="fill_text" value="" id="teachingType" name="teachingType">
		                </td>
		            </tr>
		 			<tr>
		                <th><label for="introduce">机构描述</label></th>
		                <td><textarea class="fill_textarea fill_textarea_m" id="introduce" name="introduce" maxlength="200" placeholder="机构描述"></textarea></td>
		            </tr>
		            <tr>
		                <th><label for="teachingPrice">授课价格</label></th>
		                <td><textarea class="fill_textarea fill_textarea_m" id="teachingPrice" name="teachingPrice" maxlength="200" placeholder="授课价格"></textarea></td>
		            </tr>
		            <tr>
		                <th>排序</th>
		                <td>
		                	<input type="text" class="fill_text" value="" id="sort" name="sort">
		                </td>
		            </tr>
		
		            <tr>
		                <th><label for="contactName">联系人</label></th>
		                <td id="contactSex">
		                    <input type="text" class="fill_text" id="contactName" name="contactName" value="">
		                </td>
		            </tr>
		
		            <tr>
		                <th><label for="contactPhone">联系电话</label></th>
		                <td><input type="text" class="fill_text" value="" id="contactPhone" name="contactPhone"></td>
		            </tr>
		
		            <tr>
		                <th><label for="wechat">QQ</label></th>
		                <td><input type="text" class="fill_text" id="qq" name="qq" value=""></td>
		            </tr>
		        </tbody>
		        <tfoot>
		            <tr>
		                <th></th>
		                <td><input type="submit" class="round_m transition_a fill_btn" id="btnPublish" value="提交"></td>
		            </tr>
		        </tfoot>
		    </table>
		</div>
	</form>

<div id="l-map" style="display:none;"></div>
<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&amp;ak=aSBzW9RUaCp3AM2dvTjR7f4lE7Tqm4wx&amp;services=&amp;t=20190123111209"></script>
<script type="text/javascript" src="<%=basePath %>static/js/getscript"></script>

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
                    $("#lng").val( pp.lng);
                    $("#lat").val( pp.lat);
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

	</div>
  </body>
</html>
