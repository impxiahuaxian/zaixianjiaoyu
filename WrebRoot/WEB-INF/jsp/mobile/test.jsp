<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />

<title>滑动到底部加载下一页内容</title>

<script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js"></script>

<script src="<%=basePath %>static/mobile/js/zepto.min.js"></script>

<style>

table {

    width:100%;

    padding:0 15px;

    background:#fff;

    border-collapse: collapse;

}

table td {

    padding: 6px 0;

    width:33%;

    border-bottom:1px solid #e1e1e1;

}

tr td:nth-child(2) {

    text-align: center;

}

tr td img {

    width: 24px;

    vertical-align: middle;

}

tr td:last-child {

    text-align: right;

}

td>div:first-child {

    /*margin-bottom: -6px;*/

}

td>div:last-child {

    color: #9C9C9C;

}

</style>

</head>

<body >

<input type="hidden" name="pageNo" id="pageNo" value="1" />

<div class="white" >

        <table id="wrapper">

             

        </table>

    </div>

</body>

<script>
$(function(){

    query('01');//第一次加载

});

function query(type)

{

    $.ajax({

        url : "<%=basePath%>/query.action",

        data : {

            pageNo : $("#pageNo").val()

        },

        cache : false,

        success : function(data) {

            loading=true;

            if(data==null){
                $("#pageNo").val(parseInt($("#pageNo").val())-1);   
            }else{       
                var content="";
                
                if(type=="00"){

                    if(data.length==0){

                         $("#pageNo").val(parseInt($("#pageNo").val())-1);  

                         return "";

                    }

                    for(var i=0;i<data.length;i++)

                    {
                      content=content

                            +   '<tr>'

                            +   '<td><div>'+data[i].id+'</div><div>'+data[i].time+'</div></td>'

                            +   '<td>¥'+data[i].amount+'</td>'

                            +   '</tr>';

                    }

                    $("#wrapper").append(content);

                }else{

                    for(var i=0;i<data.length;i++)

                    {
                          content=content
                                +   '<tr>'

                                +   '<td><div>'+data[i].id+'</div><div>'+data[i].time+'</div></td>'

                                +   '<td>¥'+data[i].amount+'</td>'

                                +   '</tr>';

                    }

                    $("#wrapper").html(content);

                }

            }

        },

        error : function(){

            loading=true;

            $("#pageNo").val(parseInt($("#pageNo").val())-1);   

            _alert("查询数据出错啦，请刷新再试");

        }

    });

}

 var loading=false;

 Zepto(function($){

     $(window).scroll(function(){

     if(($(window).scrollTop()+$(window).height()>$(document).height()-10)&&loading){

            loading=false;

            $("#pageNo").val(parseInt($("#pageNo").val())+1);

            query("00");

           }

        });

     })

      

     var ua = navigator.userAgent.toLowerCase();    

     if (/android/.test(ua)) {

        $('.date>div>img:last').css({"margin-left":"-25px"});

     }

</script>

</html>