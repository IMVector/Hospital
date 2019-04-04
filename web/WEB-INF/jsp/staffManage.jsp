<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>员工管理</title>
        <style>
            .mselect {
                border: 1px solid #DCDEE0;
                vertical-align: middle;
                border-radius: 3px;
                height: 40px;
                padding: 0px 16px;
                font-size: 14px;
                color: #555555;
                outline:none;
                width:100%;
                margin:0;
                list-style:none;
                box-sizing: border-box;
            }
            .mselect:focus {
                border: 1px solid #27A9E3;
            }
        </style>
    </head>

    <body>
        <jsp:include page="manageStaffHeaderTemplete.jsp"/>

        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    职工管理
                </div>
                <div id="optionLoader" class="ui active inverted dimmer">
                    <div class="ui text loader">加载</div>
                </div>
                <table>

                    <tr>
                        <td>
                            <div class="ui input fluid focus">
                                <input id="staffName_" placeholder="职工姓名" type="text">
                            </div>
                        </td>
                        <td> 
                            <button id="getByName" class="ui basic fluid button blue">查询指定姓名员工</button>
                        </td>
                        <td>
                            <div class="ui input focus">
                                <select id="staffDepartment_" class="ui dropdown"></select>
                            </div>
                        </td>
                        <td>
                            <button id="getByDepartment" class="ui basic fluid button blue">查询指定部门员工</button>
                        </td>
                        <td>
                            <div class="ui input focus">
                                <select id="staffTitle_" class="ui dropdown"></select>
                            </div>
                        </td>
                        <td>
                            <button id="getByTitle" class="ui basic fluid button blue">查询指定头衔员工</button>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <div class="ui input focus">
                                <select id="staffRole_" class="ui dropdown"></select>
                            </div>
                        </td>
                        <td>
                            <button id="getByRole" class="ui basic fluid button blue">查询指定角色员工</button>
                        </td>

                        <td>
                            <button id="getAllBtn" class="ui basic fluid button blue">查询所有职工的信息</button>
                        </td>
                        <td>
                            <button id="add" class="ui basic fluid button blue">添加职工</button>
                        </td>
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="staffTable" class="ui table blue">
                    </table>
                </div>
                <div>
                    <button id="selectAll" class="ui button blue">全选</button>
                    <!--<button id="updateAll" class="ui button blue">全部更新</button>-->
                    <button id="deleteAll" class="ui button blue">全部删除</button>
                </div>
                <div>
                    <p id="pageText"></p>
                    <div id="PageButtons" class="mini ui basic buttons">

                    </div>
                    <label for="" class="ui label">跳转到：</label>
                    <!--发送ajax请求-->
                    <select id="pageSelecter" class="mini ui button basic dropdown">
                        <option value="">页码</option>
                        <!--<option value="1">1</option>-->
                    </select>
                </div>

            </div>

            <div id="modeltest" class="ui inverted modal ">
                <div class="header">添加职工</div>
                <div class="content">
                    <div class="ui header blue segment">职工信息</div>
                    <form id="myForm" class="ui form">
                        <div class="field">
                            <label for="">员工邮箱：</label>
                            <div class="ui input ">
                                <input id="email" name="email" placeholder="请输入员工邮箱" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工姓名：</label>
                            <div class="ui input ">
                                <input id="staffName" name="staffName" placeholder="请输入员工姓名" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工性别：</label>
                            <div class="ui input ">
                                <select id="staffGender" name="gender" class="ui fluid dropdown">
                                    <option value="">性别</option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">职工职称：</label>
                            <div class="ui input ">
                                <select id="staffTitleInfo"  name="title.titleId" class="ui fluid dropdown" ></select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">所属部门：</label>
                            <div class="ui input ">
                                <select id="departmentId" name="department.departmentId" class="ui fluid dropdown"></select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工角色：</label>
                            <div class="ui input ">
                                <select id="roleId" name="role.roleId" class="ui fluid dropdown"></select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工擅长领域：</label>
                            <div class="ui input ">
                                <input id="specialty" name="specialty" placeholder="请输入员工擅长领域" type="text">
                            </div>
                        </div>
                        <div class="field">
                            <label for="">员工简介：</label>
                            <div class="ui input ">
                                <textarea id="introduction" placeholder="请输入员工简介" name="introduction"></textarea>
                            </div>
                        </div>
                        <button id="resetButton" type="reset" style="display:none;"></button> 
                    </form>
                </div>
                <div class="actions">
                    <div class="ui black deny button">放弃</div>
                    <div class="ui positive button">上传信息</div>
                </div>

            </div>
            <jsp:include page="warningModel.jsp"/>
        </div>
    </body>

    <script>
        var ajaxCount = 3;
        function isAjaxFinished() {
            ajaxCount--;
            if (ajaxCount === 0) {
                $("#optionLoader").removeClass("active");
            }
        }
        $(document).ready(function () {

            $("#optionLoader").addClass('active');
            requestDepartmentList("#staffDepartment_");
            requestTitleList("#staffTitle_");
            requestRoleList("#staffRole_");

            $("#getByName").on("click", function () {
                var name = $("#staffName_").val();
                var url = "staff/getStaffByName/" + name;
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, staffTableInfo, function () {
                    return 1;
                });
            });
            $("#getByTitle").on("click", function () {
                var title = $("#staffTitle_").val();
                var url = "staff/getStaffByTitle/" + title + "/page_key_word";
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, staffTableInfo, staffByTitleItemNum);
            });
            $("#getByDepartment").on("click", function () {
                var title = $("#staffDepartment_").val();
                var url = "staff/getStaffByDepartment/" + title + "/page_key_word";
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, staffTableInfo, staffByDepartmentItemNum);
            });
            $("#getByRole").on("click", function () {
                var title = $("#staffRole_").val();
                var url = "staff/getStaffByRole/" + title + "/page_key_word";
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, staffTableInfo, staffByRoleItemNum);
            });

            $("#getAllBtn").click(function () {
                var url = 'staff/staffList/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, staffTableInfo, staffItemNum);
            });

            $("#pageSelecter").on("change", function () {
                var url = 'staff/staffList/page_key_word';
                goToThPage("PageButtons", "pageText", "pageSelecter", url, staffTableInfo, staffItemNum);
            });


            //弹出添加model框
            $("#add").click(function () {
                requestDepartmentList("#departmentId");
                requestTitleList("#staffTitleInfo");
                requestRoleList("#roleId");
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
                                url: 'staff/addStaff',
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
                }).modal('show');
            });

            $(document).on("click", ".detailBtn", function () {
                var id = $(this).closest("tr").attr("id");
                window.open("staff/goToStaffDetails/" + id, "_self");
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
                    url: "staff/deleteStaff/" + id,
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
                        toastError("请求失败,请重试！");
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


        function staffTableInfo(data) {
            $("#staffTable").empty();
            $("#staffTable").append("<thead><tr><th>选择</th><th>职工编号</th><th>职工姓名</th><th>职工头衔</th><th>所属部门名称</th><th style='padding-left: 10%' colspan='2'>操作</th></tr></thead>");
            $.each(data, function (index, staff) {
                var str = " \n\
                <tr id=" + staff.staffId + ">\n\
                    <td>\n\
                        <div class='ui toggle checkbox'>\n\
                            <input name='public' type='checkbox'>\n\
                            <label></label>\n\
                        </div>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' >" + staff.staffId + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + staff.staffName + "' data-position='top left'>" + staff.staffName + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + staff.title.titleName + "' data-position='top left'>" + staff.title.titleName + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + staff.department.departmentName + "' data-position='top left'>" + staff.department.departmentName + "</label>\n\
                    </td>\n\
                    <td>\n\
                        <button class='ui button primary detailBtn'>详情</button>\n\
                        <button class='ui button negative deleteBtn'>删除</button>\n\
                    </td>\n\
                </tr>";
                $("#staffTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

        function staffItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "staff/staffListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
            return itemNum;
        }
        function staffByTitleItemNum() {
            var itemNum = 0;

            var title = $("#staffTitle_").val();
            $.ajax({
                url: "staff/getStaffByTitleItemNum/" + title,
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
            return itemNum;
        }
        function staffByDepartmentItemNum() {
            var itemNum = 0;

            var departmentId = $("#staffDepartment_").val();
            $.ajax({
                url: "staff/getStaffByDepartmentItemNum/" + departmentId,
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
            return itemNum;
        }
        function staffByRoleItemNum() {
            var itemNum = 0;

            var roleId = $("#staffRole_").val();
            $.ajax({
                url: "staff/getStaffByRoleItemNum/" + roleId,
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
            return itemNum;
        }
        function requestTitleList(id) {

            $.ajax({
                url: "staff/getTitleList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    isAjaxFinished();
                    $(id).empty();
                    $(id).append("<option value=''>职称</option>");
                    $.each(data, function (index, title) {
                        var str = "<option value=" + title.titleId + ">" + title.titleName + "</option>";
                        $(id).append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }

        function requestDepartmentList(id) {
            $.ajax({
                url: "staff/getDepartmentList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    isAjaxFinished();
                    $(id).empty();
                    $(id).append("<option value=''>部门</option>");
                    $.each(data, function (index, department) {
                        var str = "<option value=" + department.departmentId + ">" + department.departmentName + "</option>";
                        $(id).append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }
        function requestRoleList(id) {
            $.ajax({
                url: "staff/getRoleList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    isAjaxFinished();
                    $(id).empty();
                    $(id).append("<option value=''>角色</option>");
                    $.each(data, function (index, role) {
                        var str = "<option value=" + role.roleId + ">" + role.roleName + "</option>";
                        $(id).append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }

        $('.ui.form').form({
            fields: {
                email: {
                    identifier: 'email', //form的field
                    rules: [
                        {
                            type: 'email', //验证类型
                            prompt: '请输入正确的邮箱'//提示信息
                        }
                    ]
                },
                staffName: {
                    identifier: 'staffName',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入员工姓名'
                        }
                    ]
                },
                titleId: {
                    identifier: 'titleId',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择员工职称'
                        }
                    ]
                },
                departmentId: {
                    identifier: 'departmentId',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择所属部门'
                        }
                    ]
                },
                roleId: {
                    identifier: 'roleId',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择员工角色'
                        }
                    ]
                },
                specialty: {
                    identifier: 'specialty',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入员工擅长领域'
                        }
                    ]
                },
                introduction: {
                    identifier: 'introduction',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入员工简介'
                        }
                    ]
                },
                gender: {
                    identifier: 'gender',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择员工性别'
                        }
                    ]
                }
            }
        });


    </script>
</html>
