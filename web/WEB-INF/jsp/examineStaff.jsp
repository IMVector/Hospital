
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
                <div class="ui relaxed divided items">
                    <div class="item">
                        <div class="ui small image">
                            <img src="${examStaff.image.imagePath}">
                        </div>

                        <div class="content">
                            <!--<a class="header">内容标题</a>-->
                            <div class="meta">
                                <div class="ui label">编号：</div> &nbsp&nbsp${examStaff.staffId}
                            </div>
                            <div class="meta">
                                <div class="ui label">姓名：</div> &nbsp&nbsp${examStaff.staffName}

                                <!--<a>姓名：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">职称：</div> &nbsp&nbsp${examStaff.title.titleName}

                                <!--<a>血型：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">特长：</div> &nbsp&nbsp${examStaff.specialty}
                                <!--<a>年龄：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">性别：</div> &nbsp&nbsp${examStaff.gender}
                                <!--<a>婚否：</a>-->
                            </div>
<!--                            <div class="extra">
                                <a href="staff/goToExamStaffInfoUpdate" class="ui right floated primary button">
                                    修改信息
                                    <i class="right chevron icon"></i>
                                </a>
                            </div>-->
                        </div>
                    </div>
                    <div class="ui divider"></div>
                </div>
                <center>
                    <div class="ui huge horizontal divided list">
                        <div class="item">
                            <i class="stethoscope huge icon"></i>
                            <div class="content">
                                <a class="header link-staff" href="staff/goToTaskList">查看任务</a>
                            </div>
                        </div>
<!--                        <div class="item">
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
                        </div>-->
                    </div>
                </center>


<!--                <div class="twelve wide column">
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
                                                            项  
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">详情</a>
                                        </div>
                                    </div>
                                    <br>
                                </div>

                                <div class="ui divider"></div>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>

        </div>
    </body>
</html>
