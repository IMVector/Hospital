
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #checkRecordTable td{
                text-align: center;
                vertical-align:middle;
            }
            #checkRecordTable th{
                text-align: center;
                vertical-align:middle;
            }
            p{
                font-weight: bold;
                font-size: 15px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="staffHeaderTemplete.jsp"/>
        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">职工信息</div>
                <form id="myForm" class="ui form">
                    <div class="field">
                        <label for="">员工邮箱：</label>
                        <div class="ui input ">
                            <input id="email" name="email" readonly placeholder="请输入员工邮箱" type="text" value="${staff.email}">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工姓名：</label>
                        <div class="ui input ">
                            <input id="staffName" name="staffName" placeholder="请输入员工姓名" type="text" value="${staff.staffName}">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工性别：</label>
                        <div class="ui input ">
                            <select id="staffGender" name="gender" class="ui fluid dropdown" value="${staff.gender}">
                                <option value="">性别</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">职工职称：</label>
                        <div class="ui input ">
                            <select id="staffTitleInfo"  name="title.titleId" class="ui fluid dropdown" value="${staff.title.titleId}">

                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">所属部门：</label>
                        <div class="ui input ">
                            <select id="departmentId" name="department.departmentId" class="ui fluid dropdown" value="${staff.department.departmentId}"></select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工角色：</label>
                        <div class="ui input ">
                            <select id="roleId" name="role.roleId" class="ui fluid dropdown"  value="${staff.role.roleId}"></select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工擅长领域：</label>
                        <div class="ui input ">
                            <input id="specialty" name="specialty" placeholder="请输入员工擅长领域" type="text" value="${staff.specialty}">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工简介：</label>
                        <div class="ui input ">
                            <textarea id="introduction" placeholder="请输入员工简介" name="introduction">
                                ${staff.introduction}
                            </textarea>
                        </div>
                    </div>
                    <button id="resetButton" type="reset" style="display:none;"></button> 
                </form>
            </div>

        </div>
    </body>
    <script>


        function t() {
            if ($(".ui.form").form('validate form')) {
                $.ajax({
                    url: 'staff/updateStaff',
                    type: 'POST',
                    async: false,
                    data: $("#myForm").serialize(), //将表单的数据编码成一个字符串提交给服务器
                    success: function (data) {
                        if (data) {
                            toastSuccess("修改成功！");
                            $('#resetButton').click();
                            $('.ui.modal').modal('hide');
                        } else {
                            toastError("修改失败！");
                        }
                    },
                    error: function (req, status, error) {
                        toastError("请求失败,请重试！");
                    }
                });
            } else {
                return false;
            }
        }

        requestDepartmentList("#departmentId");
        requestTitleList("#staffTitleInfo");
        requestRoleList("#roleId");
        function requestTitleList(id) {

            $.ajax({
                url: "staff/getTitleList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    isAjaxFinished();
                    $(id).append("<option value=''>职称</option>");
                    $.each(data, function (index, title) {
                        var str = "<option value=" + title.titleId + ">" + title.titleName + "</option>";
                        $(id).append(str);
                    });
                    $("#staffTitleInfo").val(${staff.title.titleId});
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
                    $(id).append("<option value=''>部门</option>");
                    $.each(data, function (index, department) {
                        var str = "<option value=" + department.departmentId + ">" + department.departmentName + "</option>";
                        $(id).append(str);
                    });
                    $("#departmentId").val(${staff.department.departmentId});

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
                    $(id).append("<option value=''>角色</option>");
                    $.each(data, function (index, role) {
                        var str = "<option value=" + role.roleId + ">" + role.roleName + "</option>";
                        $(id).append(str);
                    });
                    $("#roleId").val(${staff.role.roleId});
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