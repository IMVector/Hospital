
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>检查记录</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #checkRecordTable td{
                text-align: center;
                vertical-align:middle;
            }
            #checkRecordTable th{
                text-align: center;
                vertical-align:middle;
            }
        </style>
    </head>

    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />
        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    预防建议
                </div>
                <div class="container-inner">
                    <table id="healthAdviceTable" class="ui blue table">

                    </table>
                </div>
                <div>
                    <p id="pageText_healthAdvice"></p>
                    <div id="healthAdvicePageButtons" class="mini ui basic buttons">

                    </div>
                    <div>
                        <label for="" class="ui label">跳转到：</label>
                        <!--发送ajax请求-->
                        <select id="pageSelecter_healthAdvice" class="ui dropdown">
                            <option value="">页码</option>


                            <!--<option value="1">1</option>-->
                        </select>
                    </div>
                </div>
                <div class="ui divider"></div>
                <div class="ui header blue segment">
                    饮食建议
                </div>
                <div class="container-inner">
                    <table id="dietAdviceTable" class="ui blue table">

                    </table>
                </div>
                <div>
                    <p id="pageText_dietAdvice"></p>
                    <div id="dietAdvicePageButtons" class="mini ui basic buttons">

                    </div>
                    <div>
                        <label for="" class="ui label">跳转到：</label>
                        <!--发送ajax请求-->
                        <select id="pageSelecter_dietAdvice" class="ui dropdown">
                            <option value="">页码</option>


                        </select>
                    </div>
                </div>


            </div>
            <!--<div id="pageNumber" class="nonevisiual"></div>-->
        </div>
    </body>
    <script>

        $(document).ready(function () {

            //            $("#healthAdvice").click(function () {
            var url = 'patient/precautionAdviceList/${patient.patientId}/page_key_word';
            fillForm("healthAdvicePageButtons", "pageText_healthAdvice", "pageSelecter_healthAdvice", currentPage = 1, url, showHealthAdviceTable, getHealthAdviceItemNum);
            //            });

            $("#pageSelecter_healthAdvice").on("change", function () {
                var url = 'patient/precautionAdviceList/${patient.patientId}/page_key_word';
                goToThPage("healthAdvicePageButtons", "pageText_healthAdvice", "pageSelecter_healthAdvice", url, showHealthAdviceTable, getHealthAdviceItemNum);
            });

            //            $("#dietAdvice").click(function () {
            var url = 'patient/dietAdviceList/${patient.patientId}/page_key_word';
            fillForm("dietAdvicePageButtons", "pageText_dietAdvice", "pageSelecter_dietAdvice", currentPage = 1, url, showdietAdviceTable, getdietAdviceItemNum);
            //            });

            $("#pageSelecter_dietAdvice").on("change", function () {
                var url = 'patient/dietAdviceList/${patient.patientId}/page_key_word';
                goToThPage("dietAdvicePageButtons", "pageText_dietAdvice", "pageSelecter_dietAdvice", url, showdietAdviceTable, getdietAdviceItemNum);
            });
        });

        function showdietAdviceTable(data) {
            $("#dietAdviceTable").empty();
            $("#dietAdviceTable").append("<thead><tr> <th>建议编号</th><th>病人姓名</th><th>建议日期</th><th>建议内容</th><th>建议人</th></tr></thead>");
            $.each(data, function (index, dietAdvice) {
                var str = "<tr id=" + dietAdvice.dietAdviceId + ">\n\
                    <td>" + dietAdvice.dietAdviceId + "</td><td>${patient.patientName}</td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + formatDatebox(dietAdvice.dietAdviceTime) + "\" data-position=\"top left\">" + formatDatebox(dietAdvice.dietAdviceTime) + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + dietAdvice.dietAdviceContent + "\" data-position=\"top left\">" + dietAdvice.dietAdviceContent + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + dietAdvice.staff.staffName + "\" data-position=\"top left\">" + dietAdvice.staff.staffName + "</label></td></tr>";
                $("#dietAdviceTable").append(str);
            });
        }


        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });
        function getdietAdviceItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "patient/dietAdviceListItemNumber/${patient.patientId}",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
            return itemNum;
        }
        function showHealthAdviceTable(data) {
            $("#healthAdviceTable").empty();
            $("#healthAdviceTable").append("<thead><tr> <th>建议编号</th><th>病人姓名</th><th>建议日期</th><th>建议内容</th><th>建议人</th><th>操作</th></tr></thead>");
            $.each(data, function (index, healthAdvice) {
                var str = "<tr id=" + healthAdvice.precautionAdviceId + ">\n\
                    <td>" + healthAdvice.precautionAdviceId + "</td><td>${patient.patientName}</td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + formatDatebox(healthAdvice.dietAdviceTime) + "\" data-position=\"top left\">" + formatDatebox(healthAdvice.dietAdviceTime) + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + healthAdvice.precautionAdviceContent + "\" data-position=\"top left\">" + healthAdvice.precautionAdviceContent + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + healthAdvice.staff.staffName + "\" data-position=\"top left\">" + healthAdvice.staff.staffName + "</label> </td>\n\
                    <td><a class='ui button small blue' href='patient/goToReply/" +  healthAdvice.precautionAdviceId+ "'>回复</a> </td></tr>";

                $("#healthAdviceTable").append(str);
            });
        }

        function getHealthAdviceItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "patient/precautionAdviceListItemNumber/${patient.patientId}",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
            return itemNum;
        }
    </script>
</html>
