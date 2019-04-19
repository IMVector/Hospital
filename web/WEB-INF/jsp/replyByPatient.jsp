
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>病人回复</title>
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
        <jsp:include page="staffHeaderTemplete.jsp"/>
        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    回复
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

                        </select>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>

        $(document).ready(function () {

            var url = 'staff/precautionAdviceList/${staff.staffId}/page_key_word';
            fillForm("healthAdvicePageButtons", "pageText_healthAdvice", "pageSelecter_healthAdvice", currentPage = 1, url, showHealthAdviceTable, getHealthAdviceItemNum);

            $("#pageSelecter_healthAdvice").on("change", function () {
                var url = 'staff/precautionAdviceList/${staff.staffId}/page_key_word';
                goToThPage("healthAdvicePageButtons", "pageText_healthAdvice", "pageSelecter_healthAdvice", url, showHealthAdviceTable, getHealthAdviceItemNum);
            });

        });

        function showHealthAdviceTable(data) {
            $("#healthAdviceTable").empty();
            $("#healthAdviceTable").append("<thead><tr> <th>建议编号</th><th>病人姓名</th><th>建议日期</th><th>建议内容</th><th>建议人</th><th>操作</th></tr></thead>");
            $.each(data, function (index, healthAdvice) {
                var str = "<tr id=" + healthAdvice.precautionAdviceId + ">\n\
                    <td>" + healthAdvice.precautionAdviceId + "</td><td>${staff.staffName}</td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + formatDatebox(healthAdvice.dietAdviceTime) + "\" data-position=\"top left\">" + formatDatebox(healthAdvice.dietAdviceTime) + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + healthAdvice.precautionAdviceContent + "\" data-position=\"top left\">" + healthAdvice.precautionAdviceContent + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + healthAdvice.staff.staffName + "\" data-position=\"top left\">" + healthAdvice.staff.staffName + "</label> </td>\n\
                    <td><a class='ui button small blue' href='staff/goToReply/" + healthAdvice.precautionAdviceId + "'>回复</a> </td></tr>";

                $("#healthAdviceTable").append(str);
            });
        }

        function getHealthAdviceItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "staff/precautionAdviceListItemNumber/${staff.staffId}",
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
