<%-- 
    Document   : patientRegister
    Created on : 2019-3-12, 14:01:08
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>注册</title>
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
        <!--<div class="ui segment">-->
        <div class="column">
            <div class="ui segment">
                <form class="ui form">

                    <div class="field">
                        <label>姓名</label>
                        <input type="text" name="patientName" placeholder="请输入姓名">
                    </div>
                    <div class="field">
                        <label>手机号码</label>
                        <input type="text" name="patientPhone" placeholder="请输入手机号码">
                    </div>
                    <div class="field">
                        <label>家庭住址</label>
                        <input type="text" name="patientAddress" placeholder="请输入家庭住址">
                    </div>
                    <div class="field">
                        <label>身份证号</label>
                        <input type="text" name="IdCard" placeholder="请输入身份证号">
                    </div>
                    <div class="field">
                        <label>婚姻状况</label>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="patientMstatus">
                            <i class="dropdown icon"></i>
                            <div class="default text">婚姻状况</div>
                            <div class="menu">
                                <div class="item" data-value="未婚">未婚</div>
                                <div class="item" data-value="已婚">已婚</div>
                            </div>
                        </div>
                    </div>
                    <button type="button" id="submitButton" class="fluid ui primary button">注册</button>
                    <br>
                    <!--<button type="button" id="goToLoginButton" class="fluid ui button">去登录</button>-->

                </form>
            </div>


        </div>

    </body>
    <script>
        $('.ui.radio.checkbox').checkbox();
        $('select.dropdown').dropdown();
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


        $('.ui.form').form({
            fields: {
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
                patientMstatus: {
                    identifier: 'patientMstatus',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '请选择正确的婚姻状况'
                        }
                    ]
                }
            }
        });

    </script>
</html>
