/*
 * Author	: fei.xia
 * Email	: 312166604@qq.com
 * createdate : 2014-3-7
 */
var dd = {
    'field': '',//大类
    'childfield': '',//小类
    'to_id': '',//code赋值
    'to_text': '',//value赋值
    'is_multi': '',//多选开关
    'show_full': '',//是否显示不限
    'is_loc': '',//定位开关
    'empty': '',//是否可提交空值
    'title': '',
    'unlimit': ''
};
var pclose = function () {
    $('#' + dd.field).hide();
    $('.page1').show();
    if ($('#template').val() == 'search/joblist') {
        _listopfixed.ini();
    }
}
var setPage = function () {
    dd.field = arguments[0],
	dd.childfield = arguments[1],
	dd.to_id = arguments[2],
	dd.to_text = arguments[3],
	dd.is_multi = arguments[4],
	dd.show_full = arguments[5],
	dd.empty = arguments[6] ? arguments[6] : '',
	dd.is_loc = arguments[7] ? arguments[7] : '';
    
    pageshow(dd.field);
    var reg = /,/;
    if (reg.test($('#fun').val()) > 0) {
        var funlist = $('#fun').val().split(",");
        for (var i = 0; i < funlist.length; i++) {
            $('#f_bfun_' + funlist[i].substr(0, 2) + '00').click();
        }
    }

}

var setHotCity = function () {
    var area_c = hotareaall_c,
		area_v = hotareaall_v;
    var loc = storage.json_get('location');
    if (!loc) {
        var url = domain + 'ajax/in/showjobarea.ajax.php',
			result = ajaxRequest(url, {}, 'get', 'json');
        if (result) {
            loc = result.domm;
        }
        else {
            loc = { 'areacode': '020000', 'areaname': '上海' };
        }
        storage.json_set('location', loc);
    }
    var htm = '<p class="btitle"><span class="c_dark">当前城市</span></p>';
    if (dd.is_loc) {
        htm += '<span class="t" onclick="pageclose()" value="' + loc.areacode + '">' + loc.areaname + '</span>';
    }
    else {
        htm += '<span class="t" onclick="selVal(this)" value="' + loc.areacode + '">' + loc.areaname + '</span>';
    }

    htm += '<p class="btitle"><span class="c_dark">热门城市</span></p>'
		 + '<table class="hotcity t2">';
    var cnt = 0;
    for (var ele in area_c) {
        if (dd.show_full == 0 && area_c[ele] == '000000') {
            continue;
        }
        if (cnt % 4 == 0) {
            htm += '<tr>';
        }
        if (dd.is_loc) {
            htm += '<td onclick="setLoc(this,\'' + domain + '\')" value="' + area_c[ele] + '"><span>' + area_v[ele] + '</span></td>';
        }
        else {
            if (dd.is_multi == 1) {
                var id = $('#' + dd.to_id).val();
                if (id.indexOf(area_c[ele]) != -1) {
                    htm += '<td onclick="selAreaMulti(this,1)" value="' + area_c[ele] + '" id="hotcity_' + area_c[ele] + '" class="on"><span>' + area_v[ele] + '</span></td>';
                }
                else {
                    htm += '<td onclick="selAreaMulti(this,1)" value="' + area_c[ele] + '" id="hotcity_' + area_c[ele] + '" class=""><span>' + area_v[ele] + '</span></td>';
                }
            }
            else {
                htm += '<td onclick="selVal(this)" value="' + area_c[ele] + '"><span>' + area_v[ele] + '</span></td>';
            }
        }
        if (cnt % 4 == 3) {
            htm += '</tr>';
        }
        cnt++;
    }
    htm += '</table>'
		 + '<p class="btitle"><span class="lnte">按省份选择城市</span></p>';
    return htm;
}

var setChild = function (o) {
    var next = $(o).next();
    if (next.hasClass('lsinfo')) {
        if (next.css('display') == 'none') {
            $('.lsinfo').hide();
            $('.down').removeClass('down');
            $(o).addClass('down');
            next.show();
        }
        else {
            $(o).removeClass('down');
            next.hide();
        }
    }
    else {
        var code = eval(dd.childfield + '_c'),
			value = eval(dd.childfield + '_v'),
			fathercode = $(o).attr('value');
        if (dd.field.indexOf('area') != -1) {
            var htm = '<div class="lsinfo" style="display:block">',
				trigger = true,
				id = new Array();
            $('.barea').each(function () {
                id.push($(this).attr('value'));
            });
            id = id.toString();
            for (var ele in code) {
                if (code[ele].substr(0, 2) == fathercode.substr(0, 2)) {
                    if (dd.is_loc) {
                        htm += '<i value="' + code[ele] + '" onclick="setLoc(this,\'' + domain + '\')">' + value[ele] + '</i>';
                    }
                    else {
                        if (dd.is_multi) {
                            var ck = '';
                            if (id.indexOf(code[ele]) != -1) {
                                ck = ' class="on"';
                            }
                            htm += '<i' + ck + ' id="barea_' + code[ele] + '" value="' + code[ele] + '" onclick="selAreaMulti(this)">' + value[ele] + '</i>';
                        }
                        else {
                            htm += '<i value="' + code[ele] + '" onclick="selVal(this)">' + value[ele] + '</i>';
                        }
                    }
                    trigger = false;
                }
            }
            if (trigger) {
                if (is_loc) {
                    setLoc(o, domain);
                }
                else {
                    selVal(o);
                }
                return false;
            }
            htm += '<div class="clear"></div></div>';
        }
        else {
            var htm = '<p class="lsinfo" style="display:block">';
            var noshow = 0;
            for (var ele in code) {
                if (dd.is_multi == 1 && $(o).attr('value') == dd.unlimit) {
                    selMulti(o);
                    return false;
                }
                if (code[ele].substr(0, 2) == fathercode.substr(0, 2)) {
                    if (dd.is_multi == 1) {
                        var id = $('#' + dd.field + '_' + dd.unlimit).hasClass('ck') ? '' : $('#' + dd.to_id).val();
                        if (id.indexOf(code[ele]) != -1) {
                            var ck = 'ck';
                        }
                        else {
                            var ck = 'nr';
                        }
                        htm += '<span class="i ' + ck + '" value="' + code[ele] + '" id="' + dd.field + '_' + code[ele] + '" onclick="selMulti(this)">' + value[ele] + '</span>';
                    }
                    else {
                        if (noshow > 0) {
                            htm += '<span class="i nr" value="' + code[ele] + '" onclick="selVal(this)">' + value[ele] + '</span>';
                        }
                        noshow++;
                    }
                    trigger = false;
                }
            }
            htm += '</p>';
        }
        $('.lsinfo').hide();
        $('.down').removeClass('down');
        $(o).addClass('down');
        $(o).after(htm);

    }
}

//多选选择
var selMulti = function (o) {
    var value = $(o).attr('value');
    if (value == dd.unlimit) {
        $('#' + dd.field + '_sel').empty();
        $('.ck').removeClass('ck').addClass('nr');
    }
    else {
        if ($('#' + dd.field + '_' + dd.unlimit).hasClass('ck')) {
            $('#' + dd.field + '_' + dd.unlimit).removeClass('ck').addClass('nr');
            $('#' + dd.field + 'sel_' + dd.unlimit).remove();
        }
        if (dd.childfield) {
            var suffix = '';
            for (var i = 0; i < value.length - 2; i++) {
                suffix += '0';
            }
            if (value.substr(2) == suffix) {
                $(o).siblings().each(function () {
                    if ($(this).hasClass('ck')) {
                        $(this).removeClass('ck').addClass('nr');
                        var child_val = $(this).attr('value');
                        $('#' + dd.field + 'sel_' + child_val).remove();
                    }
                });
            }
            else {
                var parent_val = value.substr(0, 2) + suffix;
                $('#' + dd.field + '_' + parent_val).removeClass('ck').addClass('nr');
                $('#' + dd.field + 'sel_' + parent_val).remove();
            }
        }
    }
    if ($('.plst').find('.' + dd.field).length >= 5 && !$(o).hasClass('ck')) {
        pop('您已经选择了5个' + dd.title + '，如需更换，请取消后重新选择！', 1);
        return false;
    }
    if ($(o).hasClass('nr')) {
        $(o).removeClass('nr').addClass('ck');
        var htm = '<span class="i cancel ' + dd.field + '" id="' + dd.field + 'sel_' + value + '" value="' + value + '"><em class="icon" onclick="delMulti(this)"></em>' + $(o).text() + '</span>';
        $('#' + dd.field + '_sel').append(htm);
        if ($('.ck')[0]) {
            $('#' + dd.field + '_sel').find('center').remove();
        }
    }
    else {
        if (value != dd.unlimit) {
            $(o).removeClass('ck').addClass('nr');
            $('#' + dd.field + 'sel_' + value).remove();
            if (!$('.plst').find('.' + dd.field)[0]) {
                $('#' + dd.field + '_sel').append('<center>您还未选择' + dd.title + '哦！</center>');
            }
        }
    }
    if (value == dd.unlimit) {
        confirmMulti();
    }
    $('#' + dd.field + '_selnum').text('已选' + dd.title + '（' + $('.plst').find('.' + dd.field).length + '/5）')
}

//地区多选选择
var selAreaMulti = function (o) {
    var ishot = arguments[1] ? arguments[1] : '';
    var value = $(o).attr('value');
    if (value == '000000') {
        $('#barea_sel').empty();
        $('.on').removeClass('on');
    }
    else {
        if ($('#barea_000000').hasClass('on')) {
            $('#barea_000000').removeClass('on');
            $('#bareasel_000000').remove();
        }
        if (value.substr(2) == '0000') {
            if (!ishot) {
                $('.on:not(#barea_' + value + ')').each(function () {
                    if (value.substr(0, 2) == $(this).attr('value').substr(0, 2)) {
                        $(this).removeClass('on');
                        $('#bareasel_' + $(this).attr('value')).remove();
                    }
                });
            }
        }
        else {
            var parent_val = value.substr(0, 2) + '0000';
            $('#barea_' + parent_val).removeClass('on');
            $('#bareasel_' + parent_val).remove();
        }
    }
    if ($('.plst').find('.barea').length >= 5 && !$(o).hasClass('on')) {
        pop('您已经选择了5个地区，如需更换，请取消后重新选择！', 1);
        return false;
    }
    if (!$(o).hasClass('on')) {
        $(o).addClass('on');
        if (ishot) {
            $('#barea_' + value).addClass('on');
        }
        else {
            $('#hotcity_' + value).addClass('on');
        }
        var htm = '<span class="i cancel barea" id="bareasel_' + value + '" value="' + value + '"><em class="icon" onclick="delMulti(this)"></em>' + $(o).text() + '</span>';
        $('#barea_sel').append(htm);
        if ($('.on')[0]) {
            $('#barea_sel').find('center').remove();
        }
    }
    else {
        if (value != '000000') {
            $(o).removeClass('on');
            if (ishot) {
                $('#barea_' + value).removeClass('on');
            }
            else {
                $('#hotcity_' + value).removeClass('on');
            }
            $('#bareasel_' + value).remove();
            if (!$('.plst').find('.barea')[0]) {
                $('#barea_sel').append('<center>您还未选择地区哦！</center>');
            }
        }
    }
    if (value == '000000') {
        confirmMulti();
    }
    $('#barea_selnum').text('已选地区（' + $('.plst').find('.barea').length + '/5）')
    $('#err_area').hide();
}

//确认选择职能
var confirmMulti = function () {
    var arr_id = new Array(),
		arr_name = new Array();
    $('.' + dd.field).each(function () {
        arr_id.push($(this).attr('value'));
        arr_name.push($(this).text());
    });
    var id = arr_id.toString(),
		name = arr_name.toString();
    if (id == '' && !dd.empty) {
        pop('请选择' + dd.title, 1);
        return false;
    }
    if (name == '') {
        name = '请选择' + dd.title;
    }
    selVal('', id, name);
}

//删除选中多选
var delMulti = function (o) {
    var obj = $(o).parent();
    obj.remove();
    var value = obj.attr('value');
    if (dd.field.indexOf('area') != -1) {
        $('#barea_' + value).removeClass('on');
        $('#hotcity_' + value).removeClass('on');
        if (!$('.' + dd.field)[0]) {
            $('#' + dd.field + '_sel').append('<center>您还未选择' + dd.title + '哦！</center>');
        }
    }
    else {
        $('#' + dd.field + '_' + value).removeClass('ck').addClass('nr');
        if (!$('.' + dd.field)[0]) {
            $('#' + dd.field + '_sel').append('<center>您还未选择' + dd.title + '哦！</center>');
        }
    }
    $('#' + dd.field + '_selnum').text('已选' + dd.title + '（' + $('.plst').find('.' + dd.field).length + '/5）')
}

var selVal = function (o) {
    var code = typeof (arguments[1]) != "undefined" ? arguments[1] : $(o).attr('value'),
		value = arguments[2] ? arguments[2] : $(o).text();
    $('#' + dd.to_id).attr('value', code);
    $('#' + dd.to_text).text(value);
    if ($('#' + dd.to_text).hasClass('c_tdefault')) {
        $('#' + dd.to_text).removeClass('c_tdefault');
    }
    if (!code) {
        $('#' + dd.to_text).addClass('c_tdefault');
    }
    var template = $('#template').val();
    if (template == 'search/jobsearch' && dd.to_id == 'jobarea') {
        $("input[name='landmark']").val('');
        storage.json_set('location', { 'areacode': code, 'areaname': value });
        $('.areaname').text(value);
        var url = domain + 'ajax/in/location.ajax.php?areacode=' + code + '&areaname=' + value;
        ajaxRequest(url, {}, 'get');
    }
    if (template == 'my/microresume' && dd.to_id == 'jobarea') {
        var micro_area = $('#micro_area').val();
        if (micro_area == '') {
            storage.json_set('location', { 'areacode': code, 'areaname': value });
            $('.areaname').text(value);
            var url = domain + 'ajax/in/location.ajax.php?areacode=' + code + '&areaname=' + value;
            ajaxRequest(url, {}, 'get');
        }
    }
    if (template == 'resume/resume3' && dd.to_id == 'funtype') {
        $('#selfpos').empty();
        var html = '<input type="text" title="请输入职位名称"  maxlength="50" id="position" class="txt" value="' + value + '"><span class="pclear" style="display: none;"></span>';
        $('#selfpos').append(html);
        $('#position').on("blur", function () {
            var position = filterTitle($('#position'));
            var str = position.replace(/[^\x00-\xff]/g, '**');
            if (position == '') {
                inputPrompt($('#position'), '请输入职位名称');
                addInput($(this));
                return false;
            } else if (str.length > 50) {
                inputPrompt($('#position'), '职位名称限25个中文字内');
                return false;
            }
        });
        $('#position').on("input", function () {
            $('#position').next().show();
            $("#err_position").hide();
        });

        $('#position').on("focus", function () {
            var v = $(this).attr('title');
            if (v) {
                if ($(this).val() == v) {
                    $(this).val('');
                }
                $(this).removeClass('c_tdefault');
            }
        });

        $('.pclear').click(function () {
            $(this).parent().find('input').val('').focus();
        });

        $('#err_funtypename').hide();
        $('#err_position').hide();
    }

    pageclose();
}

