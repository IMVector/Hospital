<%-- 
    Document   : diagnosis
    Created on : 2019-3-19, 10:00:42
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="resourcesTemplete.jsp" />
        <title>诊断</title>
        <style>
            #checkRecordList p{
                font-weight: bold;
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffHeaderTemplete.jsp"/>
        <div class="ui container">

            <form id="medicalRecordForm" class="ui form">
                <div class="required field">
                    <label>身份证号</label>
                    <input id="IdCard" type="text" name="IdCard" placeholder="请输入病人的身份证号">
                </div>
                <!-- <div class="ui warning message">
                    <i class="close icon"></i>
                    <div class="header">
                        该病人用户不存在！是否输入有误或者新建用户？
                    </div>
                    <br>
                    <button class="ui positive button">新建用户</button>
                </div>-->
                <div class="required field">
                    <label>病人描述症状</label>
                    <textarea name="symptom" placeholder="请输入病人描述症状"></textarea>
                </div>
                <div class="ui styled fluid accordion">
                    <div class="title active">
                        <i class="dropdown icon"></i>
                        <!--What is a dog?-->
                        检查事项
                    </div>
                    <div class="content">
                        <div class="fields">
                            <div class="six wide field">
                                <label for="">检查项目：</label>
                                <div class="ui input ">
                                    <select id="checkItemId" name="checkItemId" class="ui fluid dropdown"></select>
                                </div>
                            </div>
                            <div class="six wide field">
                                <label for="">检查重点(疑似症状)：</label>
                                <input id="taskContent" type="text" name="taskContent">
                            </div>
                            <div class="four wide field">
                                <label for="">去检查选中项目：</label>
                                <button id="startTask" type="button" class="ui fluid button">检查</button>
                            </div>

                        </div>

                        <p class="transition visible" style="display: block !important;">
                        <div class="ui indicating progress">
                            <div class="bar"></div>
                            <div class="label">检查进度</div>
                        </div>
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        检查结果
                        <!--What kinds of dogs are there?-->
                    </div>
                    <div id="checkRecordList" class="content">

                        <div class="ui segments">
                            <div class="ui segment">
                                <p>检查影像或检查报告文件</p>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                            <div class="ui segment">
                                <p>检查结果描述及分析：</p>
                            </div>
                            <div class="ui horizontal segments">
                                <div class="ui segment">
                                    <p>病人姓名：</p>
                                </div>
                                <div class="ui segment">
                                    <p>病人年龄：</p>
                                </div>
                                <div class="ui segment">
                                    <p>婚姻状况：</p>
                                </div>
                            </div>
                            <div class="ui segment">
                                <p>检查人：</p>
                            </div>
                        </div>

                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        病史
                        <!--How do you acquire a dog?-->
                    </div>
                    <div class="content">
                        <p class="transition hidden">Three common ways for a prospective owner to acquire a dog is from pet shops, private owners, or shelters.</p>
                        <p class="transition hidden">A pet shop may be the most convenient way to buy a dog.
                            Buying a dog from a private owner allows you to assess the pedigree and upbringing of your dog before choosing to take it home. 
                            Lastly, finding your dog from a shelter, helps give a good home to a dog who may not find one so readily.</p>
                    </div>
                </div>
                <br>
                <div class="required field">
                    <label>诊断</label>
                    <textarea name="diagnosticDescription" placeholder="请输入诊断描述"></textarea>
                </div>

                <div class="required field">
                    <label>处方</label>
                    <div class="ui fluid action input">
                        <input type="text" placeholder="Search...">
                        <div class="ui button">Search</div>
                    </div>
                    <div class="ui segment" style="height:100px;background-color:whitesmoke">

                    </div>
                </div>
                <div class="ui styled fluid accordion">
                    <div class="title">
                        <i class="dropdown icon"></i>
                        <!--What is a dog?-->
                        药库信息
                    </div>
                    <div class="content">
                        <p class="transition visible" style="display: block !important;">
                            A dog is a type of domesticated animal. Known for its loyalty and faithfulness, 
                            it can be found as a welcome guest in many households across the world.
                        </p>
                    </div>
                </div>
                <br>
                <div class="field">
                    <label>注意事项</label>
                    <div class="ui fluid action input">
                        <textarea name="PrescriptionPrecautions" placeholder="请输入注意事项"></textarea>
                    </div>
                </div>

                <button id="medicalRecordBtn" type="button" class="ui primary button">提交信息</button>

            </form>

            <div class="ui basic modal">
                <div class="ui icon header">
                    <!--<i class="archive icon"></i>-->
                    <i class="user times icon"></i>
                    该病人用户不存在！是否输入有误或者新建用户？
                </div>
                <div class="content">
                    <!--<p>Your inbox is getting full, would you like us to enable automatic archiving of old messages?</p>-->
                </div>
                <div class="actions">
                    <div class="ui yellow basic cancel inverted button">
                        <i class="remove icon"></i>
                        重新输入
                    </div>
                    <div class="ui green ok inverted button">
                        <i class="checkmark icon"></i>
                        新增用户
                    </div>
                </div>
            </div>
            <input type="text" style="display: none" id="patientId">

        </div>
    </body>
    <!--window.clearInterval(clock);-->
    <script>
        var clock = null;
//        $('.message .close').on('click', function () {
//            $(this).closest('.message').transition('fade');
//        });
        window.onbeforeunload = function (event) {
            return "是否清除已填写并未提交数据？";
        };
//        window.addEventListener("beforeunload", function (event) {
//            alert("是否清除已填写并未提交数据？");
//            console.log("是否清除已填写并未提交数据？");
//        });
        $(document).on("click", "#startTask", function () {
            //需要提交的内容:病人的IdCard，checkItemId,taskSponsor(从session中获取)
            var Idcard = $("#IdCard").val();
            var checkItemId = $("#checkItemId").val();
            var taskContent = $("#taskContent").val();
            $.ajax({
                url: "staff/addTask",
                type: 'POST',
                data: {"IdCard": Idcard, "checkItemId": checkItemId, "taskContent": taskContent},
                success: function (data, textStatus, jqXHR) {
                    if (data) {
                        toastSuccess("已通知检查医生");
                        clock = setInterval(getLastTaskByPatientIdCard, 10000);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败！请重试！");
                }
            });

        });
        requestCheckItmeList("#checkItemId");
        function requestCheckItmeList(id) {
            $.ajax({
                url: "staff/getCheckItemList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $(id).empty();
                    $.each(data, function (index, checkItem) {
                        var str = "<option value=" + checkItem.checkItemId + ">" + checkItem.checkItemName + "</option>";
                        $(id).append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }

        $('.ui.styled.accordion').accordion({
            selector: {
                trigger: '.title'
            }
        });
        $(document).on("click", ".ui.indicating.progress", function () {
            $('.ui.indicating.progress').progress('increment', 30);
        });

        /**
         * 验证病人是否有账号
         */
        $("#IdCard").change(function () {
            $.ajax({
                url: "patient/ isIdCardexist/" + $(this).val(),
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    if (data === false) {
                        $('.ui.basic.modal').modal('show');
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败");
                }
            });
        });

        $("#patientModal").modal("show");

        $("#medicalRecordBtn").click(function () {
            if ($('medicalRecordForm').form('is valid')) {
                $.ajax({
                    url: "staff/addMedicalRecord",
                    type: 'POST',
                    data: $("#medicalRecordForm").serialize(),
                    success: function (data, textStatus, jqXHR) {
                        if (data === false) {
                            $('.ui.basic.modal').modal('show');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败");
                    }
                });
            }

        });

        function getLastTaskByPatientIdCard() {
            var IdCard = $("#IdCard").val();
            $.ajax({
                url: "staff/getLastTaskByPatientIdCard",
                type: 'POST',
                data: {"IdCard": IdCard},
                success: function (data, textStatus, jqXHR) {
                    console.log(data.taskProgress);
                    console.log(data.taskStatus);
                    if (data.taskProgress === 1) {
                        $("#patientId").val(data.patient.patientId);
                        window.clearInterval(clock);
                        getTodayMedicalRecord();
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败！请重试！");
                }
            });

        }
        function getTodayMedicalRecord() {

            $.ajax({
                url: "staff/getCheckRecordOfToday",
                type: 'POST',
                data: {"patientId": $("#patientId").val()},
                success: function (data, textStatus, jqXHR) {
                     $("#checkRecordList").empty();
                    $.each(data, function (index, checkRecord) {
                        var str = "\
                                <div class=\"ui segments\">\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查影像或检查报告文件</p>"+checkRecord.resultFile+"\n\
                                    </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查结果描述及分析：</p>"+checkRecord.checkResultDescription+"\n\
                                    </div>\n\
                                    <div class=\"ui horizontal segments\">\n\
                                        <div class=\"ui segment\">\n\
                                            <p>病人姓名：</p>"+checkRecord.patient.patientName+"\n\
                                        </div>\n\
                                        <div class=\"ui segment\">\n\
                                            <p>病人年龄：</p>"+checkRecord.patient.patientAge+"\n\
                                        </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>婚姻状况：</p></div>"+checkRecord.patient.patientMstatus+"\n\
                                    </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查人：</p>"+checkRecord.staff.staffName+"\n\
                                    </div>\n\
                                </div>";
                        $("#checkRecordList").append(str);

                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败请重试！");
                }
            });

        }

        $('#medicalRecordForm').form({
            fields: {
                IdCard: {
                    identifier: 'IdCard',
                    rules: [
                        {
                            type: 'regExp[^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X)$]',
                            prompt: '请输入正确格式的身份证号'
                        }
                    ]
                },
                symptom: {
                    identifier: 'symptom',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入病人描述症状'
                        }
                    ]
                },
                diagnosticDescription: {
                    identifier: 'diagnosticDescription',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入诊断描述'
                        }
                    ]
                }
            }
        });

    </script>
</html>
