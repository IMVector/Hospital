<%-- 
    Document   : patientLogin
    Created on : 2019-3-12, 15:05:34
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
        <jsp:include page="resourcesTemplete.jsp" />
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
                <form class="ui large form">
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
                                <input type="text" name="validateCode" placeholder="请输入验证码">
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
            </div>
        </div>
    </body>

    <script>
        $(document).ready(function () {

            //验证并提交表单
            $(document).on("click", "#loginButton", function () {
//                var value = $("#validationCode").val();
//                var hash = md5(value);
//                $('.ui.form').form('validate form');
//                if ($('.ui.form').form('is valid') && validateCode === hash) {
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
//                }
            });



            $('.ui.form').form({
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
            })
                    ;
        })
                ;
    </script>
</html>
