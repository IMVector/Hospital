<%-- 
    Document   : task
    Created on : 2018-5-19, 10:30:04
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>任务</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #taskTable td{
                text-align: center;
                vertical-align:middle;
            }
            #taskTable th{
                text-align: center;
                vertical-align:middle;
            }
        </style>
    </head>

    <body>
        <jsp:include page="staffHeaderTemplete.jsp" />
        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    任务信息
                </div>
                <div class="container-inner">
                    <table id="taskTable" class="ui blue table">
                    </table>
                </div>

                <div>
                    <p id="pageText"></p>
                    <div id="taskPageButtons" class="mini ui basic buttons">

                    </div>
                    <div>
                        <label for="" class="ui label">跳转到：</label>
                        <!--发送ajax请求-->
                        <select id="pageSelecter" class="ui dropdown">
                            <option value="">页码</option>
                            <!--<option value="1">1</option>-->
                        </select>
                    </div>
                </div>
            </div>
            <!--<div id="pageNumber" class="nonevisiual"></div>-->
        </div>
    </body>
    <script>

        $(document).ready(function () {
            var url = 'staff/unfinishedTaskList/page_key_word';
            fillForm("taskPageButtons", "pageText", "pageSelecter", currentPage = 1, url, taskTableInfo, getTaskItemNumber);
            $("#task").click(function () {
                var url = 'staff/unfinishedTaskList/page_key_word';
                fillForm("taskPageButtons", "pageText", "pageSelecter", currentPage = 1, url, taskTableInfo, getTaskItemNumber);
            });

            $("#pageSelecter").on("change", function () {
                var url = 'staff/unfinishedTaskList/page_key_word';
                goToThPage("taskPageButtons", "pageText", "pageSelecter", url, taskTableInfo, getTaskItemNumber);
            });
        });

        function taskTableInfo(data) {
            $("#taskTable").empty();
            $("#taskTable").append("<thead><tr> <th style='width:100px;'>任务编号</th><th style='width:100px;'>病人姓名</th><th>任务日期</th><th>检查重点</th><th>检查是否完成</th><th>查看详情</th></tr></thead>");
            $.each(data, function (index, task) {
                var str = "<tr id=" + task.taskId + ">\n\
                    <td style='width:100px;'>" + task.taskId + "</td><td>" + task.patient.patientName + "</td>\n\
                    <td style='width:100px;'><label class=\"mylabel\" data-content=\"" + formatDatebox(task.date) + "\" data-position=\"top left\">" + formatDatebox(task.date) + "</label></td>\n\
                    <td style='width:300px;'><label class=\"mylabel\" data-content=\"" + task.taskContent + "\" data-position=\"top left\">" + task.taskContent + "</label></td>\n\
                    <td style='width:100px;'><label class=\"mylabel\" data-content=\"" + task.taskStatus + "\" data-position=\"top left\">" + task.taskStatus + "</label></td>\n\
                    <td style='width:100px;'> <a  class='ui button small blue' href='staff/goToTaskDetails/" + task.taskId + "'>查看</a> </td>\n\</tr>";

                $("#taskTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

        /**
         * 查询数据库中当前病人的所有病例数量 这是一个同步请求
         * @returns {data|Number} 返回病例数量
         */
        function getTaskItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/unfinishedTaskListItemNumber",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
            return itemNum;
        }






    </script>
</html>
