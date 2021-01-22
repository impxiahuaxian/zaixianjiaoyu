
function getLocation() {
    // Get GPS first
    if (navigator.geolocation) {
        // timeout at 60000 milliseconds (60 seconds)
        var options = { enableHighAccuracy: true, maximumAge: 30000, timeout: 60000 };
        navigator.geolocation.getCurrentPosition(showLocation, errorHandler, options);
    }
    else {
        //alert("您的浏览器不支持使用HTML5来获取地理位置服务！");
        console.log("您的浏览器不支持使用HTML5来获取地理位置服务,根据IP查找！");
        // By ip
        callLocalCity();
    }
}


//read cookie
$.getCookie = function (name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg)) {
        return unescape(arr[2]);
    }
    else {
        return null;
    }
}
//set cookie
$.setCookie = function (name, value) {
    var year = new Date().getFullYear();
    //判断是平年还是闰年
    var isLeapYear = (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0
    var Days = isLeapYear ? 366 : 365; //有效期为1年
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}

function showLocation(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    //alert("Latitude : " + latitude + " Longitude: " + longitude);
    //console.log("Latitude : " + latitude + " Longitude: " + longitude);
    var point = new BMap.Point(longitude, latitude);
    var geoc = new BMap.Geocoder();
    geoc.getLocation(point, function (rs) {
        var addComp = rs.addressComponents;
        //alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
        var cityName = addComp.city;
        $.setCookie("area", addComp.district);
        window.location.href = "/Navigation/" + encodeURI(cityName);
    });
}

function errorHandler(value) {

    switch (value.code) {
        case 1:
            //alert("位置服务被拒绝");
            console.log("位置服务被拒绝");
            callLocalCity();
            break;
        case 2:
            //alert("暂时获取不到位置信息");
            console.log("暂时获取不到位置信息,根据IP查找");
            callLocalCity();
            break;
        case 3:
            //alert("获取信息超时");
            console.log("获取信息超时");
            callLocalCity();
            break;
        case 4:
            //alert("未知错误");
            console.log("未知错误");
            callLocalCity();
            break;
        default:
            callLocalCity();
            break;
    }
}



function getCityByIP(rs) {
    var cityName = rs.name;
    window.location.href = "/Navigation/" + encodeURI(cityName);
   
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function callLocalCity() {
    var myCity = new BMap.LocalCity();
    myCity.get(getCityByIP);
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function init() {
    var indictor = getCookie("GeoLocation");
    if (indictor == null || indictor == "") {
        //getLocation();
    }

}

window.onload = init;
