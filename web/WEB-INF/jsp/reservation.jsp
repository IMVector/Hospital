<%-- 
    Document   : reservation
    Created on : 2019-3-17, 21:45:18
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>预约医生</title>
        <jsp:include page="resourcesTemplete.jsp" />
    </head>
    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />


        <div class="ui fluid-container">
            <div class="ui centered grid">

                <div class="twelve wide column">
                    <div class="row">
                        <div class="ui grid">
                            <div class="four wide column">
                                <img src="resources/image/狗子.jpeg" height="200px;" alt="">
                            </div>
                            <div class="four wide column">
                                <div>name</div>
                                <div>title</div>
                            </div>
                            <div class="eight wide column">
                                <div class="ui right floated segment">
                                    <div class="ui pointing secondary menu">
                                        <div class="active item" data-tab="tab-name">医生简介</div>
                                        <div class="item" data-tab="tab-name2">医生擅长领域</div>
                                    </div>
                                    <div class="ui active tab" data-tab="tab-name" style="height: 150px;width: 300px;">
                                        asdfsdaf
                                    </div>
                                    <div class="ui tab" data-tab="tab-name2" style="height: 150px;width: 300px;">
                                        ffffffffffff
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="ui divider"></div>
                    <table  id="mytable"  class="ui celled table">
                        <thead>
                            <tr>
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
                                <td data-label="Name">James</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Engineer</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job"><a href="patient/goToReservation">Engineer</a></td>
                                <td data-label="Job">Designer</td>
                                <td data-label="Age">24</td>
                            </tr>
                            <tr>
                                <td data-label="Name">Jill</td>
                                <td data-label="Age">26</td>
                                <td data-label="Job">Engineer</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Designer</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Engineer</td>
                            </tr>
                            <tr>
                                <td data-label="Name">Elyse</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Designer</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Engineer</td>
                                <td data-label="Job">Designer</td>
                                <td data-label="Job">Engineer</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="wrap">
            <div class="wrap-main">
                <table style="text-align: right">
                    <tbody>
                        <tr>
                            <td>
                                <input type="button" name="previousweek" value="上一周" onclick="previousWeek();">&nbsp;
                                <span id="showdate"></span>&nbsp;
                                <input type="button" name="previousweek" value="下一周" onclick="nextWeek();">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script>
        $('.ui.pointing.secondary.menu .item').tab();

        function getDayOfWeek(date) {
            var day = new Date(Date.parse(date));
            var today = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
            var week = today[day.getDay()];
            return week;
        }

        window.onload = function () {
            initDate();
        };

        /*******************************/
        var currDT;
        var aryDay = new Array("日", "一", "二", "三", "四", "五", "六"); //显示星期
        var lastDay; //页面显示的最后一天
        var firstDay; //页面显示的第一天
        var date = new Date; //获取完整日期
        var year = date.getFullYear(); //获取当前年份
        //初始化日期加载
        function initDate() {
            currDT = new Date();
            showdate.innerHTML = currDT.toLocaleDateString(); //显示日期
            var dw = currDT.getDay(); //从Date对象返回一周中的某一天(0~6)
            var tdDT; //日期

            //在表格中显示一周的日期
            var objTB = document.getElementById("mytable"); //取得表格对象
            for (var i = 0; i < 7; i++) {
                tdDT = getDays()[i];

                dw = tdDT.getDay(); //星期几
                objTB.rows[0].cells[i].innerHTML = tdDT.getMonth() + 1 + "月" + tdDT.getDate() + "日 星期" + aryDay[dw]; //显示
                var newtime = '<input type="text" value="' + year + "-" + (tdDT.getMonth() + 1) + "-" + tdDT.getDate() + '">';
                $(".newtime").append(newtime);

                if (tdDT.toLocaleDateString() === currDT.toLocaleDateString()) {
                    objTB.rows[0].cells[i].style.color = "white"; //currDT突出显示
                    objTB.rows[0].cells[i].style.backgroundColor = "#1e9be8"; //currDT突出显示
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

        //取得下一周的日期数(共七天)
        function getNextWeekDatas(ndt) {
            var days = new Array();
            for (var i = 1; i <= 7; i++) {
                var dt = new Date(ndt);
                days[i - 1] = getNextWeek(dt, i);
            }
            return days;
        }

        //指定日期的下一周(后七天)
        function getNextWeek(dt, i) {
            var today = dt;
            today.setDate(today.getDate() + i);
            return today;
        }


        //取得上一周的日期数(共七天)
        function getPreviousWeekDatas(ndt) {
            var days = new Array();
            for (var i = -7; i <= -1; i++) {
                var dt = new Date(ndt);
                days[7 + i] = getPreviousWeek(dt, i);
            }
            return days;
        }

        //指定日期的上一周(前七天)
        function getPreviousWeek(dt, i) {
            var today = dt;
            today.setDate(today.getDate() + i);
            return today;
        }

        //下一周
        function nextWeek() {
            setCurrDTAfter(); //重设时间
            showdate.innerHTML = currDT.toLocaleDateString(); //显示日期

            //在表格中显示一周的日期
            var objTB = document.getElementById("mytable"); //取得表格对象
            var dw = currDT.getDay(); //从Date对象返回一周中的某一天(0~6)
            var tdDT; //日期
            $(".newtime input").remove();
            for (var i = 0; i < 7; i++) {
                tdDT = getNextWeekDatas(lastDay)[i];

                dw = tdDT.getDay(); //星期几
                objTB.rows[0].cells[i].innerHTML = tdDT.getMonth() + 1 + "月" + tdDT.getDate() + "日 星期" + aryDay[dw]; //显示
                var newtime = '<input type="text" value="' + year + "-" + (tdDT.getMonth() + 1) + "-" + tdDT.getDate() + '">';
                $(".newtime").append(newtime);

                if (tdDT.toLocaleDateString() === currDT.toLocaleDateString()) {
                    objTB.rows[0].cells[i].style.color = "white"; //currDT突出显示
                    objTB.rows[0].cells[i].style.backgroundColor = "#1e9be8"; //currDT突出显示
                }
            }
            //重新赋值
            firstDay = getNextWeekDatas(lastDay)[0]; //注意赋值顺序1
            lastDay = getNextWeekDatas(lastDay)[6]; //注意赋值顺序2
        }

//上一周
        function previousWeek() {
            settCurrDTBefore();
            showdate.innerHTML = currDT.toLocaleDateString(); //显示日期

            //在表格中显示一周的日期
            var objTB = document.getElementById("mytable"); //取得表格对象
            var dw = currDT.getDay(); //从Date对象返回一周中的某一天(0~6)
            var tdDT; //日期
            $(".newtime input").remove();
            for (var i = 0; i < 7; i++) {
                tdDT = getPreviousWeekDatas(firstDay)[i];

                dw = tdDT.getDay(); //星期几
                objTB.rows[0].cells[i].innerHTML = tdDT.getMonth() + 1 + "月" + tdDT.getDate() + "日 星期" + aryDay[dw]; //显示
                var newtime = '<input type="text" value="' + year + "-" + (tdDT.getMonth() + 1) + "-" + tdDT.getDate() + '">';
                $(".newtime").append(newtime);

                if (tdDT.toLocaleDateString() === currDT.toLocaleDateString()) {
                    objTB.rows[0].cells[i].style.color = "white"; //currDT突出显示
                    objTB.rows[0].cells[i].style.backgroundColor = "#1e9be8"; //currDT突出显示
                }
            }
            //重新赋值
            lastDay = getPreviousWeekDatas(firstDay)[6]; //注意赋值顺序1
            firstDay = getPreviousWeekDatas(firstDay)[0]; //注意赋值顺序2
        }

        //当前日期后第七天
        function setCurrDTAfter() {
            currDT.setDate(currDT.getDate() + 7);
        }

        //当前日期前第七天
        function settCurrDTBefore() {
            currDT.setDate(currDT.getDate() - 7);
        }

        /**********************************************************************/
        $("#mytable tr td").click(function () {
            $("#mytable tr td").removeAttr("class");
            $(this).attr("class", "active");
            //        alert($(this).index())
            var num = $(this).index();
            //        alert(num)
            //        alert($(".newtime").find("input").eq(num).val())
        });
    </script>
</html>
