// banner
if ((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)) { } else {
    window.addEventListener("load", function () {
        var innerbn = document.getElementById("bnActive");
        innerbn != null ? innerbn.classList.add("active") : 0;
    });
}
// end banner



if (typeof $ != "undefined") {
    ; $(function () {

        $(":radio").click(function () {
            var $this = $(this);
            if (!$this.attr("checked")) {
                $this.attr("checked", "checked");
                $this.parent().siblings().find(":radio").removeAttr("checked");
                $this.parent().parent().siblings().find(":radio").removeAttr("checked");
                if ($this.closest('div,td').children('#SalaryMin').length > 0) {
                    if ($this.data('id') == 1) {
                        $("#SalaryMin").attr('disabled', 'disabled').val('');
                        $("#SalaryMax").attr('disabled', 'disabled').val('');
                    } else {
                        $("#SalaryMin").removeAttr('disabled', 'disabled');
                        $("#SalaryMax").removeAttr('disabled', 'disabled');
                    }
                }
            }
        });

        $(":checkbox").click(function () {
            var $this = $(this);
            if (!$this.attr("checked")) {
                $this.attr("checked", "checked");
                $this.parent().siblings().find(":radio").removeAttr("checked");
                $this.parent().parent().siblings().find(":radio").removeAttr("checked");
            } else {
                $this.removeAttr("checked");
            }
        });
        //下拉
        $(".divselect_box").each(function () {
            var divselect = $(this),
                citySelect = divselect.find(".citySelect"),
                cityhd = citySelect.find(".dorpdown_province li"),
                cityhdCur = citySelect.find(".dorpdown_province .cur"),
                cityItem = citySelect.find(".dorpdown_city ul");
            divselect.click(function (e) {
                !divselect.hasClass("divselect_boxopen") && !$(e.target).closest(".dorpdown_city li").length ? divselect.addClass("divselect_boxopen") : 0;
            });
            function active(el) {
                var val = el.data("province");
                cityItem.hide();
                for (var i = cityItem.length - 1; i >= 0; i--) {
                    $(cityItem[i]).data("province") == val ? function () {
                        $(cityItem[i]).show();
                    }() : 0;
                };
            }
            active(cityhdCur);
            cityhd.mouseenter(function () {
                var ths = $(this);
                ths.addClass("cur").siblings().removeClass("cur");
                active(ths);
            });
            cityItem.find("li").click(function () {
                divselect.removeClass("divselect_boxopen");
                divselect.find("cite").text($(this).text());
            });
        });
        $(window).on("click", function (e) {
            !$(e.target).closest(".divselect_box").length ? $(".divselect_box").removeClass("divselect_boxopen") : 0;
        });
        //



        //左导航
        $('.nav_ul li').click(function () {
            $(this).addClass('light').siblings().removeClass('light');
        });
        //

        //点击高亮
        $('.click_a').click(function () {
            $(this).toggleClass('active');
        });
        $('.click_a_o a').click(function () {
            $(this).addClass('active').siblings().removeClass('active');
        });
        //

        //表格隔行变色
        $('.even_table tbody tr:odd').addClass('tr_even');
        //

        //授课时间
        $('.select_a').click(function () {
            $(this).parent().parent().children('.time_hide_box').toggle();
        });
        //

        //隔行变色
        $('.even_li').each(function () {
            $(this).children('li:odd').addClass('li_even');
        });
        //

        //学生评价
        $('.show_first').each(function () {
            $(this).find('li:gt(0)').hide();
        });
        $('.bbs_more_a').click(function () {
            var bbs_box = $(this).parent().siblings();
            if (bbs_box.find('li:last').is(":visible")) {
                bbs_box.find('li:gt(0)').hide();
                $(this).text("查看全部7条评价");
            } else {
                bbs_box.find('li').show();
                $(this).text("简略显示相关评价");
            }
        });
        $('.bbs_more_a2').click(function () {
            var bbs_box2 = $(this).parent().siblings();
            if (bbs_box2.find('li:last').is(":visible")) {
                bbs_box2.find('li:gt(0)').hide();
                $(this).text("查看全部7条总结");
            } else {
                bbs_box2.find('li').show();
                $(this).text("简略显示相关总结");
            }
        });

        //选择科目
        $('.subject_box .show').addClass('subject_click');
        $('.subject_box .show .select_ul_box').show('slow');
        $('.th_more_a').click(function () {
            $(this).parent().parent().toggleClass('subject_click').siblings().removeClass('subject_click');
            $(this).parent().parent().children('.select_ul_box').slideToggle().end().siblings().children('.select_ul_box').slideUp();
        });
        //

        //显示分享
        //$('.hover_box').hover(function () {
        //    $(this).children('.sec_box').slideDown();
        //}, function () {
        //    $(this).children('.sec_box').slideUp();
        //});
        $('.hover_box').mouseover(function () {
            $(this).children('.sec_box').show();
        }).mouseout(function () {
            $(this).children('.sec_box').hide();
        });

        //

        //表格经过
        $('.hover_table tbody tr').hover(function () {
            $(this).addClass('tr_hover');
        }, function () {
            $(this).removeClass('tr_hover');
        });
        //




        //全选功能
        (function () {
            $(".all_sel :checkbox").click(function () {
                var checkbox = $(this).closest(".tabItem").find(".list_table :checkbox,.che_ul :checkbox");
                if ($(this).prop("checked")) {
                    checkbox.prop("checked", true);
                } else {
                    checkbox.prop("checked", false);
                }
            });
            $(".list_table :checkbox,.che_ul :checkbox").click(function () {
                var parents = $(this).closest(".tabItem"),
                    allche = parents.find(".all_sel :checkbox"),
                    checkboxlength = parents.find(".list_table :checkbox,.che_ul :checkbox").length,
                    checkedlength = parents.find(".list_table :checked,.che_ul :checked").length;
                if (checkedlength == checkboxlength) {
                    allche.prop("checked", true);
                } else {
                    allche.prop("checked", false);
                }
            });
        })();
        //end全选功能



        //我的消息
        //展开
        var $moreBtn = $('.mes_a');
        $moreBtn.click(function () {
            var $divNone = $(this).parent().parent().siblings('.d');
            if ($divNone.is(":visible")) {
                $divNone.hide();
                $(this).text("点击展开详情>>");
            } else {
                $divNone.show();
                $(this).text("收起详情>>");
            }
        });
        //删除
        $('.mes_del').click(function () {
            $(this).parent().parent().parent('li').fadeOut();
        });
        //

        //滚动图片
        if ($().slide) {
            (function () {
                //大图切换
                $(".focusDp").slide({
                    mainCell: ".bigImg", titCell: ".smallImg li", effect: "left", autoPlay: true, pnLoop: false, delayTime: 400, interTime: 3000,
                    startFun: function (i, p) {
                        //控制小图自动翻页
                        if (i == 0) { $(".focusDp .sPrev").click() } else if (i % 4 == 0) { $(".focusDp .sNext").click() }
                    }
                });
                //小图左滚动切换
                $(".focusDp .smallScroll").slide({ mainCell: "ul", delayTime: 100, vis: 5, scroll: 1, effect: "left", autoPage: true, prevCell: ".sPrev", nextCell: ".sNext", pnLoop: false });
            })();
        };
        // end

        if ($(".tab_nav dd").hasClass("do-ajax")) {
            //标签导航
            $(".tab_nav dd a:first").addClass("tab_light");


            $(".tab_box > div").hide();
            $(".tab_box > div:first").show();


            $('.tab_nav dd a').click(function () {
                $(this).addClass('tab_light').siblings().removeClass('tab_light');
                //$(".tab_box > div").hide().eq($('.tab_nav dd a').index(this)).fadeIn();

                var index = $(".reg_tab_nav_n .tab_light").index();
                if (index == 0) {
                    $(".policy1").show();
                    $(".policy2").hide();
                    $(".policy3").hide();
                }
                if (index == 1) {
                    $(".policy1").hide();
                    $(".policy2").show();
                    $(".policy3").hide();
                }
                if (index == 2) {
                    $(".policy1").hide();
                    $(".policy2").hide();
                    $(".policy3").show();
                }
            });

            //标签导航
            $(".tab_nav dd a:first").addClass("tab_light");
            $(".tab_box > div").hide();
            $(".tab_box > div:first").show();
            $('.tab_nav dd a').click(function () {
                $(this).addClass('tab_light').siblings().removeClass('tab_light');
                $(".tab_box > div").hide().eq($('.tab_nav dd a').index(this)).fadeIn();
            });
            //
            //二级标签导航
            $('.tab_nav_sec li a:first').addClass('tab_light');
            $(".tab_box_sec > div").hide();
            $(".tab_box_sec > div:first").show();
            $('.tab_nav_sec li a').click(function () {
                $(this).addClass('tab_light').siblings().removeClass('tab_light');
                $(".tab_box_sec > div").hide().eq($('.tab_nav_sec li a').index(this)).fadeIn();
            });
            //
        }
        //标签导航
        $(".tab_nav_w dd").each(function () {
            $(this).children('a:first').addClass('tab_light');
        });
        $(".tab_box_w > div").hide();
        $(".tab_box_w").each(function (index, element) {
            $(this).children("div:first").show();
        });
        $('.tab_nav_w dd a').click(function () {
            $(this).addClass('tab_light').siblings().removeClass('tab_light');
            $(this).parents(".h_tab").children(".tab_box_o").children(".tab_box_w").children("div").hide().eq($(this).index()).fadeIn();
        });
        //

        //标签导航
        $(".tab_nav_n dd").each(function () {
            $(this).children('a:first').addClass('tab_light');
        });
        $(".tab_box_n > div").hide();
        $(".tab_box_n").each(function (index, element) {
            $(this).children("div:first").show();
        });
        $('.tab_nav_n dd a').click(function () {
            $(this).addClass('tab_light').siblings().removeClass('tab_light');
            $(this).parents(".h_tab_n").children(".tab_box_n").children("div").hide().eq($(this).index()).fadeIn();
        });
        //


        //返回顶部
        var ftoolTop = $("#ftoolTop");
        ftoolTop.click(function (e) {
            e.preventDefault();
            $("html,body").animate({ scrollTop: 0 }, 500);
        });
        $(window).on("DOMContentLoaded scroll resize", function () {
            $(this).scrollTop() == 0 ? ftoolTop.hide() : ftoolTop.show();
        });
        //

        // nav
        (function () {
            var $slideNav = $("#slideNav"),
                $currentNav = $slideNav.find(".current_nav"),
                $slideNavLine = $("#slideNavLine"),
                $el, leftPos, newWidth;
            if ($slideNavLine.length > 0) {
                $slideNavLine.css({
                    "width": $currentNav.innerWidth(),
                    "left": $currentNav.position().left
                }).data("origLeft", $slideNavLine.position().left).data("origWidth", $slideNavLine.width());
                $slideNav.find("a").hover(function () {
                    $el = $(this);
                    leftPos = $el.position().left;
                    newWidth = $el.innerWidth();
                    $slideNavLine.stop().animate({
                        left: leftPos,
                        width: newWidth
                    });
                }, function () {
                    $slideNavLine.stop().animate({
                        left: $slideNavLine.data("origLeft"),
                        width: $slideNavLine.data("origWidth")
                    });
                });
            };
        })();
        // end nav


        //下拉选择
        $(function () {
            $(".divselect").on("click", function () {
                $(this).toggleClass("divselect_open");
            });
            $(".divselect").on("click", "li", function () {
                $(this).closest(".divselect").find("cite").text($(this).text());
                $(this).closest(".divselect").find("cite").data("id", $(this).data("id"));
            });


            $(".divselect_box li").click(function () {
                $(this).closest(".divselect_box").find("cite").text($(this).text());
                $(this).closest(".divselect_box").find("cite").data("id", $(this).data("id"));
            });
            // 点击其它地方搜索消失
            $(window).on("click", function (e) {
                if ($(e.target).hasClass("prevStop") || $(e.target).hasClass("nextStop")) {
                    return false;
                }
                if ($(e.target).parents(".divselect").length == 0) {
                    $(".divselect").removeClass("divselect_open");
                } else {
                    e.stopPropagation();
                }
            });

            if ($(".datetimepicker").datetimepicker) {

                // 日期时间选择器
                $(".datetimepicker").datetimepicker({
                    lang: "ch",
                    i18n: {
                        // 以中文显示月份
                        de: {
                            months: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月", ],
                            // 以中文显示每周（必须按此顺序，否则日期出错）
                            dayOfWeek: ["日", "一", "二", "三", "四", "五", "六", ]
                        }
                    },
                    // 显示成年月日，时间--
                    format: "Y-m-d",
                    // 限制不能选取2000/01/01之前
                    minDate: '2000/01/01',
                    //取消时间选择
                    timepicker: false
                });
            }

        });
        //end 下拉选择

        //点击选中
        $('.click_ul li').click(function () {
            $(this).toggleClass('active');
        });
        $('.click_ul_li li').click(function () {
            $(this).addClass('active').siblings().removeClass('active');
        });
        //


        //上传图片
        $('.up_box li').hover(function () {
            $(this).children('.box').children('.del_pic').stop().fadeIn();
        }, function () {
            $(this).children('.box').children('.del_pic').stop().fadeOut();
        });
        //删除图片
        $('.del_pic').click(function () {
            $(this).parent().parent('li').fadeOut();
        });
        //





        // 浮动导航
        (function () {
            var headerWrap = $("#headerWrap");
            if (headerWrap.length != 0) {
                var headerWrapH = headerWrap.offset().top,
                    stopProdp = $("#stop_homeNav");
                if (stopProdp.length != 0) {
                    var stopProdpH = stopProdp.offset().top;
                };
                //滚动条事件
                $(window).scroll(function () {
                    var scroH = $(this).scrollTop();
                    if (scroH > headerWrapH) {
                        headerWrap.addClass("Topheader");
                        if (scroH >= stopProdpH) {
                            headerWrap.removeClass("Topheader");
                        };
                    } else {
                        headerWrap.removeClass("Topheader");
                    }
                });
            };
            // 
            var $homeNav = $("#homeNav");
            if (typeof $.fn.onePageNav == "function") {
                $homeNav.onePageNav();
            };
        })();
        // end 浮动导航



    });

    //文本框
    function placeholder(input) {
        var placeholder = input.attr("placeholder"),
            defaultValue = input.defaultValue;
        if (!defaultValue) {
            input.val() == "" ? input.val(placeholder).addClass("phcolor") : 0;
        }
        input.focus(function () {
            input.val() == placeholder ? $(this).val("") : 0;
        });
        input.blur(function () {
            input.val() == "" ? $(this).val(placeholder).addClass("phcolor") : 0;
        });
        input.keydown(function () {
            $(this).removeClass("phcolor");
        });
    }
    ; $(function () {
        supportPlaceholder = "placeholder" in document.createElement("input");
        if (!supportPlaceholder) {
            $("input").each(function () {
                var type = $(this).attr("type");
                text = $(this).attr("placeholder");
                if (type == "text" || type == "number" || type == "search" || type == "email" || type == "date" || type == "url") {
                    placeholder($(this));
                }
            });
        }
    });
    //end文本框

};
// end jq


function getdelids(parameters) {
    var delIds = [];
    $(":checkbox:not([id='all_t01'])").each(function () {
        if ($(this).prop("checked")) {
            var id = $(this).closest("li").data("id");
            delIds.push(id);
        }
    });
    return delIds;
}


$.fn.serializeObject = function () {

    var o = {};

    var a = this.serializeArray();

    $.each(a, function () {

        if (o[this.name]) {

            if (!o[this.name].push) {

                o[this.name] = [o[this.name]];

            }

            o[this.name].push(this.value || '');

        } else {

            o[this.name] = this.value || '';

        }

    });

    return o;

};

$.fn.GetCiteValue = function () {
    if (!$(this).find("cite").data("id")) {
        return '';
    }
    return $(this).find("cite").data("id");
}
$.fn.GetCiteText = function () {
    if ($(this).find("cite").text() == '请选择') {
        return '';
    }
    return $(this).find("cite").text();
}
$.fn.GetDropdownValue = function () {
    var value = '';
    $(this).find(":radio").each(function (i, v) {
        if ($(v).attr("checked")) {
            value = $(v).val();
            return false;
        }
    });
    return value;
}

$(function () {
    $(".search-box ul li").click(function (event) {
        $(".options em").html($(this).html());
        $(".search-box input[type=text]").attr("placeholder", $(this).attr("placeholder"));
        var url = $(this).attr("target");
        $(".search-form").attr("action", url);
        $(".search-box ul li").first().html($(this).html());
    });

    $(".search-box :button").click(function (event) {
        var url = $(".search-form").attr("action");
        var keyword = $(".search-box input[name=keyword]").val();
        url += "?k=" + keyword;
        window.open(url);
    });

    $(".pub-nav ul li").removeClass('active');
    $(".pub-nav ul li").eq("0").addClass('active');

    $(".pub-city").hover(function () {
        $(this).addClass('active');
    }, function () {
        $(this).removeClass('active');
    });


    $(".th_search_btn").click(function () {
        var keyword = $(".th_search_text").val();
        var href = window.location.href.toLowerCase();
        var host = window.location.host;
        if (href.indexOf('jy') > 0) {
            window.open("http://" + host + "/jy_a0_s0_c0_f0_x0_g1?k=" + keyword);
            return false;
        }
        if (href.indexOf('xy') > 0) {
            window.open("http://" + host + "/xy_a0_s0_d0_x0_t0_o0_g1?k=" + keyword);
            return false;
        }
        if (href.indexOf('xb') > 0) {
            window.open("http://" + host + "/xb_a0_s0_g1?k=" + keyword);
            return false;
        }
    });
});


$.acSiteUrl = 'https://www.ygjj.com';
$.acStaticCdnUrl = "https://www.ygjj.com";
$.cookieDomain = ".exunj.com";

Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, //month 
        "d+": this.getDate(), //day 
        "h+": this.getHours(), //hour 
        "m+": this.getMinutes(), //minute 
        "s+": this.getSeconds(), //second 
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter 
        "S": this.getMilliseconds() //millisecond 
    }

    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }

    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}
function GetUnixDate(value) {
    var msec = value.toString().replace(/\/Date\(([-]?\d+)\)\//gi, "$1");
    return new Date(Number.parseInt(msec)).format("yyyy/MM/dd");
}

function GetUnixDateFull(value) {
    var msec = value.toString().replace(/\/Date\(([-]?\d+)\)\//gi, "$1");
    return new Date(Number.parseInt(msec)).format("yyyy-MM-dd hh:mm:ss");
}



function change_width(img_name, wid, hei) {
    var CurImage = new Image();
    if (CurImage.src != img_name.src) {
        CurImage.src = img_name.src;
    }
    var img_width = CurImage.width;
    var img_height = CurImage.height;

    img_name.width = img_width;
    img_name.height = img_height;

    if (img_height / hei > img_width / wid) {
        if (img_height > hei) {
            img_name.width = img_width / img_height * hei;
            img_name.height = hei;
        }
    }
    else {
        if (img_width > wid) {
            img_name.height = img_height / img_width * wid;
            img_name.width = wid;
        }
    }

    return true;
}
/* ============================================================
 * Autocomplete
 * ============================================================ */
$(function () {
    if (typeof $("#School,#BiyeSchool,#SubjectName,#CitySearch").autocomplete != 'undefined') {
        //autocomplete
        $("#School,#BiyeSchool").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/home/GetAutoCompleteSchool",
                    dataType: "json",
                    data: {
                        keyword: request.term
                    },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                value: item.School1
                            }
                        }));
                    },
                    error: function (xhr) {
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                $(this).val(ui.item.value);
            }
        });

        $("#SubjectName").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/home/GetAutoCompleteSubject",
                    dataType: "json",
                    data: {
                        keyword: request.term
                    },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                value: item.Name
                            }
                        }));
                    },
                    error: function (xhr) {
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                $(this).val(ui.item.value);
            }
        });

        $("#CitySearch").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/home/GetAutoCompleteCity",
                    dataType: "json",
                    data: {
                        keyword: request.term
                    },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                value: item.CityName
                            }
                        }));
                    },
                    error: function (xhr) {
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                $(this).val(ui.item.value);
            }
        });
    }
});
/* ============================================================ */
