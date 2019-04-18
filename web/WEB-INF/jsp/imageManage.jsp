<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #card_parent {
                display: flex;
                /*实现垂直居中*/
                /*align-items: center;*/
                /*实现水平居中*/
                justify-content: center;
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
                            <div class="ui header red segment">
                                网站图片管理
                            </div>

                            <div id="card_parent" class="ui link cards">
                                <!--显示图片--> 

                            </div><!--card_parent-->


                        </div>
                    </div>
                </div>


                <form style="display: none"  id="imageForm" enctype="multipart/form-data">
                    <div> 
                        <input id="select_file"  type="file" id="input-image" name="input-image"> 
                    </div> 
                </form>

            </div>
            <!-- /container -->
            <jsp:include page="footerTemplete.jsp" />
    </body>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: "getFirstPageImage",
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $("#card_parent").empty();
                    $.each(data, function (index, image) {
                        var str = '<div id="' + image.imageId + '" class="card"><div class="image" ><img src="' + image.imagePath + '"></div><div class="content"><div class="header">' + image.usePage + '</div><div class="description"></div></div>\n\
                <div class="extra content"><span class="right floated"><button class="ui mini button blue myCelect">选择</button><button class="ui mini button blue myChange">更换</button></span></div></div > ';
                        $("#card_parent").append(str);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败" + errorThrown);
                }
            });
        });
        function updateImage() {
            $.ajax({
                url: "upload/uploadImage",
                type: 'POST',
                cache: false,
                data: new FormData($("#imageForm")[0]),
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data)
                        toastSuccess("上传成功");
                    else
                        toastError("上传失败");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
        }

        $(document).on("click", ".myCelect", function () {
            $("#select_file").click();
        });
        $(document).on("click", ".myChange", function () {
            var id = $(this).closest(".card").attr("id");
            $.ajax({
                url: "upload/uploadImage/update/"+id,
                type: 'POST',
                cache: false,
                data: new FormData($("#imageForm")[0]),
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data)
                        toastSuccess("上传成功");
                    else
                        toastError("上传失败");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    toastError("请求失败，请重试！" + errorThrown);
                }
            });
        });


    </script>
</html>
