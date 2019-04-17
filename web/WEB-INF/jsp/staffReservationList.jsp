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
        <jsp:include page="staffHeaderTemplete.jsp"/>

        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    预约查询
                </div>
                <table>
                    <tr>
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="reservationTable" class="ui table blue">
                    </table>
                </div>
                <div>
                    <p id="pageText"></p>
                    <div id="PageButtons" class="mini ui basic buttons">

                    </div>
                    <label for="" class="ui label">跳转到：</label>
                    <!--发送ajax请求-->
                    <select id="pageSelecter" class="ui dropdown">
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
            var url = 'staff/reservationlist/${staff.staffId}/page_key_word';
            fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, reservationTableInfo, reservationItemNum);

            $("#getAllBtn").click(function () {
                var url = 'staff/reservationlist/${staff.staffId}/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, reservationTableInfo, reservationItemNum);
            });
            $("#pageSelecter").on("change", function () {
                var url = 'staff/reservationlist/${staff.staffId}/page_key_word';
                goToThPage("PageButtons", "pageText", "pageSelecter", url, reservationTableInfo, reservationItemNum);
            });
        });
        function reservationTableInfo(data) {
            $("#reservationTable").empty();
            $("#reservationTable").append("<thead><tr><th>预约编号</th><th>预约时间</th><th>病人姓名</th><th>病人年龄</th><th>预约部门名称</th></tr></thead>");
            $.each(data, function (index, reservation) {
                var str = " \n\
                <tr id=" + reservation.reservationId + ">\n\
                    <td>\n\
                        <label class='mylabel table-label' >" + reservation.reservationId + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + resolveReservationDate(reservation.reservationTime, reservation.reservationDate) + "' data-position='top left'>" + resolveReservationDate(reservation.reservationTime, reservation.reservationDate) + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + reservation.patient.patientName + "' data-position='top left'>" + reservation.patient.patientName + "</label>\n\
                    </td>\n\
                     <td>\n\
                        <label class='mylabel table-label' data-content='" + reservation.patient.patientAge + "' data-position='top left'>" + reservation.patient.patientAge + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + reservation.staff.department.departmentName + "' data-position='top left'>" + reservation.staff.department.departmentName + "</label>\n\
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
                url: "staff/reservationlisSize/${staff.staffId}",
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
