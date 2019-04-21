<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #medicineTable th{
                text-align: center;
            }
            #medicineTable td{
                text-align: center;
            }
        </style>
    </head>

    <body>
        <jsp:include page="manageStaffHeaderTemplete.jsp"/>

        <div class="ui container">
            <div class="ui segment container-admin-outer">
                <div class="ui header blue segment">
                    药品信息管理
                </div>
                <table>
                    <tr>
                        <td>
                            <div class="ui input focus">
                                <input id="medicalName" placeholder="药品名称" type="text">
                            </div>
                        </td>
                        <td> 
                            <button id="getByName" class="ui basic button blue">查询指定药品信息</button>
                        </td>
                        <td>
                            <button id="getAllBtn" class="ui basic button blue">查询所有药品信息</button>
                        </td>
                        <td>
                            <button id="add" class="ui basic button blue">添加药品</button>
                        </td>
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="medicineTable" class="ui table blue">
                    </table>
                </div>
                <div>
                    <button id="selectAll" class="ui button blue">全选</button>
                    <button id="updateAll" class="ui button blue">全部更新</button>
                    <button id="deleteAll" class="ui button blue">全部删除</button>
                </div>
                <div>
                    <p id="pageText"></p>
                    <div id="PageButtons" class="mini ui basic buttons">

                    </div>
                    <!--<div>-->
                    <label for="" class="ui label">跳转到：</label>
                    <!--发送ajax请求-->
                    <select id="pageSelecter" class="ui dropdown">
                        <option value="">页码</option>
                        <!--<option value="1">1</option>-->
                    </select>
                </div>

            </div>
            <div id="modeltest" class="ui inverted modal ">
                <div class="header">添加药品</div>
                <div class="content">
                    <div class="ui header blue segment">药品信息</div>
                    <form id="myForm" class="ui form">
                        <div class="field">
                            <label for="">药品名称：</label>
                            <div class="ui input ">
                                <input id="medicineName" name="medicineName" placeholder="请输入药品名称" type="text">
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">药品说明：</label>
                            <div class="ui input ">
                                <textarea id="medicineInstructions" name="medicineInstructions" placeholder="请输入药品说明" type="text"></textarea>
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">药品功效：</label>
                            <div class="ui input ">
                                <textarea id="medicineDescription"  name="medicineDescription" placeholder="请输入药品功效" type="text"></textarea>
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">药品价格：</label>
                            <div class="ui input ">
                                <input id="price" name="medicinePrice" placeholder="请输入单位药品价格" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">药品数量：</label>
                            <div class="ui input ">
                                <input id="medicineNumber" name="medicineNumber" placeholder="请输入药品数量" type="text">
                            </div>
                        </div>

                        <br/>
                        <div class="field">
                            <label for="">有效期：</label>
                            <div class="ui input ">
                                <input id="validityPeriod" name="validityPeriod" placeholder="请输入有效期时长" type="text">
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">生产日期：</label>
                            <div class="ui input ">
                                <input id="productionDate" name="productionDate" placeholder="请输入生产日期" type="date">
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label id="result" class="ui header blue"></label>
                        </div>
                        <button type="reset" id="resetButton" style="display: none"></button>
                    </form>
                    <!--</div>-->
                </div>
                <div class="actions">
                    <div class="ui black deny button">放弃</div>
                    <div class="ui positive button">提交信息</div>
                </div>
            </div>
            <jsp:include page="warningModel.jsp"/>
        </div>
    </body>

    <script>


        var nameFlag = false;
        $(document).ready(function () {

            $("#getByName").on("click", function () {
                nameFlag = true;
                var name = $("#medicalName").val();
                var url = "staff/getMedicineByName/" + name;
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, medicineTableInfo, getMedicineByNameItemNumber);
            });

            $("#getAllBtn").click(function () {
                nameFlag = false;
                var url = 'staff/medicineList/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, medicineTableInfo, getMedicineItemNumber);
            });

            $("#pageSelecter").on("change", function () {
                if (flag) {
                    var name = $("#medicalName").val();
                    var url = "staff/getMedicineByName/" + name;
                    fillForm("PageButtons", "pageText", "pageSelecter", url, medicineTableInfo, getMedicineByNameItemNumber);
                } else {
                    var url = 'staff/medicineList/page_key_word';
                    goToThPage("PageButtons", "pageText", "pageSelecter", url, medicineTableInfo, getMedicineItemNumber);
                }

            });
            //全部更新
            $("#updateAll").on("click", function () {
                if ($(this).text() === "全部更新") {
                    $(this).text("全部保存");
                } else {
                    $(this).text("全部更新");

                    //发送ajax请求更新全部选中
                    $(".ui.toggle.checkbox").each(function (index, element) {
                        if ($(this).checkbox("is checked")) {
                            var id, name, instructions, description, price, productionDate, validatePeriod, number;
                            id = $(this).closest("tr").attr("id");
                            $(this).closest("tr").find(".myInput").each(function (index, element) {
                                //1、药品名称
                                //2、适用症状
                                //3、说明
                                //4、价格
                                //5、生产日期
                                //6、有效期
                                //在这里发送ajax请求    
                                switch (index) {
                                    case 0:
                                        name = $(this).val();
                                        break;
                                    case 1:
                                        description = $(this).val();
                                        break;
                                    case 2:
                                        instructions = $(this).val();
                                        break;
                                    case 3:
                                        price = $(this).val();
                                        break;
                                    case 4:
                                        productionDate = $(this).val();
                                        break;
                                    case 5:
                                        validatePeriod = $(this).val();
                                        break;
                                    case 6:
                                        number = $(this).val();
                                        break;
                                }
                            });
                            $.ajax({
                                url: "staff/updateMedicine",
                                type: 'POST',
                                data: {"medicineId": id, "medicineName": name, "medicineInstructions": instructions, "medicineDescription": description, "productionDate": productionDate, "validityPeriod": validatePeriod, "medicinePrice": price, "medicineNumber": number},
                                success: function (data, textStatus, jqXHR) {
                                    if (data) {
                                        $("#" + id).find(".mylabel").each(function (index, element) {
                                            switch (index) {
                                                case 0:
                                                    $(this).html(name);
                                                    break;
                                                case 1:
                                                    $(this).html(instructions);
                                                    break;
                                                case 2:
                                                    $(this).html(description);
                                                    break;
                                                case 3:
                                                    $(this).html(price);
                                                    break;
                                                case 4:
                                                    $(this).html(formatDatebox(productionDate));
                                                    break;
                                                case 5:
                                                    $(this).html(validatePeriod);
                                                    break;
                                                case 6:
                                                    $(this).html(number);
                                                    break;
                                            }
                                        });
                                        toastSuccess("更新成功");
                                    } else {
                                        toastError("更新失败！");
                                    }
                                }, error: function (jqXHR, textStatus, errorThrown) {
                                    toastError("请求失败，请重试！" + errorThrown);
                                }
                            });
                        }

                    });
                    $("#selectAll").click();//关闭checkbox
                }
                $(".ui.toggle.checkbox").each(function (index, element) {
                    if ($(this).checkbox("is checked")) {
                        $(this).closest("tr").find(".nonevisiual").addClass("ui input");
                        $(this).closest("tr").find(".table-label").removeClass("mylabel");
                        $(this).closest("tr").find(".table-label").addClass("nonevisiual");
                    } else {
                        $(this).closest("tr").find(".table-label").removeClass("nonevisiual");
                        $(this).closest("tr").find(".table-label").addClass("mylabel");
                        $(this).closest("tr").find(".nonevisiual").removeClass("ui input");
                    }
                });

            });

            //弹出添加model框
            $("#add").click(function () {
                $('#modeltest')
                        .modal({
                            inverted: true,
                            closable: false,
                            onDeny: function () {
                                $('#resetButton').click();
                                return true;
                            },
                            onApprove: function () {
                                if ($(".ui.form").form('validate form')) {
                                    $.ajax({
                                        url: 'staff/addMedicine',
                                        type: 'POST',
                                        async: false,
                                        data: $("#myForm").serialize(), //将表单的数据编码成一个字符串提交给服务器
                                        success: function (data) {
                                            if (data) {
                                                toastSuccess("添加成功");
                                            } else {
                                                toastError("添加失败");
                                            }

                                        },
                                        error: function (req, status, error) {
                                            toastError("请求失败，请重试！" + error);
                                        }
                                    });
                                } else {
                                    return false;
                                }

                            }
                        }).modal('show');
            });

            //修改一个
            $(document).on('click', '.updatebtn', function () {
                if ($(this).text() === "修改") {
                    $(this).text("保存");

                    var checkBox = $(this).closest("tr").find(".ui.toggle.checkbox");
                    $(this).closest("tr").find(".ui.toggle.checkbox").checkbox("check");
                    if (checkBox.checkbox("is checked")) {
                        //选中
                        $(this).closest("tr").find(".nonevisiual").addClass("ui input");
                        $(this).closest("tr").find(".table-label").removeClass("mylabel");
                        $(this).closest("tr").find(".table-label").addClass("nonevisiual");
                    }

                } else {
                    $(this).text("修改");

                    var checkBox = $(this).closest("tr").find(".ui.toggle.checkbox");
                    $(this).closest("tr").find(".ui.toggle.checkbox").checkbox("uncheck");
                    if (!checkBox.checkbox("is checked")) {
                        //去除选中状态
                        $(this).closest("tr").find(".table-label").removeClass("nonevisiual");
                        $(this).closest("tr").find(".table-label").addClass("mylabel");
                        $(this).closest("tr").find(".nonevisiual").removeClass("ui input");
                    }



                    //发送ajax请求更新当前
                    var id, name, instructions, description, price, productionDate, validatePeriod, number;
                    id = $(this).closest("tr").attr("id");
                    $(this).closest("tr").find(".myInput").each(function (index, element) {
                        //1、药品名称
                        //2、适用症状
                        //3、说明
                        //4、价格
                        //5、生产日期
                        //6、有效期
                        //在这里发送ajax请求    
                        switch (index) {
                            case 0:
                                name = $(this).val();
                                break;
                            case 1:
                                description = $(this).val();
                                break;
                            case 2:
                                instructions = $(this).val();
                                break;
                            case 3:
                                price = $(this).val();
                                break;
                            case 4:
                                productionDate = $(this).val();
                                break;
                            case 5:
                                validatePeriod = $(this).val();
                                break;
                            case 6:
                                number = $(this).val();
                                break;
                        }
                    });
                    $.ajax({
                        url: "staff/updateMedicine",
                        type: 'POST',
                        data: {"medicineId": id, "medicineName": name, "medicineInstructions": instructions, "medicineDescription": description, "productionDate": productionDate, "validityPeriod": validatePeriod, "medicinePrice": price, "medicineNumber": number},
                        success: function (data, textStatus, jqXHR) {
                            if (data) {
                                $("#" + id).find(".mylabel").each(function (index, element) {
                                    switch (index) {
                                        case 0:
                                            $(this).html(name);
                                            break;
                                        case 1:
                                            $(this).html(description);
                                            break;
                                        case 2:
                                            $(this).html(instructions);
                                            break;
                                        case 3:
                                            $(this).html(price);
                                            break;
                                        case 4:
                                            $(this).html(formatDatebox(productionDate));
                                            break;
                                        case 5:
                                            $(this).html(validatePeriod);
                                            break;
                                        case 6:
                                            $(this).html(number);
                                            break;
                                    }
                                });
                                toastSuccess("更新成功");
                            } else {
                                toastError("更新失败");
                            }
                        }, error: function (jqXHR, textStatus, errorThrown) {
                            toastError("请求失败,请重试！" + errorThrown);
                        }
                    });

                }
            });

            //全部选中按钮事件
            $("#selectAll").on("click", function () {
                if ($(this).text() === "全选") {
                    $(this).text("取消全选");
                    $(".ui.toggle.checkbox").each(function () {
                        if (!$(this).checkbox("is checked")) {
                            $(this).checkbox("check");
                        }
                    });

                } else {
                    $(".ui.toggle.checkbox").each(function () {
                        if ($(this).checkbox("is checked")) {
                            $(this).checkbox("uncheck");
                        }
                    });
                    $(this).text("全选");
                }
            });
            //删除一行
            $(document).on('click', ".deleteBtn", function () {
                var id = $(this).closest("tr").attr("id");
                $.ajax({
                    url: "staff/deleteMedicine/" + id,
                    type: 'POST',
                    success: function (data, textStatus, jqXHR) {
                        if (data) {
                            $("#" + id).remove();
                            toastSuccess("删除成功");
                        } else {
                            toastError("删除失败");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败,请重试！" + errorThrown);
                    }
                });

            });

            $("#deleteAll").on("click", function () {
                showWarning("全部删除", "全部删本页选中？", function () {
                    //发送ajax请求删除全部选中
                    $(".ui.toggle.checkbox").each(function (index, element) {
                        if ($(this).checkbox("is checked")) {
                            var id;
                            id = $(this).closest("tr").attr("id");
                            $("#" + id).find(".deleteBtn").click();
                        }
                    });
                });

            });
        });



        function medicineTableInfo(data) {
            $("#medicineTable").empty();
            $("#medicineTable").append("<thead><tr><th>选择</th><th>名称</th><th>适用症</th><th>说明</th><th>价格</th><th>生产日期</th><th>有效期</th><th>剩余数量</th><th>操作</th></tr></thead>");
            $.each(data, function (index, metication) {
                var str = " <tr id=" + metication.medicineId + ">\n\
                                <td>\n\
                                    <div class=\"ui toggle checkbox\"><input name=\"public\" type=\"checkbox\"><label></label></div>\n\
                                </td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + metication.medicineName + "\" data-position=\"top left\"  >" + metication.medicineName + "</label>\n\
                                    <div class=\"nonevisiual\" ><input value=" + metication.medicineName + " class=\"myInput\" style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + metication.medicineDescription + "\" data-position=\"top left\" >" + metication.medicineDescription + "</label>\n\
                                        <div class=\"nonevisiual\" ><input value=" + metication.medicineDescription + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + metication.medicineInstructions + "\" data-position=\"top left\">" + metication.medicineInstructions + "</label>\n\
                                        <div class=\"nonevisiual\"><input value=" + metication.medicineInstructions + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" >" + metication.medicinePrice + "元</label><div class=\"nonevisiual\">\n\
                                        <input value=" + metication.medicinePrice + " class=\"myInput\" style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + formatDatebox(metication.productionDate) + "\" data-position=\"top left\">" + formatDatebox(metication.productionDate) + "</label>\n\
                                        <div class=\"nonevisiual\"><input value=" + formatDatebox(metication.productionDate) + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" >" + metication.validityPeriod + "</label><div class=\"nonevisiual\"><input value=" + metication.validityPeriod + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" >" + metication.medicineNumber + "</label><div class=\"nonevisiual\"><input value=" + metication.medicineNumber + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td style='width:150px'>\n\
                                            <button class=\"ui mini button blue updatebtn\" >修改</button><button class=\"ui mini button blue deleteBtn\">删除</button>\n\
                                </td>\n\
                            </tr>";


                $("#medicineTable").append(str);
            });
        }


        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });


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

        $('.ui.form').form({
            fields: {
                medicineName: {
                    identifier: 'medicineName', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入药品名称'//提示信息
                        }
                    ]
                },
                medicineInstructions: {
                    identifier: 'medicineInstructions',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入药品说明'
                        }
                    ]
                },
                medicineDescription: {
                    identifier: 'medicineDescription',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入药品功效'
                        }
                    ]
                },
                price: {
                    identifier: 'price',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入单位药品价格'
                        },
                        {
                            type: 'number',
                            prompt: '请输入单位药品价格'
                        }
                    ]
                },
                validityPeriod: {
                    identifier: 'validityPeriod',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入有效期时长'
                        }
                    ]
                },
                productionDate: {
                    identifier: 'productionDate',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入生产日期'
                        }
                    ]
                },
                medicineNumber: {
                    identifier: 'medicineNumber',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入数量'
                        },
                        {
                            type: 'number',
                            prompt: '请输入数量'
                        }
                    ]
                }
            }
        });

    </script>

</html>
