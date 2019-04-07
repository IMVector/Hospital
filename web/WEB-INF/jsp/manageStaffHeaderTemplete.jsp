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
                <a href="staff/staffIndex" class="item">                            
                    医院管理主页
                </a>
                <!--                <div class="ui dropdown item">
                                    人员管理
                                    <i class="dropdown icon"></i>
                                    <div class="menu">
                                        <a class="item" href="staff/goToManageStaff">员工管理</a>
                                        <a class="item">员工出勤管理</a>
                                    </div>
                                </div>-->
                <a class="item" href="staff/goToManageStaff">员工管理</a>
                <a href="staff/goToDepartmentManage" class="item">部门管理</a>
                <a class="item" href="staff/goToTitleManage">职称管理</a>
                <a class="item" href="staff/goToRoleManage">角色管理</a>

                <!--<a href="personalCenter3" class="item">岗位管理</a>-->
                <a href="staff/goToCheckItemManage" class="item">检查项目管理</a>
                <a href="staff/goToBloodBank" class="item">血库信息管理 </a>
                <a href="staff/goToMedicineManage" class="item">药品信息管理 </a>
            </div>

            <div class="item right">
                <c:if test="${empty staff}">
                    <a href="staff/goToLogin" class=" ui blue button">登录</a>
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
                <a href="staff/staffIndex" class="item">                            
                    医院管理主页
                </a>
                <a href="personalCenter1" class="item">部门管理</a>
                <!--<a href="personalCenter2" class="item">人员管理</a>-->
                <div class="ui dropdown item">
                    人员管理
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <div class="item">员工管理</div>
                        <div class="item">员工角色管理</div>
                        <div class="item">员工部门管理</div>
                        <!--<div class="divider"></div>-->
                        <div class="item">员工出勤管理</div>
                        <!--<div class="divider"></div>-->
                        <div class="item">员工职称管理</div>
                        <div class="item">员工岗位管理</div>
                    </div>
                </div>
                <a href="personalCenter3" class="item">岗位管理</a>
                <a href="personalCenter4" class="item">检查项目管理</a>
                <a href="personalCenter5" class="item">血库信息管理 </a>
            </div>
            <div class="item right">
                <c:if test="${empty staff}">
                    <a href="staff/goToLogin" class=" ui blue button">登录</a>
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