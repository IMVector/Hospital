<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>回复医生</title>
        <jsp:include page="resourcesTemplete.jsp"/>
    </head>
    <body>
        <jsp:include page="patientHeaderTemplete.jsp"/>
        <div class="ui container">

            <div class="ui segment">
                <div class="ui header blue segment">${patient.patientName}健康建议详情</div>
                <div class="ui segment item"><p class="ui label">建议日期：</p>${precautionAdvice.dietAdviceTime}</div>
                <div class="ui segment item"><p class="ui label">建议内容：</p>${precautionAdvice.precautionAdviceContent}</div>
                <div class="ui segment item"><p class="ui label">建议给出医生：</p>${precautionAdvice.staff.staffName}</div>


                <form id="precautionAdviceFrom" class="ui form">
                    <input name="staff.staffId" type="text" value="${precautionAdvice.staff.staffId}" style="display: none">
                    <input name="patient.patientId" type="text" value="${patient.patientId}" style="display: none">
                    <input name="role" type="text" value="patient" style="display: none">
                    <input name="lastId" type="text" value="${precautionAdvice.precautionAdviceId}" style="display: none">
                    <div class="field">
                        <label>回复内容</label>
                        <div class="ui fluid action input">
                            <textarea name="precautionAdviceContent" placeholder="请输入回复内容"></textarea>
                        </div>
                    </div>
                </form>
                <br>
                <div class="col-offset-12">
                    <button id="precautionAdviceSubmit" class="ui button blue">提交回复</button>
                    <a href="patient/goToPatientAdvice" class="ui negative button" >返回</a>
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
                        toastError("回复失败！");
                    } else {
                        toastSuccess("回复成功！");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败");
                }


            });

        });
    </script>
</html>
