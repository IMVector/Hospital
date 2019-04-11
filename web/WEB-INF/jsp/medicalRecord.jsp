
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人病例</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #medicalRecordTable td{
                text-align: center;
                vertical-align:middle;
            }
            #medicalRecordTable th{
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
                    病历信息
                </div>
                <div class="container-inner">
                    <table id="medicalRecordTable" class="ui blue table">
                    </table>
                </div>

                <div>
                    <p id="pageText"></p>
                    <div id="medicalRecordPageButtons" class="mini ui basic buttons">

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

        $(document).ready(function () {
            var url = 'patient/medicalRecordList/${patient.patientId}/page_key_word';
            fillForm("medicalRecordPageButtons", "pageText", "pageSelecter", currentPage = 1, url, medicalRecordTableInfo, getMedicalRecordItemNumber);
            $("#medicalRecord").click(function () {
                var url = 'patient/medicalRecordList/${patient.patientId}/page_key_word';
                fillForm("medicalRecordPageButtons", "pageText", "pageSelecter", currentPage = 1, url, medicalRecordTableInfo, getMedicalRecordItemNumber);
            });

            $("#pageSelecter").on("change", function () {
                var url = 'patient/medicalRecordList/${patient.patientId}/page_key_word';
                goToThPage("medicalRecordPageButtons", "pageText", "pageSelecter", url, medicalRecordTableInfo, getMedicalRecordItemNumber);
            });
        });

        function medicalRecordTableInfo(data) {
            $("#medicalRecordTable").empty();
            $("#medicalRecordTable").append("<thead><tr> <th style='width:100px;'>病例编号</th><th style='width:100px;'>病人姓名</th><th>病例日期</th><th>发病症状</th><th>诊查结果</th><th>查看详情</th></tr></thead>");
            $.each(data, function (index, medicalRecord) {
                var str = "<tr id=" + medicalRecord.medicalRecordId + ">\n\
                    <td style='width:100px;'>" + medicalRecord.medicalRecordId + "</td><td>${patient.patientName}</td>\n\
                    <td style='width:100px;'><label class=\"mylabel\" data-content=\"" + formatDatebox(medicalRecord.date) + "\" data-position=\"top left\">" + formatDatebox(medicalRecord.date) + "</label></td>\n\
                    <td style='max-width:400px;'><label class=\"mylabel\" data-content=\"" + medicalRecord.symptom + "\" data-position=\"top left\">" + medicalRecord.symptom + "</label></td>\n\
                    <td style='max-width:400px;'><label class=\"mylabel\" data-content=\"" + medicalRecord.diagnosticDescription + "\" data-position=\"top left\">" + medicalRecord.diagnosticDescription + "</label></td>\n\
                    <td style='width:100px;'> <a  class='ui button small blue' href='patient/medicalRecordDetails/" + medicalRecord.medicalRecordId + "'>查看</a> </td>\n\</tr>";

                $("#medicalRecordTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

        /**
         * 查询数据库中当前病人的所有病例数量 这是一个同步请求
         * @returns {data|Number} 返回病例数量
         */
        function getMedicalRecordItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "patient/medicalRecordListItemNumber/${patient.patientId}",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
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
