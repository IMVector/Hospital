
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
                <a href="staff/goToStaffIndex" class="item">
                    医生主页
                </a>
                <a href="personalCenter1" class="item">查看病人就诊记录</a>
                <a href="personalCenter2" class="item">查看病人处方记录</a>
                <a href="personalCenter3" class="item">查看病人检查记录</a>
                <a href="personalCenter4" class="item">查询药品</a>
                <a href="personalCenter5" class="item">安排事项</a>
            </div>
            <div class="item right">
                <c:if test="${empty staff}">
                    <a href="staff/goToStaffLogin" class=" ui blue button">登录</a>
                    &nbsp
                    &nbsp
                    <!--<a href="staff/goToRegister" class="ui blue button">注册</a>-->

                </c:if>
                <c:if test="${ not empty staff}">
                    <a href="personalCenter">
                        <img class="ui avatar image" src="${staff.image.imagePath}">
                    </a>
                    <a class="ui blue" href="staff/unload">退出</a>
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
                <a href="staff/goToStaffIndex" class="item">
                    医生主页
                </a>
                <a href="personalCenter1" class="item">查看病人就诊记录</a>
                <a href="personalCenter2" class="item">查看病人处方记录</a>
                <a href="personalCenter3" class="item">查看病人检查记录</a>
                <a href="personalCenter4" class="item">查询药品</a>
                <a href="personalCenter5" class="item">安排事项</a>
                <a href="personalCenter6" class="item">个人中心</a>
            </div>
            <div class="item right">
                <c:if test="${empty staff}">
                    <a href="staff/goToStaffLogin" class=" ui blue button">登录</a>
                    &nbsp
                    &nbsp
                    <!--<a href="staff/register" class="ui blue button">注册</a>-->

                </c:if>
                <c:if test="${ not empty staff}">
                    <a href="personalCenter">
                        <img class="ui avatar image" src="${staff.image.imagePath}">
                    </a>
                    <a class="ui blue" href="staff/unload">退出</a>
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

