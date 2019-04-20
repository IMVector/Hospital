<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <script src="resources/js/cropper.js"></script><!-- Cropper.js is required -->
        <link  href="resources/css/cropper.css" rel="stylesheet">
        <script src="resources/js/jquery-cropper.js"></script>
        <script src="resources/js/testScript.js"></script>
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
        <%--<jsp:include page="staffHeaderTemplete.jsp"/>--%>
        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">职工信息</div>
                <form id="myForm" class="ui form">
                    <input type="text" name="staffId" value="${manageStaff.staffId}" style="display:none">
                    <div class="field">
                        <label for="">员工邮箱：</label>
                        <div class="ui input ">
                            <input id="email" name="email" readonly placeholder="请输入员工邮箱" type="text" value="${manageStaff.email}">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工姓名：</label>
                        <div class="ui input ">
                            <input id="password" name="staffPassword" placeholder="请输入密码" type="text">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">密码：</label>
                        <div class="ui input ">
                            <input id="repeatPassword" name="repeatPassword" placeholder="请输入重复密码" type="text">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">重复密码：</label>
                        <div class="ui input ">
                            <input id="staffName" name="staffName" placeholder="请输入员工姓名" type="text" value="${manageStaff.staffName}">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工性别：</label>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="gender" value="${manageStaff.gender}">
                            <i class="dropdown icon"></i>
                            <div class="default text">性别</div>
                            <div  id="staffGender" class="menu">
                                <div class="item" data-value="男">男</div>
                                <div class="item" data-value="女">女</div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">职工职称：</label>
                        <div class="ui input ">
                            <select id="staffTitleInfo"  name="title.titleId" class="ui fluid dropdown" value="${manageStaff.title.titleId}"></select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">所属部门：</label>
                        <div class="ui input ">
                            <select id="departmentId" name="department.departmentId" class="ui fluid dropdown" value="${manageStaff.department.departmentId}"></select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工角色：</label>
                        <div class="ui input ">
                            <select id="roleId" name="role.roleId" class="ui fluid dropdown" value="${manageStaff.role.roleId}"></select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工擅长领域：</label>
                        <div class="ui input ">
                            <input id="specialty" name="specialty" placeholder="请输入员工擅长领域" type="text" value="${manageStaff.specialty}">
                        </div>
                    </div>
                    <div class="field">
                        <label for="">员工简介：</label>
                        <div class="ui input ">
                            <textarea id="introduction" placeholder="请输入员工简介" name="introduction" value="${manageStaff.introduction}">
                                ${manageStaff.introduction}
                            </textarea>
                        </div>
                    </div>
                    <div class="ui placeholder segment">
                        <div class="ui center aligned icon header">
                            <c:if test="${not empty manageStaff.image.imagePath}">
                                <img id="avatar" class="ui centered circular image" src="${manageStaff.image.imagePath}">
                            </c:if>
                            <c:if test="${empty manageStaff.image.imagePath}">
                                <img id="avatar" class="ui centered circular image" src="resources/image/avatar.png">
                            </c:if>
                        </div>
                        <center>
                            <div  id="mySelect" class="ui primary button">头像</div>
                            <input id="imagePath" type="text" style="display:none" name="image.imagePath" value="${manageStaff.image.imagePath}">
                        </center>

                    </div>
                    <button id="resetButton" type="reset" style="display:none;"></button> 
                </form>
                <div class="ui col-offset-14">
                    <button id="infoSubmit" class="ui primary button">提交修改</button>

                </div>
            </div>

        </div>
        <form id="imageForm" style="display:none" enctype="multipart/form-data">
            <div> 
                <input id="inputImage"  type="file" name="input-image" accept="image/*"> 
            </div> 
        </form>

        <div class="ui modal">
            <div class="header">Header</div>
            <div class="content">
                <div style="height:200px;display:inline-block;width: 85%">
                    <img id="image" height="300px" src="resources/image/狗子.jpeg">
                </div>
                <div style="height:120px;margin-left: 10px;display:inline-block;">
                    <div class="small" style="height:100px;width:100px;overflow: hidden;border-radius: 50%;"></div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <button id="getCroppedCanvas" class="ui button">裁切头像</button>
                </div>

            </div>
            <div class="actions">
                <div id="uploadButton" class="ui green button">上传头像</div>
                <div id="cancleButton" class="ui red button">取消</div>
            </div>
        </div>

    </body>
    <script>

        $('.ui.selection.dropdown').dropdown();

        $(document).on("click", "#mySelect", function () {
            $("#inputImage").click();
        });

        $(document).on("click", "#infoSubmit", function () {
            if ($(".ui.form").form('validate form')) {
                $.ajax({
                    url: 'staff/updateStaffSelf',
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
        });

        var $inputImage = $('#inputImage');
        var $image = $('#image');
        var formData;
        var file;

        $inputImage.change(function () {
            $('.ui.modal').modal('setting', 'closable', false).modal('show');

            var files = this.files;
            //var file;
            if (files && files.length) {
                file = files[0];
            }
            var console = window.console || {log: function () {}};
            var URL = window.URL || window.webkitURL;
            var originalImageURL = $image.attr('src');
            var uploadedImageName = 'cropped.jpg';
            var uploadedImageType = 'image/jpeg';
            var uploadedImageURL;
            if (URL) {
                if (/^image\/\w+$/.test(file.type)) {
                    uploadedImageName = file.name;
                    uploadedImageType = file.type;

                    if (uploadedImageURL) {
                        URL.revokeObjectURL(uploadedImageURL);
                    }

                    uploadedImageURL = URL.createObjectURL(file);
                    //$image.attr('src', uploadedImageURL)
                    $image.cropper('destroy').attr('src', uploadedImageURL);
                    //.cropper(options);
                    $inputImage.val('');

                    $('#image').cropper({
                        aspectRatio: 1 / 1,
                        viewMode: 1,
                        dragMode: 'none',
                        preview: ".small",
                        responsive: false,
                        restore: false});
                } else {
                    window.alert('Please choose an image file.');
                }
            } else {
                $inputImage.prop('disabled', true).parent().addClass('disabled');
            }
        });
        $(document).on("click", "#uploadButton", function () {
            $.ajax({
                url: "upload/uploadImage/uploadPatientImage",
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data === "Error") {
                        toastError("上传失败");
                    } else {
                        toastSuccess("上传成功");
                        $('.ui.modal').modal('hide');
                        //$("#avatar").val(data);
                        $('#avatar').attr('src', data);
                        $("#imagePath").val(data);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
        });
        $("#getCroppedCanvas").on("click", function () {
            console.log($('#image').cropper('getCroppedCanvas'));
            var cas = $('#image').cropper('getCroppedCanvas', {width: 200, height: 200});
            var base64url = cas.toDataURL('image/jpeg');
            cas.toBlob(function (e) {
                //console.log(e);  //生成Blob的图片格式= 
                formData = new FormData();
                formData.append("file", e, file.name);
            });
            //console.log(base64url); //生成base64图片的格式
            //$('.cavans').html(cas);  //在body显示出canvas元素
            //var formData = new FormData();
            //注意：此处第3个参数最好传入一个带后缀名的文件名，否则很有可能被后台认为不是有效的图片文件
            //formData.append("file", blob, file.name);
        });
        var ajaxCount = 3;
        function isAjaxFinished() {
            ajaxCount--;
            if (ajaxCount === 0) {
                $("#optionLoader").removeClass("active");
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
                    $("#staffTitleInfo").val(${manageStaff.title.titleId});
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
                    $("#departmentId").val(${manageStaff.department.departmentId});

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
                    $("#roleId").val(${manageStaff.role.roleId});
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
                staffPassword: {
                    identifier: 'staffPassword',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入密码'
                        }
                    ]
                },
                repeatPassword: {
                    identifier: 'repeatPassword',
                    rules: [
                        {
                            type: 'match[staffPassword]',
                            prompt: '请确认自己两次输入的密码是否一致'
                        },
                        {
                            type: 'empty',
                            prompt: '请确认自己两次输入的密码是否一致'
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