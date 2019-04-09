<%-- 
    Document   : checkRecord
    Created on : 2018-5-19, 10:30:04
    Author     : Vector
--%>

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
                    检查记录
                </div>
                <div class="ui segments">
                    <div class="ui segment">
                        <p>检查影像或检查报告文件</p>
                        ${checkRecord.resultFile}
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                    <div class="ui segment">
                        <p>检查结果描述及分析：</p>${checkRecord.checkResultDescription}
                    </div>
                    <div class="ui horizontal segments">
                        <div class="ui segment">
                            <p>检查项目名称：</p>${checkRecord.checkItem.checkItemName}
                        </div>
                        <div class="ui segment">
                            <p>检查项目价格：</p>${checkRecord.checkItem.checkItemPrice}
                        </div>
                        <div class="ui segment">
                            <p>检查日期：</p>${checkRecord.checkDate}
                        </div>
                        <div class="ui segment">
                            <p>是否支付：</p>${checkRecord.paymentStatus}
                        </div>

                    </div>
                    <div class="ui segment">
                        <p>检查项目描述：</p>${checkRecord.checkItem.checkItemDescription}
                    </div>
                    <div class="ui segment">
                        <p>检查人：</p>${checkRecord.staff.staffName}
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>

    </script>
</html>
