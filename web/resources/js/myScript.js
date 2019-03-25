//表格交替背景颜色
$(document).ready(function () {
    tableColor();
});
$(document).ready(function () {
    $('.dropdown').dropdown({
        on: 'hover'
    });
});

/**
 * 交替更改表格的颜色
 * @returns {undefined}
 */
function tableColor() {
    $(".table").find("tr").each(function (i) {
        switch (i % 5) {
            case 0:
                $(this).addClass("active");
                break;
            case 1:
                $(this).addClass("danger");
                break;
            case 2:
                $(this).addClass("success");
                break;
            case 3:
                $(this).addClass("info");
                break;
            case 4:
                $(this).addClass("warning");
                break;
        }
    });
}
//网页加载时计算网页显示区域
$(document).ready(function () {//网页加载时计算显示区域大小
    var height = window.innerHeight - 30;
    $("#mybody").css("height", height);
    $("#mybody").css("max-height", height);
});
//浏览器大小改变时布局响应事件
$(document).ready(function () {
    $(window).resize(function () {//浏览器显示区域大小改变时重新计算显示区域
        var height = window.innerHeight - 30;
        $("#mybody").css("height", height);
        $("#mybody").css("max-height", height);
    });
});

//ajax刷新时回调函数计算窗口大小
function calSize() {
    var height = window.innerHeight - 30;
    $("#mybody").css("height", height);
    $("#mybody").css("max-height", height);
}

/**
 * 日期解析函数
 * @param {type} format传入字符串
 * @returns {unresolved} 转换成年月日时分秒格式
 */
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, // month
        "d+": this.getDate(), // day
        "h+": this.getHours(), // hour
        "m+": this.getMinutes(), // minute
        "s+": this.getSeconds(), // second
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
        "S": this.getMilliseconds()
                // millisecond
    }
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}
/**
 * 显示日期函数年月日
 * @param {type} value
 * @returns {String}
 */
function formatDatebox(value) {
    if (value == null || value == '') {
        return '';
    }
    var dt;
    if (value instanceof Date) {
        dt = value;
    } else {
        dt = new Date(value);
    }
    return dt.format("yyyy-MM-dd");
}
function formatDateboxDetails(value) {
    if (value == null || value == '') {
        return '';
    }
    var dt;
    if (value instanceof Date) {
        dt = value;
    } else {
        dt = new Date(value);
    }
    return dt.format("yyyy-MM-dd hh:mm:ss");
}


/**
 * 随机数生成函数
 * @param {type} min
 * @param {type} max
 * @returns {Number}
 */
function myRandom(min, max) {
    return parseInt(Math.random() * (min - max) + max);//生成min-max之间的随机数
}


function getRandomcolor() {
    return "rgb(" + myRandom(0, 255) + "," + myRandom(0, 255) + "," + myRandom(0, 255) + ")";
}


function toastError(message) {
    $('body').toast({
        position: 'fixed',
        content: message,
        duration: 3000,
        isCenter: true,
        background: 'rgba(230,0,0,0.5)',
        animateIn: 'bounceIn-hastrans',
        animateOut: 'bounceOut-hastrans',
    });
}

function toastSuccess(message) {

    $('body').toast({
        position: 'fixed',
        content: message,
        duration: 3000,
        isCenter: true,
        background: '#4EA44E',
        animateIn: 'bounceIn-hastrans',
        animateOut: 'bounceOut-hastrans',
    });
}
