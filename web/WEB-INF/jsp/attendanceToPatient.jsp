<%-- 
    Document   : attendanceToPatient
    Created on : 2019-3-17, 19:39:31
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>挂号预约</title>
        <jsp:include page="resourcesTemplete.jsp" />
    </head>
    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />
        <div class="ui fluid-container">
            <div class="ui centered grid">

                <div class="twelve wide column">

                    <div>
                        <div class="ui fluid action input">
                            <input type="text" placeholder="Search...">
                            <select class="ui compact selection dropdown">
                                <option value="department">科室名称</option>
                                <option value="Staff">专家姓名</option>
                            </select>
                            <div class="ui primary button">查询</div>
                        </div>
                    </div>
                    <br>
                    <div>
                        <div id="departmentList" class="ui grid">
                            <!--<div class="two wide column"><button class="ui button">test</button></div>-->
                        </div>
                        <br>
                        <div class="ui styled fluid accordion">
                            <div class="title">
                                <i class="dropdown icon"></i>
                                更多部门>>
                            </div>
                            <div class="content">
                                <div id="departmentList_" class="ui grid">
                                    <!--<div class="two wide column"><button class="ui button">test</button></div>-->
                                </div>
                            </div>
                        </div>
                    </div>


                    <table id="staffTable" class="ui celled table">
                    </table>
                    <div>
                        <p id="pageText"></p>
                        <div id="PageButtons" class="mini ui basic buttons">

                        </div>
                        <label for="" class="ui label">跳转到：</label>
                        <!--发送ajax请求-->
                        <select id="pageSelecter" class="ui dropdown">
                            <option value="">页码</option>
                            <!--<option value="1">1</option>-->
                        </select>
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
        $(document).ready(function () {
            if (${departmentId} === -1) {
                var url = 'staff/staffList/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, staffTableInfo, staffItemNum);
            } else {
                var url = "staff/getStaffByDepartment/${departmentId}/page_key_word";
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, staffTableInfo, staffByDepartmentItemNum);
            }

            var url = 'staff/departmentList/page_key_word';
            fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, departmentTableInfo, getDepartmentItemNumber);

            requestDepartmentList("#departmentList_");
        });

        $("#pageSelecter").on("change", function () {
            var url = 'staff/staffList/page_key_word';
            goToThPage("PageButtons", "pageText", "pageSelecter", url, staffTableInfo, staffItemNum);
        });
        function staffTableInfo(data) {
            $("#staffTable").empty();
            $("#staffTable").append("<thead><tr><th>科室名称</th><th>医生</th><th>职称</th><th>专业</th><th>预约</th></tr></thead>");
            $("#staffTable").append("<tbody></tbody>");
            $.each(data, function (index, staff) {
                var str = "\
                <tr>\n\
                    <td>" + staff.department.departmentName + "</td>\n\
                    <td>" + staff.staffName + "</td>\n\
                    <td>" + staff.title.titleName + "</td>\n\
                    <td>" + staff.specialty + "</td>\n\
                    <td><a href='patient/goToReservation/" + staff.staffId + "'>预约</a></td>\n\
                </tr>";
                $("#staffTable tbody").append(str);
            });
        }
        function staffItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "staff/staffListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
            return itemNum;
        }

        //ajax回调函数，显示部门信息
        function departmentTableInfo(data) {
            $("#departmentList").empty();
            $.each(data, function (index, department) {
                var str = "<div class='two wide column'><a class='ui button'>" + department.departmentName + "</a></div>";
                $("#departmentList").append(str);
            });
        }
        //获取数据库中的总数量
        function getDepartmentItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/departmentListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！");
                }
            });
            return itemNum;
        }
        function requestDepartmentList(id) {
            $.ajax({
                url: "staff/getDepartmentList",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $(id).empty();
                    $.each(data, function (index, department) {
                        var str = "<div class='two wide column'><a class='ui button'>" + department.departmentName + "</a></div>";
                        $(id).append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
        }
        function staffByDepartmentItemNum() {
            var itemNum = 0;
            var departmentId =${departmentId};
            $.ajax({
                url: "staff/getStaffByDepartmentItemNum/" + departmentId,
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！");
                }
            });
            return itemNum;
        }
    </script>
</html>
