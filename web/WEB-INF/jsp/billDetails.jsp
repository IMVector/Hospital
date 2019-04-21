<%-- 
    Document   : medicalRecordDetails
    Created on : 2018-5-25, 14:01:03
    Author     : Vector
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>账单详情</title>
        <jsp:include page="resourcesTemplete.jsp"/>
    </head>
    <body>
        <jsp:include page="patientHeaderTemplete.jsp"/>
        <div class="ui container">

            <div class="ui segment">
                <div class="ui header blue segment">账单详情</div>


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
                            <th id="totalAmount">总计：${bill.totalAmount}元</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>

                <div class="ui segment item"><p class="ui label">账单日期：</p>${bill.billDate}</div>
                <div class="ui segment item"><p class="ui label">是否支付：</p>${bill.paymentStatus}</div>
                <div class="col-offset-14">
                    <a href="patient/goToBill" class="ui button blue" >返回</a>
                </div>


            </div>
        </div>
    </body>
    <script>
        getBillInfo("${bill.billId}");



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


    </script>
</html>
