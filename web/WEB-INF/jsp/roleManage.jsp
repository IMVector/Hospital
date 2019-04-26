<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>角色管理</title>
    </head>

    <body>
        <jsp:include page="manageStaffHeaderTemplete.jsp"/>

        <div class="ui container">
            <div class="ui segment ">
                <div class="ui header blue segment">
                    角色管理
                </div>

                <table>
                    <tr>
                        <td>
                            <div class="ui input focus">
                                <input id="roleName" placeholder="角色名称" type="text">
                            </div>
                        </td>
                        <td> 
                            <button id="getByName" class="ui basic button blue">查询指定角色信息</button>
                        </td>
                        <td>
                            <button id="getAllBtn" class="ui basic button blue">查询所有角色信息</button>
                        </td>
                        <td>
                            <button id="add" class="ui basic button blue">添加角色</button>
                        </td>
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="roleTable" class="ui table blue">
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
                <div class="header">添加角色</div>
                <div class="content">
                    <div class="ui header blue segment">角色信息</div>
                    <form id="myForm" class="ui form">
                        <div class="field">
                            <label for="">角色名称：</label>
                            <div class="ui input ">
                                <input id="medicationName" name="roleName" placeholder="角色名称" type="text">
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="">角色说明：</label>
                            <div class="ui input ">
                                <textarea id="roleDescription" name="roleDescription" placeholder="请输入角色说明" type="text"></textarea>
                            </div>
                        </div>
<!--                        <div class="field">
                            <label for="">角色负责的检查工作：</label>
                            <div class="ui input ">
                                <select id="checkItemId" name="roleWork" class="ui fluid dropdown"></select>
                            </div>
                        </div>-->
                        <br/>
                        <div class="field">
                            <label id="result" class="ui header blue"></label>
                        </div>
                        <button id="resetButton" type="reset" style="display:none;"></button> 
                    </form>
                    <!--</div>-->
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
    </body>
    <script>


        $(document).ready(function () {

//            requestCheckItmeList("#checkItemId");

            $("#getByName").on("click", function () {
                var name = $("#roleName").val();
                var url = "staff/getRoleByName/" + name;
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, roleTableInfo, getRoleListByNameItemNum);
            });

            $("#getAllBtn").click(function () {
                var url = 'staff/roleList/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, roleTableInfo, getRoleListItemNum);
            });

            $("#pageSelecter").on("change", function () {
                var url = 'staff/roleList/page_key_word';
                goToThPage("PageButtons", "pageText", "pageSelecter", url, roleTableInfo, getRoleListItemNum);
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
                                        id = $(this).val();
                                        break;
                                    case 1:
                                        name = $(this).val();
                                        break;
                                    case 2:
                                        description = $(this).val();
                                }
                            });
                            $.ajax({
                                url: "staff/updateRole",
                                type: 'POST',
                                data: {"roleId": id, "roleName": name, "roleDescription": description},
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
                                    toastError("请求失败,请重试！" + errorThrown);
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
                                        url: 'staff/addRole',
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
                                            toastError("请求失败,请重试！" + errorThrown);
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
                        //1、药品名称
                        //2、适用症状
                        //3、说明
                        //4、价格
                        //5、生产日期
                        //6、有效期
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
                        url: "staff/updateRole",
                        type: 'POST',
                        data: {"roleId": id, "roleName": name, "roleDescription": description},
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
                    url: "staff/deleteRole/" + id,
                    type: 'POST',
                    success: function (data, textStatus, jqXHR) {
                        if (data) {
                            $("#" + id).remove();
                            toastSuccess("删除成功");
                        } else {
                            toastError("删除失败,请重试！");
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


//        //添加成功响应函数
//        function deleteSuccess(data) {
//            if (true == data) {
//                alert("成功")
//
//            } else {
//                alert("失败")
//            }
//        }

        function roleTableInfo(data) {
            $("#roleTable").empty();
            $("#roleTable").append("<thead><tr><th>选择</th><th>角色编号</th><th>角色</th><th>角色说明</th><th>操作</th></tr></thead>");
            $.each(data, function (index, role) {
                var str = " <tr id=" + role.roleId + "><td><div class=\"ui toggle checkbox\"><input name=\"public\" type=\"checkbox\"><label></label></div></td><td>\n\
                                        <label class=\"mylabel table-label\" >" + role.roleId + "</label>\n\<div class=\"nonevisiual\" ><input readonly value=" + role.roleId + " class=\"myInput\" style=\"width: 80%;\" type=\"text\"></div></td><td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + role.roleName + "\" data-position=\"top left\">" + role.roleName + "</label><div class=\"nonevisiual\" ><input value=" + role.roleName + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div></td><td>\n\
                                        <label class=\"mylabel table-label\"  data-content=\"" + role.roleDescription + "\" data-position=\"top left\">" + role.roleDescription + "</label><div class=\"nonevisiual\"><input value=" + role.roleDescription + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div></td>\n\
                                        <td style='width:150px'><button class=\"ui mini button blue updatebtn\" >修改</button><button class=\"ui mini button blue deleteBtn\">删除</button></td></tr>";


                $("#roleTable").append(str);
            });
        }
        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

        function getRoleListItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "staff/roleListItemNum",
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
        function getRoleListByNameItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "staff/getRoleListByNameItemNum/" + $("#roleName").val(),
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


        //表单验证
        $('.ui.form').form({
            fields: {
                roleName: {
                    identifier: 'roleName', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入角色名称'//提示信息
                        }
                    ]
                },
                roleDescription: {
                    identifier: 'roleDescription', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入角色描述'//提示信息
                        }
                    ]
                }

            }
        });
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
    </script>

</html>
