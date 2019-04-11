
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
                    个人中心
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
                <h3 class="ui block header">
                    Block Header
                </h3>
                <div class="ui segments">
                    <div class="ui segment">
                        <p>Top</p>
                    </div>
                    <div class="ui segment">
                        <p>Middle</p>
                    </div>
                    <div class="ui segment">
                        <p>Middle</p>
                    </div>
                    <div class="ui segment">
                        <p>Middle</p>
                    </div>
                    <div class="ui segment">
                        <p>Bottom</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>

    </script>
</html>
