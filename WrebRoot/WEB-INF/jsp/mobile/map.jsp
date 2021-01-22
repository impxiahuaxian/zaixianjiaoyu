<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta chartset="utf-8">
    <title>【吉师家教网】四平家教网_免费找家教_四平家教一对一在线辅导</title>
	<meta name="keywords" content="四平家教，四平家教兼职，四平兼职家教，家教">
	<meta name="description" content="吉师家教网是四平家教行业权威上门和在线辅导平台,自2003年创立以来,已为四平数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!182-5380-0650。">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
	<link href="<%=basePath %>static/mobile/css/css_old.css" rel="stylesheet">
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
  
<body class="has_bottom" style="">
    
    <header id="gheader">
        <section class="header">

            <aside class="l_header">

                <a class="go_back" style="cursor:pointer;" onclick="goBack();" title="我的"></a>
            </aside>
            <h1 class="g_tit">
                地图
            </h1>

            <script>

            function goBack() {
                window.history.back();
            }
            </script>
            <aside class="r_header">
                <a href="tel:150-6033-8989" class="t_tel"></a>
            </aside>
        </section>
    </header>
    <section class="in_main">
        <div id="allmap" style="position: relative; height: 580px; overflow: hidden; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;"></div>

        <script type="text/javascript" src="<%=basePath %>static/js/api"></script>
        <script type="text/javascript" src="<%=basePath %>static/js/getscript"></script>
        
    </section>




<script type="text/javascript">
    //百度地图API功能
    function loadJScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://api.map.baidu.com/api?v=2.0&ak=aSBzW9RUaCp3AM2dvTjR7f4lE7Tqm4wx&callback=init";
        document.body.appendChild(script);
    }

    window.onload = loadJScript; //异步加载地图
    //默认地理位置设置为上海市浦东新区
    var x=121.48789949,y=31.24916171;
    function init() {
        // 百度地图API功能
        var map = new BMap.Map('allmap'); // 创建Map实例
        map.addControl(new BMap.ScaleControl()); // 添加比例尺控件
        var point = new BMap.Point(x,y);
        map.centerAndZoom(point,18);
        if (25.381590 <= 0) {
            var address = encodeURI('<%=request.getAttribute("address")%>');
            var myGeo = new BMap.Geocoder();
            myGeo.getPoint(address,
                function(point) {
                    if (point) {
                        map.centerAndZoom(point, 18);
                        map.addOverlay(new BMap.Marker(point));
                    }
                },
                "all");
        } else {
            var point = new BMap.Point(<%=request.getAttribute("lng")%>, <%=request.getAttribute("lat")%>);
            var marker = new BMap.Marker(point); // 创建标注
            map.addOverlay(marker); // 将标注添加到地图中
            map.centerAndZoom(point, 18);
        }

        map.enableScrollWheelZoom(); //启用滚轮放大缩小
    }
</script>
</body>
</html>
