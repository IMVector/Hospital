<%-- 
    Document   : staffIndex
    Created on : 2019-3-18, 19:25:05
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>员工主页</title>
        <style>
            .link-staff{
                text-decoration: none;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="ui container">

            <div class="ui huge horizontal divided list">
                <div class="item">
                    <!--                    <img class="ui avatar image" src="/images/avatar/small/helen.jpg">-->
                    <!--<i class="edit outline huge icon"></i>-->
                    <i class="stethoscope huge icon"></i>
                    <div class="content">
                        <a class="header link-staff" href="staff/goToDiagnosis">诊断</a>
                    </div>
                </div>
                <div class="item">
                    <!--<img class="ui avatar image" src="/images/avatar/small/christian.jpg">-->
                    <i class="edit outline huge icon"></i>
                    <div class="content">
                        <div class="header">就医安排</div>
                    </div>
                </div>
                <div class="item">
                    <!--<img class="ui avatar image" src="/images/avatar/small/daniel.jpg">-->
                    <i class="heartbeat huge icon"></i>
                    <div class="content">
                        <div class="header">查看检查结果</div>
                    </div>
                </div>
                <div class="item">
                    <!--<img class="ui avatar image" src="/images/avatar/small/daniel.jpg">-->
                    <!--<i class="heartbeat huge icon"></i>-->
                    <i class="file alternate outline huge icon"></i>
                    <div class="content">
                        <div class="header">开处方</div>
                    </div>
                </div>
                <div class="item">
                    <!--<img class="ui avatar image" src="/images/avatar/small/daniel.jpg">-->
                    <!--<i class="heartbeat huge icon"></i>-->
                    <!--<i class="file alternate outline huge icon"></i>-->
                    <i class="calendar alternate outline huge icon"></i>
                    <div class="content">
                        <div class="header">查看预约信息</div>
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
                                            <div> 今日已接待病人</div>
                                            <div>
                                                <div class="ui horizontal statistic">
                                                    <div class="value">
                                                        3
                                                    </div>
                                                    <div class="label">
                                                        人  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">详情>></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <br>
                            </div>

                            <div class="ui divider"></div>

                            <div class="header">
                                <div class="ui grid">
                                    <div class="six wide column">
                                        <i class="orange user circle outline huge icon"></i>
                                    </div>
                                    <div class="ten wide column">
                                        <div class="row">
                                            <div> 今日剩余待病人</div>
                                            <div>
                                                <div class="ui horizontal statistic">
                                                    <div class="value">
                                                        3
                                                    </div>
                                                    <div class="label">
                                                        人 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">详情>></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--<br>-->
                            </div>
                        </div>
                    </div>

                    <div class="ui blue card">
                        <div class="content">
                            <div class="header">
                                <div class="ui grid">
                                    <div class="six wide column">
                                        <!--<i class="blue user circle huge icon"></i>-->
                                        <i class="orange clipboard check huge icon"></i>
                                    </div>
                                    <div class="ten wide column">
                                        <div class="row">
                                            <div> 待完成的任务</div>
                                            <div>
                                                <div class="ui horizontal statistic">
                                                    <div class="value">
                                                        3
                                                    </div>
                                                    <div class="label">
                                                        个 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">详情>></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                            </div>

                            <div class="ui divider"></div>

                            <div class="header">
                                <div class="ui grid">
                                    <div class="six wide column">
                                        <!--<i class="orange user circle outline huge icon"></i>-->
                                        <i class="blue clipboard list huge icon"></i>
                                    </div>
                                    <div class="ten wide column">
                                        <div class="row">
                                            <div> 已完成的任务</div>
                                            <div>
                                                <div class="ui horizontal statistic">
                                                    <div class="value">
                                                        3
                                                    </div>
                                                    <div class="label">
                                                        个 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">详情>></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>



    </body>
</html>
