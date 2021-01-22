function changeImg() {
        var imgSrc = $("#codeImg");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }  

　　 //加入时间戳，去缓存机制22222   
function chgUrl(url) {
    var timestamp = (new Date()).valueOf();if ((url.indexOf("&") >= 0)) {
        url = url + "&timestamp=" + timestamp;
    } else {
        url = url + "?timestamp=" + timestamp;
    }
    return url;
}

$(function () {
    //$('#mobilereg input:not("#Password")').placeholder();
    //$('#emailreg input:not("#Password")').placeholder();
    //$('#email').autoMailii({
    //    emails: ['qq.com', '163.com', '126.com', 'sina.com', '21cn.com ', 'hotmail.com', 'sohu.com', 'gmail.com']
    //});
	
	

    var ajaxSync = function (url, data, callback, type, method) {
        if (jQuery.isFunction(data)) {
            type = type || callback;
            callback = data;
            data = undefined;
        }
        $.ajax({
            async: false,
            type: method || 'GET',
            url: url,
            data: data,
            success: callback,
            dataType: 'json'
        });
    };

    //手机注册
    var regmobile =/^(13|14|15|17|18|16|19)[0-9]{9}$/,
        regpasswd = /^(?![^a-zA-Z]+$)(?!\D+$).{6,16}$/,
        regpassword2 = /^[^<>]{6,16}$/,
        regemail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;

    //手机号码验证
    $('#mobilephone').blur(function () {
        var This = $(this);
        This.val($.trim(This.val()));
        if ($.trim(This.val()).length < 1) {
            showError(This, "手机不能为空");
        } else if (!regmobile.test($.trim(This.val()))) {
            showError(This, "请输入正确的手机号码");
        } else {
       
            $.post("checkMobileExist.action", { "mobile": This.val() }, function (data) {
                if (!data.success) {
                    showError(This,data.message);
                } 
            });
            hideError(This);
        }
    });

    function showError(input, msg) {
        input.parent().siblings('.errorMessage').html(msg).show();
    }
    function hideError(input) {
        input.parent().siblings('.errorMessage').hide();
    }
    
    //图片验证码
    $('#imgvefyData').blur(function () {
        var $this = $(this);
        if ($.trim($this.val()).length < 1) {
            showError($this, "图片验证码不能为空");
        } else {
           
            hideError($this);
        }
    });

    //密码
    $('.password').on('blur', function () {
        var $this = $(this);
        if ($.trim($this.val()).length < 1) {
            showError($this, "密码不能为空");
        } else if (!regpassword2.test($.trim($this.val()))) {
            showError($this, "密码为6-16位字母和数字,且不能包含<>");
        } else {

            if (this.id == 'cfmPassword') {
                if ($this.val() != $("#Password").val()) {
                    showError($this, "两次输入的密码不一致");
                    return false;
                }
            }
            hideError($this);
        }
    });

    //复选框
    $('#agree,#agreeemail').bind('blur click', function () {
        var $this = $(this);
        if (this.checked) {
            hideError($this);
        } else {
            showError($this, "必须同意用户协议及教员须知");
        }
    });


    //手机注册 btn
    var isSubmit = false;
    $('#mobireg').click(function () {
        $('#mobilephone,#imgvefyData,  #Password, #agree,#cfmPassword').blur();
        if ($("#mobilereg .errorMessage:visible").length > 0) {
            return;
        }
        

        isSubmit = true;
        $this = $(this);
        $this.val('正在提交中...').attr('disabled', true);
        var registerType =$(".reg_tab_nav_n .tab_light").index() + 1;
        
      
        var d = {
            IsAsync: true,
            mobile: $("#mobilephone").val(),
            password: $('#Password').val(),
            confirmPassword: $('#cfmPassword').val(),
            registerType: registerType,
            verifyCode:$("#imgvefyData").val()
        };
        
       
        $.post('register.action', d, function (res) {
        	
            if (res.success) {
        		alert(res.message);
            	
            } else {
            	isSubmit = false;
                $this.val('注 册').attr('disabled', false);
                alert(res.message);
            	
            }
        });
    });


    //邮箱验证
    $('#email').blur(function () {
        var This = $(this);
        This.val($.trim(This.val()));
        if ($.trim(This.val()).length < 1) {
            This.parent().find('.Exp').attr('class', 'Exp').addClass('Wrong').html('邮箱不能为空').show();
        } else if (!regemail.test($.trim(This.val()))) {
            This.parent().find('.Exp').attr('class', 'Exp').addClass('Wrong').html('邮箱格式不正确').show();
        } else {
            This.parent().find('.Exp').attr('class', 'Exp').addClass('Wrong').hide();
            ajaxSync(jQuery.acSiteUrl + "/registercheck?callback=?", { name: "email", value: This.val() }, function (data) {
                if (data.Code != 1) {
                    This.parent('li').find('.Exp').attr('class', 'Exp').addClass('Wrong').html(data.Message).show();
                } else {
                    This.parent().find('.Exp').attr('class', 'Exp').addClass('Correct').html('').show();
                }
            });
        }
    });

    //邮箱验证码
    $('#emailmbyzm').blur(function () {
        var This = $(this);
        if ($.trim(This.val()).length < 1) {
            This.parent().find('.Exp').attr('class', 'Exp').addClass('Wrong').html('验证不能为空').show();
        } else {
            ajaxSync(jQuery.acSiteUrl + "/registercheck?callback=?", { name: "emailvalidatecode", value: This.val() + ',' + $('#email').val() }, function (data) {
                if (data.Code != 1) {
                    This.parent('li').find('.Exp').attr('class', 'Exp').addClass('Wrong').html(data.Message).show();
                } else {
                    This.parent().find('.Exp').attr('class', 'Exp').addClass('Correct').html('').show();
                }
            });
        }
    });


    //获得邮箱验证码
    $('#getvefydata_email').click(function () {
        $('#email').blur();
        if ($('#login_nav li:first span.Wrong').length > 0) {
            return;
        }

        acUtils.remainTime($(this), 60, null, '秒后重新发送', 'reg_email_remainTime', { expires: 1 / 24 / 60, path: '/', domain: '.ac.ppdai.com', secure: false });
        emailSend($('#email').val());
    });
    if (jQuery.cookie('reg_email_remainTime') && jQuery.cookie('reg_email_remainTime').length > 0) {
        acUtils.remainTime('#getvefydata_email', jQuery.cookie('reg_email_remainTime'), null, '秒后重新发送', 'reg_email_remainTime', { expires: 1 / 24 / 60, path: '/', domain: '.ac.ppdai.com', secure: false });
    }
    var emailSend = function (email) {
        var sendUrl = jQuery.acSiteUrl + '/ValidateCode?ValidateType=Email&email=' + email + '&callback=?';
        $.getJSON(sendUrl, {}, function (res) {
            if (res.Code == 1) {
                //
            } else {
                //console.log(res.Message);
                $('.popErrorMessage').html(res.Message).css('opacity', '1');
            }
        });
    };

    //邮箱注册btn
    $('#emailregbtn').click(function () {
        $('#email, #emailmbyzm, #Password, #agreeemail').blur();
        if ($('#emailreg ul li span.Wrong').length) {
            return;
        }

        isSubmit = true;
        $this = $(this);
        $this.val('正在提交中...').attr('disabled', true);
        var d = {
            IsAsync: true,
            Email: $("#email").val(),
            Password: $('#Password').val(),
            ValidateCode: $('#emailmbyzm').val(),
            Redirect: $('#Redirect').val(),
            RegisterValidateType: $('#regValidateType').val()
        };
        $.post('/User/Register', d, function (res) {
            if (res.Code == 1) {
                if (self == top) {
                    window.location.href = res.Content.Redirect;
                } else {
                    top.location.href = res.Content.Redirect;
                }
            } else {
                isSubmit = false;
                $this.val('注 册').attr('disabled', false);
                alert(res.Message);
            }
        });
    });


    $('.tabnav li').click(function () {
        var acSiteUrl = jQuery.acSiteUrl;
        var $this = $(this);
        if ($this.hasClass('current')) {
            //
        } else {
            var url = acSiteUrl + '/User/Register?regWay=' + $this.data('regway');
            window.location.href = url;
        }
    });
    $('.userRole').click(function () {
        var $this = $(this);
        $this.addClass('cur').siblings().removeClass('cur');

        var regvalidatetype = $this.data('regvalidatetype');
        $('#regValidateType').val(regvalidatetype);

        if (regvalidatetype.toLowerCase().indexOf('lender') > -1) {
            $('.policy1').hide();
            $('.policy2').show();
        } else {
            $('.policy1').show();
            $('.policy2').hide();
        }
    });
    $('.tpLogin').click(function () {
        var r = btnClick($(this).text());
        if (self == top) {
            window.location.href = r;
        } else {
            parent.location.href = r;
        }
    });
});

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
