
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
                    检查记录
                </div>
                <div class="container-inner">
                    <table id="checkRecordTable" class="ui blue table">
                    </table>
                </div>

                <div>
                    <p id="pageText"></p>
                    <div id="checkRecordButtons" class="mini ui basic buttons">

                    </div>
                    <div>
                        <label for="" class="ui label">跳转到：</label>
                        <!--发送ajax请求-->
                        <select id="pageSelecter" class="ui dropdown">
                            <option value="">页码</option>
                            <!--<option value="1">1</option>-->
                        </select>
                    </div>
                </div>
            </div>
            <!--<div id="pageNumber" class="nonevisiual"></div>-->
        </div>
    </body>
    <script>

        var url = 'patient/checkRecordList/${patient.patientId}/page_key_word';
        fillForm("checkRecordButtons", "pageText", "pageSelecter", currentPage = 1, url, checkRecordTableShow, getCheckRecordItemNumber);
        console.log("+++++++++++++++");
        $(document).ready(function () {
            $("#chaeckRecord").click(function () {
                var url = 'patient/checkRecordList/${patient.patientId}/page_key_word';
                fillForm("checkRecordButtons", "pageText", "pageSelecter", currentPage = 1, url, checkRecordTableShow, getCheckRecordItemNumber);
            });
            $("#pageSelecter_1").on("change", function () {
                var url = 'patient/checkRecordList/${patient.patientId}/page_key_word';
                goToThPage("checkRecordButtons", "pageText", "pageSelecter", url, checkRecordTableShow, getCheckRecordItemNumber);
            });
        });


        function checkRecordTableShow(data) {

            $("#checkRecordTable").empty();
            $("#checkRecordTable").append("<thead><tr> <th>检查编号</th><th>病人姓名</th><th>检查项目</th><th>检查日期</th><th>查看详情</th></tr></thead>");
            $.each(data, function (index, checkRecord) {
                var str = "<tr id=" + checkRecord.checkRecordId + ">\n\
                   <td>" + checkRecord.checkRecordId + "</td>\n\
                    <td>${patient.patientName}</td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + checkRecord.checkItem.checkItemName + "\" data-position=\"right center\">" + checkRecord.checkItem.checkItemName + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + formatDatebox(checkRecord.checkDate) + "\" data-position=\"right center\">" + formatDatebox(checkRecord.checkDate) + "</label></td>\n\
                    <td> <a  class='ui button small blue' href='patient/checkRecordDetails/" + checkRecord.checkRecordId + "'>查看</a> </td>\n\</tr>";

                $("#checkRecordTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

        function getCheckRecordItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "patient/checkRecordListItemNumber/${patient.patientId}",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败" + errorThrown);
                }
            });
            return itemNum;
        }

    </script>
</html>
