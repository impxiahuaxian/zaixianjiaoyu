<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	
		<title>文章上传</title>

  </head>
  
  <body>
	<div class="margin clearfix">
			<div class="article_style">
				<div class="add_content" id="form-article-add">
					<ul>
						<li class="clearfix Mandatory">
							<label class="label_name">
								<i>
									*
								</i>
								公告标题
							</label>
							<span class="formControls col-10">
								<input name="公告标题" type="text" id="title" class="col-xs-10 col-sm-5 ">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								<i>
									*
								</i>
								所属类型
							</label>
							<span class="formControls col-4">
								<select class="form-control" id="type">
									<option value="0">
										--选择所属类型--
									</option>
									<option value="1">
										通知公告
									</option>
									<option value="2">
										学员必读
									</option>
									<option value="3">
										教员必读
									</option>
								</select>
							</span>
						</li>
						
						<li class="clearfix Mandatory">
							<label class="label_name">
								<i>
									*
								</i>
								公告来源
							</label>
							<span class="formControls col-10">
								<input name="公告来源" type="text" id="source" name="source" class="col-xs-10 col-sm-5 ">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								排序
							</label>
							<span class="formControls col-10">
								<input type="text" id="sort" class="col-xs-10 col-sm-1">
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								<i>
									*
								</i>
								显示
							</label>
							<span class="formControls col-4">
								<select class="form-control" id="display">
									<option value="1">
										是
									</option>
									<option value="0">
										否
									</option>
								</select>
							</span>
						</li>
						<li class="clearfix">
							<label class="label_name">
								公告内容
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
	            title: $('#title').val(),
	            type: $('#type').val(),
	            source: $('#source').val(),
	            sort: $('#sort').val(),
	            display: $('#display').val(),
	            content:UE.getEditor('editor').getContent()
	        };
	     
       
	        $.post('pubNotice.action', d, function (res) {
	        	
	            if (res.success) {
	            	layer.alert('添加成功！',{
	                	title: '提示框',				
						icon:1,		
					});
					
	            } else {
	            	alert(res.message);
	            }
	        });
		 
	  	 }		  		     					
	}
	
	$(function(){
		var ue = UE.getEditor('editor');
		
	});

</script>
	
  </body>
</html>

