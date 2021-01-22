<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Institution"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            【吉师家教】四平家教网_免费找家教_四平家教一对一在线辅导
        </title>
        
	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">        
        
        <meta name="keywords" content="小班、辅导班、培训班、晚托班">
        <meta name="description" content="阳光家教网南宁辅导班版块提供了南宁各区域众多精品小班、辅导班、培训班、托管班的信息，免费供学员查询，价格合理">
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
  
  <body>
    <div class="page1">
        <header>
			<h3>
				<a href="javascript:history.back(-1)" class="fh">
					返回
				</a>
				辅导班中心
	            <a style="float: right;color: white;" href="<%=basePath %>mobile.action" title="首页">
	          	 首页
	            </a>
			</h3>

		</header>
            <!-- 中间 -->
            <!-- 一行 -->
            
            <ul class="cflist" id="main">
            <%
            List<Institution> institutionList = (List<Institution>)request.getAttribute("institutionList");
            if(institutionList!=null){
            	for(int i = 0; i < institutionList.size(); i++){
            		Institution institution = institutionList.get(i);
            %>
            	<li class="cfitem">
                    <a href="<%=basePath %>institution/mInstitutionInfo.action?id=<%=institution.getiId() %>" class="cfface">
                        <div class="cfface_content">
                            <div class="coursecut">
                                <div class="coursecut_img">
                                    <img src="<%=basePath %>static/institutionimg/<%=institution.getLogo() %>"
                                    alt="">
                                </div>
                                <div class="coursecut_content">
                                    <div class="coursecut_title" >
                                        <%=institution.getiName() %>
                                    </div>
                                    <div class="cfface_info_mc"  >
	                                        授课科目：<%=institution.getCourse() %>
	                                </div>
                                    <div class="tags">
                                        <ul class="tagslist">
                                            <li>
                                                <%=institution.getTeachingType() %>
                                            </li>
                                            <li>
                                                免费试听
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="cfface_info_mc" >
                                        价格：<%=institution.getTeachingPrice() %>
                                    </div>
                                </div>
                            </div>
                            <div class="cfface_info">
                                <div class="cfface_info_mc">
                                    <span class="cfface_p">
                                        地址：<%=institution.getAddress() %>
                                    </span>
                                </div>
                                <span class="inf">
                                    <%=institution.getPubTime() %>
                                </span>
                            </div>
                        </div>
                    </a>
                </li>
            <%
            	}
            
            }
            %>
            </ul>
            
        </div>
        
        
        <!-- gotop -->
        <a href="javascript:void(0)" class="gotop_toolbtn toolbtn" style="display: none;">
            顶部
        </a>
        <!-- end gotop -->
        
        <!-- ntextpop -->
        <div class="ntextpop" id="messagebox">
            <span class="ntextpop_content">
            </span>
        </div>
        <!-- end ntextpop -->
       
       
        <script src="./南宁小班_南宁晚托班_南宁辅导班_南宁培训班,第0页_files/tool.js">
        </script>
        
        <script>

            function show(msg) {
                $(".ntextpop_content").text(msg);
                //$(".ntextpop").addClass("show");
                $(".ntextpop").fadeIn(1000).fadeOut(0);
            }
        </script>
        
    </body>

</html>
