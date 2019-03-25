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

            <div class="ui form">
                <div class="required field">
                    <label>身份证号</label>
                    <input type="text" name="IdCard" placeholder="请输入病人的身份证号">
                </div>
                <!--<form class="ui reply form">-->
                <div class="required field">
                    <label>病人描述症状</label>
                    <textarea></textarea>
                </div>
                <div class="ui styled fluid accordion">
                    <div class="title active">
                        <i class="dropdown icon"></i>
                        <!--What is a dog?-->
                        检查事项
                    </div>
                    <div class="content active">
                        <p class="transition visible" style="display: block !important;">
                        <div class="ui indicating progress">
                            <div class="bar"></div>
                            <div class="label">Funding</div>
                        </div>
                        <div class="ui steps">
                            <div class="step">
                                <i class="truck icon"></i>
                                <div class="content">
                                    <div class="title">Shipping</div>
                                    <div class="description">Choose your shipping options</div>
                                </div>
                            </div>
                            <div class="active step">
                                <i class="payment icon"></i>
                                <div class="content">
                                    <div class="title">Billing</div>
                                    <div class="description">Enter billing information</div>
                                </div>
                            </div>
                            <div class="disabled step">
                                <i class="info icon"></i>
                                <div class="content">
                                    <div class="title">Confirm Order</div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="ui ordered steps">
                            <div class="completed step">
                                <div class="content">
                                    <div class="title">Shipping</div>
                                    <div class="description">Choose your shipping options</div>
                                </div>
                            </div>
                            <div class="completed step">
                                <div class="content">
                                    <div class="title">Billing</div>
                                    <div class="description">Enter billing information</div>
                                </div>
                            </div>
                            <div class="active step">
                                <div class="content">
                                    <div class="title">Confirm Order</div>
                                    <div class="description">Verify order details</div>
                                </div>
                            </div>
                        </div>
                        <br>
                        A dog is a type of domesticated animal. Known for its loyalty and faithfulness, 
                        it can be found as a welcome guest in many households across the world.
                        </p>
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
                    <textarea></textarea>
                </div>

                <div class="required field">
                    <label>处方</label>
                    <div class="ui fluid action input">
                        <input type="text" placeholder="Search...">
                        <div class="ui button">Search</div>
                    </div>
                    <div class="ui segment" style="height:100px;">

                    </div>
                </div>
                <div class="ui styled fluid accordion">
                    <div class="title active">
                        <i class="dropdown icon"></i>
                        <!--What is a dog?-->
                        药库信息
                    </div>
                    <div class="content active">
                        <p class="transition visible" style="display: block !important;">
                            A dog is a type of domesticated animal. Known for its loyalty and faithfulness, 
                            it can be found as a welcome guest in many households across the world.
                        </p>
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
            </div>


        </div>
    </body>
    <script>
        $('.ui.styled.accordion').accordion({
            selector: {
                trigger: '.title'
            }
        });
        $(document).on("click", ".ui.indicating.progress", function () {
            $('.ui.indicating.progress').progress('increment', 30);
        });
    </script>
</html>
