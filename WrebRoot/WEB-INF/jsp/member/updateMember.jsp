<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.District"%>
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



	<!--end一行的左-->
	<div class="r_cell box_r">

		<dl class="r_tab_nav">
			<dd>
				<a href="javascript:void(0)" class="tab_light">基本信息</a>
				<a href="<%=basePath %>member/updatepwdPage.action">密码修改</a>
				<!--<a href="http://putian.ygjj.com/user/changemobile">手机号修改</a>  -->
			</dd>
		</dl>

		<table class="fill_table font_15">
			<tbody>
				<tr>
					<th>
						<label for="ContactSex">
							姓名
						</label>
						
					</th>
					<td id="ContactSex">
						<input type="text" id="UserName" class="fill_text"
							style="width: 180px;" value="<%=member.getName() %>">
						<input type="text" id="memberId" name="memberId" hidden="hidden" value="<%=member.getMemberId() %>">
						<%
							if(member.getGender()==1){
						 %>
						<span class="sel_box_r"> <input type="radio" id="aa-1"
								name="gender" value="1" checked=""> <label for="aa-1">
								先生
							</label> </span>
						<span class="sel_box_r m_l_b"> <input type="radio"
								id="aa-2" name="gender" value="0"> <label for="aa-2">
								女士
							</label> </span>

						<%}else{ %>
						<span class="sel_box_r"> <input type="radio" id="aa-1"
								name="gender" value="1"> <label for="aa-1">
								先生
							</label> </span>
						<span class="sel_box_r m_l_b"> <input type="radio"
								id="aa-2" name="gender" value="0" checked=""> <label
								for="aa-2">
								女士
							</label> </span>
						<%} %>

					</td>

				</tr>

				<tr>
					<th>
						<label for="wechat">
							住址区域
						</label>
					</th>
					<td>
						<div class="dtdropsel dtdropsel_log divselect"
							style="z-index: 13; border: none;" id="AreaId">
							<cite id="district" data-id="<%=member.getDistrictId() %>"><%=member.getDistrict() %></cite>


							<ul class="dtselect_list dtselect_list_scroll">
							<%
							List<District> districtList = (List<District>)request.getAttribute("districtList");
							if(districtList!=null){
								for(int i=0;i<districtList.size();i++){
								District district = districtList.get(i);
							 %>
								<li data-id="<%=district.getDistrictId() %>">
									<%=district.getDistrict() %>
								</li>
								<%
							 	}
							 } 
							 %>

							</ul>

							<script>
    //$("#btnSelectArea").click(function () {
    //    var text = $(".arealist [class=sel]").text();
    //    var id = $(".arealist [class=sel]").data('id');
    //    $("#AreaId").val(text);
    //    $("#AreaId").attr("area", id);
    //    $(".area").text(text).data('id', id);
    //    $("#localPop").removeClass("show");
    //    if (typeof searteacher === 'function') {
    //        searteacher();
    //    }
    //});
</script>
						</div>
					</td>

				</tr>

				<tr>
					<th>
						<label for="TeachAddress">
							大概住址
						</label>
					</th>
					<td>
						<input type="text" id="TeachAddress" class="fill_text"
							placeholder="" value="<%=member.getAddress() %>">
					</td>

				</tr>
				<tr>
					<th>
						<label for="Wexin">
							微信号
						</label>
					</th>
					<td>
						<input type="text" id="Wexin" class="fill_text"
							value="<%=member.getWxNumber() %>">
					</td>

				</tr>
				<tr>
					<th>
						<label></label>
					</th>
					<td>
						<input type="button" id="btnSave"
							class="round_m transition_a login_btn" value="确定修改"
							style="width: 410px">
					</td>
				</tr>
			</tbody>
		</table>


	</div>
	<!--end一行的右-->
	<div id="l-map" style="display: none;"></div>
	<div id="searchResultPanel"
		style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>

	<script type="text/javascript" src="<%=basePath %>static/js/api"></script>
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
    $('#btnSave').click(function () {
        var userName = $.trim($("#UserName").val());
        var districtId = $("#district").data("id");
        var memberId = $.trim($("#memberId").val());
        var address = $.trim($("#TeachAddress").val());
        var wexin = $.trim($("#Wexin").val());
        
        if (userName == '') {
            alert('请输入用户名');
            return false;
        }
     
        if (address == '') {
            alert('请输入大概地址');
            return false;
        }
        $this = $(this);
        var text = $this.text();

        $this.text('正在提交中...').attr('disabled', 'disabled');
        var param = {
        };
        param.userName = userName;
        param.districtId = districtId;
        param.address = address;
        param.wexin = wexin;
        param.gender =  $("input[name='gender']:checked").val();
        param.memberId =  memberId;
        
        $.post('updateMember.action', param, function (res) {
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