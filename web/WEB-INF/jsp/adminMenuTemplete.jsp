<%-- 
    Document   : adminMenuTemplete
    Created on : 2018-6-2, 13:35:23
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="four wide column">
    <div class="ui segment myGuide">

<!--        <div id="medicationManage" class="ui header green segment">
            药品信息管理
        </div>

        <div id="departmentManage" class="ui header teal segment">
            部门管理 
        </div>

        <div id="titleManage" class="ui header blue segment">
            职称管理
        </div>      

        <div id="staffManage" class="ui header yellow  segment">
            职工管理
        </div>-->

        <div id="imageManage"  class="ui header red segment">
            网站图片管理
        </div>

        <div id="databaseManage" class="ui header orange segment">
            数据库设置管理
        </div>

        <div id="webManage" class="ui header violet segment">
            网站管理
        </div>
    </div>


</div>

<script>
    $(document).ready(function () {
        $(".myGuide").children().each(function (index, element) {
            var id = $(this).attr('id');
            $(this).on("click", function () {
                var page = "admin/" + id;
                window.location.href = page;
            });

        });
    });
</script>
