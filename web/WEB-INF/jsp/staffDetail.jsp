
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改信息</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #scheduleTable td{
                text-align: center;
                vertical-align:middle;
            }
        </style>
    </head>
    <body>
        <jsp:include page="manageStaffHeaderTemplete.jsp"/>


        <div class="ui fluid-container">

            <div class="ui centered grid">

                <div class="twelve wide column">
                    <div class="row">
                        <div class="ui header blue segment">
                            医生信息<button class="ui right floated button updateBtn">修改医生信息</button>
                        </div>
                        <div class="ui grid">
                            <div class="four wide column">
                                <img src="${staffDetails.image.imagePath}" height="200px;" alt="图片丢失了">
                            </div>
                            <div class="five wide column">
                                <div class="ui fluid segment">
                                    <div class="ui relaxed divided list">
                                        <div class="item">
                                            <div class="content">

                                                <div class="header"> 姓名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${staffDetails.staffName}
                                                </div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">

                                                <div class="header">职称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${staffDetails.title.titleName}
                                                </div>
                                                <br>

                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">

                                                <div class="header"> 部门:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${staffDetails.department.departmentName}</div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">
                                                <div class="header"> 邮箱:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${staffDetails.email}</div>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="content">
                                                <div class="header"> 性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${staffDetails.gender}</div>
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
                                        ${staffDetails.introduction}
                                    </div>
                                    <div class="ui tab" data-tab="tab-name2" style="height: 150px;width: 300px;">
                                        ${staffDetails.specialty}
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="ui divider"></div>
                    <div class="ui header blue segment">
                        预约信息<button class="ui right floated button updateReservation">修改预约信息</button>
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
                                        值班
                                    </c:if>
                                </td>
                                <td id="2_1">
                                    <c:if test="${'true'==schedule.scheduleList[2]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="3_1">
                                    <c:if test="${'true'==schedule.scheduleList[4]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="4_1">
                                    <c:if test="${'true'==schedule.scheduleList[6]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="5_1">
                                    <c:if test="${'true'==schedule.scheduleList[8]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="6_1">
                                    <c:if test="${'true'==schedule.scheduleList[10]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="7_1">
                                    <c:if test="${'true'==schedule.scheduleList[12]}">
                                        值班
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>下午&nbsp;&nbsp;1:30-6：00</td>
                                <td id="1_2">
                                    <c:if test="${'true'==schedule.scheduleList[1]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="2_2">
                                    <c:if test="${'true'==schedule.scheduleList[3]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="3_2">
                                    <c:if test="${'true'==schedule.scheduleList[5]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="4_2">
                                    <c:if test="${'true'==schedule.scheduleList[7]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="5_2">
                                    <c:if test="${'true'==schedule.scheduleList[9]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="6_2">
                                    <c:if test="${'true'==schedule.scheduleList[11]}">
                                        值班
                                    </c:if>
                                </td>
                                <td id="7_2">
                                    <c:if test="${'true'==schedule.scheduleList[13]}">
                                        值班
                                    </c:if>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <div id="modeltest" class="ui inverted modal ">
                <div class="header">修改职工信息</div>
                <div class="content">
                    <div class="ui header blue segment">职工信息</div>
                    <form id="myForm" class="ui form">
                        <input type="text" style="display:none;" name="staffId" value="${staffDetails.staffId}">
                        <input type="text" style="display:none;" name="staffPassword" value="${staffDetails.staffPassword}">
                        <div class="field">
                            <label for="">员工邮箱：</label>
                            <div class="ui input ">
                                <input type="text" id="email" name="email" placeholder="请输入员工邮箱" value="${staffDetails.email}">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工姓名：</label>
                            <div class="ui input ">
                                <input id="staffName" name="staffName" placeholder="请输入员工姓名" value="${staffDetails.staffName}" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工性别：</label>
                            <div class="ui input ">
                                <select id="staffGender" name="gender" class="ui fluid dropdown" value="${staffDetails.gender}">
                                    <option value="">性别</option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>

                            </div>
                        </div>
                        <div class="field">
                            <label for="">职工职称：</label>
                            <div class="ui input ">
                                <select id="staffTitleInfo"  name="title.titleId" class="ui fluid dropdown" value="${staffDetails.title.titleId}"></select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">所属部门：</label>
                            <div class="ui input ">
                                <select id="departmentId" name="department.departmentId" class="ui fluid dropdown" value="${staffDetails.department.departmentId}"></select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工角色：</label>
                            <div class="ui input ">
                                <select id="roleId" name="role.roleId" class="ui fluid dropdown" value="${staffDetails.role.roleId}"></select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工擅长领域：</label>
                            <div class="ui input ">
                                <input id="specialty" name="specialty" placeholder="请输入员工擅长领域" type="text" value="${staffDetails.specialty}">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工简介：</label>
                            <div class="ui input ">
                                <textarea id="introduction" placeholder="请输入员工简介" name="introduction">${staffDetails.introduction}</textarea>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">职工职称：</label>
                            <div class="ui input ">
                                <select id="staffWorkInfo"  name="staffWork" class="ui fluid dropdown" value="${staffDetails.staffWork}"></select>
                            </div>
                        </div>
                        <button id="resetButton" type="reset" style="display:none;"></button> 
                    </form>
                </div>
                <div class="actions">
                    <div class="ui black deny button">放弃</div>
                    <div class="ui positive button">上传信息</div>
                </div>

            </div>



        </div>
        <div id="scheduleModel" class="ui inverted fullscreen modal">
            <div class="header">修改值班表</div>
            <div class="content">
                <div class="ui header blue segment">值班表</div>
                <form id="scheduleForm">
                    <input type="text" style="display:none;" name="staff.staffId" value="${staffDetails.staffId}">
                    <table  id="scheduleTable" style="width: 70%;margin: auto;" class="ui celled table">
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
                                <td id="alt_1_1">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[0]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_2_1">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[2]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_3_1">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[4]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_4_1">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[6]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_5_1">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[8]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_6_1">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[10]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_7_1">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[12]">
                                        <label></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>下午&nbsp;&nbsp;1:30-6：00</td>
                                <td id="alt_1_2">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[1]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_2_2">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[3]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_3_2">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[5]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_4_2">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[7]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_5_2">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[9]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_6_2">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[11]">
                                        <label></label>
                                    </div>
                                </td>
                                <td id="alt_7_2">
                                    <div class="ui toggle checkbox">
                                        <input type="checkbox" name="scheduleList[13]">
                                        <label></label>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="8">
                                    <div class="ui right floated pagination menu">
                                        <button id="selectAll" type="button" class="ui primary button">全选</button>
                                    </div>
                                </th>
                            </tr>
                        </tfoot>
                    </table>
                    <button type="reset" id="scheduleReset" style="display: none"></button>
                </form>

            </div>
            <div class="actions">
                <div class="ui black deny button">放弃</div>
                <div class="ui positive button">上传信息</div>
            </div>
        </div>
        <span id="showdate" style="display: none"></span>
    </body>
    <script>
        $('.ui.pointing.secondary.menu .item').tab();

        $("#staffGender").val("${staffDetails.gender}");

        var ajaxCount = 3;
        function isAjaxFinished() {
            ajaxCount--;
            if (ajaxCount === 0) {
                $("#optionLoader").removeClass("active");
            }
        }

        $(".updateReservation").click(function () {
            $('#scheduleModel').modal({
                inverted: true,
                closable: false,
                onDeny: function () {
                    $('#scheduleReset').click();
                    return true;
                },
                onApprove: function () {
                    var flag = false;
                    $.ajax({
                        url: 'staff/updateSchedule',
                        type: 'POST',
                        async: false,
                        data: $("#scheduleForm").serialize(), //将表单的数据编码成一个字符串提交给服务器
                        success: function (data) {
                            if (data) {
                                toastSuccess("修改成功！");
                                flag = true;
                                $('#scheduleReset').click();
                                $('.ui.modal').modal('hide');
                            } else {
                                toastError("修改失败！");
                            }
                        },
                        error: function (req, status, error) {
                            toastError("请求失败,请重试！");
                        }
                    });
                    return flag;

                }
            }).modal('show');
        });

        //弹出添加model框
        $(".updateBtn").click(function () {
            requestDepartmentList("#departmentId");
            requestTitleList("#staffTitleInfo");
            requestRoleList("#roleId");
            requestCheckItmeList("#staffWorkInfo");
            $('#modeltest').modal({
                inverted: true,
                closable: false,
                onDeny: function () {
                    $('#resetButton').click();
                    return true;
                },
                onApprove: function () {
                    if ($(".ui.form").form('validate form')) {
                        $.ajax({
                            url: 'staff/updateStaff',
                            type: 'POST',
                            async: false,
                            data: $("#myForm").serialize(), //将表单的数据编码成一个字符串提交给服务器
                            success: function (data) {
                                if (data) {
                                    toastSuccess("修改成功！");
                                    $('#resetButton').click();
                                    $('.ui.modal').modal('hide');
                                } else {
                                    toastError("修改失败！");
                                }
                            },
                            error: function (req, status, error) {
                                toastError("请求失败,请重试！");
                            }
                        });
                    } else {
                        return false;
                    }
                }
            }).modal('show');
        });
        function requestTitleList(id) {

            $.ajax({
                url: "staff/getTitleList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    isAjaxFinished();
                    $(id).append("<option value=''>职称</option>");
                    $.each(data, function (index, title) {
                        var str = "<option value=" + title.titleId + ">" + title.titleName + "</option>";
                        $(id).append(str);
                    });
                    $("#staffTitleInfo").val(${staffDetails.title.titleId});
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }

        function requestDepartmentList(id) {
            $.ajax({
                url: "staff/getDepartmentList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    isAjaxFinished();
                    $(id).append("<option value=''>部门</option>");
                    $.each(data, function (index, department) {
                        var str = "<option value=" + department.departmentId + ">" + department.departmentName + "</option>";
                        $(id).append(str);
                    });
                    $("#departmentId").val(${staffDetails.department.departmentId});

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }
        function requestRoleList(id) {
            $.ajax({
                url: "staff/getRoleList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    isAjaxFinished();
                    $(id).append("<option value=''>角色</option>");
                    $.each(data, function (index, role) {
                        var str = "<option value=" + role.roleId + ">" + role.roleName + "</option>";
                        $(id).append(str);
                    });
                    $("#roleId").val(${staffDetails.role.roleId});
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }

        function getDayOfWeek(date) {
            var day = new Date(Date.parse(date));
            var today = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
            var week = today[day.getDay()];
            return week;
        }

        window.onload = function () {
            initDate("mytable");
            initDate("scheduleTable");
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
            showdate.innerHTML = currDT.toLocaleDateString(); //显示日期
            var dw = currDT.getDay(); //从Date对象返回一周中的某一天(0~6)
            var tdDT; //日期

            //在表格中显示一周的日期
            var objTB = document.getElementById(tableId); //取得表格对象
            for (var i = 0; i < 7; i++) {
                tdDT = getDays()[i];

                dw = tdDT.getDay(); //星期几
                objTB.rows[0].cells[i + 1].innerHTML = tdDT.getMonth() + 1 + "月" + tdDT.getDate() + "日 星期" + aryDay[dw]; //显示
                var newtime = '<input type="text" value="' + year + "-" + (tdDT.getMonth() + 1) + "-" + tdDT.getDate() + '">';
                $(".newtime").append(newtime);

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

//        //取得下一周的日期数(共七天)
//        function getNextWeekDatas(ndt) {
//            var days = new Array();
//            for (var i = 1; i <= 7; i++) {
//                var dt = new Date(ndt);
//                days[i - 1] = getNextWeek(dt, i);
//            }
//            return days;
//        }

//        //指定日期的下一周(后七天)
//        function getNextWeek(dt, i) {
//            var today = dt;
//            today.setDate(today.getDate() + i);
//            return today;
//        }


//        //取得上一周的日期数(共七天)
//        function getPreviousWeekDatas(ndt) {
//            var days = new Array();
//            for (var i = -7; i <= -1; i++) {
//                var dt = new Date(ndt);
//                days[7 + i] = getPreviousWeek(dt, i);
//            }
//            return days;
//        }

//        //指定日期的上一周(前七天)
//        function getPreviousWeek(dt, i) {
//            var today = dt;
//            today.setDate(today.getDate() + i);
//            return today;
//        }

//        //下一周
//        function nextWeek() {
//            setCurrDTAfter(); //重设时间
//            showdate.innerHTML = currDT.toLocaleDateString(); //显示日期
//
//            //在表格中显示一周的日期
//            var objTB = document.getElementById("mytable"); //取得表格对象
//            var dw = currDT.getDay(); //从Date对象返回一周中的某一天(0~6)
//            var tdDT; //日期
//            $(".newtime input").remove();
//            for (var i = 0; i < 7; i++) {
//                tdDT = getNextWeekDatas(lastDay)[i];
//
//                dw = tdDT.getDay(); //星期几
//                objTB.rows[0].cells[i].innerHTML = tdDT.getMonth() + 1 + "月" + tdDT.getDate() + "日 星期" + aryDay[dw]; //显示
//                var newtime = '<input type="text" value="' + year + "-" + (tdDT.getMonth() + 1) + "-" + tdDT.getDate() + '">';
//                $(".newtime").append(newtime);
//
//                if (tdDT.toLocaleDateString() === currDT.toLocaleDateString()) {
//                    objTB.rows[0].cells[i].style.color = "white"; //currDT突出显示
//                    objTB.rows[0].cells[i].style.backgroundColor = "#1e9be8"; //currDT突出显示
//                }
//            }
//            //重新赋值
//            firstDay = getNextWeekDatas(lastDay)[0]; //注意赋值顺序1
//            lastDay = getNextWeekDatas(lastDay)[6]; //注意赋值顺序2
//        }
//
//        //上一周
//        function previousWeek() {
//            settCurrDTBefore();
//            showdate.innerHTML = currDT.toLocaleDateString(); //显示日期
//
//            //在表格中显示一周的日期
//            var objTB = document.getElementById("mytable"); //取得表格对象
//            var dw = currDT.getDay(); //从Date对象返回一周中的某一天(0~6)
//            var tdDT; //日期
//            $(".newtime input").remove();
//            for (var i = 0; i < 7; i++) {
//                tdDT = getPreviousWeekDatas(firstDay)[i];
//
//                dw = tdDT.getDay(); //星期几
//                objTB.rows[0].cells[i].innerHTML = tdDT.getMonth() + 1 + "月" + tdDT.getDate() + "日 星期" + aryDay[dw]; //显示
//                var newtime = '<input type="text" value="' + year + "-" + (tdDT.getMonth() + 1) + "-" + tdDT.getDate() + '">';
//                $(".newtime").append(newtime);
//
//                if (tdDT.toLocaleDateString() === currDT.toLocaleDateString()) {
//                    objTB.rows[0].cells[i].style.color = "white"; //currDT突出显示
//                    objTB.rows[0].cells[i].style.backgroundColor = "#1e9be8"; //currDT突出显示
//                }
//            }
//            //重新赋值
//            lastDay = getPreviousWeekDatas(firstDay)[6]; //注意赋值顺序1
//            firstDay = getPreviousWeekDatas(firstDay)[0]; //注意赋值顺序2
//        }
//
//        //当前日期后第七天
//        function setCurrDTAfter() {
//            currDT.setDate(currDT.getDate() + 7);
//        }
//
//        //当前日期前第七天
//        function settCurrDTBefore() {
//            currDT.setDate(currDT.getDate() - 7);
//        }

        /**********************************************************************/
//        $("#mytable tr td").click(function () {
//            $("#mytable tr td").removeAttr("class");
//            $(this).attr("class", "active");
//            //        alert($(this).index())
//            var num = $(this).index();
//            //        alert(num)
//            //        alert($(".newtime").find("input").eq(num).val())
//        });

        //全部选中按钮事件
        $("#selectAll").on("click", function () {
            if ($(this).text() === "全选") {
                $(this).text("取消全选");
                $(".ui.toggle.checkbox").each(function () {
                    if (!$(this).checkbox("is checked")) {
                        $(this).checkbox("check");
                    }
                });

            } else {
                $(".ui.toggle.checkbox").each(function () {
                    if ($(this).checkbox("is checked")) {
                        $(this).checkbox("uncheck");
                    }
                });
                $(this).text("全选");
            }
        });


        $('.ui.form').form({
            fields: {
                email: {
                    identifier: 'email', //form的field
                    rules: [
                        {
                            type: 'email', //验证类型
                            prompt: '请输入正确的邮箱'//提示信息
                        }
                    ]
                },
                staffName: {
                    identifier: 'staffName',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入员工姓名'
                        }
                    ]
                },
                titleId: {
                    identifier: 'titleId',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择员工职称'
                        }
                    ]
                },
                departmentId: {
                    identifier: 'departmentId',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择所属部门'
                        }
                    ]
                },
                roleId: {
                    identifier: 'roleId',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择员工角色'
                        }
                    ]
                },
                specialty: {
                    identifier: 'specialty',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入员工擅长领域'
                        }
                    ]
                },
                introduction: {
                    identifier: 'introduction',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入员工简介'
                        }
                    ]
                },
                gender: {
                    identifier: 'gender',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择员工性别'
                        }
                    ]
                }
            }
        });
        function requestCheckItmeList(id) {
            $.ajax({
                url: "staff/getCheckItemList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $(id).empty();
                    $(id).append("<option value=''>工作</option>");
                    $.each(data, function (index, checkItem) {
                        var str = "<option value=" + checkItem.checkItemId + ">" + checkItem.checkItemName + "</option>";
                        $(id).append(str);
                    });
                    $("#staffWorkInfo").val(${staffDetails.staffWork});
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }
    </script>
</html>
