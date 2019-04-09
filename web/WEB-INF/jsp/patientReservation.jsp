<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>预约管理</title>
        <style>
            #reservationTable th{
                text-align: center;
            }
            #reservationTable td{
                text-align: center;
            }
            .mselect {
                border: 1px solid #DCDEE0;
                vertical-align: middle;
                border-radius: 3px;
                height: 40px;
                padding: 0px 16px;
                font-size: 14px;
                color: #555555;
                outline:none;
                width:100%;
                margin:0;
                list-style:none;
                box-sizing: border-box;
            }
            .mselect:focus {
                border: 1px solid #27A9E3;
            }
        </style>
    </head>

    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />

        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    预约管理
                </div>
                <table>
                    <tr>
                        <td>
                            <button id="getAllBtn" class="ui basic fluid button blue">查询预约信息</button>
                        </td>
                        <td>
                            <button onclick="window.open('patient/goToAttendanceToPatient','_self')" class="ui basic fluid button blue">去预约</button>
                        </td>
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="reservationTable" class="ui table blue">
                    </table>
                </div>
                <div>
                    <button id="selectAll" class="ui button blue">全选</button>
                    <button id="deleteAll" class="ui button blue">全部取消</button>
                </div>
                <div>
                    <p id="pageText"></p>
                    <div id="PageButtons" class="mini ui basic buttons">

                    </div>
                    <label for="" class="ui label">跳转到：</label>
                    <!--发送ajax请求-->
                    <select id="pageSelecter" class="mini ui button basic dropdown">
                        <option value="">页码</option>
                        <!--<option value="1">1</option>-->
                    </select>
                </div>

            </div>

            <jsp:include page="warningModel.jsp"/>
        </div>
    </body>

    <script>

        $(document).ready(function () {


            $("#getAllBtn").click(function () {
                var url = 'patient/reservationlist/${patient.patientId}/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, reservationTableInfo, reservationItemNum);
            });
            $("#pageSelecter").on("change", function () {
                var url = 'patient/reservationlist/${patient.patientId}/page_key_word';
                goToThPage("PageButtons", "pageText", "pageSelecter", url, reservationTableInfo, reservationItemNum);
            });
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
            //取消一行
            $(document).on('click', ".deleteBtn", function () {
                var id = $(this).closest("tr").attr("id");
                $.ajax({
                    url: "patient/deleteReservation/" + id,
                    type: 'POST',
                    success: function (data, textStatus, jqXHR) {
                        if (data) {
                            $("#" + id).remove();
                            toastSuccess("取消成功");
                        } else {
                            toastError("取消失败,请重试！");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败,请重试！");
                    }
                });
            });
            $("#deleteAll").on("click", function () {

                showWarning("全部取消", "全部删本页选中？", function () {
                    //发送ajax请求取消全部选中
                    $(".ui.toggle.checkbox").each(function (index, element) {
                        if ($(this).checkbox("is checked")) {
                            var id;
                            id = $(this).closest("tr").attr("id");
                            $("#" + id).find(".deleteBtn").click();
                        }
                    });
                });
            });
        });
        function reservationTableInfo(data) {
            $("#reservationTable").empty();
            $("#reservationTable").append("<thead><tr><th>选择</th><th>预约编号</th><th>预约时间</th><th>医生姓名</th><th>医生头衔</th><th>预约部门名称</th><th style='text-align:center'>操作</th></tr></thead>");
            $.each(data, function (index, reservation) {
                var str = " \n\
                <tr id=" + reservation.reservationId + ">\n\
                    <td>\n\
                        <div class='ui toggle checkbox'>\n\
                            <input name='public' type='checkbox'>\n\
                            <label></label>\n\
                        </div>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' >" + reservation.reservationId + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + resolveReservationDate(reservation.reservationTime, reservation.reservationDate) + "' data-position='top left'>" + resolveReservationDate(reservation.reservationTime, reservation.reservationDate) + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + reservation.staff.staffName + "' data-position='top left'>" + reservation.staff.staffName + "</label>\n\
                    </td>\n\
                     <td>\n\
                        <label class='mylabel table-label' data-content='" + reservation.staff.title.titleName + "' data-position='top left'>" + reservation.staff.title.titleName + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + reservation.staff.department.departmentName + "' data-position='top left'>" + reservation.staff.department.departmentName + "</label>\n\
                    </td>\n\
                    <td style='text-align:center'>\n\
                        <button class='ui button negative deleteBtn'>取消</button>\n\
                    </td>\n\
                </tr>";
        //<button class='ui button primary detailBtn'>详情</button>\n\
                $("#reservationTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });
        function reservationItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "patient/reservationlisSize/${patient.patientId}",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
            return itemNum;
        }

        function resolveReservationDate(week, date) {
            var weekStr = new Array("", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日");
            var timeOfDayStr = new Array("", "上午", "下午");
            var array = week.split("_");
            var dateStr = formatDatebox(date) + " " + weekStr[array[0]] + timeOfDayStr[array[1]];
            return dateStr;
        }

    </script>
</html>
