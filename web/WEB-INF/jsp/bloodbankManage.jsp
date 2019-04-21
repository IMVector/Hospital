<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #bloodbankTable th{
                text-align: center;
            }
            #bloodbankTable td{
                text-align: center;
            }
        </style>
    </head>

    <body>
        <jsp:include page="manageStaffHeaderTemplete.jsp"/>

        <div class="ui container">
            <div class="ui segment container-admin-outer">
                <div class="ui header blue segment">
                    血库信息管理
                </div>
                <table>
                    <tr>
                        <td>
                            <div class="ui input focus">
                                <div class="ui selection dropdown">
                                    <input id="bloodType" type="hidden" name="bloodType">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">血型</div>
                                    <div class="menu">
                                        <div class="item" data-value="A型">A型</div>
                                        <div class="item" data-value="B型">B型</div>
                                        <div class="item" data-value="O型">O型</div>
                                        <div class="item" data-value="AB型">AB型</div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td> 
                            <button id="getByBloodType" class="ui basic button blue">查询该血型库存</button>
                        </td>
                        <td>
                            <button id="getAllBtn" class="ui basic button blue">查询所有库存</button>
                        </td>
                        <td>
                            <button id="add" class="ui basic button blue">添加捐献信息</button>
                        </td>
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="bloodbankTable" class="ui table blue">
                    </table>
                </div>
                <div>
                    <button id="selectAll" class="ui button blue">全选</button>
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
                <div class="header">添加捐献信息</div>
                <div class="content">
                    <div class="ui header blue segment">捐赠信息</div>
                    <form id="myForm" class="ui form">
                        <div class="field">
                            <label for="">捐赠人姓名：</label>
                            <div class="ui input ">
                                <input id="donorName" name="donorName" placeholder="请输入捐赠人姓名" type="text">
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">血型：</label>
                            <div class="ui selection dropdown">
                                <input type="hidden" name="donorBloodType">
                                <i class="dropdown icon"></i>
                                <div class="default text">血型</div>
                                <div class="menu">
                                    <div class="item" data-value="A型">A型</div>
                                    <div class="item" data-value="B型">B型</div>
                                    <div class="item" data-value="O型">O型</div>
                                    <div class="item" data-value="AB型">AB型</div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">捐献人性别：</label>
                            <div class="ui selection dropdown">
                                <input type="hidden" name="donorGender">
                                <i class="dropdown icon"></i>
                                <div class="default text">捐献人性别</div>
                                <div class="menu">
                                    <div class="item" data-value="男">男</div>
                                    <div class="item" data-value="女">女</div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">捐献人地址：</label>
                            <div class="ui input ">
                                <input id="donorAddress" name="donorAddress" placeholder="请输入捐献人地址" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">捐献人手机号：</label>
                            <div class="ui input ">
                                <input id="donorPhone" name="donorPhone" placeholder="请输入捐献人手机号" type="text">
                            </div>
                        </div>
                        <br/>
                        <input id="isInBank" name="isInBank" style="display:none" type="text" value="是">
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

        $('.ui.selection.dropdown').dropdown();

        var flag = false;

        $(document).ready(function () {

            $("#getByBloodType").on("click", function () {
                flag = true;
                var bloodType = $("#bloodType").val();
                var url = "staff/getListByBloodType/" + bloodType + "/page_key_word";
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, bloodbankTableInfo, getbloodTypeItemNumber);
            });

            $("#getAllBtn").click(function () {
                flag = false;
                var url = 'staff/bloodbankList/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, bloodbankTableInfo, getBloodbankListItemNumber);
            });

            $("#pageSelecter").on("change", function () {
                if (flag === true) {
                    var bloodType = $("#bloodType").val();
                    var url = "staff/getListByBloodType/" + bloodType + "/page_key_word";
                    fillForm("PageButtons", "pageText", "pageSelecter", url, bloodbankTableInfo, getbloodTypeItemNumber);
                } else {
                    var url = 'staff/bloodbankList/page_key_word';
                    goToThPage("PageButtons", "pageText", "pageSelecter", url, bloodbankTableInfo, getBloodbankListItemNumber);
                }

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
                                        url: 'staff/addBloodbank',
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
                    url: "staff/deleteBloodbankItem/" + id,
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



        function bloodbankTableInfo(data) {
            $("#bloodbankTable").empty();
            $("#bloodbankTable").append("<thead><tr><th>选择</th><th>捐赠人姓名</th><th>血型</th><th>捐献人性别</th><th>捐献人地址</th><th>捐献人手机号</th><th>是否在库</th><th>操作</th></tr></thead>");
            $.each(data, function (index, bloodbankItem) {
                var str = " <tr id=" + bloodbankItem.recordId + ">\n\
                                <td>\n\
                                    <div class=\"ui toggle checkbox\"><input name=\"public\" type=\"checkbox\"><label></label></div>\n\
                                </td>\n\
                                <td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + bloodbankItem.donorName + "\" data-position=\"top left\"  >" + bloodbankItem.donorName + "</label>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + bloodbankItem.donorBloodType + "\" data-position=\"top left\" >" + bloodbankItem.donorBloodType + "</label>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + bloodbankItem.donorGender + "\" data-position=\"top left\">" + bloodbankItem.donorGender + "</label>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + bloodbankItem.donorAddress + "\" data-position=\"top left\">" + bloodbankItem.donorAddress + "</label>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + bloodbankItem.donorPhone + "\" data-position=\"top left\">" + bloodbankItem.donorPhone + "</label>\n\
                                </td>\n\
                                <td>\n\
                                        <label class=\"mylabel table-label\" >" + bloodbankItem.isInBank + "</label><div class=\"nonevisiual\"><input value=" + bloodbankItem.isInBank + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div>\n\
                                </td>\n\
                                <td style='width:150px'>\n\
                                        <button class=\"ui mini button blue deleteBtn\">删除</button>\n\
                                </td>\n\
                            </tr>";


                $("#bloodbankTable").append(str);
            });
        }


        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });


        function getBloodbankListItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/bloodbankListItemNumber",
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
        function getbloodTypeItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/getListByBloodTypeItemNumber/" + $("#bloodType").val(),
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
                donorName: {
                    identifier: 'donorName', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入捐赠人姓名'//提示信息
                        }
                    ]
                },
                donorBloodType: {
                    identifier: 'donorBloodType',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入血型'
                        }
                    ]
                },
                donorGender: {
                    identifier: 'donorGender',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入捐献人性别'
                        }
                    ]
                },
                donorAddress: {
                    identifier: 'donorAddress',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入捐献人地址'
                        }
                    ]
                },
                donorPhone: {
                    identifier: 'donorPhone',
                    rules: [
                        {
                            type: 'regExp[^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$]',
                            prompt: '请输入正确的手机号'
                        }
                    ]
                }
            }
        });

    </script>

</html>
