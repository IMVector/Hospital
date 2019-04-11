
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>任务详情</title>
        <jsp:include page="resourcesTemplete.jsp"/>
    </head>
    <body>
        <jsp:include page="staffHeaderTemplete.jsp"/>
        <div class="ui container">

            <div class="ui segment">
                <div class="ui header blue segment">任务详情</div>

                <div class="ui segment item">

                    <span style="font-size: 25px;font-weight: bold"><i class="address big card icon"></i>病人基本信息</span>
                    <div class="ui divider"></div>
                    <div class="ui huge horizontal divided list">
                        <div class="item">
                            <div class="content">
                                <p class="ui label">病人姓名：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${task.patient.patientName}
                            </div>
                        </div>
                        <div class="item">
                            <div class="content">
                                <p class="ui label">病人年龄：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${task.patient.patientAge}
                            </div>
                        </div>
                        <div class="item">
                            <div class="content">
                                <p class="ui label">病人血型：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${task.patient.bloodType}
                            </div>
                        </div>
                        <div class="item">
                            <div class="content">
                                <p class="ui label">婚姻状况：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${task.patient.patientMstatus}
                            </div>
                        </div>
                    </div>

                </div>
                <div class="ui segment item">
                    <span style="font-size: 25px;font-weight: bold"><i class=" user big plus icon"></i>&nbsp;任务发起人</span>
                    <div class="ui divider"></div>

                    <div class="ui huge horizontal divided list">
                        <div class="item">
                            <div class="content">
                                <p class="ui label">姓名：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${task.staffByTaskSponsor.staffName}
                            </div>
                        </div>
                        <div class="item">
                            <div class="content">
                                <p class="ui label">科室：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${task.staffByTaskSponsor.department.departmentName}
                            </div>
                        </div>
                    </div>

                </div>
                <div class="ui segment item">
                    <span style="font-size: 25px;font-weight: bold"><i class="user big icon"></i>任务执行人</span>
                    <div class="ui divider"></div>

                    <div class="ui huge horizontal divided list">
                        <div class="item">
                            <div class="content">
                                <p class="ui label">任务执行人：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${task.staffByTaskTarget.staffName}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui segment item">
                    <span style="font-size: 25px;font-weight: bold"><i class="calendar alternate outline big icon"></i>任务日期</span>
                    <div class="ui divider"></div>

                    <div class="ui huge horizontal divided list">
                        <div class="item">
                            <div class="content">
                                <p class="ui label">任务日期：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${task.date}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui segment item">
                    <span style="font-size: 25px;font-weight: bold"><i class="heartbeat big icon"></i>任务重点</span>
                    <div class="ui divider"></div>

                    <p class="ui label">任务重点：</p>
                    <span style="font-size: 18px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${task.taskContent}
                    </span>
                </div>

                <div class="ui placeholder segment">
                    <div class="ui center aligned icon header">
                    </div>
                    <center>
                        <div  id="mySelect" class="ui primary button">上传结果文件</div>
                    </center>

                </div>

                <form id="resultForm" class="ui form">
                    <input name="patient.patientId" value="${task.patient.patientId}" style="display: none"/>
                    <div class="field">
                        <label for="">检查结论：</label>
                        <div class="ui input ">
                            <textarea id="checkResultDescription" name="checkResultDescription" placeholder="请输入检查结果以及结果分析"></textarea>
                        </div>
                    </div>
                    <input id="resultFile" type="text" name="resultFile" style="display: none"/>
                </form>


                <div class="col-offset-13">
                    <br>
                    <a href="patient/goToMedicalRecord" class="ui secondary button" >返回</a>
                    <button id="checkRecordBtn" class="ui positive button">提交</button>
                </div>
            </div>
        </div>


        <form id="resultFileForm" style="display:none" enctype="multipart/form-data">
            <div> 
                <input id="inputFile"  type="file" name="input-file"> 
            </div> 
        </form>


    </body>

    <script>
        function changeTaskStatus() {
            $.ajax({
                url: "staff/changeTaskStatus",
                type: 'POST',
                data: {"taskId":${task.taskId}},
                success: function (data, textStatus, jqXHR) {
                    if (!data) {
                        toastError("任务状态修改失败！");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("任务状态修改失败！");
                }
            });
        }

        $(document).on("click", "#checkRecordBtn", function () {
            $.ajax({
                url: "staff/finishTask",
                type: 'POST',
                data: $("#resultForm").serialize(),
                success: function (data, textStatus, jqXHR) {
                    if (data) {
                        toastSuccess("检查完成！");
                        changeTaskStatus();
                        window.open("staff/goToTaskList", "_self");
                    } else {
                        toastError("信息上传失败！请重试！");
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败请重试！");
                }
            });
        });

        $(document).on("click", "#mySelect", function () {
            $("#inputFile").click();
        });
        $(document).on("change", "#inputFile", function () {
            $.ajax({
                url: "upload/uploadFile/uploadCheckRecordResultFile",
                type: 'POST',
                cache: false,
                data: new FormData($("#resultFileForm")[0]),
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data === "Error") {
                        toastError("上传失败");
                    } else {
                        toastSuccess("上传成功");
                        $("#resultFile").val(data);
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
        });
        $('.ui.form').form({
            fields: {
                checkResultDescription: {
                    identifier: 'checkResultDescription', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入检查结果描述以及分析'//提示信息
                        }
                    ]
                }
            }
        });
    </script>
</html>
