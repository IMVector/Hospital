<%-- 
    Document   : reservation
    Created on : 2019-3-17, 21:45:18
    Author     : Vector
--%>

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
                        <div>
                            <div class="ui fluid action input">
                                <input type="text" placeholder="科室名称">
                                <div class="ui primary button">查询</div>
                            </div>
                        </div>
                        <br>

                        <div>
                            <div id="departmentList" class="ui grid">
                                <!--<div class="two wide column"><button class="ui button">test</button></div>-->
                            </div>
                            <br>
                            <div class="ui styled fluid accordion">
                                <div class="title">
                                    <i class="dropdown icon"></i>
                                    更多部门>>
                                </div>
                                <div class="content">
                                    <div id="departmentList_" class="ui grid">
                                        <!--<div class="two wide column"><button class="ui button">test</button></div>-->
                                    </div>
                                </div>
                            </div>
                        </div>            
                    </div>
                    <div class="ui divider"></div>
                    <div class="ui header blue segment">
                        出诊信息
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
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/1_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="2_1">
                                    <c:if test="${'true'==schedule.scheduleList[2]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/2_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="3_1">
                                    <c:if test="${'true'==schedule.scheduleList[4]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/3_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="4_1">
                                    <c:if test="${'true'==schedule.scheduleList[6]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/4_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="5_1">
                                    <c:if test="${'true'==schedule.scheduleList[8]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/5_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="6_1">
                                    <c:if test="${'true'==schedule.scheduleList[10]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/6_1')">预约</a>
                                    </c:if>
                                </td>
                                <td id="7_1">
                                    <c:if test="${'true'==schedule.scheduleList[12]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/7_1')">预约</a>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>下午&nbsp;&nbsp;1:30-6：00</td>
                                <td id="1_2">
                                    <c:if test="${'true'==schedule.scheduleList[1]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/1_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="2_2">
                                    <c:if test="${'true'==schedule.scheduleList[3]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/2_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="3_2">
                                    <c:if test="${'true'==schedule.scheduleList[5]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/3_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="4_2">
                                    <c:if test="${'true'==schedule.scheduleList[7]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/4_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="5_2">
                                    <c:if test="${'true'==schedule.scheduleList[9]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/5_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="6_2">
                                    <c:if test="${'true'==schedule.scheduleList[11]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/6_2')">预约</a>
                                    </c:if>
                                </td>
                                <td id="7_2">
                                    <c:if test="${'true'==schedule.scheduleList[13]}">
                                        <a href="javascript:reservation('patient/reservation/${staff.staffId}/7_2')">预约</a>
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
        $('.ui.styled.accordion').accordion({
            selector: {
                trigger: '.title'
            }
        });

        var url = 'staff/departmentList/page_key_word';
        fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, departmentTableInfo, getDepartmentItemNumber);
        requestDepartmentList("#departmentList_");
        //ajax回调函数，显示部门信息
        function departmentTableInfo(data) {
            $("#departmentList").empty();
            $.each(data, function (index, department) {
                var str = "<div class='two wide column'><a class='ui button'>" + department.departmentName + "</a></div>";
                $("#departmentList").append(str);
            });
        }
//获取数据库中的总数量
        function getDepartmentItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/departmentListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！");
                }
            });
            return itemNum;
        }


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
            var id_ = url.slice(-3);//截取url后三位
            var reservationDate = $("#" + id_ + "").children("input").val();//预约那天的日期
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
        }
    </script>
</html>
