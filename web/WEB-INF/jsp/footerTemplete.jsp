<%-- 
    Document   : footerTemplete
    Created on : 2018-5-18, 15:08:26
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ui footer blue segment ">
    <center>
        <p class="ui header orange bottom">©版权所有：firefly小组</p>

    </center>
    <div class="ui header green" style="display:flex; justify-content:center;">
        <div class="ui grid">
            <div class="ui row">
                <div id="weatherDescription" style="display:flex; justify-content:center; align-items:center;"></div>
                <img id="weatherImage" src="" alt="天气">
            </div>

        </div>
    </div> 
</div>
<script>
    $(document).ready(function () {
        var map = {};
        map["晴"] = 0;
        map["多云"] = 1;
        map["阴"] = 2;
        map["阵雨"] = 3;
        map["雷阵雨"] = 4;
        map["雪"] = 5;
        map["雨夹雪"] = 6;
        map["小雨"] = 7;
        map["中雨"] = 8;
        map["大雨"] = 9;

        $.ajax({
            url: "weather",
            type: 'POST',
            data: {},
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                var str = data['date'] + "," + data["week"] + "," + data["weather"] + "," + data["windDirection"] + "," + data["windPower"]
                $("#weatherDescription").html(str);
                var str="resources/image/"+map[data["weather"]]+".png";
                $("#weatherImage").attr("src",str);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                toastError("请求失败" + errorThrown);
            }
        })
    })
</script>