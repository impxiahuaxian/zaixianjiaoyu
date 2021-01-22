function changeImg() {
        var imgSrc = $("#codeImg");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }  

//加入时间戳，去缓存机制
function chgUrl(url) {
    var timestamp = (new Date()).valueOf();if ((url.indexOf("&") >= 0)) {
        url = url + "&timestamp=" + timestamp;
    } else {
        url = url + "?timestamp=" + timestamp;
    }
    return url;
}

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
var regmobile = /^(13|14|15|17|18|16|19)[0-9]{9}$/,
    regpasswd2 = /^(?![^a-zA-Z]+$)(?!\D+$).{8,16}$/,
    regpassword = /^[^<>]{6,12}$/,
    regemail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;

if (jQuery.cookie('reg_mobile_remainTime') && jQuery.cookie('reg_mobile_remainTime').length > 0) {
    acUtils.remainTime('#sendtime',
        jQuery.cookie('reg_mobile_remainTime'),
        null,
        '秒再发送',
        'reg_mobile_remainTime',
        { expires: 60, path: '/', domain: jQuery.doMain, secure: false });

    acUtils.remainTime('#sendtime2',
        jQuery.cookie('reg_mobile_remainTime'),
        null,
        '秒再发送',
        'reg_mobile_remainTime',
        { expires: 60, path: '/', domain: jQuery.doMain, secure: false });

    acUtils.remainTime('#sendtime3',
        jQuery.cookie('reg_mobile_remainTime'),
        null,
        '秒再发送',
        'reg_mobile_remainTime',
        { expires: 60, path: '/', domain: jQuery.doMain, secure: false });
}
var smsSend = function (mobile, p1) {
    var sendUrl = '/ValidateCode/MobileWithImgCode?mobilePhone=' + mobile + '&imgCode=' + p1 + '&callback=?';
    $.post(sendUrl, {}, function (res) {
        if (res.success) {
            sendSMS_NoImgCode(mobile);
        } else {
            show(res.message);
        }
    });
};

var sendSMS_NoImgCode = function (mobile) {
    setcookie('mobile', '1');
    $.post('/Register/SendMobileCode',
        { "mobile": mobile, "messageType": 1, verifyCode: $.trim($("#imgvefyData").val()) },
        function (data) {
            if (!data.success) {
                var msg = "";
                if (data.message == 1) {
                    msg = "您发送频率过快，请稍后再试!";
                }
                if (data.message == 2) {
                    msg = "对不起，已超出今日最大发送次数!";
                }
                if (data.message == 3) {
                    msg = "手机号码错误!";
                }
                if (data.message == 4) {
                    msg = "手机号码不存在!";
                }
                if (data.message == 5) {
                    msg = "手机号码已注册!";
                }
                if (data.message == 500) {
                    msg = "服务连接失败!";
                }
                show(msg);
            } else {
                acUtils.remainTime('#sendtime',
                    jQuery.cookie('findpwd_mobile_remainTime'),
                    null,
                    '秒再发送',
                    'reg_mobile_remainTime',
                    { expires: 60, path: '/', domain: jQuery.doMain, secure: false });
                acUtils.remainTime('#sendtime2',
                    jQuery.cookie('findpwd_mobile_remainTime'),
                    null,
                    '秒再发送',
                    'reg_mobile_remainTime',
                    { expires: 60, path: '/', domain: jQuery.doMain, secure: false });
                acUtils.remainTime('#sendtime3',
                    jQuery.cookie('findpwd_mobile_remainTime'),
                    null,
                    '秒再发送',
                    'reg_mobile_remainTime',
                    { expires: 60, path: '/', domain: jQuery.doMain, secure: false });
            }
        });
}
$(function () {

    //学员手机注册 btn
    var isSubmit = false;

    student();
    teacher();
    fudaoban();

   
}
);

function student() {
    function handleClass(ele, addClassName, removeClassName, content) {

    	$('.form_warning').text(content);
        ele.parent().siblings('.common-icon').removeClass(removeClassName).addClass(addClassName);
    }

    //手机号码验证
    $('#mobilephone').blur(function () {

        var This = $(this);
        This.val($.trim(This.val()));
        if ($.trim(This.val()).length < 1) {
            handleClass(This, 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(This.val()))) {
            handleClass(This, 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        } else {
        
            $.post('checkMobileExist.action',
                { mobile: This.val() },
                function (data) {
                    if (!data.success) {
                        handleClass(This, 'wrong_hint', 'true_hint', data.message);
                    } else {
                        handleClass(This, 'true_hint', 'wrong_hint', '');
                    }
                });
        }
    });
 
    //图片验证码
    $('#imgvefyData').blur(function () {
        var This = $(this);
        if ($.trim(This.val()).length < 1) {
            handleClass(This, 'wrong_hint', 'true_hint', '*图片验证码不能为空');
        } else {
     
            handleClass(This, 'true_hint', 'wrong_hint', '');
 
        }
    });

    //密码
    $('#Password').on('blur',
        function () {
            var This = $(this);
            if ($.trim($(this).val()).length < 1) {
                handleClass(This, 'wrong_hint', 'true_hint', '*密码不能为空');
            } else if (!regpassword.test($.trim($(this).val()))) {
                handleClass(This, 'wrong_hint', 'true_hint', '*密码为6-12位字母或数字,且不能包含<>');
            } else {
                handleClass(This, 'true_hint', 'wrong_hint', '');
            }
        });

    //学员获得手机验证码
    $('#sendtime').click(function () {

        var mobilephone = $("#mobilephone");
        mobilephone.val($.trim(mobilephone.val()));
        if ($.trim(mobilephone.val()).length < 1) {
            handleClass(mobilephone, 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(mobilephone.val()))) {
            handleClass(mobilephone, 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        } else {
            if (jQuery.cookie('mobile') && $("#dlImageCode").is(":hidden")) {
                show('请输入图形验证码');
                $("#dlImageCode").show();
                return false;
            }
            $.post('/Register/CheckUserExist',
                { name: "mobilePhone", value: mobilephone.val() },
                function (data) {
                    if (!data.success) {
                        handleClass(mobilephone, 'wrong_hint', 'true_hint', data.message);
                    } else {
                        handleClass(mobilephone, 'true_hint', 'wrong_hint', '');
                    }
                });
        }
        $('#Password').blur();
        if (!$("#dlImageCode").is(":hidden")) {
            $('#imgvefyData').blur();
        }
        if ($('.box1 div.common-icon:lt(3)').hasClass('wrong_hint')) {
            return;
        } else {
            if ($('#imgvefyData').val()) {
                smsSend($('#mobilephone').val(), $('#imgvefyData').val());
            } else {
                sendSMS_NoImgCode($('#mobilephone').val());
            }
        }
    });

    $('#mobireg').click(function () {
        var mobile = $("#mobilephone").val()
        if ($.trim(mobile).length < 1) {
            handleClass($("#mobilephone"), 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(mobile))) {
            handleClass($("#mobilephone"), 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        }
        $('#Password').blur();
        if ($('.form_warning').text() != '') {
            return false;
        }

        isSubmit = true;
        $this = $(this);
        $this.val('正在提交中...').attr('disabled', true);
        var d = {
            IsAsync: true,
            mobile: mobile,
            password: $('#Password').val(),
            registerType: 1,
            verifyCode: $("#imgvefyData").val()
        };

        $.post('mRegister.action',
            d,
            function (res) {
                if (res.success) {
                	alert(res.message);
                    if (self == top) {
                        window.location.href = res.redirect;
                    } else {
                        top.location.href = res.redirect;
                    }
                } else {
                    isSubmit = false;
                    $this.val('注 册').attr('disabled', false);
                    alert(res.message);
                }
            });
    });
};


function teacher() {

    function handleClassTeacher(ele, addClassName, removeClassName, content) {
        $('.form_warning2').text(content);
        ele.parent().siblings('.common-icon').removeClass(removeClassName).addClass(addClassName);
    }

    //图片验证码
    $('#imgvefyData2').blur(function () {
        var This = $(this);
        if ($.trim(This.val()).length < 1) {
            handleClassTeacher(This, 'wrong_hint', 'true_hint', '*图片验证码不能为空');
        } else {
            handleClassTeacher(This, 'wrong_hint', 'true_hint', '');
       
        }
    });

    //手机号码验证
    $('#mobilephone2').blur(function () {

        var This = $(this);
        This.val($.trim(This.val()));
        if ($.trim(This.val()).length < 1) {
            handleClassTeacher(This, 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(This.val()))) {
            handleClassTeacher(This, 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        } else {
         
            $.post('checkMobileExist.action',
                { mobile:  This.val() },
                function (data) {
                    if (!data.success) {
                        handleClassTeacher(This, 'wrong_hint', 'true_hint', data.message);
                    } else {
                        handleClassTeacher(This, 'true_hint', 'wrong_hint', '');
                    }
                });
        }
    });


    //密码
    $('#Password2').on('blur',
        function () {
            var This = $(this);
            if ($.trim($(this).val()).length < 1) {
                handleClassTeacher(This, 'wrong_hint', 'true_hint', '*密码不能为空');
            } else if (!regpassword.test($.trim($(this).val()))) {
                handleClassTeacher(This, 'wrong_hint', 'true_hint', '*密码为6-12位字母或数字,且不能包含<>');
            } else {
                handleClassTeacher(This, 'true_hint', 'wrong_hint', '');
            }
        });

    //
    $('#selectedJop').on('blur',
        function () {
            var This = $(this);
            if ($.trim($(this).val()).length < 1) {
                handleClassTeacher(This, 'wrong_hint', 'true_hint', '*请选择教员身份');
            } else {
                handleClassTeacher(This, 'true_hint', 'wrong_hint', '');
            }
        });

    //教员获得手机验证码
    $('#sendtime2').click(function () {
        var mobilephone = $("#mobilephone2");
        mobilephone.val($.trim(mobilephone.val()));
        if ($.trim(mobilephone.val()).length < 1) {
            handleClassTeacher(mobilephone, 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(mobilephone.val()))) {
            handleClassTeacher(mobilephone, 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        } else {
       
            if (jQuery.cookie('mobile') && $("#dlImageCode").is(":hidden")) {
                show('请输入图形验证码');
                $("#dlImageCode").show();
                return false;
            }
            $.post('/Register/CheckUserExist',
                { name: "mobilePhone", value: mobilephone.val() },
                function (data) {
                    if (!data.success) {
                        handleClassTeacher(mobilephone, 'wrong_hint', 'true_hint', '');
                    } else {
                        handleClassTeacher(mobilephone, 'true_hint', 'wrong_hint', '');
                    }
                });
        }
        $('#Password2').blur();
        if (!$("#dlImageCode").is(":hidden")) {
            $('#imgvefyData2').blur();
        }
        if ($('.box2 div.common-icon:lt(3)').hasClass('wrong_hint')) {
            return;
        } else {
            if ($('#imgvefyData2').val()) {
                smsSend($('#mobilephone2').val(), $('#imgvefyData2').val());
            } else {
                sendSMS_NoImgCode($('#mobilephone2').val());
            }
        }


    });

    //教员
    $('#mobireg2').click(function () {

        var mobile = $("#mobilephone2").val()
        if ($.trim(mobile).length < 1) {
            handleClassTeacher($("#mobilephone2"), 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(mobile))) {
            handleClassTeacher($("#mobilephone2"), 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        }
       
        $('#Password2').blur();
        if ($('.form_warning2').text() != '') {
            return;
        }
        $('#selectedJop').blur();
        if ($('.form_warning2').text() != '') {
            return;
        }

        var teacherType = 18;
        if ($.trim($("#selectedJop").val()) === '大学生') {
            teacherType = 18;
        }
        if ($.trim($("#selectedJop").val()) === '专职教师') {
            teacherType = 19;
        }
      
        isSubmit = true;
        $this = $(this);
        $this.val('正在提交中...').attr('disabled', true);
        var d = {
            IsAsync: true,
            mobile: $("#mobilephone2").val(),
            password: $('#Password2').val(),
            registerType: 2,
            teacherType: teacherType,
            verifyCode: $("#imgvefyData").val()
        };
        $.post('mRegister.action',
            d,
            function (res) {
                if (res.success) {
                	alert(res.message);
                    if (self == top) {
                        window.location.href = res.redirect;
                    } else {
                        top.location.href = res.redirect;
                    }
                } else {
                    isSubmit = false;
                    $this.val('注 册').attr('disabled', false);
                    alert(res.message);
                }
            });
    });
}

function fudaoban() {
    //手机号码验证
    $('#mobilephone3').blur(function () {

        var This = $(this);
        This.val($.trim(This.val()));
        if ($.trim(This.val()).length < 1) {
            handleClassFudaoban(This, 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(This.val()))) {
            handleClassFudaoban(This, 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        } else {
            //ajaxSync(jQuery.acSiteUrl + "/registercheck?callback=?", { name: "mobilePhone", value:This.val() }, function (data) {
            //    if (data.Code != 1) {
            //        handleClass(This,'wrong_hint','true_hint',data.Message);
            //    } else {
            //         handleClass(This,'true_hint','wrong_hint','');
            //    }
            //});
            $.post('/Register/CheckUserExist',
                { name: "mobilePhone", value: This.val() },
                function (data) {
                    if (!data.success) {
                        handleClassFudaoban(This, 'wrong_hint', 'true_hint', data.message);
                    } else {
                        handleClassFudaoban(This, 'true_hint', 'wrong_hint', '');
                    }
                });
        }
    });

    //手机验证码
    $('#mbyzm3').blur(function () {
        var This = $(this);
        if ($.trim(This.val()).length < 1) {
            handleClassFudaoban(This, 'wrong_hint', 'true_hint', '*手机验证码不能为空');
        } else {
            handleClassFudaoban(This, 'wrong_hint', 'true_hint', '');
      
        }
    });

    //密码
    $('#Password3').on('blur',
        function () {
            var This = $(this);
            if ($.trim($(this).val()).length < 1) {
                handleClassFudaoban(This, 'wrong_hint', 'true_hint', '*密码不能为空');
            } else if (!regpassword.test($.trim($(this).val()))) {
                handleClassFudaoban(This, 'wrong_hint', 'true_hint', '*密码为6-12位字母或数字,且不能包含<>');
            } else {
                handleClassFudaoban(This, 'true_hint', 'wrong_hint', '');
            }
        });

    //教员获得手机验证码
    $('#sendtime3').click(function () {
        var mobilephone = $("#mobilephone3");
        mobilephone.val($.trim(mobilephone.val()));
        if ($.trim(mobilephone.val()).length < 1) {
            handleClassFudaoban(mobilephone, 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(mobilephone.val()))) {
            handleClassFudaoban(mobilephone, 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        } else {
    
            if (jQuery.cookie('mobile') && $("#dlImageCode").is(":hidden")) {
                show('请输入图形验证码');
                $("#dlImageCode").show();
                return false;
            }
            $.post('/Register/CheckUserExist',
                { name: "mobilePhone", value: mobilephone.val() },
                function (data) {
                    if (!data.success) {
                        handleClassFudaoban(mobilephone, 'wrong_hint', 'true_hint', '');
                    } else {
                        handleClassFudaoban(mobilephone, 'true_hint', 'wrong_hint', '');
                    }
                });
        }
        $('#Password3').blur();
        if (!$("#dlImageCode").is(":hidden")) {
            $('#imgvefyData').blur();
        }
        if ($('.box3 div.common-icon:lt(3)').hasClass('wrong_hint')) {
            return;
        } else {
            if ($('#imgvefyData3').val()) {
                smsSend($('#mobilephone3').val(), $('#imgvefyData3').val());
            } else {
                sendSMS_NoImgCode($('#mobilephone3').val());
            }
        }
    });
    $('#imgvefyData3').blur(function () {
        var This = $(this);
        if ($.trim(This.val()).length < 1) {
            handleClassFudaoban(This, 'wrong_hint', 'true_hint', '*图片验证码不能为空');
        } else {
           
            handleClassFudaoban(This, 'true_hint', 'wrong_hint', '');

          
        }
    });
    function handleClassFudaoban(ele, addClassName, removeClassName, content) {
        $('.form_warning3').text(content);
        ele.parent().siblings('.common-icon').removeClass(removeClassName).addClass(addClassName);
    }
    //辅导班
    $('#mobireg3').click(function () {
        var mobile = $("#mobilephone3").val()
        if ($.trim(mobile).length < 1) {
            handleClass($("#mobilephone3"), 'wrong_hint', 'true_hint', '*手机不能为空');
        } else if (!regmobile.test($.trim(mobile))) {
            handleClass($("#mobilephone3"), 'wrong_hint', 'true_hint', '*请输入正确的手机号码');
        }

        $('#imgvefyData, #mbyzm3, #Password3').blur();
        if ($('.form_warning3').text() != '') {
            return;
        }
        $('#imgvefyData3').blur(function () {
            var This = $(this);
            if ($.trim(This.val()).length < 1) {
                handleClassFudaoban(This, 'wrong_hint', 'true_hint', '*图片验证码不能为空');
            } else {
               
            }
        });
        isSubmit = true;
        $this = $(this);
        $this.val('正在提交中...').attr('disabled', true);
        var d = {
            IsAsync: true,
            Mobile: $("#mobilephone3").val(),
            Password: $('#Password3').val(),
            ValidateCode: $('#mbyzm3').val(),
            RegisterType: 3,
            RegisterValidateType: $('#regValidateType').val(),
            Redirect: $('#Redirect').val(),
            VerifyCode: $("#imgvefyData").val()
        };
        $.post('/Register/SignUp',
            d,
            function (res) {
                if (res.success) {
                    if (self == top) {
                        window.location.href = res.redirect;
                    } else {
                        top.location.href = res.redirect;
                    }
                } else {
                    isSubmit = false;
                    $this.val('注 册').attr('disabled', false);
                    alert(res.message);
                }
            });
    });
}
