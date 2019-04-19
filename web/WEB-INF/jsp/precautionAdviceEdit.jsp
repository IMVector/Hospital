<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>饮食建议</title>
        <jsp:include page="resourcesTemplete.jsp"/>
    </head>
    <body>
        <jsp:include page="staffHeaderTemplete.jsp"/>
        <div class="ui container">

            <div class="ui segment">
                <div class="ui header blue segment">${medicalRecord.patient.patientName}病例详情</div>
                <div class="ui segment item"><p class="ui label">病例日期：</p>${medicalRecord.date}</div>
                <div class="ui segment item"><p class="ui label">发病症状：</p>${medicalRecord.symptom}</div>

                <div class="ui segment item"><p class="ui label">诊断结果：</p>${medicalRecord.diagnosticDescription}</div>
                <div class="ui segment item"><p class="ui label">诊断医师：</p>${medicalRecord.staff.staffName}</div>


                <div class="ui segment item">
                    <form id="precautionAdviceFrom" class="ui form">
                        <input name="staff.staffId" type="text" value="${staff.staffId}" style="display: none">
                        <input name="patient.patientId" type="text" value="${medicalRecord.patient.patientId}" style="display: none">
                        <input name="role" type="text" value="staff" style="display: none">
                        <div class="field">
                            <label>预防建议</label>
                            <div class="ui fluid action input">
                                <textarea name="precautionAdviceContent" placeholder="请输入注意事项"></textarea>
                            </div>
                        </div>
                    </form>

                </div>



                <div class="col-offset-12">
                    <button id="precautionAdviceSubmit" class="ui button blue">提交饮食注意事项</button>
                    <a href="staff/goToStaffPrecautionAdvice" class="ui negative button" >返回</a>
                </div>


            </div>
        </div>
    </body>
    <script>
        $(document).on("click", "#precautionAdviceSubmit", function () {
            $.ajax({
                url: "staff/addPrecautionAdvice",
                type: 'POST',
                data: $("#precautionAdviceFrom").serialize(),
                success: function (data, textStatus, jqXHR) {
                    if (data === false) {
                        toastError("预防建议提交失败！");
                    } else {
                        toastSuccess("预防建议提交成功！");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败");
                }


            });

        });
    </script>
</html>
