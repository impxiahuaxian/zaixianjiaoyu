<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.GradePrice"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>
     	【吉师家教网】四平家教价格_四平中小学家教资费标准_四平中学家教课时费
    </title>
    <meta name="keywords" content="家教价格,英语家教价格,数学家教价格,钢琴家教价格,福州家教价格,阳光家教网课费高不高">
    <meta name="description" content="吉师家教涵盖了上百种科目家教价格，是吉师家教网根据广大四平家教学员和教员反馈、协商制定的家教学员和家教教员双方都能接受和认可的家教价格标准">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
   	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">


    <link href="<%=basePath %>static/mobile/css/css_old.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="author" content="[家教 家教网 家教服务]">
    <meta name="copyright" content="阳光家教网">
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
  
 <body class="has_bottom">
    <header id="gheader">
        <section class="header">
            <aside class="l_header" onclick="window.history.back();"><a href="javascript:void(0)" class="go_back"></a></aside>
            <h1 class="g_tit">吉师家教价格</h1>
        </section>
    </header>
    <!--end全局頭部-->
    <section class="in_main">
            <table class="date_t np_date">
                <tbody>
                    <tr class="red_bg">
                        <th>家教类目</th>
                        <th>大学生家教价格</th>
                        <th>教师家教价格</th>
                    </tr>
                    <%
	                List<GradePrice> gradePriceList = (List<GradePrice>)request.getAttribute("gradePriceList");
	                if(gradePriceList!=null){
	                	for(int i=0;i<gradePriceList.size();i++){
	                		GradePrice gradePrice = gradePriceList.get(i);
	                %>
	                 		<tr>
	                            <th><%=gradePrice.getGradeName() %></th>
	                                    <td><b class="orange_text">¥<%=gradePrice.getSminPrice() %>-<%=gradePrice.getSmaxPrice() %></b></td>
	                                    <td><b class="orange_text">¥<%=gradePrice.getTminPrice() %>-<%=gradePrice.getTmaxPrice() %></b></td>
	                        </tr>
	                 	
	                <%	   		
	                	}
	                } 
	                %>

                </tbody>
            </table>
            
            


    </section>
    <!--end中间-->
    <!--end全局脚部-->

</body></html>
