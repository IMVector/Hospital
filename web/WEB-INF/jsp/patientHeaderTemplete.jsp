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
<br>
<br>
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

