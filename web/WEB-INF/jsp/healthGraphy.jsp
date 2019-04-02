<%-- 
    Document   : healthGraphy
    Created on : 2018-5-30, 14:38:18
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="resourcesTemplete.jsp" />
        <title>就医大数据</title>
    </head>

    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />
        <div class="ui container">
            <div id="canvasContainer_1" class="ui segment">
                <canvas id="chart_1" class="block"></canvas>
                <select id="yearSelecter_1" class="mini ui button basic dropdown">
                    <option value="">选择年份</option>
                    <!--<option value="1">1</option>-->
                </select>
                <button id="showMedicalTimesChart" class="ui blue button">查看该年份的就医次数</button>

            </div>

            <div  id="canvasContainer_2" class="ui segment">
                <canvas id="chart_2"></canvas>
                <select id="yearSelecter_2" class="mini ui button basic dropdown ">
                    <option value="">选择年份</option>
                    <!--<option value="1">1</option>-->
                </select>
                <button id="showFeeChart" class="ui blue button">查看该年份的就医花费</button>
            </div>

            <div  id="canvasContainer_3" class="ui segment">
                <canvas id="chart_3"></canvas>
                <select id="yearSelecter_3" class="mini ui button basic dropdown ">
                    <option value="">选择年份</option>
                    <!--<option value="1">1</option>-->
                </select>
                <button id="showIllness" class="ui blue button">查看该年份的生病情况</button>
            </div>

        </div>

    </body>
    <script>
        var year = 0;
        $("#showMedicalTimesChart").click(function () {

            var year = $("#yearSelecter_1").val();
            var url = "patient/graphy_times/${patient.patientId}/" + year;
            getSomethingByAjax(url, changeMedicalTimesChart);
        });

        $("#showFeeChart").click(function () {
            var year = $("#yearSelecter_2").val();
            var url = "patient/graphy_fee/${patient.patientId}/" + year;
            getSomethingByAjax(url, showFeechart);
        });

        $("#showIllness").click(function () {

            var year = $("#yearSelecter_3").val();
            var url = "patient/illnessInfo/${patient.patientId}/" + year;
            getSomethingByAjax(url, illnessMedicalChart);

        });


        $(document).ready(function () {
            var url = "patient/medicalRecordYearSet/${patient.patientId}/";
            getSomethingByAjax(url, getYearSet);

        });

        function getYearSet(data) {
            $("#yearSelecter_1").empty();
            $("#yearSelecter_2").empty();
            $("#yearSelecter_3").empty();
            $("#yearSelecter_1").append('<option value="0">年份</option>');
            $("#yearSelecter_2").append('<option value="0">年份</option>');
            $("#yearSelecter_3").append('<option value="0">年份</option>');

            for (var i = 0; i < data.length; i++) {

                $("#yearSelecter_1").append('<option value=' + data[i] + '>' + data[i] + '</option>');
                $("#yearSelecter_2").append('<option value=' + data[i] + '>' + data[i] + '</option>');
                $("#yearSelecter_3").append('<option value=' + data[i] + '>' + data[i] + '</option>');
            }
        }


        function changeMedicalTimesChart(data) {

//            var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var MONTHS = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
            var config = {
                type: 'line',
                data: {
                    labels: MONTHS,
                    datasets: [{
                            label: "就医次数",
                            backgroundColor: window.chartColors.blue,
                            borderColor: window.chartColors.blue,
                            data: [
                                data[0],
                                data[1],
                                data[2],
                                data[3],
                                data[4],
                                data[5],
                                data[6],
                                data[7],
                                data[8],
                                data[9],
                                data[10],
                                data[11]
                            ],
                            fill: false
                        }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: '就医次数统计'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: '月份'
                                }
                            }],
                        yAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: '次数'
                                }
                            }]
                    }
                }
            };



            var i = 0;
            config.data.datasets.forEach(function (dataset) {
                dataset.data = dataset.data.map(function () {
//                    console.log(data[i]);
                    return data[i++];

                });
            });

            //清空画布
            if (!!(document.getElementById("chart_1"))) {
                document.getElementById("chart_1").remove();
            }
            $('#canvasContainer_1').prepend('<canvas id="chart_1"></canvas>');

            var ctx = document.getElementById("chart_1").getContext("2d");
            window.myLine = new Chart(ctx, config);
            window.myLine.update();
        }



        function showFeechart(data) {
            var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var color = Chart.helpers.color;
            var config = {
                type: 'bar',
                data: {
                    labels: MONTHS,
                    datasets: [{
                            label: '就医花费情况',
                            backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
                            borderColor: window.chartColors.blue,
                            borderWidth: 1,
                            data: [
                                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                            ]
                        }]

                },
                options: {
                    responsive: true,
                    legend: {
                        position: 'top'
                    },
                    title: {
                        display: true,
                        text: '就医花费情况'
                    }
                }
            };
            var i = 0;
            config.data.datasets.forEach(function (dataset) {
                dataset.data = dataset.data.map(function () {
//                    console.log(data[i]);
                    return data[i++];

                });
            });

            //清空画布
            if (!!(document.getElementById("chart_2"))) {
                document.getElementById("chart_2").remove();
            }
            $('#canvasContainer_2').prepend('<canvas id="chart_2"></canvas>');

            var ctx = document.getElementById("chart_2").getContext("2d");
            window.myLine = new Chart(ctx, config);
        }



        function illnessMedicalChart(data) {
            var config = {
                type: 'pie',
                data: {
                    datasets: [{
                            data: [

                            ],
                            backgroundColor: [

                            ],
                            label: '生病情况统计'
                        }],
                    labels: [
                    ]
                },
                options: {
                    responsive: true
                }
            };

            //清空画布
            if (!!(document.getElementById("chart_3"))) {
                document.getElementById("chart_3").remove();
            }
            $('#canvasContainer_3').prepend('<canvas id="chart_3"></canvas>');

            var ctx = document.getElementById("chart_3").getContext("2d");
            window.myPie = new Chart(ctx, config);

            for (var key in data) {
                config.data.labels.push(key);
                config.data.datasets.forEach(function (dataset) {
                    dataset.data.push(data[key]);
                    var str = getRandomcolor();
                    dataset.backgroundColor.push(str);
                });
            }

            window.myPie.update();

        }





    </script>

</html>
