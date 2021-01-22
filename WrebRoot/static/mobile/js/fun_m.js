/*
 * 输入框、密码框自动填充
 */
//;(function($){
//	$("input[type='email'],input[type='text'],input[type='password'],textarea").each(function(){
//		if($(this).val() == $(this).attr('title')){
//			$(this).val('');
//		}
//		addInput($(this));
//	});
//})(Zepto)

$("input[type='text'],input[type='email'],input[type='password'],textarea").focus(function(){
	var v = $(this).attr('title');
	if(v){
		if($(this).hasClass('mk_password')){
			
		}
		else if($(this).hasClass('password')){
			$(this).attr('type','password').removeClass('password');
		}
		if($(this).val() == v){
			$(this).val('');
		}
		$(this).removeClass('c_tdefault');
	}
	
	if($(this).parent().find('.pclear')[0]){
		$(this).parent().find('.pclear').show();
	}
}).blur(function(){
	if(!$(this).val()){
		addInput($(this));
	}
	
	markPclear = $(this).parent();
});

function addInput(obj){
	if(!obj.val() && obj.attr('title')){
		if(obj.hasClass('mk_password')){
			obj.attr('type','text').addClass('password');
		}else if(obj.attr('type') == 'password'){
			obj.attr('type','text').addClass('password');
		}
		obj.addClass('c_tdefault');
		obj.val(obj.attr('title'));
	}
}

/*
 * 密码框显示隐藏
 */
$('.switch').click(function(){
	var that = $(this).parents('.p').find('.txt');

	if($(this).hasClass('mk')){
		$(this).removeClass('mk');
		that.removeClass('mk_password');
		if(that.val() != that.attr('title')){
			that.attr('type','password');
		}
	}else{
		$(this).addClass('mk');
		that.attr('type','text').addClass('mk_password');
	}
});

/*
 * 清空密码框
 */
$('.pclear').click(function(e){
	$(this).parent().find('input').val('').focus();
	e.stopPropagation();
});

$('.pclear').parent().click(function(e){
	//e.stopPropagation();
});

$('body').click(function(){
	$('.pclear').hide();
});

/*
 * 表单下拉框选择
 */
$(document).on("change", ".selt select",function(){
    var v = $(this).find("option:selected").text();
    $(this).siblings().removeClass('c_tdefault').html(v);
})
/*
 * 短信发送倒计时
 */
function timeClock(num){
	var that = document.getElementById('codeNum');
	num--;
	
	setTime(num);
	
	function setTime(n){
		setTimeout(function(){
			that.innerHTML = n;
			n--;
			
			if(n>=0){
				setTime(n);
			}else{
				var obj = $(that).parent();
				obj.removeClass('c_ashy').html('重新获取');
			}
		},1000);
	}
	
	
}

/*
 * 输入框内容改变
 */
function inputChange(that,fun){
	
	if(that.innerHTML == undefined){
		that = that[0];
	}
	
	if(arguments.length > 2){
		var list = new Array();
		for(var i=2;i<arguments.length;i++){
			list.push(arguments[i]);
		}
	}	
	
	that.oninput = function(){		
		that.onkeydown = null;
		fun(list);
	}
	
	that.onkeydown = function(){
	
		fun(list);
	}
}



//职位详情页的职位描述显示和隐藏
$('.art_more').click(function(){
	var $obj = $(this).parent();
	if($obj.hasClass('on')){
		$obj.removeClass('on');
		$obj.find('.icin').html('显示全部');
	}else{
		$obj.addClass('on');
		$obj.find('.icin').html('隐藏内容');
	}
	
});

/*
 * 弹层效果
 */
function pop(msg,mtype,but1,but2,fun1,fun2,class1,class2,hclose){
	//msg		: 提示框文本内容
	//			  数组信息
	//mtype		: 文本内容前是否带感叹号？0:不带感叹号（默认值）；1:带感叹号；
	//			  仅显示msg内容？2：仅显示内容，不显示按钮
	//			  仅用于标注特殊提示框？3：特殊提示框
	//but1		: 按钮1文案，默认为"确认"
	//but2		: 按钮2文案，无按钮2则为空
	//fun1		: 按钮1回调函数，默认为关闭弹出层
	//fun2		: 按钮2回调函数
	//class1	: 按钮1增加class值
	//class2	: 按钮2增加class值
	//hclose	: 弹出层带手动关闭按钮
	var top = document.body.scrollTop || document.documentElement.scrollTop;
	var h = document.documentElement.clientHeight;
	var h_b = $('body').height();
	var v = 0;
	var s_h = h_b > h ?  h_b : h; 
	
	if(h > 160){
		v = (h-160)/2;
	}
	
	top += v;
	
	mtype	= mtype ? mtype : 0; 
	but1 	= but1 ? but1 : '确认';
	fun1 	= fun1 ? fun1 : 'popclose()';
	fun2 	= fun2 ? fun2 : 'popclose()';
	if( but2 == '取消' ){
		class2 = 'but_gray';
	}
	if(mtype <= 1){
		msg = mtype ? "<em></em>"+msg : msg;
		if($('#pop')[0]){
			$('#pop').css('top',top);
			$('#pop p').html(msg);
			$('#pop .but1').attr('class','but but1 '+class1).val(but1).attr('onclick',fun1);
			if(but2){
				if(!$('#pop .but2')[0]){
					$('#pop .bop').append("<input class='but but2 "+class2+"' type='button' value='"+but2+"' onclick="+fun2+" />");
				}else{
					$('#pop .but2').attr('class','but but2 '+class2).val(but2).attr('onclick',fun2);
				}
			}else{
				$('#pop .but2').remove();
			}
			
			$('#pop,#shadow').show();
			$('#shadow').height(s_h);
		}else{
			var htm  = "<div id='pop' class='bb' style='top:"+top+"px'>";
			htm += "<section>";
			htm += "<p>"+msg+"</p>";
			htm += "<div class='bop'>";
			htm += "<input class='but but1 "+class1+"' onclick="+fun1+" type='button' value='"+but1+"' />";
			if(but2){
				htm += "<input class='but but2 "+class2+"' onclick="+fun2+" type='button' value='"+but2+"' />";
			}
			htm += "</div>";
			htm += "</section>";
			htm += "</div>";
			if(!$('#shadow')[0]){
				htm += "<div id='shadow'></div>";
			}
		
			$('body').append(htm);
			
			$('#pop,#shadow').show();
			$('#shadow').height(s_h);
		}
	}else if(mtype == 2){
		if($('#poptext')[0]){
			$('#poptext').css('top',top);
			$('#poptext p').html(msg);
			if(hclose){
				if(!$('#poptext em')[0]){
					$('#poptext').append("<em onclick='popclose()'></em>");
				}
			}else{
				$('#poptext em').remove();
			}
			$('#poptext,#shadow').show();
			$('#shadow').height(s_h);
		}else{
			var htm  = "<div id='poptext' class='bb' style='top:"+top+"px'>";
				htm += "<p>"+msg+"</p>";
			if(hclose){
				htm += "<em onclick='popclose()'></em>";
			}
				htm += "</div>";
			if(!$('#shadow')[0]){
				htm += "<div id='shadow'></div>";
			}
				
			$('body').append(htm);
			$('#poptext,#shadow').show();
			$('#shadow').height(s_h);
		}
	}else if(mtype == 3){
		top-=113;
		if($('#poplist')[0]){
			$('#poplist').css('top',top);
			$('#poplist strong').html(msg.title);
			$('#poplist .but1').attr('class','but but1 '+class1).val(but1).attr('onclick',fun1);
			$('#poplist .but2').attr('class','but but2 '+class2).val(but2).attr('onclick',fun2);
			var htm = '';
			for(var i=0;i<msg.list.length;i++){
				htm += "<li class='icin "+msg.list[i][2]+"' name='"+msg.list[i][0]+"'>"+msg.list[i][1]+"</li>";
			}
			$('#poplist ul').html(htm);
			$('#poplist,#shadow').show();
			$('#shadow').height(s_h);
		}else{
			var htm  = "<div id='poplist' class='bb' style='top:"+top+"px'>";
				htm += "<strong class='at'>"+msg.title+"</strong>";
				htm += "<section>";
				htm += "<ul id='ulst'>";
			for(var i=0;i<msg.list.length;i++){
				htm += "<li class='icin "+msg.list[i][2]+"' name='"+msg.list[i][0]+"'>"+msg.list[i][1]+"</li>";
			}
				htm += "</ul>";
				htm += "<div class='nt c_dark2'>"+msg.note+"</div>";
				htm += "<div class='bop'>";
				htm += "<input class='but but1 "+class1+"' onclick="+fun1+" type='button' value='"+but1+"' />";
				htm += "<input class='but but2 "+class2+"' onclick="+fun2+" type='button' value='"+but2+"' />";
				htm += "</div>";
				htm += "</section>";
				htm += "</div>";
				if(!$('#shadow')[0]){
					htm += "<div id='shadow'></div>";
				}
				
			$('body').append(htm);
			$('#poplist,#shadow').show();
			$('#shadow').height(s_h);
		}
	}
}

function popclose(){
	$('#pop,#poptext,#poplist,#shadow').hide();
}

/*
 * 二级页面
 */
function pageshow(name){
	$('.page1').hide();
	$('#'+name).show();	
	if($('#template').val() == 'search/joblist'){
		_listopfixed.close();
	}
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

function pageclose(){
	$('.page1').show();
	$('.page2').hide();
	if($('#template').val() == 'search/joblist'){
		_listopfixed.ini();
	}
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}
 
 
/*
 * 二级页面下拉展开
 */
$('.hinfo .slte').click(function(){
	if($('.phead').hasClass('mk')){
		$('.phead').removeClass('mk');
	}else{
		$('.phead').addClass('mk');
	}
});
 
 
$('.ltse .i').click(function(){
	if($(this).hasClass('down')){
		$(this).removeClass('down');
		if($(this).next().hasClass('lsinfo')){
			$(this).next().hide();
		}
	}else{
		$('.ltse .i').removeClass('down');
		$('.ltse .lsinfo').hide();
		if($(this).parent().hasClass('lsinfo')){
			if($(this).hasClass('ck')){
				$(this).removeClass('ck').addClass('nr');;
			}else{
				$(this).removeClass('nr').addClass('ck');
			}
		}else{
			$(this).addClass('down');
			if($(this).next().hasClass('lsinfo')){
				$(this).next().show();
			}
		}
	}
});


/*
 * 薪酬查询
 */
function set_rate(o){
	var w = $('.rte').width();
	var l = (o[3]-o[2])*w/(o[1]-o[0]);
	var r = (o[2]-o[0])*100/(o[1]-o[0]);

	var htm  = "<font class='m1'>￥"+o[0]+"</font><font class='x1'>￥"+o[1]+"</font>";
		htm += "<div style='width:"+l+"px;margin-left:"+r+"%' class='kd bb'>";
		htm += "<font class='m2'>￥"+o[2]+"</font><font class='x2'>￥"+o[3]+"</font>";
		htm += "<span style='width:"+l+"px'></span></div>";

	$('.rte').append(htm);	
	$('.rte .m2,.rte .x2').show();
}

/*
 * 删除左右两端的空格
 */
function trim(str){ 
　	return str.replace(/(^\s*)|(\s*$)/g, "");
}

/*
 * 搜索结果tab
 */
// $('#hser .tab span').click(function(){	
// 	var n = $(this).index();
// 	$(this).addClass('on').siblings().removeClass('on');
	
// 	$('#hser section').hide();
// 	$('#hser section').eq(n).show()
// });

// $('#hser center span').click(function(){
// 	$('#hser .tab span').removeClass('on');
// 	$('#hser section').hide();
// });

// $('#hser .el span').click(function(){
// 	$(this).parent().parent().find('span').removeClass('mk');
// 	$(this).addClass('mk');
// });

// $('#hser .ar').click(function(){
// 	if($(this).hasClass('on')){
// 		$(this).html('地标').removeClass('on');
// 		$('#hser .t_dq').show();
// 		$('#hser .t_db').hide();
// 	}else{
// 		$(this).html('地区').addClass('on');
// 		$('#hser .t_db').show();
// 		$('#hser .t_dq').hide();
// 	}
// });


// $(".e[name='selt']").click(function(){
// 	$(this).find('.i').each(function(){
// 		if($(this).hasClass('i_check')){
// 			$(this).removeClass('i_check').addClass('i_checked');
// 		}else{
// 			$(this).removeClass('i_checked').addClass('i_check');
// 		}
// 	});
// });
$('#hser .tab span').click(function(){	
	if($(this).hasClass('nt')){
		$(this).siblings().removeClass('on');
		$('#hser section').hide();
		return 0;
	}
	
	var n = $(this).index();
	$(this).addClass('on').siblings().removeClass('on');	
	$('#hser section').hide();
	$('#hser section').eq(n).show()
});

$('#hser center span').click(function(){
	$('#hser .tab span').removeClass('on');
	$('#hser section').hide();
});

$('#hser .el span').click(function(){
	$(this).parent().parent().find('span').removeClass('mk');
	$(this).addClass('mk');
});

$('#hser .ar').click(function(){
	if($(this).hasClass('on')){		
		$(this).html('地标').removeClass('on');
		$('#hser .t_dq').show();
		$('#hser .t_db').hide();
	}else{
		$(this).html('地区').addClass('on');
		$('#hser .t_db').show();
		$('#hser .t_dq').hide();
	}
});


$(".e[name='selt']").click(function(){
	$(this).find('.i').each(function(){
		if($(this).hasClass('i_check')){
			$(this).removeClass('i_check').addClass('i_checked');
		}else{
			$(this).removeClass('i_checked').addClass('i_check');
		}
	});
});


function seltAll(obj){
	if(obj.innerHTML == '全选'){
		$('.i_check').each(function(){
			$(this).removeClass('i_check').addClass('i_checked');
		});
		obj.innerHTML = '全取消';
	}else{
		$('.i_checked').each(function(){
			$(this).removeClass('i_checked').addClass('i_check');
		});
		obj.innerHTML = '全选';
	}
}


//function ready to rebuild
$(function(){
	_listopfixed.ini();
});
var topheight = 0;
var _G = {
	screenH	: window.screen.availHeight,
	height : window.screen.availHeight > document.body.clientHeight ? window.screen.availHeight : document.body.clientHeight	
};

var _shadow = {
	show	: function(){
		var shadow = document.getElementById('shadow');
			
		if(!shadow){
	        shadow = document.createElement('div');
	        shadow.id = 'shadow';
	        shadow.style.display = 'none';
	        document.body.appendChild(shadow);
	    }
	    shadow.style.height = _G.height+'px';
	    shadow.style.display = 'block';
	},
	hide	: function(){
		document.getElementById('shadow').style.display = 'none';
	}
};

var _listopfixed = {
	ini : function(){
		var objlist = $('.lop');
		var objH = 50;
		$('.lop.fixed').show();
		if(objlist.length == 2){
			// var $that = $('.lop.normal');
			var $that = $('#addMore');;
			var offset = $that.offset();
			if(offset.top > (_G.screenH+objH)){
				$('.lop').show();
				this.ascroll();
				$(window).scroll(function(event){
					_listopfixed.ascroll();
				});
			}
		}
	},

	close : function(){
		$('.lop').hide();
		$(window).unbind('scroll');
	},

	ascroll : function(){
		var objH = 50;
		var motion = 'scrolldown';
		var ooo = topheight;
		if(topheight > $(window).scrollTop()) {
			motion = 'scrollup';
		}
		topheight = $(window).scrollTop();
		if('search/joblist' == $("#template").val()){
			var oNav=$('#search');
			var oFil=$('.filtertag');
			var oWp= $('.filterwp');
			var ua = navigator.userAgent;

			if(!oNav.hasClass("hasFixed") && oNav.offset()){
				var oT=oNav.offset().top;
			}else{
				var oT=0;
			}
			
			
			if(!oNav.hasClass("hasFixed") && motion == 'scrollup') {
				oFil.removeClass('filFixed1').removeClass('filFixed');
			}
			if($(window).scrollTop() >= oT && $(window).scrollTop() != 0 ){
				if(motion == 'scrollup') {
					//如果下拉，显示关键字输入框
					oNav.addClass('hasFixed');
					oFil.removeClass('filFixed1').addClass('filFixed');
				} else {
					oNav.removeClass('hasFixed');
					oFil.addClass('filFixed1');
				}
			}else{
				oNav.removeClass('hasFixed');
				oFil.removeClass('filFixed').removeClass('filFixed1');
			}
			if($(".filter_shadow").attr("style") == "display: block;"){
				oNav.removeClass('hasFixed');
			}
			
			var val = $(window).scrollTop() + _G.screenH - objH;
			var $that = $('#addMore');
			var offset = $that.offset();

			//去除空隙
			if (oNav.hasClass('hasFixed') || oFil.hasClass('filFixed') || oFil.hasClass('filFixed1')) {
				oWp.addClass('filter_nav');
			}else{
				oWp.removeClass('filter_nav');
			}

			if (/(iPhone|iPad|iPad|iOS)/i.test(ua)) {
				if (navigator.userAgent.indexOf('UCBrowser') > -1) {
					oNav.removeClass('hasFixed');	
			    	oFil.css({'top':0})
				};
			}

			// alert(val);
			// alert(offset.top);
			
			// if(val >= (offset.top)){
				// $('.lop').hide();
			// }else{
				// $('.lop').show();
			// }

			if(val >= (offset.top + 40)) {
				if(!isShowFooter()) {
					appendJoblist();
				}
			}
		} else {
			var val = $(window).scrollTop() + _G.screenH - objH;
			var $that = $('.lop.normal')
			var offset = $that.offset();
			if(val >= offset.top){
				$('.lop.fixed').hide();
			}else{
				$('.lop.fixed').show();
			}
		}
	}
};


// function showHbox(){	//右侧展开边栏
// 	_G.tempTp = $('body').scrollTop();
	
// 	$('body').scrollTop(0);
	
// 	$('#hbox').height(_G.height).show();
	
// 	_shadow.show();
	
// 	$('#hbox,#hbox .anu,#hbox .hbtitle em').click(function(){
// 		$('#hbox,#shadow').hide();
// 		$('body').scrollTop(_G.tempTp);
// 	});
	
// 	$('#hbox .page2').click(function(e){
// 		e.stopPropagation();
// 	});
// }

/*名企招聘浮层*/
$('.tname:first-child').click(function(event) {
	$(this).addClass('mk');
	var ttop=$(this).offset().top;
	$('body').append('<div id="shadow"></div>');
	$('#shadow').css({
		'height':$('body').height()-ttop,
		'top':ttop
	}).show();
	$('.cnco').show();
});
$('.cnco .close').click(function(event){
	$('.tname:first-child').removeClass('mk');
	$('#shadow').remove();
	$('.cnco').hide();
});

//简历数据更新浮层
function home_pop(){
	var swkk=0;
	document.addEventListener("touchmove",function(e){
		if(swkk==0){
			e.preventDefault();
		}
	},false);
	$('.home_pop .but_sm').click(function(event) {
		swkk=1;
	});
	$('.home_pop,#shadow2').show();
	var windowH=$(window).height();
	var tt=$(window).scrollTop();
	var popH=$('.home_pop').height();
	var popT=(windowH-popH)/2+tt;
	$('.home_pop').css('top',popT);
}
//三秒提示浮层
function note(txt,time,area){
	if($('.note')[0]){
		$('.note').addClass('on').children('span').html(txt);
	}else{
		var htm='<div class="note"><span>'+txt+'</span></div>';
		$('body').append(htm);
		setTimeout(function(){
			$('.note').addClass('on');
		},1);
	}
	var area=area?area:'middle';
	var wtop = $(window).height();
	var nheight=$('.note').height();
	var nmiddle=(wtop-nheight)/2;
	var ntop=(wtop-nheight)/5;
	var nbottom=(wtop-nheight)*4/5;
	switch(area){
		case 'top':
			$('.note').css('top',ntop);
			break;
		case 'middle':
			$('.note').css('top',nmiddle);
			break;
		case 'bottom':
			$('.note').css('top',nbottom);
			break;
	}
	var time=time? time:1200;
	setTimeout(function(){
		$('.note').removeClass('on');
	},time);
}