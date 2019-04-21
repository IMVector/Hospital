<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>部门管理</title>
        <script src="resources/js/cropper.js"></script><!-- Cropper.js is required -->
        <link  href="resources/css/cropper.css" rel="stylesheet">
        <script src="resources/js/jquery-cropper.js"></script>

        <style>
            .hidden-block{
                display: none;
            }
        </style>
    </head>

    <body>
        <%--<jsp:include page="adminHeaderIndex.jsp" />--%>
        <jsp:include page="manageStaffHeaderTemplete.jsp"/>

        <div class="ui container">
            <div class="ui segment">
                <div class="ui header blue segment">
                    部门管理
                </div>
                <table>
                    <tr>

                        <td>
                            <div class="ui input focus">
                                <input id="departmentName" placeholder="部门名称" type="text">
                            </div>
                        </td>
                        <td> 
                            <button id="getByName" class="ui basic button blue">查询指定部门信息</button>
                        </td>
                        <td>
                            <button id="getAllBtn" class="ui basic button blue">查询所有部门信息</button>
                        </td>
                        <td>
                            <button id="add" class="ui basic button blue">添加部门</button>
                        </td>
                        <td>
                            <a href="javascript:window.open('staff/goToManageStaff')"class="ui basic button blue">管理员工</a>
                        </td>
                    </tr>
                </table>
                <div class="container-admin-inner">
                    <table id="departmentTable" class="ui table blue" >
                    </table>
                </div>

                <div>
                    <button id="selectAll" class="ui button blue">全选</button>
                    <button id="updateAll" class="ui button blue">全部更新</button>
                    <button id="deleteAll" class="ui button blue">全部删除</button>
                </div>     
                <br>

                <div>
                    <div id="pageText"></div>
                    <div id="PageButtons" class="ui basic buttons">

                    </div>
                    <label for="pageSelecter" class="ui big label">跳转到：</label>
                    <!--发送ajax请求-->
                    <select id="pageSelecter" class="ui dropdown">
                        <option value="">页码</option>

                        <!--<option value="1">1</option>-->
                    </select>

                </div>


            </div>

            <div id="modeltest" class="ui inverted modal ">
                <div class="header">添加部门信息</div>
                <div class="content">
                    <div class="ui header blue segment">部门信息</div>
                    <form id="myForm" class="ui form">
                        <div class="field">
                            <label>部门名称：</label>
                            <div class="ui input ">
                                <input id="medicationName" name="departmentName" placeholder="部门名称" type="text">
                            </div>
                        </div>
                        <br/>
                        <div class="field">
                            <label>部门说明：</label>
                            <div class="ui input ">
                                <input id="medicationInstructions" name="departmentDescription" placeholder="部门说明" type="text">
                            </div>
                        </div>

                        <div class="field">
                            <label>部门图片</label>
                            <div style="height:200px;width: 85%">
                                <img id="mySelect" height="200px" src="resources/image/image.png">
                            </div>
                            <br>
                            <button id="uploadButton" type="button" class="ui primary button">上传</button>
                            <input id="imagePath" type="text" style="display: none" name="imagePath">
                        </div>
                        <button id="resetButton" type="reset" style="display:none;"></button> 
                    </form>

                    <br>
                    <div id="hiddenCropper" class="hidden-block">
                        <div style="height:200px;display:inline-block;width: 85%">
                            <img id="image" height="300px" src="resources/image/image.png">
                        </div>
                        <div style="height:120px;margin-left: 10px;display:inline-block;">
                            <div class="small" style="height:100px;width:100px;overflow: hidden;"></div>
                            <br>
                            <br>
                            <br>
                            <br>
                            <button id="getCroppedCanvas" class="ui button">裁切头像</button>
                        </div>
                    </div>


                </div>
                <div class="actions">
                    <div class="ui black deny button">放弃</div>
                    <div class="ui positive button">上传信息</div>
                </div>
            </div>
            <jsp:include page="warningModel.jsp"/>
        </div>
        <!-- /container -->
        <%--<jsp:include page="footerTemplete.jsp" />--%>

        <!--</div>style="display: none"-->
        <form id="imageForm" style="display:none" enctype="multipart/form-data">
            <div> 
                <input id="inputImage"  type="file" name="input-image" accept="image/*"> 
            </div> 
        </form>

    </body>
    <script>

        $('select.dropdown').dropdown();


        var $inputImage = $('#inputImage');
        var $image = $('#image');
        var formData;
        var file;
        $(document).on("click", "#mySelect", function () {
            $("#inputImage").click();
        });
        $(document).on("click", "#cancleButton", function () {
            $('.ui.modal').modal('refresh');
            $('.ui.modal').modal('hide');
        });
        $("#getCroppedCanvas").on("click", function () {
            console.log($('#image').cropper('getCroppedCanvas'));
            var cas = $('#image').cropper('getCroppedCanvas', {width: 200, height: 200});
            var base64url = cas.toDataURL('image/jpeg');
            cas.toBlob(function (e) {
                //console.log(e);  //生成Blob的图片格式= 
                formData = new FormData();
                formData.append("file", e, file.name);
                //-------------图片回显-------------
                var url = URL.createObjectURL(e);
                $('#mySelect').attr('src', url);
            });

            $("#hiddenCropper").addClass("hidden-block");
            //console.log(base64url); //生成base64图片的格式
            //$('.cavans').html(cas);  //在body显示出canvas元素
            //var formData = new FormData();
            //注意：此处第3个参数最好传入一个带后缀名的文件名，否则很有可能被后台认为不是有效的图片文件
            //formData.append("file", blob, file.name);
        });
        $(document).on("click", "#uploadButton", function () {
            $.ajax({
                url: "upload/uploadImage/uploadPatientImage",
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data === "Error") {
                        toastError("上传失败");
                    } else {
                        toastSuccess("上传成功");
                        $('#avatar').attr('src', data);
                        $("#imagePath").val(data);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
        });
        $inputImage.change(function () {
            $("#hiddenCropper").removeClass("hidden-block");

            var files = this.files;
            //var file;
            if (files && files.length) {
                file = files[0];
            }
            var console = window.console || {log: function () {}};
            var URL = window.URL || window.webkitURL;
            var originalImageURL = $image.attr('src');
            var uploadedImageName = 'cropped.jpg';
            var uploadedImageType = 'image/jpeg';
            var uploadedImageURL;
            if (URL) {
                if (/^image\/\w+$/.test(file.type)) {
                    uploadedImageName = file.name;
                    uploadedImageType = file.type;

                    if (uploadedImageURL) {
                        URL.revokeObjectURL(uploadedImageURL);
                    }

                    uploadedImageURL = URL.createObjectURL(file);
                    //$image.attr('src', uploadedImageURL)
                    $image.cropper('destroy').attr('src', uploadedImageURL);
                    //.cropper(options);
                    $inputImage.val('');

                    $('#image').cropper({
                        aspectRatio: 1 / 1,
                        viewMode: 1,
                        dragMode: 'none',
                        preview: ".small",
                        responsive: false,
                        restore: false});
                } else {
                    window.alert('Please choose an image file.');
                }
            } else {
                $inputImage.prop('disabled', true).parent().addClass('disabled');
            }
        });



        $(document).ready(function () {

            $("#getByName").on("click", function () {
                var name = $("#departmentName").val();
                var url = "staff/getDepartmentByName/" + name;
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, departmentTableInfo, getDepartmentByNameItemNumber);
            });

            $("#getAllBtn").click(function () {
                var url = 'staff/departmentList/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, departmentTableInfo, getDepartmentItemNumber);
            });

            $("#pageSelecter").on("change", function () {
                var url = 'staff/departmentList/page_key_word';
                goToThPage("PageButtons", "pageText", "pageSelecter", url, departmentTableInfo, getDepartmentItemNumber);
            });

            //全部更新
            $("#updateAll").on("click", function () {
                if ($(this).text() === "全部更新") {
                    $(this).text("全部保存");
                } else {
                    $(this).text("全部更新");

                    //发送ajax请求更新全部选中
                    $(".ui.toggle.checkbox").each(function (index, element) {
                        if ($(this).checkbox("is checked")) {
                            var id, name, description;
                            $(this).closest("tr").find(".myInput").each(function (index, element) {
                                //在这里发送ajax请求    
                                switch (index) {
                                    case 0:
                                        id = $(this).val();
                                        break;
                                    case 1:
                                        name = $(this).val();
                                        break;
                                    case 2:
                                        description = $(this).val();
                                        break;
                                }
                            });
                            $.ajax({
                                url: "staff/updateDepartment",
                                type: 'POST',
                                data: {"departmentId": id, "departmentName": name, "departmentDescription": description},
                                success: function (data, textStatus, jqXHR) {
                                    if (data) {
                                        $("#" + id).find(".mylabel").each(function (index, element) {
                                            switch (index) {
                                                case 0:
                                                    $(this).html(id);
                                                    break;
                                                case 1:
                                                    $(this).html(name);
                                                    break;
                                                case 2:
                                                    $(this).html(description);
                                                    break;
                                            }
                                        });
                                        toastSuccess("更新成功");
                                    } else {
                                        toastError("更新失败");
                                    }
                                }, error: function (jqXHR, textStatus, errorThrown) {
                                    toastError("请求失败");

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

            //弹出添加model框
            $("#add").click(function () {
                $('#modeltest').modal({
                    inverted: true,
                    closable: false,
                    onDeny: function () {
                        $('#resetButton').click();
                        return true;
                    },
                    onApprove: function () {
                        if ($(".ui.form").form('validate form')) {
                            $.ajax({
                                url: 'staff/addDepartment',
                                type: 'POST',
                                async: false,
                                data: $("#myForm").serialize(), //将表单的数据编码成一个字符串提交给服务器
                                success: function (data) {
                                    if (data) {
                                        toastSuccess("添加成功");
                                        $('#resetButton').click();
                                        $('.ui.modal').modal('hide');
                                    } else {
                                        toastError("添加失败");
                                    }
                                },
                                error: function (req, status, error) {
                                    toastError("请求失败" + error);
                                }
                            });
                        } else {
                            return false;
                        }
                    }
                }).modal('show');
            });


            //修改一个
            $(document).on('click', '.updatebtn', function () {
                if ($(this).text() === "修改") {
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
                    var id, name, description;
                    $(this).closest("tr").find(".myInput").each(function (index, element) {
                        //在这里发送ajax请求    
                        switch (index) {
                            case 0:
                                id = $(this).val();
                                break;
                            case 1:
                                name = $(this).val();
                                break;
                            case 2:
                                description = $(this).val();
                                break;

                        }
                    });
                    $.ajax({
                        url: "staff/updateDepartment",
                        type: 'POST',
                        data: {"departmentId": id, "departmentName": name, "departmentDescription": description},
                        success: function (data, textStatus, jqXHR) {
                            if (data) {
                                $("#" + id).find(".mylabel").each(function (index, element) {
                                    switch (index) {
                                        case 0:
                                            $(this).html(id);
                                            break;
                                        case 1:
                                            $(this).html(name);
                                            break;
                                        case 2:
                                            $(this).html(description);
                                            break;
                                    }
                                });
                                toastSuccess('更新成功');
                            } else {
                                toastError("更新失败");
                            }
                        }, error: function (jqXHR, textStatus, errorThrown) {
                            toastError("请求失败" + errorThrown);
                        }
                    });

                }
            });

            //全部选中按钮事件
            $("#selectAll").on("click", function () {
                if ($(this).text() === "全选") {
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
                    url: "staff/deleteDepartment/" + id,
                    type: 'POST',
                    success: function (data, textStatus, jqXHR) {
                        if (data) {
                            $("#" + id).remove();
                            toastSuccess("删除成功");
                        } else {
                            toastError("删除失败");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败");
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
        });

        //ajax回调函数，显示部门信息
        function departmentTableInfo(data) {
            $("#departmentTable").empty();
            $("#departmentTable").append("<thead><tr><th>选择</th><th>部门编号</th><th>部门名称</th><th>部门描述</th><th>操作</th></tr></thead>");
            $.each(data, function (index, department) {
                var str = " \n\
                <tr id=" + department.departmentId + ">\n\
                    <td style='width:100px;'>\n\
                        <div class='ui toggle checkbox'>\n\
                            <input name='public' type='checkbox'>\n\
                            <label></label>\n\
                        </div>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' >" + department.departmentId + "</label>\n\
                        <div class='nonevisiual' >\n\
                            <input value=" + department.departmentId + " class='myInput' style='width: 50%;' readonly type='text'>\n\
                        </div>\n\
                    </td>\n\
                    <td>\n\
                        <label class='mylabel table-label' data-content='" + department.departmentName + "' data-position='top left'>" + department.departmentName + "</label>\n\
                        <div class='nonevisiual'>\n\
                            <input value=" + department.departmentName + " class='myInput'  style='width: 80%;' type='text'>\n\
                        </div>\n\
                    </td>\n\
                    <td  style='width:200px; max-width: 300px;'>\n\
                        <label class='mylabel table-label' data-content='" + department.departmentDescription + "' data-position='top left'>" + department.departmentDescription + "</label>\n\
                        <div class='nonevisiual'>\n\
                            <input value=" + department.departmentDescription + " class='myInput'  style='width: 80%;' type='text'>\n\
                        </div>\n\
                    </td>\n\
                    <td style='width:150px'>\n\
                        <button  class='ui mini button blue updatebtn' >修改</button>\n\
                        <button class='ui mini button blue deleteBtn'>删除</button>\n\
                    </td>\n\
                </tr>";


                $("#departmentTable").append(str);
            });
        }

        $(document).on("mouseover", ".mylabel", function () {
            $(this).popup("show");
        });
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
        //获取数据库中的总数量
        function getDepartmentByNameItemNumber() {
            var itemNum = 0;
            $.ajax({
                url: "staff/getDepartmentByNameItemNumber/" + $("#departmentName").val(),
                type: 'POST',
                async: false,
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
        //表单验证
        $('.ui.form').form({
            fields: {
                departmentName: {
                    identifier: 'departmentName', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入部门名称'//提示信息
                        }
                    ]
                },
                departmentDescription: {
                    identifier: 'departmentDescription', //form的field
                    rules: [
                        {
                            type: 'empty', //验证类型
                            prompt: '请输入部门信息'//提示信息
                        }
                    ]
                }

            }
        });


    </script>
</html>
