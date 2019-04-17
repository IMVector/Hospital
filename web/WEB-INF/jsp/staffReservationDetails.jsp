
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="resourcesTemplete.jsp" />
        <title>诊断</title>
        <style>
            #checkRecordList p{
                font-weight: bold;
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffHeaderTemplete.jsp"/>
        <div class="ui container">

            <div class="ui segment">
                <div class="ui relaxed divided items">
                    <div class="item">
                        <div class="ui small image">
                            <img src="${patient.image.imagePath}">
                        </div>

                        <div class="content">
                            <!--<a class="header">内容标题</a>-->
                            <div class="meta">
                                <div class="ui label">编号：</div> &nbsp&nbsp${patient.patientId}
                            </div>
                            <div class="meta">
                                <div class="ui label">姓名：</div> &nbsp&nbsp${patient.patientName}

                                <!--<a>姓名：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">血型：</div> &nbsp&nbsp${patient.bloodType}

                                <!--<a>血型：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">年龄：</div> &nbsp&nbsp${patient.patientAge}
                                <!--<a>年龄：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">婚否：</div> &nbsp&nbsp${patient.patientMstatus}
                                <!--<a>婚否：</a>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ui segment">

                <div class="ui header blue segment">
                    病人就医历史
                </div>
                <button id="medicalRecordSearch" class="ui primary button">查询病史</button>
                <br>
                <br>
                <div class="container-admin-inner">
                    <table id="medicalRecordTable" class="ui blue table">
                    </table>
                </div>


                <div>
                    <p id="pageText"></p>
                    <div id="medicalRecordPageButtons" class="mini ui basic buttons">

                    </div>
                    <br>
                    <br>
                    <div>
                        <label for="" class="ui big label" style="float: left">跳转到：</label>
                        <!--发送ajax请求-->
                        <select id="pageSelecter" class="ui dropdown" style="width: 20%;float: left">
                            <option value="">页码</option>      
                            <!--<option value="1">1</option>-->
                        </select>
                        <div  style="clear:both"></div>  
                    </div>
                </div>

            </div>

            <div class="ui segment">
                <div class="ui header blue segment">
                    病人用药历史
                </div>
                <button id="medicalHistorySearch" class="ui primary button">查询用药史</button>
                <br>
                <br>
                <div class="container-admin-inner">
                    <table id="medicalHistoryTable" class="ui blue table">
                    </table>
                </div>

                <div>
                    <p id="medicalHistoryPageText"></p>
                    <div id="medicalHistoryPageButtons" class="mini ui basic buttons">
                    </div>
                    <br>
                    <br>
                    <div>
                        <label for="" class="ui big label" style="float: left">跳转到：</label>
                        <!--发送ajax请求-->
                        <select id="medicalHistoryPageSelecter" class="ui dropdown" style="width: 20%;float: left">
                            <option value="">页码</option>      
                            <!--<option value="1">1</option>-->
                        </select>
                        <div  style="clear:both"></div>  
                    </div>
                </div>

            </div>



        </div>

        <div class="ui modal">
            <div class="header">病历详情</div>
            <div class="scrolling content">
                <div class="ui segment">
                    <div class="ui header blue segment">${patient.patientName}病例详情</div>
                    <div class="ui segment item"><p class="ui label">病例日期：</p>
                        <div id="medicalRecordDate">

                        </div>
                    </div>
                    <div class="ui segment item"><p class="ui label">发病症状：</p>
                        <div id="medicalRecordSymptom">

                        </div>
                    </div>
                    <div class="ui segment item"><p class="ui label">诊断结果：</p>
                        <div id="medicalRecordDiagnosticDescription">

                        </div>
                            
                    </div>
                    <div class="ui segment item"><p class="ui label">诊断医师：</p>
                        <div id="medicalRecordStaffName">

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <!--window.clearInterval(clock);-->
    <script>

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

//        window.onbeforeunload = function (event) {
//            return "是否清除已填写并未提交数据？";
//        };

        ///////////////////////////////////////////////medicaiRecordAdd////////////////////////
        function getTodayMedicalRecord() {

            $.ajax({
                url: "staff/getCheckRecordOfToday",
                type: 'POST',
                data: {"patientId": "${patient.patientId}"},
                success: function (data, textStatus, jqXHR) {
                    $("#checkRecordList").empty();
                    $.each(data, function (index, checkRecord) {
                        var str = "\
                                <div class=\"ui segments\">\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查影像或检查报告文件</p>" + checkRecord.resultFile + "\n\
                                    </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查结果描述及分析：</p>" + checkRecord.checkResultDescription + "\n\
                                    </div>\n\
                                    <div class=\"ui horizontal segments\">\n\
                                        <div class=\"ui segment\">\n\
                                            <p>病人姓名：</p>" + checkRecord.patient.patientName + "\n\
                                        </div>\n\
                                        <div class=\"ui segment\">\n\
                                            <p>病人年龄：</p>" + checkRecord.patient.patientAge + "\n\
                                        </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>婚姻状况：</p></div>" + checkRecord.patient.patientMstatus + "\n\
                                    </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查人：</p>" + checkRecord.staff.staffName + "\n\
                                    </div>\n\
                                </div>";
                        $("#checkRecordList").append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败请重试！");
                }
            });
        }

        $("#medicalRecordSearch").click(function () {
            var url = 'staff/getMedicalRecordByIdCard/${patient.idCard}/page_key_word';
            fillForm("medicalRecordPageButtons", "pageText", "pageSelecter", currentPage = 1, url, medicalRecordTableInfo, getMedicalRecordItemNumber);
        });
        /**
         * 查询过往病史
         * @param {type} data
         * @returns {undefined}
         */
        function medicalRecordTableInfo(data) {
            $("#medicalRecordTable").empty();
            $("#medicalRecordTable").append("<thead><tr> <th style='width:100px;'>病例编号</th><th style='width:100px;'>病人姓名</th><th>病例日期</th><th>发病症状</th><th>诊查结果</th><th>查看详情</th></tr></thead>");
            $.each(data, function (index, medicalRecord) {
                var str = "<tr id=" + medicalRecord.medicalRecordId + ">\n\
                    <td style='width:100px;'>" + medicalRecord.medicalRecordId + "</td><td>" + medicalRecord.patient.patientName + "</td>\n\
                    <td style='width:100px;'><label class=\"mylabel\" data-content=\"" + formatDatebox(medicalRecord.date) + "\" data-position=\"top left\">" + formatDatebox(medicalRecord.date) + "</label></td>\n\
                    <td style='max-width:400px;'><label class=\"mylabel\" data-content=\"" + medicalRecord.symptom + "\" data-position=\"top left\">" + medicalRecord.symptom + "</label></td>\n\
                    <td style='max-width:400px;'><label class=\"mylabel\" data-content=\"" + medicalRecord.diagnosticDescription + "\" data-position=\"top left\">" + medicalRecord.diagnosticDescription + "</label></td>\n\
                    <td style='width:100px;'> <button  class='ui button small blue details'>查看</button> </td>\n\</tr>";
                $("#medicalRecordTable").append(str);
            });
        }

        $(document).on("click", ".details", function () {
            var id = $(this).closest("tr").attr("id");
            $.ajax({
                url: "staff/getMedicalRecordById/" + id,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $("#medicalRecordDate").text(formatDatebox(data.date));
                    $("#medicalRecordSymptom").text(data.symptom);
                    $("#medicalRecordDiagnosticDescription").text(data.diagnosticDescription);
                    $("#medicalRecordStaffName").text(data.staff.staffName);
                    $('.ui.modal').modal('show');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        });
        /**
         * 查询数据库中当前病人的所有病例数量 这是一个同步请求
         * @returns {data|Number} 返回病例数量
         */
        function getMedicalRecordItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/getMedicalRecordByIdCardItemNum",
                type: 'POST',
                async: false,
                data: {"IdCard": "${patient.idCard}"},
                success: function (data, textStatus, jqXHR) {
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
            return itemNum;
        }

        ///////////////////////////////////////////////////用药历史///////////////////////////////////////

        $("#medicalHistorySearch").click(function () {
            var url = 'staff/medicalHistoryList/${patient.patientId}/page_key_word';
            fillForm("medicalHistoryPageButtons", "medicalHistoryPageText", "medicalHistoryPageSelecter", currentPage = 1, url, medicalHistoryTableInfo, getMedicalHistoryItemNumber);
        });
        $("#medicalHistoryTablePageSelecter").on("change", function () {
            var url = 'staff/medicalHistoryList/${patient.patientId}/page_key_word';
            goToThPage("medicalHistoryPageButtons", "medicalHistoryPageText", "medicalHistoryPageSelecter", url, medicalHistoryTableInfo, getMedicalHistoryItemNumber);
        });
        function medicalHistoryTableInfo(data) {
            $("#medicalHistoryTable").empty();
            $("#medicalHistoryTable").append("<thead><tr><th>药品名称</th><th>不良反应</th><th>用药时长</th><th>最后一次用药时间</th></tr></thead>");
            $.each(data, function (index, medicationHistory) {
                var str = " <tr id=" + medicationHistory.medicationHistoryId + ">\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + medicationHistory.medicine.medicineName + "\" data-position=\"top left\"  >" + medicationHistory.medicine.medicineName + "</label>\n\</td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + medicationHistory.adverseReactions + "\" data-position=\"top left\" >" + medicationHistory.adverseReactions + "</label></td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + medicationHistory.duration + "\" data-position=\"top left\"   >" + medicationHistory.duration + "</label></td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + formatDatebox(medicationHistory.lastTime) + "\" data-position=\"top left\">" + formatDatebox(medicationHistory.lastTime) + "</label><div class=\"nonevisiual\"></div></td>";
                $("#medicalHistoryTable").append(str);
            });
        }

        function getMedicalHistoryItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/medicalHistoryListItemNum/${patient.patientId}",
                type: 'POST',
                async: false,
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });
            return itemNum;
        }
    </script>
</html>
