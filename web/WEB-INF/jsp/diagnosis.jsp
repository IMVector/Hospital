<%-- 
    Document   : diagnosis
    Created on : 2019-3-19, 10:00:42
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="resourcesTemplete.jsp" />
        <title>诊断</title>
    </head>
    <body>
        <jsp:include page="staffHeaderTemplete.jsp"/>
        <div class="ui container">

            <form id="medicalRecordForm" class="ui form">
                <div class="required field">
                    <label>身份证号</label>
                    <input id="IdCard" type="text" name="IdCard" placeholder="请输入病人的身份证号">
                </div>
                <!-- <div class="ui warning message">
                    <i class="close icon"></i>
                    <div class="header">
                        该病人用户不存在！是否输入有误或者新建用户？
                    </div>
                    <br>
                    <button class="ui positive button">新建用户</button>
                </div>-->
                <div class="required field">
                    <label>病人描述症状</label>
                    <textarea name="symptom" placeholder="请输入病人描述症状"></textarea>
                </div>
                <div class="ui styled fluid accordion">
                    <div class="title active">
                        <i class="dropdown icon"></i>
                        <!--What is a dog?-->
                        检查事项
                    </div>
                    <div class="content">
                        <div class="fields">
                            <div class="twelve wide field">
                                <label for="">检查项目：</label>
                                <div class="ui input ">
                                    <select id="roleId" name="role.roleId" class="ui fluid dropdown"></select>
                                </div>
                            </div>
                            <div class="four wide field">
                                <label for="">去检查选中项目：</label>
                                <button class="ui fluid button">检查</button>
                            </div>

                        </div>

                        <p class="transition visible" style="display: block !important;">
                        <div class="ui indicating progress">
                            <div class="bar"></div>
                            <div class="label">检查进度</div>
                        </div>
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        检查结果
                        <!--What kinds of dogs are there?-->
                    </div>
                    <div class="content">
                        <p class="transition hidden">There are many breeds of dogs.
                            Each breed varies in size and temperament. 
                            Owners often select a breed of dog that they find to be compatible with their own lifestyle and desires from a companion.</p>
                    </div>
                    <div class="title">
                        <i class="dropdown icon"></i>
                        病史
                        <!--How do you acquire a dog?-->
                    </div>
                    <div class="content">
                        <p class="transition hidden">Three common ways for a prospective owner to acquire a dog is from pet shops, private owners, or shelters.</p>
                        <p class="transition hidden">A pet shop may be the most convenient way to buy a dog.
                            Buying a dog from a private owner allows you to assess the pedigree and upbringing of your dog before choosing to take it home. 
                            Lastly, finding your dog from a shelter, helps give a good home to a dog who may not find one so readily.</p>
                    </div>
                </div>
                <br>
                <div class="required field">
                    <label>诊断</label>
                    <textarea name="diagnosticDescription" placeholder="请输入诊断描述"></textarea>
                </div>

                <div class="required field">
                    <label>处方</label>
                    <div class="ui fluid action input">
                        <input type="text" placeholder="Search...">
                        <div class="ui button">Search</div>
                    </div>
                    <div class="ui segment" style="height:100px;background-color:whitesmoke">

                    </div>
                </div>
                <div class="ui styled fluid accordion">
                    <div class="title">
                        <i class="dropdown icon"></i>
                        <!--What is a dog?-->
                        药库信息
                    </div>
                    <div class="content">
                        <p class="transition visible" style="display: block !important;">
                            A dog is a type of domesticated animal. Known for its loyalty and faithfulness, 
                            it can be found as a welcome guest in many households across the world.
                        </p>
                    </div>
                </div>
                <br>
                <div class="field">
                    <label>注意事项</label>
                    <div class="ui fluid action input">
                        <textarea name="PrescriptionPrecautions" placeholder="请输入注意事项"></textarea>
                    </div>
                </div>

                <button id="medicalRecordBtn" type="button" class="ui primary button">提交信息</button>

            </form>

            <div class="ui basic modal">
                <div class="ui icon header">
                    <!--<i class="archive icon"></i>-->
                    <i class="user times icon"></i>
                    该病人用户不存在！是否输入有误或者新建用户？
                </div>
                <div class="content">
                    <!--<p>Your inbox is getting full, would you like us to enable automatic archiving of old messages?</p>-->
                </div>
                <div class="actions">
                    <div class="ui yellow basic cancel inverted button">
                        <i class="remove icon"></i>
                        重新输入
                    </div>
                    <div class="ui green ok inverted button">
                        <i class="checkmark icon"></i>
                        新增用户
                    </div>
                </div>
            </div>

            <div class="ui modal">
                <form class="ui form">
                    <div class="fields">
                        <div class="twelve wide field">
                            <label>邮箱</label>
                            <input id="email" type="text" name="patientEmail" placeholder="请输入邮箱">
                        </div>
                        <div class="four wide field">
                            <label>发送验证码</label>
                            <button type="button" id="validateEmailButton" class="ui button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                        </div>
                    </div>
                    <div class="field">
                        <label>密码</label>
                        <input type="password" name="patientPassword" placeholder="请输入密码">
                    </div>
                    <div class="field">
                        <label>重复密码</label>
                        <input type="password" name="repeatPassword"  placeholder="请重复输入密码">
                    </div>
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
                    <div class="ui placeholder segment">
                        <div class="ui center aligned icon header">
                            <img id="avatar" class="ui centered circular image" src="resources/image/avatar.png">
                        </div>
                        <center>
                            <div  id="mySelect" class="ui primary button">头像</div>
                            <input id="imagePath" type="text" style="display:none" name="imagePath">
                        </center>

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
                    <div class="field">
                        <label>血型</label>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="bloodType">
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
                    <button type="button" id="submitButton" class="fluid ui primary button">注册</button>
                    <br>
                    <button type="button" id="goToLoginButton" class="fluid ui button">去登录</button>

                </form>
            </div>
        </div>
    </body>
    <script>
//        $('.message .close').on('click', function () {
//            $(this).closest('.message').transition('fade');
//        });

        $('.ui.styled.accordion').accordion({
            selector: {
                trigger: '.title'
            }
        });
        $(document).on("click", ".ui.indicating.progress", function () {
            $('.ui.indicating.progress').progress('increment', 30);
        });

        /**
         * 验证病人是否有账号
         */
        $("#IdCard").change(function () {
            $.ajax({
                url: "patient/ isIdCardexist/" + $(this).val(),
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    if (data === false) {
                        $('.ui.basic.modal').modal('show');
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败");
                }
            });
        });

        $("#medicalRecordBtn").click(function () {
            $.ajax({
                url: "staff/addMedicalRecord",
                type: 'POST',
                data:$("#medicalRecordForm").serialize(),
                success: function (data, textStatus, jqXHR) {
                    if (data === false) {
                        $('.ui.basic.modal').modal('show');
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败");
                }
            });
        });
    </script>
</html>
