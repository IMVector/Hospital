
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
                        <button type="button" id="medicalRecordSearch" class="ui primary button">查询病史</button>
                        <br>
                        <br>
                        <div class="container-admin-inner">
                            <table id="medicalRecordTable" class="ui blue table">
                            </table>
                        </div>


                        <div>
                            <p id="pageText"></p>
                            <div id="medicalRecordPageButtons" class="mini ui basic buttons">

                            </div>
                            <br>
                            <br>
                            <div>
                                <label for="" class="ui big label" style="float: left">跳转到：</label>
                                <!--发送ajax请求-->
                                <select id="pageSelecter" class="ui dropdown" style="width: 20%;float: left">
                                    <option value="">页码</option>      
                                    <!--<option value="1">1</option>-->
                                </select>
                                <div  style="clear:both"></div>  
                            </div>
                        </div>

                    </div>
                </div>
                <br>
                <div class="required field">
                    <label>诊断</label>
                    <textarea name="diagnosticDescription" placeholder="请输入诊断描述"></textarea>
                </div>

                <div class="required field">
                    <label>处方</label>
                    <div class="ui fluid multiple search normal selection dropdown">
                        <input type="hidden" name="prescriptionContent">
                        <i class="dropdown icon"></i>
                        <div class="default text">选择药品</div>
                        <div id="prescriptionOptions" class="menu">
                        </div>
                    </div>
                </div>
                <div class="ui styled fluid accordion">
                    <div class="title">
                        <i class="dropdown icon"></i>
                        用药历史
                    </div>
                    <div class="content">
                        <button  type="button" id="medicalHistorySearch" class="ui primary button">查询用药史</button>
                        <button  type="button" id="medicalHistoryAdd" class="ui primary button">添加用药史</button>
                        <br>
                        <br>
                        <div class="container-admin-inner">
                            <table id="medicalHistoryTable" class="ui blue table">
                            </table>
                        </div>

                        <div>
                            <p id="medicalHistoryPageText"></p>
                            <div id="medicalHistoryPageButtons" class="mini ui basic buttons">
                            </div>
                            <br>
                            <br>
                            <div>
                                <label for="" class="ui big label" style="float: left">跳转到：</label>
                                <!--发送ajax请求-->
                                <select id="medicalHistoryPageSelecter" class="ui dropdown" style="width: 20%;float: left">
                                    <option value="">页码</option>      
                                    <!--<option value="1">1</option>-->
                                </select>
                                <div  style="clear:both"></div>  
                            </div>
                        </div>

                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        <!--What is a dog?-->
                        药库信息
                    </div>
                    <div class="content">

                        <table>
                            <tr>
                                <td>
                                    <div class="ui input focus">
                                        <input id="medicalName" placeholder="药品名称" type="text">
                                    </div>
                                </td>
                                <td> 
                                    <button type="button" id="getByMedicineName" class="ui button blue">根据名字查询</button>
                                </td>

                                <td>
                                    <input id="medicineDescription" type="text" placeholder="药品功效">
                                </td>
                                <td>
                                    <button type="button" id="getMedicineByDescription" class="ui button blue">根据功效查询</button>
                                </td>
                                <td>
                                    <button type="button" id="getAllMedicineBtn" class="ui button blue">查询所有药品</button>
                                </td>
                            </tr>
                        </table>
                        <div class="container-admin-inner">
                            <table id="medicineTable" class="ui table blue">
                            </table>
                        </div>
                        <div>
                            <p id="medicineTablePageText"></p>
                            <div id="medicineTablePageButtons" class="mini ui basic buttons">

                            </div>
                            <br>
                            <br>
                            <div>
                                <!--<div>-->
                                <label for="" class="ui big label" style="float: left">跳转到：</label>
                                <!--发送ajax请求-->
                                <select id="medicineTablePageSelecter" class="ui dropdown" style="width: 20%;float: left">
                                    <option value="">页码</option>
                                    <!--<option value="1">1</option>-->
                                </select>
                                <div  style="clear:both"></div>  
                            </div>

                        </div>
                    </div>

                </div>
                <br>
                <div class="field">
                    <label>注意事项</label>
                    <div class="ui fluid action input">
                        <textarea name="prescriptionPrecautions" placeholder="请输入注意事项"></textarea>
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
                    <!--                    <div class="ui green ok inverted button">
                                            <i class="checkmark icon"></i>
                                            新增用户
                                        </div>-->
                </div>
            </div>
            <input type="text" style="display: none" id="patientId">
            <div id="modelTest" class="ui inverted modal ">
                <div class="header">用药历史</div>
                <div class="content">
                    <div class="ui header blue segment">用药历史</div>
                    <form id="myForm" class="ui form">
                        <input id="patientId_" type="text" name="patient.patientId" style="display: none" >
                        <div class="field">
                            <label for="">药物名称：</label>
                            <div class="ui input ">
                                <div class="ui fluid search selection dropdown">
                                    <input type="hidden" name="medicine.medicineId">
                                    <div class="default text">选择药品 </div>
                                    <i class="dropdown icon"></i>
                                    <div id="medicineOptions" class="menu">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="field">
                            <label for="">不良反应：</label>
                            <div class="ui input ">
                                <input id="adverseReactions" name="adverseReactions" placeholder="请输入不良反应（若没有请填无）" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">用药时长：</label>
                            <div class="ui input ">
                                <input id="duration" name="duration" placeholder="请输入用药时长（天）" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">上次用药时间：</label>
                            <div class="ui input ">
                                <input id="lastTime" name="lastTime" type="date" placeholder="请输入上次用药时间" type="text">
                            </div>
                        </div>
                        <button type="button" id="resetButton" type="reset" style="display:none;"></button> 
                    </form>
                </div>
                <div class="actions">
                    <div class="ui black deny button">放弃</div>
                    <div class="ui positive button">上传信息</div>
                </div>

            </div>
        </div>
    </body>
    <!--window.clearInterval(clock);-->
    <script>
        getMedicineOptions();
        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });
        //accordion使用配置
        $('.ui.styled.accordion').accordion({
            selector: {
                trigger: '.title'
            }
        });
        $('.ui.fluid.search.selection.dropdown').dropdown({
            clearable: true,
            fullTextSearch: true
        });
        var clock = null;
        window.onbeforeunload = function (event) {
            return "是否清除已填写并未提交数据？";
        };
//        window.addEventListener("beforeunload", function (event) {
//            alert("是否清除已填写并未提交数据？");
//            console.log("是否清除已填写并未提交数据？");
//        });
/////////////////////////////////////////////////task///////////////////////////////////////
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
        function getLastTaskByPatientIdCard() {
            var IdCard = $("#IdCard").val();
            if (IdCard !== "") {
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
                            $('.ui.indicating.progress').progress('increment', 100);
                            getTodayMedicalRecord();
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败！请重试！");
                    }
                });
            } else {
                toastError("请输入病人身份证号码");
            }

        }
/////////////////////////////////////////////checkItem//////////////////////////////////
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

//        $(document).on("click", ".ui.indicating.progress", function () {
//            $('.ui.indicating.progress').progress('increment', 30);
//        });

        /**
         * 验证病人是否有账号
         */
        $("#IdCard").change(function () {
            $.ajax({
                url: "patient/ isIdCardexist/" + $(this).val(),
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    if (data.patientId === undefined) {
                        $('.ui.basic.modal').modal('show');
                    } else {
                        $("#patientId").val(data.patientId);
                        $("#patientId_").val(data.patientId);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败");
                }
            });
        });
///////////////////////////////////////////////medicaiRecordAdd////////////////////////
        $("#medicalRecordBtn").click(function () {
            $('#medicalRecordForm').form('validate form');
            if ($('#medicalRecordForm').form('is valid')) {
                $.ajax({
                    url: "staff/addMedicalRecord",
                    type: 'POST',
                    data: $("#medicalRecordForm").serialize(),
                    success: function (data, textStatus, jqXHR) {
                        if (data === false) {
                            $('.ui.basic.modal').modal('show');
                        } else {
                            toastSuccess("病历信息提交成功！");
                            window.open("staff/goToStaffIndex", "_self");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败");
                    }
                });
            } else {
                toastError("请将字段填写完整！");
            }

        });
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
                                        <p>检查影像或检查报告文件</p><a href='" + checkRecord.resultFile + "'>文件</a>\n\
                                    </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查结果描述及分析：</p>" + checkRecord.checkResultDescription + "\n\
                                    </div>\n\
                                    <div class=\"ui horizontal segments\">\n\
                                        <div class=\"ui segment\">\n\
                                            <p>病人姓名：</p>" + checkRecord.patient.patientName + "\n\
                                        </div>\n\
                                        <div class=\"ui segment\">\n\
                                            <p>病人年龄：</p>" + checkRecord.patient.patientAge + "\n\
                                        </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>婚姻状况：</p>" + checkRecord.patient.patientMstatus + "\n\
                                    </div>\n\
                                    <div class=\"ui segment\">\n\
                                        <p>检查人：</p>" + checkRecord.staff.staffName + "\n\
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

        $("#medicalRecordSearch").click(function () {
            var url = 'staff/getMedicalRecordByIdCard/' + $("#IdCard").val() + '/page_key_word';
            fillForm("medicalRecordPageButtons", "pageText", "pageSelecter", currentPage = 1, url, medicalRecordTableInfo, getMedicalRecordItemNumber);
        });
        /**
         * 查询过往病史
         * @param {type} data
         * @returns {undefined}
         */
        function medicalRecordTableInfo(data) {
            $("#medicalRecordTable").empty();
            $("#medicalRecordTable").append("<thead><tr> <th>病例编号</th><th>病人姓名</th><th>病例日期</th><th>发病症状</th><th>诊查结果</th><th>查看详情</th></tr></thead>");
            $.each(data, function (index, medicalRecord) {
                var str = "<tr id=" + medicalRecord.medicalRecordId + ">\n\
                    <td>" + medicalRecord.medicalRecordId + "</td>\n\
                    <td style='width:100px;'>" + medicalRecord.patient.patientName + "</td>\n\
                    <td style='width:100px;'><label class=\"mylabel\" data-content=\"" + formatDatebox(medicalRecord.date) + "\" data-position=\"top left\">" + formatDatebox(medicalRecord.date) + "</label></td>\n\
                    <td style='max-width:280px;'><label class=\"mylabel\" data-content=\"" + medicalRecord.symptom + "\" data-position=\"top left\">" + medicalRecord.symptom + "</label></td>\n\
                    <td style='max-width:280px;'><label class=\"mylabel\" data-content=\"" + medicalRecord.diagnosticDescription + "\" data-position=\"top left\">" + medicalRecord.diagnosticDescription + "</label></td>\n\
                    </tr>";
                $("#medicalRecordTable").append(str);
            });
        }
        /**
         * 查询数据库中当前病人的所有病例数量 这是一个同步请求
         * @returns {data|Number} 返回病例数量
         */
        function getMedicalRecordItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/getMedicalRecordByIdCardItemNum",
                type: 'POST',
                async: false,
                data: {"IdCard": $("#IdCard").val()},
                success: function (data, textStatus, jqXHR) {
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
            return itemNum;
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
        /////////////////////////////////////////////////medicine///////////////////////////////////////

        var flag = false;
        $("#getByMedicineName").on("click", function () {
            flag = false;
            var name = $("#medicalName").val();
            var url = "staff/getMedicineByName/" + name;
            fillForm("medicineTablePageButtons", "medicineTablePageText", "medicineTablePageSelecter", currentPage = 1, url, medicineTableInfo, getMedicineByNameItemNumber);
        });
        $("#getAllMedicineBtn").click(function () {
            var url = 'staff/medicineList/page_key_word';
            fillForm("medicineTablePageButtons", "medicineTablePageText", "medicineTablePageSelecter", currentPage = 1, url, medicineTableInfo, getMedicineItemNumber);
        });
        $("#getMedicineByDescription").click(function () {
            flag = true;
            var url = 'staff/medicineList/' + $("#medicineDescription").val() + '/page_key_word';
            fillForm("medicineTablePageButtons", "medicineTablePageText", "medicineTablePageSelecter", currentPage = 1, url, medicineTableInfo, getMedicineItemNumber);
        });
        $("#medicineTablePageSelecter").on("change", function () {
            if (flag) {
                var url = 'staff/medicineList/' + $("#medicineDescription").val() + '/page_key_word';
                fillForm("medicineTablePageButtons", "medicineTablePageText", "medicineTablePageSelecter", currentPage = 1, url, medicineTableInfo, getMedicineItemNumber);
            } else {
                var url = 'staff/medicineList/page_key_word';
                goToThPage("medicineTablePageButtons", "medicineTablePageText", "medicineTablePageSelecter", url, medicineTableInfo, getMedicineItemNumber);
            }

        });
        function medicineTableInfo(data) {
            $("#medicineTable").empty();
            $("#medicineTable").append("<thead><tr><th>名称</th><th>适用症</th><th>说明</th><th>价格</th><th>生产日期</th><th>有效期</th><th>库存</th></tr></thead>");
            $.each(data, function (index, metication) {
                var str = " <tr id=" + metication.medicineId + ">\n\
                                <td style=\"width:150px\">\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + metication.medicineName + "\" data-position=\"top left\"  >" + metication.medicineName + "</label>\n\</td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + metication.medicineDescription + "\" data-position=\"top left\" >" + metication.medicineDescription + "</label></td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + metication.medicineInstructions + "\" data-position=\"top left\"   >" + metication.medicineInstructions + "</label></td>\n\
                                <td style=\"width:100px\">\n\
                                    <label class=\"mylabel table-label\" >" + metication.medicinePrice + "元</label></td>\n\
                                <td style=\"width:100px\">\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + formatDatebox(metication.productionDate) + "\" data-position=\"top left\">" + formatDatebox(metication.productionDate) + "</label><div class=\"nonevisiual\"></div></td>\n\
                                <td style=\"width:100px\">\n\
                                    <label class=\"mylabel table-label\" >" + metication.validityPeriod + "</label></td>\n\
                                <td style=\"width:100px\"><label class=\"mylabel table-label\" >" + metication.medicineNumber + "</label></td>";
                $("#medicineTable").append(str);
            });
        }

        function getMedicineItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/medicineListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });
            return itemNum;
        }
        function getMedicineByNameItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/getMedicineByNameItemNumber/" + $("#medicalName").val(),
                type: 'POST',
                async: false,
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });
            return itemNum;
        }
///////////////////////////////////////////////////用药历史///////////////////////////////////////

        $("#medicalHistorySearch").click(function () {
            var url = 'staff/medicalHistoryList/' + $("#patientId").val() + '/page_key_word';
            fillForm("medicalHistoryPageButtons", "medicalHistoryPageText", "medicalHistoryPageSelecter", currentPage = 1, url, medicalHistoryTableInfo, getMedicalHistoryItemNumber);
        });
        $("#medicalHistoryTablePageSelecter").on("change", function () {
            var url = 'staff/medicalHistoryList/' + $("#patientId").val() + '/page_key_word';
            goToThPage("medicalHistoryPageButtons", "medicalHistoryPageText", "medicalHistoryPageSelecter", url, medicalHistoryTableInfo, getMedicalHistoryItemNumber);
        });
        function medicalHistoryTableInfo(data) {
            $("#medicalHistoryTable").empty();
            $("#medicalHistoryTable").append("<thead><tr><th>药品名称</th><th>不良反应</th><th>用药时长</th><th>最后一次用药时间</th></tr></thead>");
            $.each(data, function (index, medicationHistory) {
                var str = " <tr id=" + medicationHistory.medicationHistoryId + ">\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + medicationHistory.medicine.medicineName + "\" data-position=\"top left\"  >" + medicationHistory.medicine.medicineName + "</label>\n\</td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + medicationHistory.adverseReactions + "\" data-position=\"top left\" >" + medicationHistory.adverseReactions + "</label></td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + medicationHistory.duration + "\" data-position=\"top left\"   >" + medicationHistory.duration + "</label></td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + formatDatebox(medicationHistory.lastTime) + "\" data-position=\"top left\">" + formatDatebox(medicationHistory.lastTime) + "</label><div class=\"nonevisiual\"></div></td>";
                $("#medicalHistoryTable").append(str);
            });
        }

        function getMedicalHistoryItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/medicalHistoryListItemNum/" + $("#patientId").val(),
                type: 'POST',
                async: false,
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });
            return itemNum;
        }
///////////////////////////////////////////////////////////////////////////////////////
        $(document).on("click", "#medicalHistoryAdd", function () {
            $("#modelTest").modal({
                inverted: true,
                closable: false,
                onDeny: function () {
                    $('#resetButton').click();
                    return true;
                },
                onApprove: function () {
                    if ($("#myForm").form('validate form')) {
                        $.ajax({
                            url: 'staff/addMedicationHistory',
                            type: 'POST',
                            async: false,
                            data: $("#myForm").serialize(), //将表单的数据编码成一个字符串提交给服务器
                            success: function (data) {
                                if (data) {
                                    toastSuccess("添加成功");
                                    $('#resetButton').click();
                                    $('.ui.modal').modal('hide');
                                } else {
                                    toastError("添加失败");
                                }
                            },
                            error: function (req, status, error) {
                                toastError("请求失败,请重试！" + error);
                            }
                        });
                    } else {
                        return false;
                    }
                }
            }).modal("show");
        });
        function getMedicineOptions() {
            $.ajax({
                url: "staff/getMedicineOptions",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $("#medicineOptions").empty();
                    $("#prescriptionOptions").empty();
                    $.each(data, function (index, medicine) {
                        var str = "<div class=\"item\" data-value=\"" + medicine.medicineId + "\">" + medicine.medicineName + "</div>";
                        $("#medicineOptions").append(str);
                        $("#prescriptionOptions").append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败!请重试!");
                }

            });
        }
    </script>
</html>
