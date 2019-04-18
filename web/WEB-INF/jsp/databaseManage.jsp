<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            .mylabel{
                display: block;
                text-overflow:ellipsis;overflow: hidden;white-space: nowrap;width:60px;
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
                        <div class="ui segment container-admin-outer" style="overflow:scroll">
                            <div class="ui header orange segment">
                                数据库管理
                            </div>
                            <table>
                                <tr>
                                    <td>
                                        <button id="getList" class="ui basic button orange">查询备份设置列表</button>
                                    </td>
                                    <td>
                                        <button id="addSetting" class="ui basic button orange">添加备份设置</button>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                            <div class="container-admin-inner">
                                <table id="databaseSettingTable" class="ui table orange">

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
                            <div>
                                <button id="selectAll" class="ui button orange">全选</button>
                                <button id="updateAll" class="ui button orange">全部更新</button>
                                <button id="deleteAll" class="ui button orange">全部删除</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div id="modeltest" class="ui inverted modal ">
                <div class="header">添加设置信息</div>
                <div class="content" style="text-align:center">
                    <div class="ui segment" style="width: 50%;margin: 0 auto">
                        <div class="ui header blue segment">设置信息</div>
                        <form id="backSetting">


                            <div class="field">
                                <label for="">sql脚本路径：</label>
                                <div class="ui input ">
                                    <input name="backpackSqlFile" placeholder="sql脚本路径" type="text">
                                </div>
                            </div>
                            <br/>
                            <div class="field">
                                <label for="">bat脚本路径：</label>
                                <div class="ui input ">
                                    <input name="backpackBatFile" placeholder="bat脚本路径" type="text">
                                </div>
                            </div>
                            <br/>
                            <div class="field">
                                <label for="">份保存路径：</label>
                                <div class="ui input ">
                                    <input name="backpackToPath" placeholder="份保存路径" type="text">
                                </div>
                            </div>


                        </form>

                    </div>
                </div>
                <div class="actions">
                    <div class="ui black deny button">取消 </div>
                    <div class="ui positive right labeled icon button">添加 <i class="checkmark icon"></i> </div>
                </div>
            </div>
        </div>
        <!-- /container -->
        <%--<jsp:include page="footerTemplete.jsp" />--%>
        <jsp:include page="warningModel.jsp"/>
    </body>
    <script>
        $("#addSetting").click(function () {
            $('#modeltest')
                    .modal({
                        inverted: true,
                        closable: false,
                        onDeny: function () {

                            return true;
                        },
                        onApprove: function () {

                            $.ajax({
                                url: 'addBackpackSetting',
                                type: 'POST',
                                async: false,
                                data: $("#backSetting").serialize(), //将表单的数据编码成一个字符串提交给服务器
                                success: function (data) {
                                    if (data) {
                                        toastSuccess("添加成功");
                                    } else {
                                        toastError("添加失败");
                                    }

                                },
                                error: function (req, status, error) {
                                    toastError("请求失败，请重试！" + error);
                                }
                            });
                        }
                    })
                    .modal('show')
                    ;
        });

        $(document).ready(function () {

            $("#getList").click(function () {
                var url = 'backpackSettingList/page_key_word';
                fillForm("pageButtons", "pageText", "pageSelecter", currentPage = 1, url, showDatabaseSettingTable, getDatabaseSettingItemNum);
            });
            $("#pageSelecter").on("change", function () {
                var url = 'backpackSettingList/page_key_word';
                goToThPage("pageButtons", "pageText", "pageSelecter", url, showDatabaseSettingTable, getDatabaseSettingItemNum);
            });

        });


        //全部更新
        $("#updateAll").on("click", function () {
            if ($(this).text() == "全部更新") {
                $(this).text("全部保存");
            } else {
                $(this).text("全部更新");

                //发送ajax请求更新全部选中
                $(".ui.toggle.checkbox").each(function (index, element) {
                    if ($(this).checkbox("is checked")) {
                        var id, sqlPath, batPath, saveLocation;
                        id = $(this).closest("tr").attr("id");
                        $(this).closest("tr").find(".myInput").each(function (index, element) {
                            //在这里发送ajax请求    
                            switch (index) {
                                case 0:
                                    sqlPath = $(this).val();
                                    break;
                                case 1:
                                    batPath = $(this).val();
                                    break;
                                case 2:
                                    saveLocation = $(this).val();
                                    break;
                            }
                        });
                        $.ajax({
                            url: "updateSetting",
                            type: 'POST',
                            data: {"backpackSettingId": id, "backpackSqlFile": sqlPath, "backpackBatFile": batPath, "backpackToPath": saveLocation},
                            success: function (data, textStatus, jqXHR) {
                                if (data) {
                                    $("#" + id).find(".mylabel").each(function (index, element) {
                                        switch (index) {
                                            case 1:
                                                $(this).html(sqlPath);
                                                break;
                                            case 2:
                                                $(this).html(batPath);
                                                break;
                                            case 3:
                                                $(this).html(saveLocation);
                                                break;
                                        }
                                    });
                                    toastSuccess("更新成功");
                                } else {
                                    toastError("更新失败！");
                                }
                            }, error: function (jqXHR, textStatus, errorThrown) {
                                toastError("请求失败，请重试！" + errorThrown);
                            }
                        });
                    }

                });
                $("#selectAll").click();//关闭checkbox
            }
            $(".ui.toggle.checkbox").each(function (index, element) {
                if ($(this).checkbox("is checked")) {
                    $(this).closest("tr").find(".nonevisiual").addClass("ui input");
                    $(this).closest("tr").find(".table-label").removeClass("mylabel");
                    $(this).closest("tr").find(".table-label").addClass("nonevisiual");
                } else {
                    $(this).closest("tr").find(".table-label").removeClass("nonevisiual");
                    $(this).closest("tr").find(".table-label").addClass("mylabel");
                    $(this).closest("tr").find(".nonevisiual").removeClass("ui input");
                }
            });

        });


        //修改一个
        $(document).on('click', '.updatebtn', function () {
            if ($(this).text() == "修改") {
                $(this).text("保存");

                var checkBox = $(this).closest("tr").find(".ui.toggle.checkbox");
                $(this).closest("tr").find(".ui.toggle.checkbox").checkbox("check");
                if (checkBox.checkbox("is checked")) {
                    //选中
                    $(this).closest("tr").find(".nonevisiual").addClass("ui input");
                    $(this).closest("tr").find(".table-label").removeClass("mylabel");
                    $(this).closest("tr").find(".table-label").addClass("nonevisiual");
                }

            } else {
                $(this).text("修改");

                var checkBox = $(this).closest("tr").find(".ui.toggle.checkbox");
                $(this).closest("tr").find(".ui.toggle.checkbox").checkbox("uncheck");
                if (!checkBox.checkbox("is checked")) {
                    //去除选中状态
                    $(this).closest("tr").find(".table-label").removeClass("nonevisiual");
                    $(this).closest("tr").find(".table-label").addClass("mylabel");
                    $(this).closest("tr").find(".nonevisiual").removeClass("ui input");
                }



                //发送ajax请求更新当前
                var id, sqlPath, batPath, saveLocation;
                id = $(this).closest("tr").attr("id");
                $(this).closest("tr").find(".myInput").each(function (index, element) {
                    //在这里发送ajax请求    
                    switch (index) {
                        case 0:
                            sqlPath = $(this).val();
                            break;
                        case 1:
                            batPath = $(this).val();
                            break;
                        case 2:
                            saveLocation = $(this).val();
                            break;
                    }
                });
                $.ajax({
                    url: "updateSetting",
                    type: 'POST',
                    data: {"backpackSettingId": id, "backpackSqlFile": sqlPath, "backpackBatFile": batPath, "backpackToPath": saveLocation},
                    success: function (data, textStatus, jqXHR) {
                        if (data) {
                            $("#" + id).find(".mylabel").each(function (index, element) {
                                switch (index) {
                                    case 1:
                                        $(this).html(sqlPath);
                                        break;
                                    case 2:
                                        $(this).html(batPath);
                                        break;
                                    case 3:
                                        $(this).html(saveLocation);
                                        break;
                                }
                            });
                            toastSuccess("更新成功");
                        } else {
                            toastError("更新失败");
                        }
                    }, error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败,请重试！" + errorThrown);
                    }
                });

            }
        });

        //全部选中按钮事件
        $("#selectAll").on("click", function () {
            if ($(this).text() == "全选") {
                $(this).text("取消全选");
                $(".ui.toggle.checkbox").each(function () {
                    if (!$(this).checkbox("is checked")) {
                        $(this).checkbox("check");
                    }
                });

            } else {
                $(".ui.toggle.checkbox").each(function () {
                    if ($(this).checkbox("is checked")) {
                        $(this).checkbox("uncheck");
                    }
                });
                $(this).text("全选");
            }
        });
        //删除一行
        $(document).on('click', ".deleteBtn", function () {
            var id = $(this).closest("tr").attr("id");
            $.ajax({
                url: "deleteSetting/" + id,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    if (data) {
                        $("#" + id).remove();
                        toastSuccess("删除成功")
                    } else {
                        toastError("删除失败");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败,请重试！" + errorThrown);
                }
            });

        });

        $("#deleteAll").on("click", function () {
            showWarning("全部删除", "全部删本页选中？", function () {
                //发送ajax请求删除全部选中
                $(".ui.toggle.checkbox").each(function (index, element) {
                    if ($(this).checkbox("is checked")) {
                        var id;
                        id = $(this).closest("tr").attr("id");
                        $("#" + id).find(".deleteBtn").click();
                    }
                });
            });

        });



//        //全部选中函数
//        function selectAll() {
//            $(".ui.toggle.checkbox").checkbox("toggle");
//        }

        function showDatabaseSettingTable(data) {
            $("#databaseSettingTable").empty();
            $("#databaseSettingTable").append(" <thead><tr><th>选择</th><th>设置编号</th><th>sql脚本路径</th><th>bat脚本路径</th><th>备份保存路径</th><th style=\"padding-left: 10%\" colspan=\"2\">操作</th></tr></thead>");
            $.each(data, function (index, detabaseSetting) {
//                var str = '<tr><td><div class="ui toggle checkbox"><input name="public" type="checkbox"><label></label></div></td><td> <label class="mylabel">编号1</label><div class="nonevisiual" ><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label  class="mylabel" for="">编号2</label><div class="nonevisiual" ><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label  class="mylabel" for="">编号3</label><div class="nonevisiual"><input  class="myInput" style="width: 80%;" type="text"></div></td><td><label class="mylabel" for="">编号4</label><div class="nonevisiual"><input  class="myInput" style="width: 80%;" type="text"></div></td><td> <button class="ui button orange updatebtn">修改</button></td> <td> <button class="ui button orange deleteBtn">删除</button> </td> </tr>'
                var str = " <tr id=" + detabaseSetting.backpackSettingId + "><td><div class=\"ui toggle checkbox\"><input name=\"public\" type=\"checkbox\"><label></label></div></td><td>\n\
                                        <label class=\"mylabel table-label\" >" + detabaseSetting.backpackSettingId + "</label>\n\<div class=\"nonevisiual\" ><input readonly=\"true\" value=" + detabaseSetting.backpackSettingId + "  style=\"width: 80%;\" type=\"text\"></div></td><td>\n\
                                    <label class=\"mylabel table-label\" data-content=\"" + detabaseSetting.backpackSqlFile + "\" data-position=\"right center\">" + detabaseSetting.backpackSqlFile + "</label><div class=\"nonevisiual\" ><input value=" + detabaseSetting.backpackSqlFile + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div></td><td>\n\
                                     <label class=\"mylabel table-label\" data-content=\"" + detabaseSetting.backpackBatFile + "\" data-position=\"right center\">" + detabaseSetting.backpackBatFile + "</label><div class=\"nonevisiual\"><input value=" + detabaseSetting.backpackBatFile + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div></td><td>\n\
                                        <label class=\"mylabel table-label\" data-content=\"" + detabaseSetting.backpackToPath + "\" data-position=\"right center\">" + detabaseSetting.backpackToPath + "</label><div class=\"nonevisiual\"><input value=" + detabaseSetting.backpackToPath + " class=\"myInput\"  style=\"width: 80%;\" type=\"text\"></div></td><td>\n\
                                        <button  class=\"ui button orange updatebtn\" >修改</button></td><td><button class=\"ui button orange deleteBtn\">删除</button></td></tr>";

//                $("#databaseSettingTable").append(str);
                $("#databaseSettingTable").append(str);
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
                    itemNum = data;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败" + errorThrown);
                }
            });
            return itemNum;
        }
//style=\"text-overflow:ellipsis;overflow: hidden;white-space: nowrap;width:60px;\"

    </script>
</html>
