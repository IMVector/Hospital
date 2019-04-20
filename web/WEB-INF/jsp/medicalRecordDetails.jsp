
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>病例详情</title>
        <jsp:include page="resourcesTemplete.jsp"/>
    </head>
    <body>
        <jsp:include page="patientHeaderTemplete.jsp"/>
        <div class="ui container">

            <div class="ui segment">

                <div class="ui header blue segment">${patient.patientName}病例详情</div>
                <h3 class="ui block header">
                    诊断
                </h3>
                <div class="ui segment item"><p class="ui label">病例日期：</p>${medicalRecord.date}</div>
                <div class="ui segment item"><p class="ui label">发病症状：</p>${medicalRecord.symptom}</div>

                <div class="ui segment item"><p class="ui label">诊断结果：</p>${medicalRecord.diagnosticDescription}</div>
                <div class="ui segment item"><p class="ui label">诊断医师：</p>${medicalRecord.staff.staffName}</div>
                <h3 class="ui block header">
                    处方
                </h3>
                <table class="ui celled blue table">
                    <thead>
                        <tr>
                            <th>药品名称</th>
                            <th>药品功效</th>
                            <th>药品说明</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${prescription['medicineList']}" var="medicine">
                            <tr>
                                <td> ${medicine.medicineName}</td>
                                <td> ${medicine.medicineDescription}</td>
                                <td> ${medicine.medicineInstructions}</td>
                            </tr>

                        </c:forEach>

                    </tbody>
                </table>
                <div class="ui segment item"><p class="ui label">处方日期：</p> ${prescription["prescription"].prescriptionDate}</div>
                <div class="ui segment item"><p class="ui label">注意事项：</p> ${prescription["prescription"].prescriptionPrecautions}</div>


                <div class="col-offset-14">
                    <a href="patient/goToMedicalRecord" class="ui button blue" >返回</a>
                </div>


            </div>
        </div>
    </body>
    <script>
        console.log("${prescription["medicineList"]}");
        console.log("${prescription["prescription"]}");
    </script>
</html>
