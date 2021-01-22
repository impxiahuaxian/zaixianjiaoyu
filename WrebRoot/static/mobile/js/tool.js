document.addEventListener("touchstart", function () { }, true);
var $$ = document.querySelectorAll.bind(document);
Element.prototype.on = Element.prototype.addEventListener;
Element.prototype.off = Element.prototype.removeEventListener;
var ForEach = function (array, fn) {
    [].forEach.call(array, fn);
};
function disableScroll(e) { e.preventDefault(); }

// slide
if (typeof TouchSlide == "function") {
    if ($('#focus ul.bd li').length > 1) {
        TouchSlide({
            slideCell: "#focus",
            titCell: ".hd",
            mainCell: ".bd",
            effect: "leftLoop",
            autoPlay: true,
            autoPage: true,
            delayTime: 500,
            interTime: 5000
        });
    }
    // 
    TouchSlide({
        slideCell: "#tabBox",
        // defaultIndex : 0, // 索引默认0
        endFun: function (i) { //高度自适应
            var bd = document.getElementById("tabBox-bd");
            bd.parentNode.style.height = bd.children[i].children[0].offsetHeight + 40 + "px";
            if (i > 0) bd.parentNode.style.transition = "200ms";//添加动画效果
            if ($("#dlImageCode").length > 0) {
                if (i == 0) {
                    $("#Password").closest(".dl").after($("#dlImageCode"));
                }
                if (i == 1) {
                    $("#Password2").closest(".dl").after($("#dlImageCode"));
                }
                if (i == 2) {
                    $("#Password3").closest(".dl").after($("#dlImageCode"));
                }
            }
        }
    });
    // 
    TouchSlide({
        slideCell: "#cldowntab", titCell: ".hd", autoPage: true,
        endFun: function (i) { //高度自适应
            var bd = document.getElementById("cldowntab-bd");
            bd.parentNode.style.height = bd.children[i].children[0].offsetHeight + "px";
            if (i > 0) bd.parentNode.style.transition = "200ms";//添加动画效果
        }
    });
    TabSlide("#tabBox-page02", "tabBox-bd", 1);
    TabSlide("#tabBox-page03", "tabBox-bd", 2);
    TabSlide("#cltab", "cltab-bd");
    TabSlide("#cltab2", "cltab2-bd");
    TabSlide("#cltab2-page02", "cltab2-bd", 1);
    TabSlide("#cltab3", "cltab3-bd");
    TabSlide("#cltab4", "cltab4-bd");
};
// end slide

document.addEventListener("DOMContentLoaded", function () {


    var $$html = document.querySelector("html");
    var $$body = document.querySelector("body");

    // class
    chelistClass($$(".dtspanselabel>li"), "che");
    listClass($$(".locallist4>li"), "sel");
    listMulityClass($$(".locallistmulity>li"), "sel");
    listClass($$(".buyscorelist>li"), "sel");
    // end class

    // albumitem
    ForEach($$(".close_albumitem"), function (el) {
        el.addEventListener("click", function () {
            var albumitem = closest(el, ".albums_list li");
            albumitem.parentNode.removeChild(albumitem);
        });
    });
    // end albumitem


    // dlox
    (function () {
        $(".choselist li").click(function () {
            $(this).addClass('sel');
            $(this).siblings().removeClass('sel');
        });
    })();
    // end dlox


    // dtitem
    ForEach($$(".dtitem .dtint, .searchrow_box .dtint"), function (el) {
        var dtitem = closest(el, ".dtitem");
        var searchrow = closest(el, ".searchrow_box");
        // el.addEventListener("focus", function(){
        // 	dtitem.classList.add("dtitemfocus");
        // });
        // el.addEventListener("blur", function(){
        // 	dtitem.classList.remove("dtitemfocus");
        // });
        document.addEventListener("click", function () {
            if (el == document.activeElement) {
                dtitem != null ? dtitem.classList.add("Ifoucs") : 0;
                searchrow != null ? searchrow.classList.add("Ifoucs") : 0;
            } else {
                dtitem != null ? dtitem.classList.remove("Ifoucs") : 0;
                searchrow != null ? searchrow.classList.remove("Ifoucs") : 0;
            }
            // !el == document.activeElement ? dtitem.classList.remove("dtitemfocus") : 0;
        });
    });
    ForEach($$(".cleardtint"), function (el) {
        el.addEventListener("click", function () {
            var dtint = closest(this, ".dtitem").querySelector(".dtint");
            dtint.value = "";
            dtint.focus();
        });


    });
    // end dtitem

    // pop
    (function () {
        popClass("provincePop");
        popClass("localPop");
        popClass("schedulePop");
        popClass("educatingPop");
        popClass("gradePop");
        popClass("beditPop");
        popClass("phonenumCpop");
        popClass("dialogPop");
        popClass("dialogPop2");
        popClass("payPop");
        popClass("orderPop");
        popClass("teacherTypePop");
        popClass("AppointPop");
        popClass("confirmPop");
        popClass("imagePop");
    })();
    // end pop

    // muliInbox
    ForEach($$(".muliInbox"), function (el) {
        var Inbox = el,
            InhdLi = Inbox.querySelectorAll(".Inhd li");
        InhdAcdex = [].indexOf.call(InhdLi, Inbox.querySelector(".active"));
        InItem = Inbox.querySelectorAll(".InItem");
        function active(bditem, acdex) {
            ForEach(bditem, function (item) {
                item.style.display = "none";
            });
            bditem[acdex].style.display = "block";
        }
        active(InItem, InhdAcdex);
        ForEach(InhdLi, function (elhd) {
            elhd.addEventListener("click", function (e) {
                ForEach(InhdLi, function (sib) {
                    sib.classList.remove("active");
                });
                this.classList.add("active");
                var acdex = [].indexOf.call(InhdLi, e.currentTarget);
                var bditem = closest(elhd, ".muliInbox").querySelectorAll(".InItem");
                active(bditem, acdex);
            });
        });
    });
    // end muliInbox


    // category
    (function () {
        var category = document.getElementById("category");
        if (category != null) {
            var categoryHeight = window.innerHeight - getOffset(category).top,
                categoryNavList = document.getElementById("categoryNavList"),
                categoryNavLi = categoryNavList.querySelectorAll("li"),
                categoryNavLiAc = categoryNavList.querySelector(".cur"),
                categoryCont = document.getElementById("categoryCont"),
                categoryItem = categoryCont.querySelectorAll(".categoryitem");
            category.style.height = categoryHeight + "px";
            function active(acitem) {
                ForEach(categoryItem, function (item) {
                    item.style.display = "none";
                });
                var acitemId = acitem.dataset["class"];
                for (var i = categoryItem.length - 1; i >= 0; i--) {
                    categoryItem[i].style.display = "none";
                    if (categoryItem[i].dataset["class"] == acitemId) {
                        categoryItem[i].style.display = "block";
                    };
                };
            }
            active(categoryNavLiAc);
            ForEach(categoryNavLi, function (hdel) {
                hdel.addEventListener("click", function (e) {
                    ForEach(categoryNavLi, function (sib) {
                        sib.classList.remove("cur");
                    });
                    this.classList.add("cur");
                    active(this);
                });
            });
            function categoryScorll(elm) {
                var init = { sy: 0, ey: 0, ty: 0 };
                setStyle(elm, {
                    transitionDuration: "0ms",
                    webkitTransitionDuration: "0ms",
                    Transform: "translateY(0px)",
                    webkitTransform: "translateY(0px)"
                });
                elm.addEventListener("touchstart", function () {
                    // event.preventDefault();
                    init.sy = event.targetTouches[0].pageY;
                    init.ey = init.sy;
                });
                elm.addEventListener("touchmove", function () {
                    init.ey = event.targetTouches[0].pageY;
                    var changeY = init.ey - init.sy - init.ty;
                    setStyle(elm, {
                        Transform: "translateY(" + changeY + "px)",
                        webkitTransform: "translateY(" + changeY + "px)"
                    });
                });
                elm.addEventListener("touchend", function () {
                    var MaxHeight = elm.clientHeight - categoryHeight;
                    var endY = init.sy - init.ey + init.ty;
                    if (endY < 0 || MaxHeight < 0) {
                        init.ty = 0;
                        setStyle(elm, {
                            Transform: "translateY(0px)",
                            webkitTransform: "translateY(0px)"
                        });
                    } else if (endY > MaxHeight) {
                        init.ty = MaxHeight;
                        setStyle(elm, {
                            Transform: "translateY(-" + MaxHeight + "px)",
                            webkitTransform: "translateY(-" + MaxHeight + "px)"
                        });
                    } else {
                        init.ty = endY;
                        setStyle(elm, {
                            Transform: "translateY(-" + endY + "px)",
                            webkitTransform: "translateY(-" + endY + "px)"
                        });
                    }
                });
            }
            categoryScorll(categoryNavList);
            ForEach(categoryItem, function (item) {
                categoryScorll(item);
            });
        };
    })();
    // end category





    // 
    ForEach($$(".givescore i"), function (el) {
        el.addEventListener("click", function () {
            var child = this.parentNode.children,
                index = [].indexOf.call(child, this),
                i = 0;
            for (; i <= index; i++) {
                child[i].classList.add("selected");
            };
            for (; i > index && i < child.length; i++) {
                child[i].classList.remove("selected");
            };
        });
    });


    // dtitem
    ForEach($$(".TranslateList .cfface"), function (el) {
        var init = { x: 5, y: 5, sx: 0, sy: 0, ex: 0, ey: 0 };
        var ths = el;
        var tool = ths.parentNode.querySelector(".cfitem_tool");
        setStyle(ths, {
            transitionDuration: "300ms",
            webkitTransitionDuration: "300ms"
        });
        ths.addEventListener("touchstart", function (e) {
            if (ths.classList.contains("active")) {
                ths.classList.remove("active");
                setStyle(ths, {
                    Transform: "translateX(0px)",
                    webkitTransform: "translateX(0px)"
                });
            } else {
                ths.classList.add("active");
                init.sx = event.targetTouches[0].pageX;
                init.sy = event.targetTouches[0].pageY;
                init.ex = init.sx;
                init.ey = init.sy;
            }
        });
        ths.addEventListener("touchmove", function (e) {
            if (ths.classList.contains("active")) {
                init.ex = event.targetTouches[0].pageX;
                init.ey = event.targetTouches[0].pageY;
                var changeX = init.sx - init.ex;
                var changeY = init.sy - init.ey;
                var toolW = tool.clientWidth + 20;
                if (Math.abs(changeX) > Math.abs(changeY)) {
                    e.preventDefault();
                    if (changeX > 0 && changeX < toolW) {
                        setStyle(ths, {
                            Transform: "translateX(-" + changeX + "px)",
                            webkitTransform: "translateX(-" + changeX + "px)"
                        });
                    }
                }
            }
        });
        ths.addEventListener("touchend", function (e) {
            var changeX = init.sx - init.ex;
            var changeY = init.sy - init.ey;
            if (ths.classList.contains("active")) {
                var toolW = tool.clientWidth;
                if (Math.abs(changeX) > Math.abs(changeY) && changeX > 0 && Math.abs(changeY) > init.y) {
                    setStyle(ths, {
                        Transform: "translateX(-" + toolW + "px)",
                        webkitTransform: "translateX(-" + toolW + "px)"
                    });
                }
            }
        });
    });
    // dtitem



    // select
    ForEach($$(".selint_select"), function (el) {
        if (el.id != 'RsumeStatus') {
            el.addEventListener("change", function () {
                var selint = closest(this, ".selint"),
                    selintLabel = selint.querySelector(".selint_label");
                if (selintLabel.nodeName == "INPUT") {
                    selintLabel.value = this.options[this.options.selectedIndex].text;
                } else {
                    selintLabel.textContent = this.options[this.options.selectedIndex].text;
                }
            });
        }

    });
    // end select


    // jobPop
    (function () {
        var jobPop = document.getElementById("jobPop"),
            selectedJop = document.getElementById("selectedJop"),
            jobselist = document.getElementById("jobselist");
        listClass($$(".jobselist>li"), "selected");
        if (jobPop != null) {
            ForEach($$(".calljobPop"), function (el) {
                el.addEventListener("click", function () {
                    jobPop.classList.add("show");
                });
            });
            ForEach($$(".closejobPop"), function (el) {
                el.addEventListener("click", function () {
                    jobPop.classList.remove("show");
                });
            });
            if (selectedJop != null && jobselist != null) {
                ForEach($$(".confirmjobPop"), function (el) {
                    el.addEventListener("click", function () {
                        selectedJop.value = jobselist.querySelector(".selected .name").textContent;
                    });
                });
            };
        };
    })();
    // end jobPop


    $(":radio").click(function () {
        var $this = $(this);
        if (!$this.attr("checked")) {
            $this.attr("checked", "checked");
            $this.parent().siblings().find(":radio").removeAttr("checked");
            $this.parent().parent().siblings().find(":radio").removeAttr("checked");
        }
        if ($this.closest('.dtitem').find('#SalaryMin').length > 0) {
            if ($this.data('id') == 1) {
                $("#SalaryMin").attr('disabled', 'disabled').val('');
                $("#SalaryMax").attr('disabled', 'disabled').val('');
            } else {
                $("#SalaryMin").removeAttr('disabled', 'disabled');
                $("#SalaryMax").removeAttr('disabled', 'disabled');
            }
        }
    });
    $("body").off().on("click", ".mesitem", function () {
        //var $label = $(this).find(":checkbox");
        //if (!$label.attr("checked")) {
        //    $label.attr("checked", "checked");
        //} else {
        //    $label.removeAttr("che");
        //}

        //var mesitem = closest(this, ".mesitem");
        //mesitem.classList.toggle("open");
        //mesitem.classList.contains("unread") ? mesitem.classList.remove("unread") : 0;
        this.classList.toggle("open");
        this.classList.contains("unread") ? this.classList.remove("unread") : 0;

    });

    //首先将#back-to-top隐藏
    $(".gotop_toolbtn").hide();
    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失

    $(window).scroll(function () {
        if ($(window).scrollTop() > 100) {
            $(".gotop_toolbtn").fadeIn(1200);
        }
        else {
            $(".gotop_toolbtn").fadeOut(1200);
        }
    });
    //当点击跳转链接后，回到页面顶部位置
    $(".gotop_toolbtn").click(function () {
        $('body,html').animate({ scrollTop: 0 }, 1000);
        return false;
    });
    //标准简历第一步性别选项
    $("span.rdo").click(function () {
        if ($(this).hasClass("on")) {
            return false;
        } else {
            $(this).toggleClass("on");
            $(this).siblings().removeClass("on");
        }
    });
    autoComplete();
    intputNumberCount();
});


function nohscorll(elm) {
    var $$html = document.querySelector("html");
    $$html.classList.add("noscorll");
    $$html.on("touchmove", disableScroll);
    elm != null ? elm.on("touchmove", function (e) { e.stopPropagation() }) : 0;
}
function hscorll(elm) {
    var $$html = document.querySelector("html");
    $$html.classList.remove("noscorll");
    $$html.off("touchmove", disableScroll);
}

function popClass(id) {
    var elm = document.getElementById(id);
    
    if (elm != null) {
        var callelm = document.querySelectorAll(".call-" + elm.id),
			hideelm = document.querySelectorAll(".hide-" + elm.id);
        delelm = document.querySelectorAll(".del-" + elm.id);
        ForEach(callelm, function (el) {
            el.addEventListener("click", function () {
                elm.classList.add("show");
            });
        });
        ForEach(hideelm, function (el) {
            el.addEventListener("click", function () {
            	
                elm.classList.remove("show");
            });
        });
        ForEach(delelm, function (el) {
            el.addEventListener("click", function () {
                elm.parentNode.removeChild(elm);
            });
        });
    };
}



// 设置css
function setStyle(obj, json) {
    for (var i in json) {
        obj.style[i] = json[i];
    }
}
// end 设置css


// 
function radioClass(el, cls) {
    ForEach(el.parentNode.children, function (sib) {
        sib.classList.remove(cls);
    });
    el.classList.add(cls);
}
function listClass(els, cls) {
    ForEach(els, function (el) {
        el.addEventListener("click", function () {
            ForEach(this.parentNode.children, function (sib) {
                sib.classList.remove(cls);
            });
            this.classList.add(cls);
        });
    });
}
function listMulityClass(els, cls) {
    ForEach(els, function (el) {
        el.addEventListener("click", function () {
            this.classList.toggle(cls);
        });
    });
}
function chelistClass(els, cls) {
    ForEach(els, function (el) {
        el.addEventListener("click", function () {
            this.classList.toggle(cls);
        });
    });
}
// 


function closest(el, selector) {
    const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector;

    while (el) {
        if (matchesSelector.call(el, selector)) {
            return el;
        } else {
            el = el.parentElement;
        }
    }
    return null;
}


function parentsUntil(el, selector, filter) {
    const result = [];
    const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector;

    // match start from parent
    el = el.parentElement;
    while (el && !matchesSelector.call(el, selector)) {
        if (!filter) {
            result.push(el);
        } else {
            if (matchesSelector.call(el, filter)) {
                result.push(el);
            }
        }
        el = el.parentElement;
    }
    return result;
}


// 
function prevAll(selector) {
    var prevEls = [];
    var el = this[0];
    if (!el) return $([]);
    while (el.previousElementSibling) {
        var prev = el.previousElementSibling;
        if (selector) {
            if ($(prev).is(selector)) prevEls.push(prev);
        }
        else prevEls.push(prev);
        el = prev;
    }
    return $(prevEls);
};


// 
function getOffset(el) {
    const box = el.getBoundingClientRect();

    return {
        top: box.top + window.pageYOffset - document.documentElement.clientTop,
        left: box.left + window.pageXOffset - document.documentElement.clientLeft
    }
}

// TabSlide
function TabSlide(cell, cellbd, page) {
    if (typeof TouchSlide == "function") {
        TouchSlide({
            slideCell: cell,
            defaultIndex: page,
            endFun: function (i) { //高度自适应
                var bd = document.getElementById(cellbd);
                bd.parentNode.style.height = bd.children[i].children[0].offsetHeight + "px";
                if (i > 0) bd.parentNode.style.transition = "200ms";//添加动画效果
            }
        });
    }
}
// end TabSlide
String.prototype.trimStart = function (trimStr) {
    if (!trimStr) { return this; }
    var temp = this;
    while (true) {
        if (temp.substr(0, trimStr.length) != trimStr) {
            break;
        }
        temp = temp.substr(trimStr.length);
    }
    return temp;
};
String.prototype.trimEnd = function (trimStr) {
    if (!trimStr) { return this; }
    var temp = this;
    while (true) {
        if (temp.substr(temp.length - trimStr.length, trimStr.length) != trimStr) {
            break;
        }
        temp = temp.substr(0, temp.length - trimStr.length);
    }
    return temp;
};
String.prototype.trim = function (trimStr) {
    var temp = trimStr;
    if (!trimStr) { temp = " "; }
    return this.trimStart(temp).trimEnd(temp);
};


jQuery.doMain = 'ygjj.com';
jQuery.acSiteUrl = 'http://m.ygjj.com';

function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
    var expires = new Date();
    expires.setTime(expires.getTime() + seconds);
    document.cookie = escape(cookieName) + '=' + escape(cookieValue)
    + (expires ? '; expires=' + expires.toGMTString() : '')
    + (path ? '; path=' + path : '/')
    + (domain ? '; domain=' + domain : '')
    + (secure ? '; secure' : '');
}
//写cookies 

function setCookie(name, value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}


function is_weixn() {
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/MicroMessenger/i) == "micromessenger") {
        return true;
    } else {
        return false;
    }
}

var domain = $('#domain').val();
var ajaxRequest = function (url) {
    var params = arguments[1] ? arguments[1] : {};
    var method = arguments[2] ? arguments[2] : 'post';
    method = method != 'post' && method != 'get' ? 'post' : method;
    var datatype = arguments[3] ? arguments[3] : 'json';
    //for (var key in params) {
    //    if (params[key]) {
    //        //params[key]=params[key].toString();
    //        params[key] = encodeURIComponent(params[key]);
    //    }
    //}
    var result = {};
    $.ajax({
        type: method,
        url: url,
        data: params,
        async: false,
        dataType: datatype,
        success: function (ret_data) {
            switch (datatype) {
                case "text":
                    result = ret_data;
                    break;
                default:
                    result = eval(ret_data);
                    break;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            result = false;
        }
    });
    return result;
}

/*
localstorage存储类
*/

var storage = {
    isLocalStorage: (window.localStorage ? true : false),

    //存值
    set: function (item, value) {
        if (this.isLocalStorage) {
            try {
                localStorage[item] = value;
            } catch (e) {
                return;
            }
        }
    },

    //取值
    get: function (item) {
        if (this.isLocalStorage) {
            return localStorage[item];
        }
    },

    //删除一个值
    del: function (item) {
        if (this.isLocalStorage) {
            localStorage.removeItem(item);
        }
    },

    //全部清除
    clear: function () {
        if (this.isLocalStorage) {
            localStorage.clear();
        }
    },

    //json存储
    json_set: function (item, value) {
        if (this.isLocalStorage) {
            try {
                localStorage[item] = JSON.stringify(value);
            } catch (e) {
                return;
            }
        }
    },

    //json取值
    json_get: function (item) {
        if (this.isLocalStorage) {
            var data = localStorage[item] ? JSON.parse(localStorage[item]) : '';
            return data;
        }
    },

    //遍历，用于测试
    display: function () {
        if (this.isLocalStorage) {
            var data = '';
            for (var i = 0; i < localStorage.length; i++) {
                key = localStorage.key(i);
                value = localStorage.getItem(key);
                data += "\nkey:" + key + " value:" + value;
            }
            return data;
        }
    }


}

//过滤title
var filterTitle = function (o) {
    if (o.val() == o.attr('title')) {
        return '';
    }
    else {
        return o.val();
    }
}

var setLoc = function (o, domain) {
    var loc = {};
    loc.areacode = $(o).attr('value');
    loc.areaname = $(o).text();

    //更新cookie
    var flag = ajaxRequest(domain + '/ajax/in/location.ajax.php/?areacode=' + loc.areacode + '&areaname=' + loc.areaname);
    //成功
    if (flag.status == 0) {
        pop('地区选择失败，请重试', 1);
        return false;
    }

    //更新localstorage
    storage.json_set('location', loc);

    //cookie和localStorage都成功后，关闭当前页面，显示主页面
    var template = $('#template').attr('value');

    if ('index' == template) {
        var url = window.location.href;
        if (-1 != url.indexOf('_t=') || -1 != url.indexOf('areaid=')) {
            //如果包含参数_t
            url = url.split('?');
            url[1] = url[1].split('&');
            var destnation = url[0];
            for (var i = 0; i < url[1].length; i++) {
                if (-1 != url[1][i].indexOf('_t=')) {
                    url[1][i] = '';
                }

                if (-1 != url[1][i].indexOf('areaid')) {
                    url[1][i] = '';
                }

                if (url[1][i] != '') {
                    if (0 == i) {
                        destnation += '?' + url[1][i];
                    } else {
                        destnation += '&' + url[1][i];
                    }
                }
            }
            location.href = destnation;
        } else {
            window.location.reload();
        }
        return false;
    } else if ('search/joblist' == template) {
        //如果是搜索结果页面，修改搜索条件，再次查询
        var url = window.location.href;
        var destnation = url;
        if (-1 != url.indexOf('?')) {
            url = url.split('?');
            url[1] = url[1].split('&');
            destnation = url[0];
            for (var i = 0; i < url[1].length; i++) {
                if (-1 != url[1][i].indexOf('jobarea')) {
                    url[1][i] = 'jobarea=' + loc.areacode;
                }

                if (-1 != url[1][i].indexOf('pageno')) {
                    url[1][i] = 'pageno=1';
                }

                if (-1 != url[1][i].indexOf('landmark')) {
                    url[1][i] = '';
                    $("input[name='landmark']").val('');
                }

                if (-1 != url[1][i].indexOf('_t')) {
                    url[1][i] = '';
                }

                if (url[1][i] != '') {
                    if (0 == i) {
                        destnation += '?' + url[1][i];
                    } else {
                        destnation += '&' + url[1][i];
                    }
                }
            }
        } else {
            destnation += '?jobarea=' + loc.areacode;
        }
        location.href = destnation;
        return false;
    }
    else if ('search/jclist' == template) {
        $("input[name='lonlat']").val('');
        $("input[name='landmark']").val('');
        $("input[name='jobarea']").val(loc.areacode);
        $("form[name='jcform']").submit();
        return false;
    }
    else if ('search/jobsearch' == template || 'search/jczp' == template) {
        $('#jobarea').attr('value', loc.areacode);
        $('#top .areaname').text(loc.areaname);
        $('#jobareaname').text(loc.areaname);
    } else if ('my/microresume' == template) {
        var micro_area = $('#micro_area').val();
        if (micro_area == '') {
            $('#jobarea').attr('value', loc.areacode);
            $('#jobareaname').text(loc.areaname);
        }
        $('#top .areaname').text(loc.areaname);
    } else if ('seo/joblist' == template) {
        var url = window.location.href;
        var arr_url = url.split('/');
        var reg = new RegExp("|[0-9/]+|");
        for (var i in arr_url) {
            if (arr_url[i].match('^p[0-9]*$')) {
                arr_url[i] = "p1";
            }
        }
        if (url == arr_url.join('/')) {
            window.location.reload();
        } else {
            location.href = arr_url.join('/');
        }
        return false;
    } else {
        $('#top .areaname').text(loc.areaname);
    }

    if ($('#ref_jobarea')[0]) {
        $('#ref_jobarea').text(loc.areaname);
        $('#ref_jobarea').attr('value', loc.areacode);
    }
    history.go(0);
    pageclose();
}
function getdelids() {
    var delIds = [];
    $(".mesitem").each(function () {
        var checkbox = $(this).find(':checkbox');
        if (checkbox[0].checked) {
            var id = $(this).closest("li").data("id");
            delIds.push(id);
        }
    });
    return delIds;
}
function getallids() {
    var delIds = [];
    $(".mesitem").each(function () {
        var id = $(this).closest("li").data("id");
        delIds.push(id);
    });
    return delIds;
}

/*
 * 二级页面
 */
var showsecondpage = function (control) {
    var $control = $('#' + control);
    $('#page1').hide();
    $control.show();
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

var closesecondpage = function (controlId) {
    $('#' + controlId).hide();
    $('#page1').show();
}
function show(msg) {
    $(".ntextpop_content").text(msg);
    //$(".ntextpop").addClass("show");
    $("#messagebox").fadeIn(2000).fadeOut(0);
    //$(".ntextpop").fadeIn(500).fadeOut(0);
}

$.fn.GetRadioValue = function () {
    return $(this).find(":radio[checked=checked]").val();
}
$.fn.GetSexValue = function () {
    return $(this).find("span.on").attr('value');
}
$.fn.SetRadioValue = function (value) {
    $(this).find(":radio").removeAttr("checked");
    $(this).find(":radio[value=" + value + "]").click();
    //$(this).find(":radio[value=" + value + "]").attr("checked", "checked");
}

$.Dialog = {
    Show: function () {
        $("#dialogPop").show();
    },
    Confirm: function (message, callback) {
        $("#dialogPop").find('li').text(message);
        $("#dialogPop").addClass("show");
        $("#btnOK").off().on('click', function () {
            var btnText = $(this).text();
            $(this).attr('disabled', true).text('正在提交...');
            callback();
            $(this).attr('disabled', false).text(btnText);
            $("#dialogPop").removeClass("show");
        });
    },

}


//表单设置值
$.fn.setForm = function (jsonValue) {
    var obj = this;
    $.each(jsonValue, function (name, ival) {
        var $oinput = obj.find("[name=" + name + "]");
        if ($oinput.attr("type") == "radio" || $oinput.attr("type") == "checkbox") {
            $oinput.each(function () {
                if (Object.prototype.toString.apply(ival) == '[object Array]') { //是复选框，并且是数组  
                    for (var i = 0; i < ival.length; i++) {
                        if ($(this).val() == ival[i]) //或者文本相等
                            $(this).prop("checked", true);
                    }
                } else {
                    if ($(this).val() == ival)
                        $(this).prop("checked", true);
                }
            });
        } else if ($oinput.attr("type") == "textarea") { //多行文本框  
            obj.find("[name=" + name + "]").html(ival);
        } else {
            obj.find("[name=" + name + "]").val(ival);
        }
    });
}



$.fn.getForm = function () {
    var $this = $(this);
    var data = {};
    if ($("#Grade")) {
        data.grade = $.trim($("#Grade").val());
    }
    if ($("#Sex")) {
        data.sex = $.trim($("#Sex").GetRadioValue());
    }
    if ($("#ContactSex")) {
        data.ContactSex = $.trim($("#ContactSex").GetRadioValue());
    }
    if ($("#SubjectId")) {
        data.subjectids = $("#SubjectId").data('id');
        data.subjectnames = $("#SubjectId").val();
    }
    if ($("#TeachDate")) {
        data.teachdays = $("#TeachDate").data('id');
    }
    if ($("#AreaId")) {
        data.areaid = $("#AreaId").data('id');
        data.areaname = $("#AreaId").val();
    }
    if ($("#TeachAddress")) {
        data.teachaddress = $("#TeachAddress").val();
        if ($("#TeachAddress").data('lat')) {
            data.lat = $("#TeachAddress").data('lat');
        } else {
            data.lat = 0;
        }
        if ($("#TeachAddress").data('lng')) {
            data.lng = $("#TeachAddress").data('lng');
        } else {
            data.lng = 0;
        }
    }
    if ($("#Contact")) {
        data.contact = $("#Contact").val();
    }
    if ($("#Mobile")) {
        data.telephone = $("#Mobile").val();
    }
    if ($("#Wexin")) {
        data.wexin = $("#Wexin").val();
    }
    
    if ($("#StuRemark")) {
        data.sturemark = $("#StuRemark").val();
    }
    
    if ($("#teacherrequire")) {
        data.teacherrequire = $("#teacherrequire").val();
    }
    if ($("#paymuchdefault")) {
        if (typeof ($("#paymuchdefault").attr("checked")) == "undefined") {
            data.isnegotiable = true;
        }
        else {
            data.isnegotiable = false;
            data.salarymin = $("#SalaryMin").val();
            data.salarymax = $("#SalaryMax").val();
        }
    }
    
    if ($("#TeacherSex")) {
        data.teachersex = $.trim($("#TeacherSex").GetRadioValue()); //$("#TeacherSex span.on").attr('value');
    }
    if ($("#jobche01")) {
        var teachertype = [];
        if ($("#jobche01").attr('checked')) {
            teachertype.push(1);
        }
        if ($("#jobche02").attr('checked')) {
            teachertype.push(2);
        }
        if ($("#jobche03").attr('checked')) {
            teachertype.push(3);
        }
        data.teachertype = teachertype;
    }
    if ($(".classmode")) {
        var classmode = [];
        $(".classmode.che").each(function () {
            classmode.push($(this).data('id'));
        });
        data.classmode = classmode;
    }
    return data;
}



var autoComplete = function () {

    if (typeof $("#School,#BiyeSchool,#SubjectName").autocomplete != 'undefined') {
        //autocomplete
        $("#School,#BiyeSchool").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/AutoComplete/GetAutoCompleteSchool",
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
            },
            create: function (e) {
                $(this).prev('.ui-helper-hidden-accessible').remove();
            }
        });

        $("#SubjectName").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/AutoComplete/GetAutoCompleteSubject",
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
            },
            create: function (e) {
                $(this).prev('.ui-helper-hidden-accessible').remove();
            }
        });
    }
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

var intputNumberCount = function () {
    $("textarea").on("input propertychange", function () {
        var $this = $(this);
        if ($this.val().length > 200) {
            $this.val($this.val().substring(0, 200));
        }
        $this.siblings(".textint_limit").find(".textint_limit_num").text($this.val().length);
    })
}