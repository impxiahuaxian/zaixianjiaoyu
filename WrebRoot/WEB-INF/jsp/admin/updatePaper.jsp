<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		
        <link href="../static/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../static/back/css/style.css"/>       
        <link href="../static/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="../static/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="../static/back/font/css/font-awesome.min.css" />
        
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="../static/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="../static/back/js/jquery-1.9.1.min.js"></script>
        <script src="../static/back/assets/js/bootstrap.min.js"></script>
		<script src="../static/back/assets/js/typeahead-bs2.min.js"></script>  	         	
        <script src="../static/back/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="../static/back/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="../static/back/js/H-ui.js" type="text/javascript"></script>
        
  		<script type="text/javascript" charset="utf-8" src="../static/back/Widget/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="../static/back/Widget/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="../static/back/Widget/ueditor/lang/zh-cn/zh-cn.js"></script>
	
		<title>试卷上传</title>

  </head>
  
  <body>
  <%
  Paper paper = (Paper)request.getAttribute("paper");
  %>
	<div class="margin clearfix">
			<div class="article_style">
				<div class="add_content" id="form-article-add">
				<input name="pId" type="hidden" value="<%=paper.getpId() %>" id="pId" >
					<ul>
						<li class="clearfix Mandatory">
							<label class="label_name">
								<i>
									*
								</i>
								试卷标题
							</label>
							<span class="formControls col-10">
								<input name="试卷标题" type="text"  id="title"  value="<%=paper.getTitle() %>"  class="col-xs-10 col-sm-5 ">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								<i>
									*
								</i>
								所属年段
							</label>
							<span class="formControls col-4">
								<select class="form-control" id="degree">
									<option value="1">
										小学
									</option>
									<option value="2">
										初中
									</option>
									<option value="3">
										高中
									</option>
								</select>
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								<i>
									*
								</i>
								所属年级
							</label>
							<span class="formControls col-4">
								<select class="form-control" id="grade">
									<option value="1">
										一年级
									</option>
									<option value="2">
										二年级
									</option>
									<option value="3">
										三年级
									</option>
									<option value="4">
										四年级
									</option>
									<option value="5">
										五年级
									</option>
									<option value="6">
										六年级
									</option>
									<option value="7">
										初一
									</option>
									<option value="8">
										初二
									</option>
									<option value="9">
										初三
									</option>
									<option value="10">
										高一
									</option>
									<option value="11">
										高二
									</option>
									<option value="12">
										高三
									</option>
								</select>
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								<i>
									*
								</i>
								所属科目
							</label>
							<span class="formControls col-4">
								<select class="form-control" id="course">
									<option value="1">
										语文
									</option>
									<option value="2">
										数学
									</option>
									<option value="3">
										英语
									</option>
									<option value="4">
										物理
									</option>
									<option value="5">
										生物
									</option>
									<option value="6">
										化学
									</option>
									<option value="7">
										政治
									</option>
									<option value="8">
										历史
									</option>
									<option value="9">
										地理
									</option>
									<option value="10">
										文综
									</option>
									<option value="11">
										理综
									</option>
								</select>
							</span>
						</li>
						<li class="clearfix Mandatory">
							<label class="label_name">
								<i>
									*
								</i>
								下载链接
							</label>
							<span class="formControls col-10">
								<input name="下载链接" type="text" id="downLink" value="<%=paper.getDownLink() %>" class="col-xs-10 col-sm-6 ">
							</span>
						</li>
						<li class="clearfix Mandatory">
							<label class="label_name">
								<i>
									*
								</i>
								下载密码
							</label>
							<span class="formControls col-10">
								<input name="下载密码" type="text" id="downPwd" value="<%=paper.getDownPwd() %>" class="col-xs-10 col-sm-6 ">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								排序
							</label>
							<span class="formControls col-10">
								<input type="text" id="sort" value="<%=paper.getSort() %>" class="col-xs-10 col-sm-1">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								浏览量
							</label>
							<span class="formControls col-10">
								<input type="text" id="view" value="<%=paper.getView() %>" class="col-xs-10 col-sm-1">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								下载量
							</label>
							<span class="formControls col-10">
								<input type="text" id="downNum"  value="<%=paper.getDownNum() %>" class="col-xs-10 col-sm-1">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								文章内容
							</label>
							<span class="formControls col-10">
								<script id="editor" type="text/plain" style="width:100%;height:400px; margin-left:10px;">
								</script>
							</span>
						</li>
					</ul>
					<div class="Button_operation">
						<button onclick="article_save_submit();" class="btn btn-primary radius"
						type="button">
							保存并提交
						</button>
						
					</div>
				</div>
			</div>
	</div>

	<script type="text/javascript">
	/**提交操作**/
	function article_save_submit(){
	     var num=0;
		 var str="";
	     $(".Mandatory input[type$='text']").each(function(n){
	          if($(this).val()=="")
	          {
	               
				   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                title: '提示框',				
					icon:0,								
	          }); 
			    num++;
	            return false;            
	          } 
		 });
		 
		 if(num>0){  
		 	return false;
		 }else{
		 	
		 	var d = {
	            IsAsync: true,
	            pId: $('#pId').val(),
	            title: $('#title').val(),
	            degree: $('#degree').val(),
	            grade: $('#grade').val(),
	            course: $('#course').val(),
	            downLink: $('#downLink').val(),
	            downPwd: $('#downPwd').val(),
	            sort: $('#sort').val(),
	            view: $('#view').val(),
	            downNum: $('#downNum').val(),
	            content:UE.getEditor('editor').getContent()
	        };
	     
       
	        $.post('updatePaper.action', d, function (res) {
	        	
	            if (res.success) {
	            	layer.alert('修改成功！',{
	                	title: '提示框',				
						icon:1,		
				});
					
				   layer.close(index);	
	            } else {
	            	alert(res.message);
	            }
	        });
		 
	  	 }		  		     					
	}
	
	var ue = UE.getEditor('editor');
	
	ue.ready(function() { 
		ue.setContent('<%=paper.getContent()%>'); 
	});
	
	window.onload=function(){
        $('#degree').val("<%=paper.getDegree()%>");
        $('#grade').val("<%=paper.getGrade()%>");
        $('#course').val('<%=paper.getCourse()%>');
	}
</script>

  </body>
</html>

