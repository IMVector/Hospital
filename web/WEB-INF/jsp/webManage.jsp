<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
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
                            <button id="getSettingList" class="ui basic button violet">查询所有设置</button>
                            <div class="container-admin-inner">
                                <table id="databaseSettingTable" class="ui table violet">

                                </table>
                            </div>
                            <div>
                                <p id="pageText"></p>
                                <div id="pageButtons" class="mini ui basic buttons">

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
                            <br/>

                            <div class="ui header violet segment">
                                数据库备份管理
                            </div>

                            <button id="getbackpackFile" class="ui basic button violet">查询所有数据库备份</button>
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

        $(document).ready(function () {

            $("#getSettingList").click(function () {
                var url = 'backpackSettingList/page_key_word';
                fillForm("pageButtons", "pageText", "pageSelecter", currentPage = 1, url, showDatabaseSettingTable, getDatabaseSettingItemNum);
            });
            $("#pageSelecter").on("change", function () {
                var url = 'backpackSettingList/page_key_word';
                goToThPage("pageButtons", "pageText", "pageSelecter", url, showDatabaseSettingTable, getDatabaseSettingItemNum);
            });

            $("#getbackpackFile").click(function () {
                var url = 'databaseBackpackFileList/page_key_word';
                fillForm("pageButtons_1", "pageText_1", "pageSelecter_1", currentPage = 1, url, showDatabaseBackpackTable, getBackpackFileItemNum);
            })
            $("#pageSelecter_1").on("change", function () {
                var url = 'databaseBackpackFileList/page_key_word';
                goToThPage("pageButtons_1", "pageText_1", "pageSelecter_1", url, showDatabaseBackpackTable, getBackpackFileItemNum);
            });



        });



        $(document).on('click', '.settingBtn', function () {
            $(this).closest("tr").find(".myInput").each(function (index, element) {
                if (index == 0) {
                    //alert(index + "  " + $(this).val())
                    var id = $(this).val();
                    var url = "setSettting/" + id;
                    getSomethingByAjax(url, setting);
                }
            });

        });

        $(document).on("click", ".restoreBtn", function () {

            $(this).closest("tr").find(".table-label").each(function (index, element) {
                if (index == 0) {
                    var id = $(this).html().trim();
                    var url = "restore/" + id;
                    getSomethingByAjax(url, restore);

                }

            });
        });

        //删除当前行
        $(document).on("click", ".deleteBtn", function () {
            $(this).closest("tr").find(".table-label").each(function (index, element) {
                if (index == 0) {
                    var id = $(this).html().trim();
                    var url = "deleteRestore/" + id;
                    getSomethingByAjax(url, backpackDelete);
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
                        if (index == 0) {
                            var id = $(this).html().trim();
                            var url = "deleteRestore/" + id;
                            getSomethingByAjax(url, backpackDelete);
                        }

                    });
                }
            });
        }
        ;
        function showDatabaseSettingTable(data) {
            $("#databaseSettingTable").empty();
            $("#databaseSettingTable").append(" <thead><tr><th>设置编号</th><th>sql脚本路径</th><th>bat脚本路径</th><th>备份保存路径</th><th>操作</th></tr></thead>");
            $.each(data, function (index, detabaseSetting) {
                //var str = '<tr><td><div class="ui toggle checkbox"><input name="public" type="checkbox"><label></label></div></td><td> <label class="mylabel">编号1</label><div class="nonevisiual" ><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label  class="mylabel" for="">编号2</label><div class="nonevisiual" ><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label  class="mylabel" for="">编号3</label><div class="nonevisiual"><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label class="mylabel" for="">编号4</label><div class="nonevisiual"><input  class="myInput" style="width: 80%;" type="text"></div></td><td> <button class="ui button orange updatebtn">修改</button></td> <td> <button class="ui button orange deleteBtn">删除</button> </td> </tr>'
                var str = " <tr id=setting" + detabaseSetting.backpackSettingId + "><td>\n\
                                        <label class=\"mylabel table-label\" >" + detabaseSetting.backpackSettingId + "</label>\n\<div class=\"nonevisiual\" ><input value=" + detabaseSetting.backpackSettingId + " class=\"myInput\" style=\"width: 80%;\" type=\"text\"></div></td><td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + detabaseSetting.backpackSqlFile + "\" data-position=\"right center\">" + detabaseSetting.backpackSqlFile + "</label><div class=\"nonevisiual\" ><input value=" + detabaseSetting.backpackSqlFile + " class=\"myInput\"  style=\"width: 80%;\" type=\"file\"></div></td><td>\n\
                                     <label class=\"mylabel table-label\" data-content=\"" + detabaseSetting.backpackBatFile + "\" data-position=\"right center\">" + detabaseSetting.backpackBatFile + "</label><div class=\"nonevisiual\"><input value=" + detabaseSetting.backpackBatFile + " class=\"myInput\"  style=\"width: 80%;\" type=\"file\"></div></td><td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + detabaseSetting.backpackToPath + "\" data-position=\"right center\">" + detabaseSetting.backpackToPath + "</label><div class=\"nonevisiual\"><input value=" + detabaseSetting.backpackToPath + " class=\"myInput\"  style=\"width: 80%;\" type=\"file\"></div></td><td>\n\
                                        <button  class=\"ui button violet settingBtn\" >使用设置</button></tr>";
                //$("#databaseSettingTable").append(str);
                $("#databaseSettingTable").append(str);
            });
        }
        function showDatabaseBackpackTable(data) {
            $("#databaseBackpackFileTable").empty();
            $("#databaseBackpackFileTable").append(" <thead><tr><th>选择</th><th>文件编号</th><th>文件路径</th><th>备份时间</th><th style=\"padding-left: 10%\" colspan=\"2\">操作</th></tr></thead>");
            $.each(data, function (index, backpack) {
                //                var str = '<tr><td><div class="ui toggle checkbox"><input name="public" type="checkbox"><label></label></div></td><td> <label class="mylabel">编号1</label><div class="nonevisiual" ><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label  class="mylabel" for="">编号2</label><div class="nonevisiual" ><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label  class="mylabel" for="">编号3</label><div class="nonevisiual"><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label class="mylabel" for="">编号4</label><div class="nonevisiual"><input  class="myInput" style="width: 80%;" type="text"></div></td><td> <button class="ui button orange updatebtn">修改</button></td> <td> <button class="ui button orange deleteBtn">删除</button> </td> </tr>'
                var str = " <tr id=file" + backpack.backpackFileId + "><td><div class=\"ui toggle checkbox\"><input name=\"public\" type=\"checkbox\"><label></label></div></td><td>\n\
                                        <label class=\"mylabel table-label\" >" + backpack.backpackFileId + "</label>\n\<div class=\"nonevisiual\" ></td><td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + backpack.backpackFilePath + "\" data-position=\"right center\">" + backpack.backpackFilePath + "</label><div class=\"nonevisiual\" ></td><td>\n\
                                     <label class=\"mylabel table-label\" data-content=\"" + formatDateboxDetails(backpack.backpackTime) + "\" data-position=\"right center\">" + formatDateboxDetails(backpack.backpackTime) + "</label><div class=\"nonevisiual\"></td><td>\n\
                                        <button  class=\"ui button violet restoreBtn\" >还原</button></td><td><button class=\"ui button violet deleteBtn\">删除</button></td></tr>";
                //                $("#databaseSettingTable").append(str);
                $("#databaseBackpackFileTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });

        function getDatabaseSettingItemNum() {
            var itemNum = 0;
            $.ajax({
                url: "backpackSettingListItemNum",
                type: 'POST',
                async: false,
                data: {},
                success: function (data, textStatus, jqXHR) {
                    //返回List项目总数量
                    itemNum = data
                },
                error: function (jqXHR, textStatus, errorThrown) {
//                    alert("请求失败，请重试！");
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });
            return itemNum;
        }
        function setting(data) {

//            alert("设置成功！可以进行还原！");
            toastSuccess("设置成功！可以进行还原");
        }
        function restore(data) {
            if (data == true) {
//                alert("还原成功！");
                toastSuccess("还原成功");
            } else {
//                alert("还原失败！");
                toastError("还原失败");
            }

        }

        function backpackDelete(data) {
            if (data >= 0) {

                $("#file" + data).remove();
//                alert("删除成功" + data);
                toastSuccess("删除成功");

            } else {
//                alert("删除失败");
                toastError("删除失败,请重试！");
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
                    itemNum = data
                },
                error: function (jqXHR, textStatus, errorThrown) {
//                    alert("请求失败，请重试！");
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });
            return itemNum;
        }

    </script>

</html>
