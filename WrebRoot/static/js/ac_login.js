
jQuery.acSiteUrl = 'https://ac.ppdai.com';
jQuery.acStaticCdnUrl = "https://ac.ppdaicdn.com";
var errorImg = '/images/errorIcon.png';
var correctImg ='/images/correctIcon.png';
var scrollImgTimer = null, curImg = 1;
$('#UserName').on('blur', function () {
    imgTip($(this), errorImg, correctImg, '手机号不能为空');
});
$('#Password').on('blur', function () {
    imgTip($(this), errorImg, correctImg, '密码不能为空');
});
$('#imgyzm').on('blur', function () {
    imgTip($(this), errorImg, correctImg, '验证码不能为空');
});

$(function() {
    
})

$(function () {
    //if (navigator.userAgent.toLowerCase().indexOf("chrome") != -1) {
    //    var selectors = document.getElementsByTagName("input");
    //    for (var i = 0; i < selectors.length; i++) {
    //        if ((selectors[i].type !== "submit") && (selectors[i].type !== "password")) {
    //            selectors[i].value = " ";
    //        }
    //    }
    //    setTimeout(function () {
    //        for (var i = 0; i < selectors.length; i++) {
    //            if (selectors[i].type !== "submit") {
    //                selectors[i].value = "";
    //            }
    //        }
    //    }, 100)
    //}
})
$(document).on("keydown", "#UserName", function (event) {
    var ev = event || window.event;
    if (ev.keyCode == 13) {
        $("#Password").focus();
    }
}).on("keydown", "#Password", function () {
    var ev = event || window.event;
    if (ev.keyCode == 13) {
        $('#login_btn').click();
    }
    
})

//图片轮播,然而并没有什么用
if ($(".imgbg ul li").length - 1 > 0) {
    var _imgBarStr = '<div class="imgbar"><a href="javascript:;" class="cur"></a>', _imgBar;
    for (var i = 1; i < $(".imgbg ul li").length; i++) {
        _imgBarStr += '<a href="javascript:;"></a>';
    }
    _imgBarStr += '</div>';
    _imgBar = $(_imgBarStr);
    _imgBar.children().click(function () {
        clearInterval(scrollImgTimer);
        imgScroll($(this).index());
        scrollImgTimer = setInterval(imgScroll, 5000);
    });
    $(".imgbg").append(_imgBar);
    function imgScroll(n) {
        if (n || n == 0) {
            curImg = n;
        }
        $(".imgbg ul").animate({ "left": -curImg * 573 }, function () {
            _imgBar.children().removeClass("cur").eq(curImg).addClass("cur");
            if (curImg == $(".imgbg ul").children().length - 1) {
                curImg = 0;
            } else {
                curImg++;
            }
        });
    }
    scrollImgTimer = setInterval(imgScroll, 5000);
}


//var qlui_loginuname = $.cookie('qlui_loginuname');
//if (qlui_loginuname != null && qlui_loginuname.length > 0) {
//    $('#UserName').val(qlui_loginuname);
//    //快速登录
//    $('#UserName').blur();
//}

// 每次登录操作强制设置为新版2014
jQuery.cookie('ui-version', null, { expires: -1, path: '/', domain: '.ppdai.com', secure: false });
jQuery.cookie("waterMarkTimeCheck", null, { expires: -1, path: "/", domain: ".ppdai.com", secure: false });
jQuery.cookie("waterMarkTimeCheck1", null, { expires: -1, path: "/", domain: ".ac.ppdai.com", secure: false });

if ($('#wraploginErrorMessage').length > 0 && $.trim($('#wraploginErrorMessage').text()) == '') {
    $('#wraploginErrorMessage').html('');
}

$('#Login input').placeholder();

$('.tpLogin').click(function () {
    var r = btnClick($(this).text());
    if (self == top) {
        window.location.href = r;
    } else {
        top.location.href = r;
    }
});

$('#rememberMe').click(function () {
    var checked = $(this).attr('checked');
    if (checked) {
        $(this).attr('checked', true);
    } else {
        $(this).attr('checked', false);
    }
});

$('#login_btn').click(function () {
    $('#wraploginErrorMessage').empty();
    $this = $(this);
    if ($this.hasClass('disabled')) {
        return;
    }

    $('#UserName, #Password, #imgyzm').blur();
    if ($(".loginErrorMessage:visible").length > 0) {
        return;
    }
    
    $this.val('正在提交中...').attr('disabled', 'disabled');
    var registerType =$(".reg_tab_nav_n .tab_light").index() + 1;
    
    var d = {
        IsAsync: true,
        redirect: $('#Redirect').val(),
        phone: $('#UserName').val(),
        password: $('#Password').val(),
        registerType: registerType,
        validateCode: $('#imgyzm').val(),
        returnUrl: GetQueryString("returnUrl"),
        rememberMe: $('#rememberMe').attr('checked') == 'checked'
    };
    $.post('login.action', d, function (res) {
    	
        if (res.Status == 1) {
            $this.val('登录成功, 跳转中...');
            if (self == top) {
                window.location.href = res.redirect;
            } else {
                top.location.href = res.redirect;
            }
        } else if(res.Status == 2){
        	$this.val('登录成功, 跳转中...');
            if (self == top) {
                window.location.href = res.redirect;
            } else {
                top.location.href = res.redirect;
            }
        }else if(res.Status==0){
        	 $('#wraploginErrorMessage').append($('<div class="loginErrorMessage">' + res.Message + '</div>'));
             $this.val('立 即 登 录').removeAttr('disabled');
             //if (res.Content.ShowImgValidateCode && $('#imgyzm').length < 1) {
             //    //验证码框不存在则刷新
             //    window.location.reload();
             //} else {
             //    $('#wraploginErrorMessage').append($('<div class="loginErrorMessage">' + res.Message + '</div>'));
             //    $this.val('立 即 登 录').attr('disabled', false);

             //    //刷新验证码
             //    if (res.Content.ShowImgValidateCode) {
             //        document.getElementById('CodeImg').src = '/ValidateCode/Image?tmp=' + Math.random();
             //    }
             //}
        }
    });
});

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};

var btnClick = function (name) {
    var ac_siteUrl = jQuery.acSiteUrl;
    var redirectUrl = $('#Redirect').val();
    redirectUrl = encodeURIComponent(redirectUrl);
    var rtnUrl = '';
    switch (name) {
        case "Alipay":
            rtnUrl = ac_siteUrl + '/thirdparty/login?apptype=0&redirect=' + redirectUrl;
            break;
        case "RenRen":
            rtnUrl = ac_siteUrl + '/thirdparty/login?apptype=4&redirect=' + redirectUrl;
            break;
        case "QQ":
            rtnUrl = ac_siteUrl + '/thirdparty/login?apptype=7&redirect=' + redirectUrl;
            break;
        case "Sina":
            rtnUrl = ac_siteUrl + '/thirdparty/login?apptype=3&redirect=' + redirectUrl;
            break;
        case "Tenpay":
            rtnUrl = ac_siteUrl + '/thirdparty/login?apptype=2&redirect=' + redirectUrl;
            break;
        case "Kaixin":
            rtnUrl = ac_siteUrl + '/thirdparty/login?apptype=5&redirect=' + redirectUrl;
            break;
        default:
            break;
    }
    return rtnUrl;
}

function imgTip(obj, errorImg, correctImg, errorMessage) {
    if ($.trim(obj.val()).length < 1) {
        $('#wraploginErrorMessage').append($('<div class="loginErrorMessage">' + errorMessage + '</div>'));
    } else {
        $('#wraploginErrorMessage>div').each(function () {
            if ($(this).html() == errorMessage) {
                $(this).remove();
            }
        });
    }
}

function jump(next, isend) {
    isend = isend || false;
    var nextInp = document.getElementById(next);
    var event = arguments.callee.caller.arguments[0] || window.event;
    if (event.keyCode == 13) {
        //判断是否按了回车，enter的keycode代码是13，想看其他代码请猛戳这里。
        if (isend) {
            $('#login_btn').click();
        } else {
            nextInp.focus();
        }
    }
}
