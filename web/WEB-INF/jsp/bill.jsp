
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人</title>
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
            p{
                font-weight: bold;
                font-size: 15px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />
        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    账单中心
                </div>
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
                            <div class="extra">
                                <a href="patient/goToUpdatePatientIngo" class="ui right floated primary button">
                                    修改信息
                                    <i class="right chevron icon"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="ui divider"></div>
                </div>
                <div class="ui header blue segment">
                    账单条目
                </div>
                <h3 class="ui block header">
                    未支付病历信息
                </h3>
                <table id="medicalRecordTable" class="ui blue table">
                </table>
                <h3 class="ui block header">
                    未支付检查信息
                </h3>
                <table id="checkRecordTable" class="ui blue table">
                </table>
                <button id="clear" class="ui fluid green button">清算</button>

                <table class="ui celled table">
                    <thead>
                        <tr>
                            <th>收费项目</th>
                            <th>金额</th>
                            <th>数目</th>
                        </tr> 
                    </thead>
                    <tbody id="billContent">
                        
                    </tbody>
                    <tfoot>
                        <tr>
                            <th id="num"></th>
                            <th id="totalAmount"></th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>

                <h3 class="ui block header">
                    账单列表
                </h3>        
            </div>
        </div>
    </body>
    <script>

        medicalRecord();
        checkRecord();


        $(document).on("click", "#clear", function () {
            $.ajax({
                url: "patient/billClear",
                type: 'POST',
                data: {"patientId":${patient.patientId}},
                success: function (data, textStatus, jqXHR) {
                    $("#totalAmount").append("总计：" + data.totalAmount + "元");
//                    console.log(data.totalAmount);
                    getBillInfo(data.billId);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("出现错误，请求失败！");
                }
            });

        });


        function getBillInfo(billId) {
            $.ajax({
                url: "patient/getBillInfo",
                type: 'POST',
                data: {"billId": billId},
                success: function (data, textStatus, jqXHR) {

                    data['checkRecordLsit'].forEach(checkRecord => {
                        var str = "\
                             <tr>\n\
                                <td>" + checkRecord.checkItem.checkItemName + "</td>\n\
                                <td>" + checkRecord.checkItem.checkItemPrice + "</td>\n\
                                <td>1</td>\n\
                            </tr>";
                        $("#billContent").append(str);
                    });
                    data['medicineList'].forEach(medicine => {
                        var str = "\
                             <tr>\n\
                                <td>" + medicine.medicineName + "</td>\n\
                                <td>" + medicine.medicinePrice + "</td>\n\
                                <td>1</td>\n\
                            </tr>";
                        $("#billContent").append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败请重试！");
                }
            });
        }


        function medicalRecord() {
            $.ajax({
                url: "patient/getUnPayMedicalRecord",
                type: 'POST',
                data: {"patientId":${patient.patientId}},
                success: function (data, textStatus, jqXHR) {
                    $("#medicalRecordTable").empty();
                    $("#medicalRecordTable").append("<thead><tr> <th style='width:100px;'>病例编号</th><th style='width:100px;'>病人姓名</th><th>病例日期</th><th>发病症状</th><th>诊查结果</th><th>查看详情</th></tr></thead>");
                    $.each(data, function (index, medicalRecord) {
                        var str = "<tr id=" + medicalRecord.medicalRecordId + ">\n\
                    <td style='width:100px;'>" + medicalRecord.medicalRecordId + "</td><td>${patient.patientName}</td>\n\
                    <td style='width:100px;'><label class='mylabel' data-content='" + formatDatebox(medicalRecord.date) + "' data-position='top left'>" + formatDatebox(medicalRecord.date) + "</label></td>\n\
                    <td style='max-width:400px;'><label class='mylabel' data-content='" + medicalRecord.symptom + "' data-position='top left'>" + medicalRecord.symptom + "</label></td>\n\
                    <td style='max-width:400px;'><label class='mylabel' data-content='" + medicalRecord.diagnosticDescription + "' data-position='top left'>" + medicalRecord.diagnosticDescription + "</label></td>\n\
                    <td style='width:100px;'> <a class='ui button small blue' href='patient/medicalRecordDetails/" + medicalRecord.medicalRecordId + "'>查看</a> </td>\n\</tr>";

                        $("#medicalRecordTable").append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });

        }
        function checkRecord() {
            $.ajax({
                url: "patient/getUnPayCheckRecordByPatientId",
                type: 'POST',
                data: {"patientId":${patient.patientId}},
                success: function (data, textStatus, jqXHR) {
                    $("#checkRecordTable").empty();
                    $("#checkRecordTable").append("<thead><tr> <th>检查编号</th><th>病人姓名</th><th>检查项目</th><th>检查日期</th><th>查看详情</th></tr></thead>");
                    $.each(data, function (index, checkRecord) {
                        var str = "<tr id=" + checkRecord.checkRecordId + ">\n\
                    <td style='width:100px;'>" + checkRecord.checkRecordId + "</td>\n\
                    <td style='width:100px;'>${patient.patientName}</td>\n\
                    <td style='max-width:400px;'><label class=\"mylabel\" data-content=\"" + checkRecord.checkItem.checkItemName + "\" data-position=\"right center\">" + checkRecord.checkItem.checkItemName + "</label></td>\n\
                    <td style='max-width:400px;'><label class=\"mylabel\" data-content=\"" + formatDatebox(checkRecord.checkDate) + "\" data-position=\"right center\">" + formatDatebox(checkRecord.checkDate) + "</label></td>\n\
                    <td style='width:100px;'> <a  class='ui button small blue' href='patient/checkRecordDetails/" + checkRecord.checkRecordId + "'>查看</a> </td>\n\</tr>";
                        $("#checkRecordTable").append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        }

    </script>
</html>
