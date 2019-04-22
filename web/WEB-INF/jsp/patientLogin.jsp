
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <script src="resources/js/md5.min.js"></script>
        <!--<script type="text/javascript" src="resources/js/md5.min.js"></script>-->
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
                max-width: 450px;
            }
            .novisiual{
                display: none;
            }
        </style>
    </head>
    <body>

        <div class="ui middle aligned center aligned grid">
            <div class="column">
                <h2 class="ui teal image header">
                    <!--<img src="assets/images/logo.png" class="image">-->
                    <div class="content">
                        登录
                    </div>
                </h2>
                <form id="loginForm" class="ui large form">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="patientEmail" placeholder="请输入邮箱">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="patientPassword" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <!--<i class="lock icon"></i>-->
                                <i class="image outline icon"></i>
                                <input id="validateCode" type="text" name="validateCode" placeholder="请输入验证码">
                                <img src="checkCode" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src = this.src + '?'">
                            </div>
                        </div>
                        <button type="button" id="loginButton" class="ui fluid large teal button">登录</button>
                    </div>

                    <div class="ui error message"></div>

                </form>

                <div class="ui message">
                    没有账号? <a href="javascript:window.open('patient/goToRegister','_self')">注册</a>
                </div>
                <div id="resetPasswordShow" class="ui message">
                    找回密码
                </div>
                <form id="passwordForm" class="ui large form novisiual">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input id="email" type="text" name="email" placeholder="请输入邮箱">
                                <button id="validateEmailButton" class="ui button" type="button">发送验证码</button>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="qrcode icon"></i>
                                <input id="validationCode" type="text" name="validateEmailCode" placeholder="请输入邮箱验证码">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input id="resetPassword" type="password" name="resetPassword" placeholder="请输入新密码">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input id="resetPasswordRepeat" type="password" name="resetPasswordRepeat" placeholder="请重复输入新密码">
                            </div>
                        </div>
                        <button type="button" id="reseatPasswordBtn" class="ui fluid large teal button">重置</button>
                    </div>

                    <div class="ui error message"></div>

                </form>
            </div>
        </div>
    </body>

    <script>
        var validateCode;

        $("#resetPasswordShow").click(function () {
            $("#passwordForm").removeClass("novisiual");
        });


        $(document).ready(function () {

            //验证并提交表单
            $(document).on("click", "#loginButton", function () {

                $('#loginForm').form('validate form');
                if ($('#loginForm').form('is valid')) {
                    $.ajax({
                        //几个参数需要注意一下
                        type: "POST", //方法类型
                        dataType: "text", //预期服务器返回的数据类型
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        url: "patient/login", //url
                        data: $('.ui.large.form').serialize(),
                        success: function (data) {
                            console.log(data);
                            if (data === "true") {
                                window.open("patientIndex", "_self");
                            } else {
                                toastError(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            toastError("请求失败，请重试！" + errorThrown);
                        }
                    });
                }
            });



            $('#loginForm').form({
                fields: {
                    patientEmail: {
                        identifier: 'patientEmail',
                        rules: [
                            {
                                type: 'empty',
                                prompt: '请输入邮箱'
                            },
                            {
                                type: 'email',
                                prompt: '请输入一个有效的邮箱'
                            }
                        ]
                    },
                    patientPassword: {
                        identifier: 'patientPassword',
                        rules: [
                            {
                                type: 'empty',
                                prompt: '请输入密码'
                            },
                            {
                                type: 'length[6]',
                                prompt: '密码的长度必须不小于六位'
                            }
                        ]
                    },
                    validateCode: {
                        identifier: 'validateCode',
                        rules: [
                            {
                                type: 'empty',
                                prompt: '请输入验证码'
                            }
                        ]
                    }
                }
            });
        });
        //验证邮箱格式是否正确并获取邮箱验证码
        $(document).on("click", "#validateEmailButton", function () {
            $('#passwordForm').form('validate field', 'email');
            if ($('#passwordForm').form('is valid', 'email')) {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST", //方法类型
                    dataType: "text", //预期服务器返回的数据类型
                    url: "patient/validateEmail/", //url
                    data: {email: $("#email").val().toString()},
                    success: function (data) {
                        validateCode = data;
                        toastSuccess("验证邮件发送成功");
                        if (data !== "ERROR") {
                            validateCode = data;
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
        $(document).on("click", "#reseatPasswordBtn", function () {
            var value = $("#validationCode").val();
            var hash = md5(value);
            $('#passwordForm').form('validate form');
            if ($('#passwordForm').form('is valid') && validateCode === hash) {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST", //方法类型
                    dataType: "text", //预期服务器返回的数据类型
                    url: "patient/resetPassword", //url
                    data: $('#passwordForm').serialize(),
                    success: function (data) {
                        if (data === false) {
                            toastError("重置失败!");
                        } else {
                            toastSuccess("重置成功");
                            window.open("patient/goToLogin", "_self");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败，请重试！" + errorThrown);
                    }
                });
            } else {
                toastError("邮箱验证码不正确，或者填写不正确！");
            }
        });


        $('#passwordForm').form({
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
                resetPassword: {
                    identifier: 'resetPassword',
                    rules: [
                        {
                            type: 'regExp[^(\\w){6,20}$]',
                            prompt: '请输入输入6-20个字母、数字、下划线 '
                        }
                    ]
                },
                resetPasswordRepeat: {
                    identifier: 'resetPasswordRepeat',
                    rules: [
                        {
                            type: 'match[resetPassword]',
                            prompt: '请确认自己两次输入的密码是否一致'
                        },
                        {
                            type: 'empty',
                            prompt: '请确认自己两次输入的密码是否一致'
                        }
                    ]
                },
                validateEmailCode: {
                    identifier: 'validateEmailCode',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请输入姓名'
                        }
                    ]
                }
            }
        });

    </script>
</html>
