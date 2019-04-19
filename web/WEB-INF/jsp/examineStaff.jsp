
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>检查医生主页</title>
    </head>
    <body>
        <div class="ui container">
            <jsp:include page="examStaffHeaderTemplete.jsp"/>
            <div class="ui segment">
                <div class="ui huge horizontal divided list">
                    <div class="item">
                        <i class="stethoscope huge icon"></i>
                        <div class="content">
                            <a class="header link-staff" href="staff/goToTaskList">查看任务</a>
                        </div>
                    </div>
                    <div class="item">
                        <i class="edit outline huge icon"></i>
                        <div class="content">
                            <div class="header">检查结果分析</div>
                        </div>
                    </div>
                    <div class="item">
                        <i class="heartbeat huge icon"></i>
                        <div class="content">
                            <div class="header">通知主治医生</div>
                        </div>
                    </div>
                </div>

                <div class="twelve wide column">

                    <div class="ui divider"></div>

                    <div class="ui four cards">
                        <div class="ui blue card">
                            <div class="content">
                                <div class="header">
                                    <div class="ui grid">
                                        <div class="six wide column">
                                            <i class="blue user circle huge icon"></i>
                                        </div>
                                        <div class="ten wide column">
                                            <div class="row">
                                                <div> 今日已完成任务</div>
                                                <div>
                                                    <div class="ui horizontal statistic">
                                                        <div class="value">
                                                            3
                                                        </div>
                                                        <div class="label">
                                                            项  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">详情</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <br>
                                </div>

                                <div class="ui divider"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
