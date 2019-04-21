
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
            <jsp:include page="staffHeaderTemplete.jsp"/>
            <div class="ui segment">

                <div class="ui relaxed divided items">
                    <div class="item">
                        <div class="ui small image">
                            <img src="${staff.image.imagePath}">
                        </div>

                        <div class="content">
                            <!--<a class="header">内容标题</a>-->
                            <div class="meta">
                                <div class="ui label">编号：</div> &nbsp&nbsp${staff.staffId}
                            </div>
                            <div class="meta">
                                <div class="ui label">姓名：</div> &nbsp&nbsp${staff.staffName}

                                <!--<a>姓名：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">职称：</div> &nbsp&nbsp${staff.title.titleName}

                                <!--<a>血型：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">特长：</div> &nbsp&nbsp${staff.specialty}
                                <!--<a>年龄：</a>-->
                            </div>
                            <div class="meta">
                                <div class="ui label">性别：</div> &nbsp&nbsp${staff.gender}
                                <!--<a>婚否：</a>-->
                            </div>
                        </div>
                    </div>
                    <div class="ui divider"></div>
                </div>

                <center>
                    <div class="ui big horizontal divided list">
                        <div class="item">
                            <i class="stethoscope huge icon"></i>
                            <div class="content">
                                <a class="header link-staff" href="staff/goToDiagnosis">诊断</a>
                            </div>
                        </div>
                        <div class="item">
                            <i class="edit outline huge icon"></i>
                            <div class="content">
                                <a class="header link-staff" href="staff/goToStaffDietAdvice">饮食建议</a>
                            </div>
                        </div>
                        <div class="item">
                            <i class="heartbeat huge icon"></i>
                            <div class="content">
                                <a class="header link-staff" href="staff/goToStaffPrecautionAdvice">预防建议</a>
                            </div>
                        </div>
                        <div class="item">
                            <i class="calendar alternate outline huge icon"></i>
                            <div class="content">
                                <a class="header link-staff" href="staff/goToStaffReservationList">预约信息</a>
                            </div>
                        </div>
                        <div class="item">
                            <i class="phone huge  icon"></i>
                            <div class="content">
                                <a class="header link-staff" href="staff/goToReplyByPatient">病人回复</a>
                                <!--<div class="header">查看预约信息</div>-->
                            </div>
                        </div>
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
                                                <div> 今日已接待病人</div>
                                                <div>
                                                    <div class="ui horizontal statistic">
                                                        <div class="value">
                                                            3
                                                        </div>
                                                        <div class="label">
                                                            人  
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="">详情</a>

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
                                                            人
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="">详情</a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>

                        <div class="ui blue card">
                            <div class="content">
                                <div class="header">
                                    <div class="ui grid">
                                        <div class="six wide column">
                                            <i class="blue user circle huge icon"></i>
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
                                                            个 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="">详情</a>
                                        </div>
                                    </div>
                                    <br>
                                </div>

                                <div class="ui divider"></div>

                                <div class="header">
                                    <div class="ui grid">
                                        <div class="six wide column">
                                            <i class="orange user circle outline huge icon"></i>
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
                                                            个
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="">详情</a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>-->
            </div>

        </div>

    </body>
</html>
