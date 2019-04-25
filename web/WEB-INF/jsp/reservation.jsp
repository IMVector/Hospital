
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>预约医生</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #mytable td{
                text-align: center;
                vertical-align:middle;
            }
        </style>
    </head>
    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />


        <div class="ui fluid-container">

            <div class="ui centered grid">

                <div class="twelve wide column">
                    <div class="row">
                        <div class="ui header blue segment">
                            医生信息
                        </div>
                        <div class="ui grid">
                            <div class="four wide column">
                                <img src="${reservationStaff.image.imagePath}" height="200px;" alt="">
                            </div>
                            <div class="five wide column">
                                <div class="ui fluid segment">
                                    <div class="ui relaxed divided list">
                                        <div class="item">
                                            <div class="content">

                                                <div class="header"> 姓名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reservationStaff.staffName}
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">

                                                <div class="header">职称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${reservationStaff.title.titleName}
                                                </div>
                                                <br>

                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">

                                                <div class="header"> 部门:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${reservationStaff.department.departmentName}</div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">
                                                <div class="header"> 邮箱:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reservationStaff.email}</div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">
                                                <div class="header"> 性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reservationStaff.gender}</div>
                                                <br>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="seven wide column">
                                <div class="ui fluid segment">
                                    <div class="ui pointing secondary menu">
                                        <div class="active item" data-tab="tab-name">医生简介</div>
                                        <div class="item" data-tab="tab-name2">医生擅长领域</div>
                                    </div>
                                    <div class="ui active tab" data-tab="tab-name" style="height: 150px;width: 300px;">
                                        ${reservationStaff.introduction}
                                    </div>
                                    <div class="ui tab" data-tab="tab-name2" style="height: 150px;width: 300px;">
                                        ${reservationStaff.specialty}
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="ui divider"></div>
                    <div class="ui header blue segment">
                        预约信息
                    </div>
                    <table  id="mytable"  class="ui celled table">
                        <thead>
                            <tr>
                                <th>时间</th>
                                <th>周一</th>
                                <th>周二</th>
                                <th>周三</th>
                                <th>周四</th>
                                <th>周五</th>
                                <th>周六</th>
                                <th>周日</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>上午&nbsp;&nbsp;8:00-11:30</td>
                                <td id="1_1">
                                    <c:if test="${schedule.scheduleList[0]=='true'}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/1_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="2_1">
                                    <c:if test="${'true'==schedule.scheduleList[2]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/2_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="3_1">
                                    <c:if test="${'true'==schedule.scheduleList[4]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/3_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="4_1">
                                    <c:if test="${'true'==schedule.scheduleList[6]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/4_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="5_1">
                                    <c:if test="${'true'==schedule.scheduleList[8]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/5_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="6_1">
                                    <c:if test="${'true'==schedule.scheduleList[10]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/6_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="7_1">
                                    <c:if test="${'true'==schedule.scheduleList[12]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/7_1')">预约</a>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>下午&nbsp;&nbsp;1:30-6：00</td>
                                <td id="1_2">
                                    <c:if test="${'true'==schedule.scheduleList[1]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/1_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="2_2">
                                    <c:if test="${'true'==schedule.scheduleList[3]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/2_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="3_2">
                                    <c:if test="${'true'==schedule.scheduleList[5]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/3_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="4_2">
                                    <c:if test="${'true'==schedule.scheduleList[7]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/4_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="5_2">
                                    <c:if test="${'true'==schedule.scheduleList[9]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/5_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="6_2">
                                    <c:if test="${'true'==schedule.scheduleList[11]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/6_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="7_2">
                                    <c:if test="${'true'==schedule.scheduleList[13]}">
                                        <a href="javascript:reservation('patient/reservation/${reservationStaff.staffId}/7_2')">预约</a>
                                    </c:if>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div id="message" class="ui hidden message">
                        <div class="header">
                            <a class="ui button" href="patient/goToReservationList">查看预约信息</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>

        var today = 0;

        $('.ui.pointing.secondary.menu .item').tab();

        window.onload = function () {
            initDate("mytable");
        };

        /*******************************/
        var currDT;
        var aryDay = new Array("日", "一", "二", "三", "四", "五", "六"); //显示星期
        var lastDay; //页面显示的最后一天
        var firstDay; //页面显示的第一天
        var date = new Date; //获取完整日期
        var year = date.getFullYear(); //获取当前年份
        //初始化日期加载
        function initDate(tableId) {
            currDT = new Date();
            var dw = currDT.getDay(); //从Date对象返回一周中的某一天(0~6)
            today = dw;
            var tdDT; //日期

            //在表格中显示一周的日期
            var objTB = document.getElementById(tableId); //取得表格对象
            for (var i = 0; i < 7; i++) {
                tdDT = getDays()[i];

                dw = tdDT.getDay(); //星期几

                objTB.rows[0].cells[i + 1].innerHTML = tdDT.getMonth() + 1 + "月" + tdDT.getDate() + "日 星期" + aryDay[dw]; //显示
                objTB.rows[1].cells[i + 1].innerHTML = objTB.rows[1].cells[i + 1].innerHTML + "<input type='text' style='display:none' value='" + formatDatebox(tdDT) + "'>";
                objTB.rows[2].cells[i + 1].innerHTML = objTB.rows[2].cells[i + 1].innerHTML + "<input type='text' style='display:none' value='" + formatDatebox(tdDT) + "'>";
                if (tdDT.toLocaleDateString() === currDT.toLocaleDateString()) {
                    objTB.rows[0].cells[i + 1].style.color = "white"; //currDT突出显示
                    objTB.rows[0].cells[i + 1].style.backgroundColor = "#1e9be8"; //currDT突出显示
                }
            }
            //重新赋值
            lastDay = getDays()[6]; //本周的最后一天
            firstDay = getDays()[0]; //本周的第一天
        }

        //取得当前日期一周内的某一天
        function getWeek(i) {
            var now = new Date();
            var n = now.getDay();
            var start = new Date();
            start.setDate(now.getDate() - n + i); //取得一周内的第一天、第二天、第三天...
            return start;
        }

        //取得当前日期一周内的七天
        function getDays() {
            var days = new Array();
            for (var i = 1; i <= 7; i++) {
                days[i - 1] = getWeek(i);
            }
            return days;
        }


        function reservation(url) {
            var patientId = "${patient.patientId}";
            if (patientId === "") {
                window.open("patient/goToLogin", "_self");
            }
            var id_ = url.slice(-3);//截取url后三位
            var reservationDate = $("#" + id_ + "").children("input").val();//预约那天的日期

            var dateIndex = id_.slice(0, 1);
            console.log(dateIndex);
            console.log(today);
            if (dateIndex >= today) {
                $.ajax({
                    url: url,
                    type: 'POST',
                    data: {"reservationDate": reservationDate},
                    success: function (data) {
                        if (data) {
                            toastSuccess("预约成功");
                            $("#message").removeClass("hidden");
                        } else {
                            toastError("预约失败");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败,请重试！");
                    }
                });
            } else {
                toastError("预约无效");
            }


        }
    </script>
</html>
