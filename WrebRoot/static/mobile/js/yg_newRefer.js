function SetCookie(name, value)//两个参数，一个是cookie的名子，
{
    var Days = 30; //此 cookie 将被保存 30天
    var exp = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + encodeURIComponent(value) + ";domain=.ygjj.com" + ";expires=" + exp.toGMTString() + ";path=/";
}
function getCookie(name)//取cookies函数        
{
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) {
        var cookieValue=unescape(arr[2]);
            if(cookieValue!=undefined&& cookieValue.length>0)
            {
                return unescape(arr[2]); 
            } 
            return null;

        }
    return null;

}
function delCookie(name)//删除cookie
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
Date.prototype.format = function () {
    var d = new Date();
    var year = d.getFullYear();
    var month = d.getMonth() + 1;
    var day = d.getDate();
    var hours = d.getHours();
    var minutes = d.getMinutes();
    var seconds = d.getSeconds();
    return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
} 
function getRefer(currentUrl, fromUrl) {
    var referID = 0;
    var regSourceId = 0;
    if (fromUrl.indexOf("http://www.baidu") != -1 && (currentUrl == "http://www.ppdai.com/default.htm" || currentUrl == "http://www.ppdai.com/default.htm")) { //zhangyan modify
        regSourceId = 2;
    } else if (fromUrl.indexOf("http://www.google") != -1 && (currentUrl == "http://www.ppdai.com/default.htm" || currentUrl == "http://www.ppdai.com/default.htm")) { //zhangyan modify
        regSourceId = 1;
    } else if ((fromUrl.indexOf("http://www.sogou") != -1 || fromUrl.indexOf("http://so") != -1) && (currentUrl == "http://www.ppdai.com/default.htm" || currentUrl == "http://www.ppdai.com/default.htm")) {
	regSourceId = 4;
    }else if (currentUrl.indexOf("jifenbao.html") != -1) {
        referID = 176435;
        regSourceId = 21;
    } else if (fromUrl.indexOf("bidalipay.aspx") != -1) {
        referID = 176435;
        regSourceId = 21;
    } else if (currentUrl.indexOf("jfbsgsha.aspx") != -1) {
        referID = 176435;
        regSourceId = 21;
    } else if (currentUrl.indexOf("regsourceid=42") != -1) { //zhangyan add
        regSourceId = 42;
    } else if (currentUrl.indexOf("regsourceid=41") != -1) { //zhangyan add
        regSourceId = 41;
    } else if (currentUrl.indexOf("regsourceid=45") != -1) {
        regSourceId = 45;
    } else if (currentUrl.indexOf("regsourceid=46") != -1){
        regSourceId = 46;
    } else if (referID != 0 && referID != 179353) {
        regSourceId = 31;
    }else if(currentUrl.indexOf("landing14.html") != -1){
	regSourceId = 37;
    }
    return { ReferID: referID, RegSourceId: regSourceId };
}
function isFromLandingPage(url, landingPages) {
    var isLandingPage = false;
    for (var i = 0; i < landingPages.length; i++) {
        if (url.indexOf(landingPages[i]) != -1) {
            isLandingPage = true;
            break;
        }
    }
    return isLandingPage;
}
function init() {
    var fromUrl = document.referrer.toLowerCase();     //来源url地址
    var currentUrl = window.location.href.toLowerCase();
    var referValue = getRefer(currentUrl, fromUrl);
    var timestamp = new Date().format();

    if(getCookie("regSourceId") == null ||getCookie("referID") == null ||getCookie("referDate") == null||getCookie("currentUrl") == null)
    {
         SetCookie("regSourceId", referValue.RegSourceId);
         SetCookie("referID", referValue.ReferID);
         SetCookie("fromUrl", fromUrl);
         SetCookie("referDate", timestamp);
         SetCookie("currentUrl", currentUrl);
    }

    if(currentUrl.indexOf("remarketing")>-1)
    {

          SetCookie("regSourceId", referValue.RegSourceId);
         SetCookie("referID", referValue.ReferID);
         SetCookie("fromUrl", fromUrl);
         SetCookie("referDate", timestamp);
         SetCookie("currentUrl", currentUrl);
    }
    if (fromUrl.length > 0 && fromUrl.indexOf("ppdai.com") < 0) {
        SetCookie("registerurl", currentUrl);
        SetCookie("registersourceurl", fromUrl);
    }
}
init();

