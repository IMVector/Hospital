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
                            <div class="ui header blue segment">欢迎使用管理系统</div>
                            
                            <img class="ui fluid image" src="resources/image/bgthird.png" alt="管理员背景">
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- /container -->
        <%--<jsp:include page="footerTemplete.jsp" />--%>
    </body>

</html>
