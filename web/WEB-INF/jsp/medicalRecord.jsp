<%-- 
    Document   : medicalRecord
    Created on : 2018-5-19, 10:30:04
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人病例</title>
        <jsp:include page="resourcesTemplete.jsp" />
    </head>

    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />
        <div class="container container-my">
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
                    <select id="pageSelecter" class="mini ui button basic dropdown">
                        <option value="">页码</option>


                        <!--<option value="1">1</option>-->
                    </select>
                </div>
            </div>
            <!--<div id="pageNumber" class="nonevisiual"></div>-->
        </div>
    </body>
    <script>

        $(document).ready(function () {

            $("#medicalRecord").click(function () {
                var url = 'medicalRecordList/${patient.patientId}/page_key_word';
                fillForm("medicalRecordPageButtons", "pageText", "pageSelecter", currentPage = 1, url, medicalRecordTableInfo, getMedicalRecordItemNumber);
            });

            $("#pageSelecter").on("change", function () {
                var url = 'medicalRecordList/${patient.patientId}/page_key_word';
                goToThPage("medicalRecordPageButtons", "pageText", "pageSelecter", url, medicalRecordTableInfo, getMedicalRecordItemNumber);
            });
        });

        function medicalRecordTableInfo(data) {
            $("#medicalRecordTable").empty();
            $("#medicalRecordTable").append("<thead><tr> <th>病例编号</th><th>病人姓名</th><th>病例日期</th><th>诊查情况</th><th>诊查医生</th><th>查看详情</th></tr></thead>");
            $.each(data, function (index, medicalRecord) {
                var str = "<tr id=" + medicalRecord.medicalRecordId + ">\n\
                    <td>" + medicalRecord.medicalRecordId + "</td><td>${patient.patientName}</td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + formatDatebox(medicalRecord.inDate) + "\" data-position=\"right center\">" + formatDatebox(medicalRecord.inDate) + "</label></td>\n\
                    <td><label class=\"mylabel\" data-content=\"" + medicalRecord.inDiagnosis + "\" data-position=\"right center\">" + medicalRecord.inDiagnosis + "</label></td>\n\
                    <td>" + medicalRecord.doctorName + "</td>\n\
                    <td> <a  class='ui button small blue' href='medicalRecordDetails/" + medicalRecord.medicalRecordId + "'>查看</a> </td>\n\</tr>"

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
                url: "medicalRecordListItemNumber/${patient.patientId}",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
//                    alert("请求失败，请重试！");
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
            return itemNum;
        }


//        /**
//         * 发送异步请求病例的列表
//         * @param {type} currentPage 当前页码
//         * @returns {undefined}         
//         */
//        function getMedicalRecord(currentPage) {
//            $.ajax({
//                url: 'medicalRecordList/${patient.patientId}/' + currentPage,
//                type: 'POST',
//                data: {},
//                success: function (data) {
//                    $("#medicalRecordTable").empty();
//                    $("#medicalRecordTable").append("<thead><tr> <th>病例编号</th><th>病人姓名</th><th>病例日期</th><th>诊查情况</th><th>诊查医生</th><th>查看详情</th></tr></thead>");
//                    $.each(data, function (index, medicalRecord) {
//                        var str = "<tr id=" + medicalRecord.medicalRecordId + ">\n\
//                    <td>" + medicalRecord.medicalRecordId + "</td><td>${patient.patientName}</td>\n\
//                    <td>" + formatDatebox(medicalRecord.inDate) + "</td>\n\
//                    <td>" + medicalRecord.inDiagnosis + "</td>\n\
//                    <td>" + medicalRecord.doctorName + "</td>\n\
//                    <td> <a  class='ui button small blue' href='medicalRecordDetails/" + medicalRecord.medicalRecordId + "'>查看</a> </td>\n\</tr>"
//
//                        $("#medicalRecordTable").append(str);
//                    });
//                }, error: function (req, status, error) {
//                    alert("请求失败，请重试！");
//                }
//
//            });
//        }



    </script>
</html>
