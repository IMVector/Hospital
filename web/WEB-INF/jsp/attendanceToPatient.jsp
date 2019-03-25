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
                        <div class="ui grid">
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            <div class="two wide column"><button class="ui button">test</button></div>
                            
                            
                        </div>
                    </div>

                    <table class="ui celled table">
                        <thead>
                            <tr>
                                <th>科室名称</th>
                                <th>医生</th>
                                <!--<th>时间</th>-->
                                <th>职称</th>
                                <th>专业</th>
                                <th>预约</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td data-label="Name">James</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Engineer</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job"><a href="patient/goToReservation">Engineer</a></td>
                            </tr>
                            <tr>
                                <td data-label="Name">Jill</td>
                                <td data-label="Age">26</td>
                                <td data-label="Job">Engineer</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Engineer</td>
                            </tr>
                            <tr>
                                <td data-label="Name">Elyse</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Designer</td>
                                <td data-label="Age">24</td>
                                <td data-label="Job">Engineer</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
