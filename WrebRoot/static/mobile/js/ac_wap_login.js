$(function () {
    //$('#UserName').val("");
    //$('#Password').val("");

    $("input[type='text']").attr("autocapitalize", "off");
    $("input[type='password']").attr("autocapitalize", "off");
    $("input[type='checkbox']").on("click", function () {
        var $this = $(this);
        if ($this.hasClass("checked")) {
            $this.removeClass("checked");
            $this.removeAttr("checked");
        } else {
            $this.addClass("checked");
            $this.attr("checked", "checked");
        }
    });

    var scrollImgTimer = null, curImg = 1;
    $('#UserName').on('blur', function () {
        imgTip($(this), '*用户名不能为空');
    });
    $('#Password').on('blur', function () {
        imgTip($(this), '*密码不能为空');
    });
    $('#imgvefyData').on('blur', function () {
        imgTip($(this), '*验证码不能为空');
    });

    $('#login_btn').click(function () {
        $this = $(this);
        if ($this.hasClass('disabled')) {
            return;
        }

        $('#UserName, #Password, #imgvefyData').blur();
        if ($('img.error').length) {
            return;
        }

        $this.val('正在提交中...').attr('disabled', 'disabled');
        var d = {
            IsAsync: true,
            phone: $('#UserName').val(),
            password: $('#Password').val()
        };
        
        $.post('mLogin.action', d, function (res) {
            if (res.Status == 1) {
                if (res.redirect) {
                    window.location.href = res.redirect;;
                }
            } else {
                $('.form_warning').append(res.Message);
                $this.val('立 即 登 录').attr('disabled', false);
            }
        });
    })
});


function imgTip(obj, errorMessage) {
    if ($.trim(obj.val()).length < 1) {
        $('.form_warning').text(errorMessage);
        $(obj).parent().siblings('.common-icon').addClass('wrong_hint');
    } else {
        $('.form_warning').text('');
        $(obj).parent().siblings('.common-icon').removeClass('wrong_hint');
    }
}

