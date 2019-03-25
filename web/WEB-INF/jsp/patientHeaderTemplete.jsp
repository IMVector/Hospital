<%-- 
    Document   : templete
    Created on : 2018-5-18, 8:36:08
    Author     : Vector
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ui four column grid">
    <div class="computer only one column row">

        <div class="ui top fixed menu">
            <div class="ui secondary menu">
                <div class="item">
                    <img class="myLogo" src="resources/image/狗子.jpeg">
                </div>
                <a href="index" class="active item">
                    InstalHMS 医院系统
                </a>
                <a href="patientIndex" class="item">
                    患者主页
                </a>

                <a href="personalCenter" class="item">个人中心</a>
            </div>
            <div class="item right">
                <c:if test="${empty patient}">
                    <a href="patient/goToLogin" class=" ui blue button">登录</a>
                    &nbsp
                    &nbsp
                    <a href="patient/goToRegister" class="ui blue button">注册</a>

                </c:if>
                <c:if test="${ not empty patient}">
                    <a href="personalCenter">
                        <img class="ui avatar image" src="${patient.image.imagePath}">
                    </a>
                    <a class="ui blue" href="unload">退出</a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="tablet only column">
        <div class="ui top fixed menu">
            <div class="ui secondary menu">
                <div class="item">
                    <img class="myLogo" src="resources/image/狗子.jpeg">
                </div>
                <a href="index" class="active item">
                    InstalHMS 医院系统
                </a>
                <a href="patientIndex" class="item">
                    患者主页
                </a>

                <a href="personalCenter" class="item">个人中心</a>
            </div>
            <div class="item right">
                <c:if test="${empty patient}">
                    <a href="patient/signup" class=" ui blue button">登录</a>
                    &nbsp
                    &nbsp
                    <a href="patient/register" class="ui blue button">注册</a>

                </c:if>
                <c:if test="${ not empty patient}">
                    <a href="personalCenter">
                        <img class="ui avatar image" src="${patient.image.imagePath}">
                    </a>
                    <a class="ui blue" href="unload">退出</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<br><br>
<br>
<br>

<script>
    $(document).ready(function () {
        $.ajax({
            url: "getLogo",
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                $(".myLogo").attr("src", data.imagePath);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                toastError("请求失败" + errorThrown);
            }
        });
    });

</script>
<!-- Fixed navbar -->
<!--<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">导航栏</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">InstalHMS 医院系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index">患者主页</a></li>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">科室导航<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">内科</a></li>
                        <li><a href="#">外科</a></li>
                        <li><a href="#">检验科</a></li>
                        <li><a href="#">输血科</a></li>
                        <li><a href="#">放射科</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">病友服务<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">预约挂号</a></li>
                        <li><a href="#">饮食建议</a></li>
                        <li><a href="#">疾病预防</a></li>
                    </ul>
                </li>
                <li><a href="#about">关于我们</a></li>
                <li><a href="#contact">联系方式</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../navbar/">Default</a></li>
                <li>
                    <a href="personalCenter" class="navbar-brand">
                        <img src="resources/image/狗子.jpeg" class="img-circle" alt="资源丢失" style="height: 30px;">
                    </a>
                </li>
                            <li><a href="../navbar-static-top/">Static top</a></li>
                            <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
            </ul>
        </div>/.nav-collapse 
    </div>
</nav>
-->
