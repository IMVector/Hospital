
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信息修改</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <script src="resources/js/cropper.js"></script><!-- Cropper.js is required -->
        <link  href="resources/css/cropper.css" rel="stylesheet">
        <script src="resources/js/jquery-cropper.js"></script>
        <script src="resources/js/testScript.js"></script>
        <script src="resources/js/md5.min.js"></script>
        <style type="text/css">
            body {
                background-color: #DADADA;
            }
            body > .grid {
                height: 100%;
            }
            .image {
                margin-top: -100px;
            }
            .column {
                max-width: 550px;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <div class="column">
            <div class="ui segment">
                <form class="ui form">
                    <div class="fields">
                        <div class="twelve wide field">
                            <label>邮箱</label>
                            <input id="email" type="text" name="patientEmail" placeholder="请输入邮箱" value="${patient.patientEmail}">
                        </div>
                        <div class="four wide field">
                            <label>发送验证码</label>
                            <button type="button" id="validateEmailButton" class="ui button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                        </div>
                    </div>
                    <div class="field">
                        <label>密码</label>
                        <input type="password" name="patientPassword" placeholder="请输入密码" value="${patient.patientPassword}">
                    </div>
                    <div class="field">
                        <label>重复密码</label>
                        <input type="password" name="repeatPassword"  placeholder="请重复输入密码">
                    </div>
                    <div class="field">
                        <label>姓名</label>
                        <input type="text" name="patientName" placeholder="请输入姓名" value="${patient.patientName}">
                    </div>
                    <div class="field">
                        <label>手机号码</label>
                        <input type="text" name="patientPhone" placeholder="请输入手机号码" value="${patient.patientPhone}">
                    </div>
                    <div class="field">
                        <label>家庭住址</label>
                        <input type="text" name="patientAddress" placeholder="请输入家庭住址" value="${patient.patientAddress}">
                    </div>
                    <div class="field">
                        <label>身份证号</label>
                        <input type="text" name="IdCard" readonly="readonly"  placeholder="请输入身份证号" value="${patient.idCard}">
                    </div>
                    <div class="ui placeholder segment">
                        <div class="ui center aligned icon header">
                            <c:if test="${  not empty  patient.image.imagePath}">
                                <img id="avatar" class="ui centered circular image" src="${patient.image.imagePath}">
                            </c:if>
                            <c:if test="${empty patient.image.imagePath}">
                                <img id="avatar" class="ui centered circular image" src="resources/image/avatar.png">
                            </c:if>
                        </div>
                        <center>
                            <div  id="mySelect" class="ui primary button">头像</div>
                            <input id="imagePath" type="text" style="display:none" name="imagePath" value="${patient.image.imagePath}">
                        </center>

                    </div>
                    <div class="field">
                        <label>婚姻状况</label>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="patientMstatus" value="${patient.patientMstatus}">
                            <i class="dropdown icon"></i>
                            <div class="default text">婚姻状况</div>
                            <div class="menu">
                                <div class="item" data-value="未婚">未婚</div>
                                <div class="item" data-value="已婚">已婚</div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>血型</label>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="bloodType" value="${patient.bloodType}">
                            <i class="dropdown icon"></i>
                            <div class="default text">血型</div>
                            <div class="menu">
                                <div class="item" data-value="A型">A型</div>
                                <div class="item" data-value="B型">B型</div>
                                <div class="item" data-value="O型">O型</div>
                                <div class="item" data-value="AB型">AB型</div>
                                <div class="item" data-value="未知">未知</div>
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>邮箱验证码</label>
                        <input id="validationCode" type="text" name="validationCode" placeholder="请输入邮箱验证码">
                    </div>
                    <button type="button" id="submitButton" class="fluid ui primary button">修改信息</button>
                    <br>
                    <button type="button" id="goToLoginButton" class="fluid ui button">去登录</button>

                </form>
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

        $('.ui.radio.checkbox').checkbox();
        $('.ui.selection.dropdown').dropdown();

        var $inputImage = $('#inputImage');
        var $image = $('#image');
        var formData;
        var file;
        var validateCode;
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
        //验证邮箱格式是否正确并获取邮箱验证码
        $(document).on("click", "#validateEmailButton", function () {
            $('.ui.form').form('validate field', 'patientEmail');
            if ($('.ui.form').form('is valid', 'patientEmail')) {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST", //方法类型
                    dataType: "text", //预期服务器返回的数据类型
                    url: "patient/validateEmail/", //url
                    data: {email: $("#email").val().toString()},
                    success: function (data) {
                        validateCode = data;
                        toastSuccess("验证邮件发送成功");
//                        console.log(data);
                        if (data !== "ERROR") {
                            validateCode = data;
                            console.log(data);
                        } else {
                            toastError("请求失败，请重试！");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败，请重试！");
                    }
                });
            }

        });
        //验证并提交表单
        $(document).on("click", "#submitButton", function () {
            var value = $("#validationCode").val();
            var hash = md5(value);
            $('.ui.form').form('validate form');
            if ($('.ui.form').form('is valid') && validateCode === hash) {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST", //方法类型
                    dataType: "text", //预期服务器返回的数据类型
                    url: "patient/register", //url
                    data: $('.ui.form').serialize(),
                    success: function (data) {
                        if (data === "Error") {
                            toastError("注册失败");
                        } else {
                            toastSuccess("注册成功");
                            window.open("patient/goToLogin", "_self");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败，请重试！" + errorThrown);
                    }
                });
            }
        });

        //跳转到登录页
        $(document).on("click", "#goToLoginButton", function () {
            window.open("patient/goToLogin", "_self");
        });

        $(document).on("click", "#mySelect", function () {
            $("#inputImage").click();
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

        $(document).on("click", "#cancleButton", function () {
            $('.ui.modal').modal('refresh');
            $('.ui.modal').modal('hide');
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


        $('.ui.form').form({
            fields: {
                patientEmail: {
                    identifier: 'patientEmail', //form的field
                    rules: [
                        {
                            type: 'email', //验证类型
                            prompt: '请输入正确的邮箱'//提示信息
                        }
                    ]
                },
                patientPassword: {
                    identifier: 'patientPassword',
                    rules: [
                        {
                            type: 'regExp[^(\\w){6,20}$]',
                            prompt: '请输入输入6-20个字母、数字、下划线 '
                        }
                    ]
                },
                repeatPassword: {
                    identifier: 'repeatPassword',
                    rules: [
                        {
                            type: 'match[patientPassword]',
                            prompt: '请确认自己两次输入的密码是否一致'
                        },
                        {
                            type: 'empty',
                            prompt: '请确认自己两次输入的密码是否一致'
                        }
                    ]
                },
                patientName: {
                    identifier: 'patientName',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入姓名'
                        }
                    ]
                },
                patientPhone: {
                    identifier: 'patientPhone',
                    rules: [
                        {
                            type: 'regExp[^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$]',
                            prompt: '请输入正确的手机号'
                        }
                    ]
                },
                patientAddress: {
                    identifier: 'patientAddress',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入家庭住址'
                        }
                    ]
                },
                IdCard: {
                    identifier: 'IdCard',
                    rules: [
                        {
                            type: 'regExp[^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X)$]',
                            prompt: '请输入正确格式的身份证号'
                        }
                    ]
                },
                bloodType: {
                    identifier: 'bloodType',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择血型'
                        }
                    ]
                },
                patientMstatus: {
                    identifier: 'patientMstatus',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择正确的婚姻状况'
                        }
                    ]
                },
                validationCode: {
                    identifier: 'validationCode',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入正确的邮箱验证码'
                        }
                    ]
                }
            }
        });


//        $("#crop").on("click", function () {
//            $('#image').cropper({
//                aspectRatio: 1 / 1,
//                viewMode: 1,
//                dragMode: 'none',
//                preview: ".small",
//                responsive: false,
//                restore: false,
//                modal: false,
//                guides: false,
//                background: false,
//                autoCrop: false,
//                autoCropArea: 0.1,
//                movable: false,
//                scalable: false,
//                zoomable: false,
//                wheelZoomRatio: false,
//                cropBoxMovable: false,
//                cropBoxResizable: false,
//                ready: function () {
//                    console.log("ready");
//                },
//                cropstart: function (e) {
//                    console.log("cropstart");
//                },
//                cropmove: function (e) {
//                    console.log("cropmove");
//                },
//                cropend: function (e) {
//                    console.log("cropend");
//                },
//                crop: function (e) {
//                    console.log("crop");
//                },
//                zoom: function (e) {
//                    console.log("zoom");
//                },
//            });
//        })

    </script>
</html>
