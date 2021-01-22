var PPDAcUtils = (function () {
  /**
  * @name 构造函数
  * @param {Object} v 未知参数1
  */
  function PPDAcUtils(v) {
      this._v0 = v;
  }

  /**
   * 调试日志
   * @param  {String} str 打印的字符串
   * @return {Void}
   */
  PPDAcUtils.prototype.debuglog = function(str) {
    var that = this;
    var err;
    try {
      if (typeof str === 'object' && str.hasOwnProperty('stack') && str.hasOwnProperty('message')) {
        str = "" + str.message + "\n\n" + str.stack;
      }
      if ($.isFunction(str)) {
        str = str.toString();
      }
      that.safeFunc(function(){
        console.log(str);
      });
    } catch (_error) {
      err = _error;
      that.safeFunc(function(){
        console.log(err);
      });
    }
  }

  /**
   * 安全执行方法
   * @param  {Func} func 匿名函数
   * @return {void}
   */
  PPDAcUtils.prototype.safeFunc = function(func) {
    try { func(); } catch (err0) { }
  }

  /**
   * 生成guid
   * @return {String}
   */
  PPDAcUtils.prototype.newGuid = function() {
    var guid = "";
    for (var i = 1; i <= 32; i++) {
        var n = Math.floor(Math.random() * 16.0).toString(16);
        guid += n;
        if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
            guid += "-";
    }
    return guid;
  }

  /**
   * 延迟加载js
   * @param  {String} Url
   * @param  {Func} 回调函数
   * @return {void}
   */
  PPDAcUtils.prototype.loadjs = function(file, func) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = file;
    document.getElementsByTagName("head")[0].appendChild(script);
    if (script.readyState){ //IE
        script.onreadystatechange = function(){
            if (script.readyState == "loaded" || script.readyState == "complete"){
                script.onreadystatechange = null;
                func();
            }
        };
    } else { //Others
        script.onload = function(){
            func();
        };
    }
    return false;
  }
  /**
   * 倒计时
   * @param  {DOM} obj 操作对象的id
   * @param  {Integer} second 间隔时间
   * @param  {String} uniqueClass 唯一的class
   * @param  {String} tip 文字提示
   * @param  {String} funcName 业务名称
   * @param  {Object} options Cookie设置项
   * @return {void}
   */
  PPDAcUtils.prototype.remainTime = function(obj, second, uniqueClass, tip, funcName, options) {
    var that = this;
    var $obj = null;
    if(second == undefined) second = 60;
    if (uniqueClass == undefined) {
        uniqueClass = that.newGuid();
        $obj = $(obj);
        $obj.addClass(uniqueClass).attr("disabled", true).attr("sourceval", $obj.attr("value"));
        $(window).keydown(function (e) {
            if (e.which == 116) {
                return false;
            }
        });
    } else {
        $obj = $("." + uniqueClass);
    }
    if (second > 0) {
        $obj.val(second + (tip || "秒后重新获取"));
        $obj.text(second + (tip || "秒后重新获取"));
        second = second - 1;
        //var code = "remainTime(null," + second + ",'" + uniqueClass + "')";
        setTimeout(function(){
            options = options || {};
            if (funcName === null) {
                funcName = 'reg_mobile_remainTime';
            }
            var expires = '';
            if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
                var date;
                if (typeof options.expires == 'number') {
                    date = new Date();
                    date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
                } else {
                    date = options.expires;
                }
                expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
            }
            var path = options.path ? '; path=' + options.path : '';
            var domain = options.domain ? '; domain=' + options.domain : '';
            var secure = options.secure ? '; secure' : '';
            document.cookie = [funcName, '=', encodeURIComponent(''+second), expires, path, domain, secure].join('');
            that.remainTime(null, second, uniqueClass, tip, funcName, options);
        }, 1000);
    } else {
        $(window).unbind("keydown");
        $obj.removeClass(uniqueClass);
        $obj.attr("value", $obj.attr("sourceval"));
        $obj.removeAttr("disabled");
    }
  }

  return PPDAcUtils;
})();
