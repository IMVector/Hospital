<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>检查项目管理</title>
        <script src="resources/js/cropper.js"></script><!-- Cropper.js is required -->
        <link  href="resources/css/cropper.css" rel="stylesheet">
        <script src="resources/js/jquery-cropper.js"></script>

        <style>
            .hidden-block{
                display: none;
            }
        </style>
    </head>

    <body>
        <%--<jsp:include page="adminHeaderIndex.jsp" />--%>
        <jsp:include page="manageStaffHeaderTemplete.jsp"/>

        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    检查项目管理
                </div>
                <table>
                    <tr>

                        <td>
                            <div class="ui input focus">
                                <input id="checkItemName" placeholder="检查项目名称" type="text">
                            </div>
                        </td>
                        <td> 
                            <button id="getByName" class="ui basic fluid button blue">查询指定检查项目信息</button>
                        </td>
                        <td>
                            <button id="getAllBtn" class="ui basic fluid button blue">查询所有检查项目信息</button>
                        </td>
                        <td>
                            <button id="add" class="ui basic fluid button blue">添加检查项目</button>
                        </td>
                        <!--                        <td>
                                                    <a href="javascript:window.open('staff/goToManageStaff')"class="ui basic button blue">管理员工</a>
                                                </td>-->
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="checkItemTable" class="ui table blue" >
                    </table>
                </div>

                <div>
                    <button id="selectAll" class="ui button blue">全选</button>
                    <button id="updateAll" class="ui button blue">全部更新</button>
                    <button id="deleteAll" class="ui button blue">全部删除</button>
                </div>     
                <br>

                <div>
                    <div id="pageText"></div>
                    <div id="PageButtons" class="ui basic buttons">

                    </div>
                    <label for="pageSelecter" class="ui big label">跳转到：</label>
                    <!--发送ajax请求-->
                    <select id="pageSelecter" class="ui dropdown">
                        <option value="">页码</option>

                        <!--<option value="1">1</option>-->
                    </select>

                </div>


            </div>

            <div id="modeltest" class="ui inverted modal ">
                <div class="header">添加检查项目信息</div>
                <div class="content">
                    <div class="ui header blue segment">检查项目信息</div>
                    <form id="myForm" class="ui form">
                        <div class="field">
                            <label>检查项目名称：</label>
                            <div class="ui input ">
                                <input name="checkItemName" placeholder="请输入检查项目名称" type="text">
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label>检查项目说明：</label>
                            <div class="ui input ">
                                <textarea name="checkItemDescription" placeholder="请输入检查项目说明" type="text"></textarea>
                            </div>
                        </div>

                        <div class="field">
                            <label>检查项目价格</label>
                            <div class="ui input">
                                <input type="text" name="checkItemPrice" placeholder="请输入检查项目价格">
                            </div>
                        </div>
                        <button id="resetButton" type="reset" style="display:none;"></button> 
                    </form>
                    <br>
                </div>
                <div class="actions">
                    <div class="ui black deny button">放弃</div>
                    <div class="ui positive button">上传信息</div>
                </div>
            </div>
            <jsp:include page="warningModel.jsp"/>
        </div>
        <!-- /container -->
        <%--<jsp:include page="footerTemplete.jsp" />--%>

        <!--</div>style="display: none"-->
        <form id="imageForm" style="display:none" enctype="multipart/form-data">
            <div> 
                <input id="inputImage"  type="file" name="input-image" accept="image/*"> 
            </div> 
        </form>

    </body>
    <script>

        $('select.dropdown').dropdown();

        $(document).ready(function () {

            $("#getByName").on("click", function () {
                var name = $("#checkItemName").val();
                var url = "staff/getCheckItemByName/" + name;
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, checkItemTableInfo, function () {
                    return 1;
                });
            });

            $("#getAllBtn").click(function () {
                var url = 'staff/checkItemList/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, checkItemTableInfo, getMedicationItemNumber);
            });

            $("#pageSelecter").on("change", function () {
                var url = 'staff/checkItemList/page_key_word';
                goToThPage("PageButtons", "pageText", "pageSelecter", url, checkItemTableInfo, getMedicationItemNumber);
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
                            var id, name, description;
                            $(this).closest("tr").find(".myInput").each(function (index, element) {
                                //在这里发送ajax请求    
                                switch (index) {
                                    case 0:
                                        id = $(this).val();
                                        break;
                                    case 1:
                                        name = $(this).val();
                                        break;
                                    case 2:
                                        description = $(this).val();
                                        break;
                                }
                            });
                            $.ajax({
                                url: "staff/updateCheckItem",
                                type: 'POST',
                                data: {"checkItemId": id, "checkItemName": name, "checkItemDescription": description},
                                success: function (data, textStatus, jqXHR) {
                                    if (data) {
                                        $("#" + id).find(".mylabel").each(function (index, element) {
                                            switch (index) {
                                                case 0:
                                                    $(this).html(id);
                                                    break;
                                                case 1:
                                                    $(this).html(name);
                                                    break;
                                                case 2:
                                                    $(this).html(description);
                                                    break;
                                            }
                                        });
                                        toastSuccess("更新成功");
                                    } else {
                                        toastError("更新失败");
                                    }
                                }, error: function (jqXHR, textStatus, errorThrown) {
                                    toastError("请求失败");

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
                $('#modeltest').modal({
                    inverted: true,
                    closable: false,
                    onDeny: function () {
                        $('#resetButton').click();
                        return true;
                    },
                    onApprove: function () {
                        if ($(".ui.form").form('validate form')) {
                            $.ajax({
                                url: 'staff/addCheckItem',
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
                                    toastError("请求失败" + error);
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
                    var id, name, description;
                    $(this).closest("tr").find(".myInput").each(function (index, element) {
                        //在这里发送ajax请求    
                        switch (index) {
                            case 0:
                                id = $(this).val();
                                break;
                            case 1:
                                name = $(this).val();
                                break;
                            case 2:
                                description = $(this).val();
                                break;

                        }
                    });
                    $.ajax({
                        url: "staff/updateCheckItem",
                        type: 'POST',
                        data: {"checkItemId": id, "checkItemName": name, "checkItemDescription": description},
                        success: function (data, textStatus, jqXHR) {
                            if (data) {
                                $("#" + id).find(".mylabel").each(function (index, element) {
                                    switch (index) {
                                        case 0:
                                            $(this).html(id);
                                            break;
                                        case 1:
                                            $(this).html(name);
                                            break;
                                        case 2:
                                            $(this).html(description);
                                            break;
                                    }
                                });
                                toastSuccess('更新成功');
                            } else {
                                toastError("更新失败");
                            }
                        }, error: function (jqXHR, textStatus, errorThrown) {
                            toastError("请求失败" + errorThrown);
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
                    url: "staff/deleteCheckItem/" + id,
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
                        toastError("请求失败");
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

        //ajax回调函数，显示检查项目信息
        function checkItemTableInfo(data) {
            $("#checkItemTable").empty();
            $("#checkItemTable").append("<thead><tr><th>选择</th><th>编号</th><th>检查项目名称</th><th>检查项目描述</th><th>检查项目价格</th><th style='padding-left: 10%;width:100px' colspan='2'>操作</th></tr></thead>");
            $.each(data, function (index, checkItem) {
                var str = " \n\
                <tr id=" + checkItem.checkItemId + ">\n\
                    <td style='width:100px;'>\n\
                        <div class='ui toggle checkbox'>\n\
                            <input name='public' type='checkbox'>\n\
                            <label></label>\n\
                        </div>\n\
                    </td>\n\
                    <td style='width: 100px;'>\n\
                        <label class='mylabel table-label' >" + checkItem.checkItemId + "</label>\n\
                        <div class='nonevisiual' >\n\
                            <input value=" + checkItem.checkItemId + " class='myInput' style='width: 50%;' readonly type='text'>\n\
                        </div>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + checkItem.checkItemName + "' data-position='top left'>" + checkItem.checkItemName + "</label>\n\
                        <div class='nonevisiual'>\n\
                            <input value=" + checkItem.checkItemName + " class='myInput'  style='width: 80%;' type='text'>\n\
                        </div>\n\
                    </td>\n\
                    <td  style='max-width: 300px;'>\n\
                        <label class='mylabel table-label' data-content='" + checkItem.checkItemDescription + "' data-position='top left'>" + checkItem.checkItemDescription + "</label>\n\
                        <div class='nonevisiual'>\n\
                            <input value=" + checkItem.checkItemDescription + " class='myInput'  style='width: 80%;' type='text'>\n\
                        </div>\n\
                    </td>\n\
                    <td  style='width:100px;'>\n\
                        <label class='mylabel table-label' data-content='" + checkItem.checkItemPrice + "元' data-position='top left'>" + checkItem.checkItemPrice + "元</label>\n\
                        <div class='nonevisiual'>\n\
                            <input value=" + checkItem.checkItemPrice + " class='myInput'  style='width: 80%;' type='text'>\n\
                        </div>\n\
                    </td>\n\
                    <td colspan='2' style='width:100px;text-align:center'>\n\
                        <button  class='ui button blue updatebtn' >修改</button>\n\
                        <button class='ui button blue deleteBtn'>删除</button>\n\
                    </td>\n\
                </tr>";


                $("#checkItemTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });
        //获取数据库中的总数量
        function getMedicationItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/checkItemListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！");
                }
            });
            return itemNum;
        }
        //表单验证
        $('.ui.form').form({
            fields: {
                checkItemName: {
                    identifier: 'checkItemName', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入检查项目名称'//提示信息
                        }
                    ]
                },
                checkItemDescription: {
                    identifier: 'checkItemDescription', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入检查项目信息'//提示信息
                        }
                    ]
                },
                checkItemPrice: {
                    identifier: 'checkItemPrice', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入检查项目价格'//提示信息
                        },
                        {
                            type: 'number', //验证类型
                            prompt: '请输入检查项目价格'//提示信息
                        }
                    ]
                }

            }
        });


    </script>
</html>
