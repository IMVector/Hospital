
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
                <a href="staff/goToManageStaffIndex" class="item">                            
                    医院管理主页
                </a>
                <a class="item" href="staff/goToManageStaff">员工管理</a>
                <a href="staff/goToDepartmentManage" class="item">部门管理</a>
                <a class="item" href="staff/goToTitleManage">职称管理</a>
                <a class="item" href="staff/goToRoleManage">角色管理</a>
                <a href="staff/goToCheckItemManage" class="item">检查项目管理</a>
                <a href="staff/goToBloodbank" class="item">血库信息管理 </a>
                <a href="staff/goToMedicineManage" class="item">药品信息管理 </a>
            </div>

            <div class="item right">
                <c:if test="${empty manageStaff}">
                    <a href="staff/goToLogin" class=" ui blue button">登录</a>
                    &nbsp
                    &nbsp
                    <!--<a href="staff/goToRegister" class="ui blue button">注册</a>-->

                </c:if>
                <c:if test="${ not empty manageStaff}">
                    <a href="staff/goToStaffPersonnelCenter">
                        <img class="ui avatar image" src="${manageStaff.image.imagePath}">
                    </a>
                    <a class="ui blue" href="staff/manageUnload">退出</a>
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
                <a href="staff/goToManageStaffIndex" class="item">                            
                    医院管理主页
                </a>
                <a class="item" href="staff/goToManageStaff">员工管理</a>
                <a href="staff/goToDepartmentManage" class="item">部门管理</a>
                <a class="item" href="staff/goToTitleManage">职称管理</a>
                <a class="item" href="staff/goToRoleManage">角色管理</a>
                <a href="staff/goToCheckItemManage" class="item">检查项目管理</a>
                <a href="staff/goToBloodbank" class="item">血库信息管理 </a>
                <a href="staff/goToMedicineManage" class="item">药品信息管理 </a>
            </div>
            <div class="item right">
                <c:if test="${empty manageStaff}">
                    <a href="staff/goToLogin" class=" ui blue button">登录</a>
                    &nbsp
                    &nbsp
                    <!--<a href="staff/register" class="ui blue button">注册</a>-->

                </c:if>
                <c:if test="${ not empty manageStaff}">
                    <a href="staff/goToStaffPersonnelCenter">
                        <img class="ui avatar image" src="${manageStaff.image.imagePath}">
                    </a>
                    <a class="ui blue" href="staff/manageUnload">退出</a>
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