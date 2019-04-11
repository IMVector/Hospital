
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
                      
                        <p>  <i class="file image big icon"></i>检查影像或检查报告文件</p>
                        ${checkRecord.resultFile}
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>
                    <div class="ui segment">
                        <p><i class="dna big icon"></i>检查结果描述及分析：</p>
                        <br>
                        ${checkRecord.checkResultDescription}
                    </div>
                    <div class="ui horizontal segments">
                        <div class="ui segment">
                            <p><i class="tasks big icon"></i>检查项目名称：</p><br>${checkRecord.checkItem.checkItemName}
                        </div>
                        <div class="ui segment">
                            <p><i class="yen sign big icon"></i>检查项目价格：</p><br>${checkRecord.checkItem.checkItemPrice}
                        </div>
                        <div class="ui segment">
                            <p><i class="calendar alternate big icon"></i>检查日期：</p><br>${checkRecord.checkDate}
                        </div>
                        <div class="ui segment">
                            <p><i class="credit card big icon"></i>是否支付：</p><br>${checkRecord.paymentStatus}
                        </div>

                    </div>
                    <div class="ui segment">
                        <p><i class="edit outline big icon"></i>检查项目描述：</p><br>${checkRecord.checkItem.checkItemDescription}
                    </div>
                    <div class="ui segment">
                        <p><i class="users big icon"></i>检查人：</p><br>${checkRecord.staff.staffName}
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>

    </script>
</html>
