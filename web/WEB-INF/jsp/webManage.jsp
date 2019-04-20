<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>网站管理</title>
        <style>
            #databaseBackpackFileTable th{
                text-align: center;
                vertical-align:middle;
            }
            #databaseBackpackFileTable td{
                text-align: center;
                vertical-align:middle;
            }
        </style>
    </head>

    <body>
        <jsp:include page="adminHeaderIndex.jsp" />

        <div class="ui fluid-container body-under-header">
            <div class="ui segment ">

                <div class="ui grid">

                    <jsp:include page="adminMenuTemplete.jsp"/>
                    <div class="eleven wide column">
                        <div class="ui segment">
                            <div class="ui header violet segment">
                                数据库备份设置
                            </div>

                            <table class="ui celled striped table">
                                <thead>
                                    <tr>
                                        <th>mysql安装路径(bin目录)</th>
                                        <th>备份文件保存路径</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td id="environment">C:\\mysql\\bin\\</td>
                                        <td id="save_path">D:\\</td>
                                    </tr>
                                </tbody>
                            </table>
                            <br/>

                            <div class="ui header violet segment">
                                数据库备份管理
                            </div>

                            <button id="getbackpackFile" class="ui button violet">查询所有数据库备份</button>
                            <br><br>
                            <div class="container-admin-inner">
                                <table id="databaseBackpackFileTable" class="ui table violet">

                                </table>
                            </div>
                            <div>
                                <p id="pageText_1"></p>
                                <div id="pageButtons_1" class="mini ui basic buttons">

                                </div>
                                <div>
                                    <label for="" class="ui label">跳转到：</label>
                                    <!--发送ajax请求-->
                                    <select id="pageSelecter_1" class="ui dropdown">
                                        <option value="">页码</option>
                                        <!--<option value="1">1</option>-->
                                    </select>
                                </div>
                            </div>
                            <br/>
                            <div>
                                <button class="ui button violet" onclick="selectAll()">全选</button>
                                <button class="ui button violet" onclick="deleteAll()">全部删除</button>
                            </div>



                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- /container -->
        <jsp:include page="footerTemplete.jsp" />
    </body>
    <script>
        created();
        function created() {
            $.ajax({
                url: "getBackpackSetting",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $("#environment").empty();
                    $("#save_path").empty();
                    $("#environment").append(data["environment"]);
                    $("#save_path").append(data["save_path"]);

                    console.log(data["environment"]);
                    console.log(data["save_path"]);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败！");
                }
            });
        }

        $(document).ready(function () {
            var url = 'databaseBackpackFileList/page_key_word';
            fillForm("pageButtons_1", "pageText_1", "pageSelecter_1", currentPage = 1, url, showDatabaseBackpackTable, getBackpackFileItemNum);
            $("#getbackpackFile").click(function () {
                var url = 'databaseBackpackFileList/page_key_word';
                fillForm("pageButtons_1", "pageText_1", "pageSelecter_1", currentPage = 1, url, showDatabaseBackpackTable, getBackpackFileItemNum);
            });
            $("#pageSelecter_1").on("change", function () {
                var url = 'databaseBackpackFileList/page_key_word';
                goToThPage("pageButtons_1", "pageText_1", "pageSelecter_1", url, showDatabaseBackpackTable, getBackpackFileItemNum);
            });
        });



        $(document).on("click", ".restoreBtn", function () {
            $(this).closest("tr").find(".table-label").each(function (index, element) {
                if (index === 0) {
                    var id = $(this).html().trim();
                    var url = "restore/" + id;
                    getSomethingByAjax(url, restore);
                }
            });
        });

        //删除当前行
        $(document).on("click", ".deleteBtn", function () {
            $(this).closest("tr").find(".table-label").each(function (index, element) {
                if (index === 0) {
                    var id = $(this).html().trim();
                    console.log(id);
                    var url = "deleteRestore/" + id;
                    $.ajax({
                        url: url,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            if (data === true) {
                                $("#file" + id).remove();
                                toastSuccess("删除成功");
                            } else {
                                toastError("删除失败,请重试！");
                            }
                        }, error: function (jqXHR, textStatus, errorThrown) {
                            toastError("请求失败,请重试！");
                        }
                    });
                }
            });
        });
        //全部选中函数
        function selectAll() {
            $(".ui.toggle.checkbox").checkbox("toggle");
        }

        //删除选中的
        function deleteAll() {
            $(".ui.toggle.checkbox").each(function (index, element) {
                if ($(this).checkbox("is checked")) {
                    var id = $(this).closest("tr").find(".mylabel").each(function (index, element) {
                        if (index === 0) {
                            var id = $(this).html().trim();
                            var url = "deleteRestore/" + id;
                            $.ajax({
                                url: url,
                                type: 'POST',
                                success: function (data, textStatus, jqXHR) {
                                    if (data === true) {
                                        $("#file" + id).remove();
                                        toastSuccess("删除成功");
                                    } else {
                                        toastError("删除失败,请重试！");
                                    }
                                }, error: function (jqXHR, textStatus, errorThrown) {
                                    toastError("请求失败,请重试！");
                                }
                            });
                        }
                    });
                }
            });
        }
        ;
        function showDatabaseBackpackTable(data) {
            $("#databaseBackpackFileTable").empty();
            $("#databaseBackpackFileTable").append(" <thead><tr><th>选择</th><th>文件编号</th><th>文件路径</th><th>备份时间</th><th>操作</th></tr></thead>");
            $.each(data, function (index, backpack) {
                var str = " <tr id=file" + backpack.backpackFileId + ">\n\
                <td style='width:80px'><div class='ui toggle checkbox'><input name='public' type='checkbox'><label></label></div></td>\n\
                <td style='width:60px'><label class='mylabel table-label' >" + backpack.backpackFileId + "</label>\n\<div class='nonevisiual' ></td>\n\
                <td style='max-width:150px'><label class='mylabel table-label' data-content='" + backpack.backpackFilePath + "' data-position='right center'>" + backpack.backpackFilePath + "</label></td>\n\
                <td style='max-width:150px'><label class='mylabel table-label' data-content='" + formatDateboxDetails(backpack.backpackTime) + "' data-position='right center'>" + formatDateboxDetails(backpack.backpackTime) + "</label></td>\n\
                <td style='width:150px'><button class='ui mini button violet restoreBtn'>还原</button><button class='ui mini button violet deleteBtn'>删除</button></tr>";
                $("#databaseBackpackFileTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

        function restore(data) {
            if (data === true) {
                toastSuccess("还原成功");
            } else {
                toastError("还原失败");
            }

        }

        function getBackpackFileItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "backpackFileListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });
            return itemNum;
        }

    </script>

</html>
