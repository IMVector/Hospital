
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>患者主页</title>
    </head>
    <style>
        .div-overflow{
            overflow: hidden;
            height: 300px; 
            transform: scale(1,1);
            -webkit-transform: scale(1,1);
        }
        .image-text{
            width: 100%;
            height: 100%;
            display:flex;
            /*主轴居中对齐*/
            justify-content: center;
            /*侧轴居中对齐*/    
            align-items: center;  
        }
        a{ 
            text-decoration: none;
            color: #333;

        }

        .image-text {
            text-align: center;
        }
        /*button 4*/
        .set-btn-wrapper {
            float:left;
            width:auto;
            line-height: 45px;
            display: inline-block;
            /*margin-right:2em;*/
            text-align:center;
        }
        #set_text {
            margin-top:-60px;
            text-align: center;
        }

        #set_text a {
            color: #333;
            text-decoration: none;
            font-weight:bold;
            font-size: 20px;
        }
        #set_button {
            stroke-width: 6px;
            fill: transparent;
            stroke: #dd483f ;
            stroke-dasharray: 85 400;
            stroke-dashoffset: -228;
            transition: 0.5s all ease;
        }
        .set-btn-wrapper:hover #set_button {
            stroke-dasharray: 50 0;
            stroke-width: 6px;
            stroke-dashoffset: 0;
            stroke: #dd483f;
        }
    </style>
</head>
<body>
    <jsp:include page="patientHeaderTemplete.jsp" />

    <div class="ui container">
        <div class="ui segment">
            <div class="ui grid">
                <div class="four wide column div-overflow" style="background:url(resources/image/backgroundImage/11.jpg);">
                    <div class="image-text">
                        <div>
                            <i class="id card huge icon"></i>
                            <div>
                                <br>
                                <div class="set-btn-wrapper"> 
                                    <svg height="45" width="150" xmlns="#">
                                    <rect id="set_button" height="45" width="150"></rect>
                                    </svg>

                                    <div id="set_text"> 
                                        <a href="patient/goToMedicalRecord">         
                                            病历
                                        </a> 
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div> 

                </div>
                <div class="four wide column div-overflow" style="background:url(resources/image/backgroundImage/22.jpg);">
                    <div class="image-text">
                        <div>
                            <i class="file alternate outline huge icon"></i>
                            <div>
                                <br>
                                <div class="set-btn-wrapper"> 
                                    <svg height="45" width="150" xmlns="#">
                                    <rect id="set_button" height="45" width="150"></rect>
                                    </svg>

                                    <div id="set_text"> 
                                        <a href="patient/goToHealthGraphy">         
                                            就医大数据
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> 
                </div>
                <div class="four wide column div-overflow" style="background:url(resources/image/backgroundImage/33.jpg);">
                    <div class="image-text">
                        <div>
                            <i class="user md huge icon"></i>
                            <div>
                                <br>
                                <div class="set-btn-wrapper"> 
                                    <svg height="45" width="150" xmlns="#">
                                    <rect id="set_button" height="45" width="150"></rect>
                                    </svg>

                                    <div id="set_text"> 
                                        <a href="patient/goToAttendanceToPatient/-1">         
                                            挂号
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> 

                </div>
                <div class="four wide column div-overflow" style="background:url(resources/image/backgroundImage/44.jpg);">
                    <div class="image-text">
                        <div>
                            <!--<i class="heart outline huge icon"></i>-->
                            <i class="comment outline huge icon"></i>
                            <div>
                                <br>
                                <div class="set-btn-wrapper"> 
                                    <svg height="45" width="150" xmlns="#">
                                    <rect id="set_button" height="45" width="150"></rect>
                                    </svg>

                                    <div id="set_text"> 
                                        <a href="patient/goToPatientAdvice">         
                                            健康建议
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> 
                </div>
                <div class="four wide column " style="background:url(resources/image/backgroundImage/55.jpg);">
                    <div class="image-text">
                        <div>
                            <!--<i class="pills huge icon"></i>-->
                            <div>
                                <br>
                                <!--                                        <div class="set-btn-wrapper"> 
                                                                            <svg height="45" width="150" xmlns="#">
                                                                            <rect id="set_button" height="45" width="150"></rect>
                                                                            </svg>
                                
                                                                            <div id="set_text"> 
                                                                                <a href="patient/goToPatientPrescription">         
                                                                                    处方信息
                                                                                </a> 
                                                                            </div>
                                                                        </div>-->
                            </div>
                        </div>

                    </div> 
                </div>
                <div class="four wide column div-overflow" style="background:url(resources/image/backgroundImage/66.jpg);">
                    <div class="image-text">
                        <div>
                            <!--                                    <i class="calculator huge icon"></i>-->
                            <i class="server huge icon"></i>
                            <div>
                                <br>
                                <div class="set-btn-wrapper"> 
                                    <svg height="45" width="150" xmlns="#">
                                    <rect id="set_button" height="45" width="150"></rect>
                                    </svg>

                                    <div id="set_text"> 
                                        <a href="patient/goToCheckRecord">         
                                            检查记录
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> 
                </div>
                <div class="four wide column div-overflow" style="background:url(resources/image/backgroundImage/77.jpg);">
                    <div class="image-text">
                        <div>
                            <i class="calculator huge icon"></i>
                            <div>
                                <br>
                                <div class="set-btn-wrapper"> 
                                    <svg height="45" width="150" xmlns="#">
                                    <rect id="set_button" height="45" width="150"></rect>
                                    </svg>

                                    <div id="set_text"> 
                                        <a href="patient/goToBill">         
                                            账单信息
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> 

                </div>
                <div class="four wide column" style="background:url(resources/image/backgroundImage/88.jpg);">
                    <div class="image-text">
                        <div>
                            <!--<i class="map signs huge icon"></i>-->  
                            <div>
                                <br>
                                <!--                                        <div class="set-btn-wrapper"> 
                                                                            <svg height="45" width="150" xmlns="#">
                                                                            <rect id="set_button" height="45" width="150"></rect>
                                                                            </svg>
                                
                                                                            <div id="set_text"> 
                                                                                <a href="#">         
                                                                                    医生安排
                                                                                </a> 
                                                                            </div>
                                                                        </div>-->
                            </div>
                        </div>

                    </div> 

                </div>
            </div>
        </div>

        <!--</div>-->
        <div class="ui divider"></div>
        <div class="ui green segment">
            <h3>科室导航</h3>
        </div>
        <div class="ui segment">
            <div class="ui fluid action input">
                <input id="departmentByName" type="text" placeholder="搜索科室">
                <button id="departmentByNameBtn" type="button" class="ui icon button">
                    <i class="search icon"></i>
                </button>
            </div>
            <br>
            <div class="ui grid">
                <div class="ui row">
                    <div class="six wide column">
                        <img id="departmentImage" src="resources/image/backgroundImage/88.jpg" alt="">
                    </div>
                    <div class="ten wide column">
                        <div id="department" class="ui grid">
                            <!--<div class="four wide column">  <a class="ui primary button" href="patient/goToDepartmentInfo/test">test</a></div>-->
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</body>
<script>
    $(".four.wide.column.div-overflow").mouseenter(function () {
        $(this).transition({animation: 'pulse', duration: 600});
    });

    $("#department").empty();
    requestDepartmentList("#department");
    function requestDepartmentList(id) {
        $.ajax({
            url: "staff/getDepartmentList",
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                $.each(data, function (index, department) {
                    if (index === 0) {
                        $("#departmentImage").attr("src", department.image.imagePath);
                    }
                    if (index < 32) {
                        var str = "<div class=\"four wide column\">  <a class=\"ui primary button\" href=\"patient/goToDepartmentInfo/" + department.departmentId + "\">" + department.departmentName + "</a></div>";
                        $(id).append(str);
                    }
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                toastError("请求失败,请重试！");
            }
        });
    }
    $(document).on("click", "#departmentByNameBtn", function () {
        $("#department").empty();
        var name = $("#departmentByName").val();
        $.ajax({
            url: "staff/getDepartmentByName/" + name,
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                $.each(data, function (index, department) {
                    if (index === 0) {
                        $("#departmentImage").attr("src", department.image.imagePath);
                    }
                    if (index < 32) {
                        var str = "<div class=\"four wide column\">  <a class=\"ui primary button\" href=\"patient/goToDepartmentInfo/" + department.departmentId + "\">" + department.departmentName + "</a></div>";
                        $("#department").append(str);
                    }
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                toastError("请求失败,请重试！");
            }
        });
    });
</script>
</html>
