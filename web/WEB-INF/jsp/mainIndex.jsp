
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>主页</title>
        <jsp:include page="resourcesTemplete.jsp" />
        <style>
            #card_parent {
                display: flex;
                /*实现垂直居中*/
                /*align-items: center;*/
                /*实现水平居中*/
                justify-content: center;
            }
            .font_{
                color: #fe6673;
                font:18px/14px Georgia, "Times New Roman", Times, serif;
            }

        </style>
    </head>
    <body id="bg_body">

        <div class="ui container slideImage">
            <div class="ui segment">
                <div class="ui header teal segment">
                    InstalHMS 医院系统
                </div>

                <div class="demo square ui shape">
                    <div class="sides">
                        <div class="active first side">
                            <img id="image_1" src="resources/image/bgfirst.png" class="ui fluid  image">
                            <div class="guide">
                                <ul class="links">
                                    <li class="l1">
                                        <p class="p">患者版</p>
                                        <a class="link" href="patientIndex">进入</a>
                                        <!--<a href="patient/signup">登陆</a>-->
                                    </li>
                                </ul>
                            </div>
                            <!--<div>患者版</div>-->
                        </div>
                        <div class="second side">
                            <img id="image_2" src="resources/image/bgsecond.png" class="ui fluid  image">
                            <div class="guide">
                                <ul class="links">
                                    <li class="l2">
                                        <p class="p">医生版</p>
                                        <a class="link" href="staff/goToStaffLogin">进入</a>
                                        <!--<a href="doctor/signup">登陆</a>-->
                                    </li>
                                </ul>
                            </div>
                            <!--<div>医生版</div>-->
                        </div>
                        <div class="third side">
                            <img id="image_3" src="resources/image/bgthird.png" class="ui fluid  image">
                            <div class="guide">
                                <ul class="links">
                                    <li class="l3">
                                        <p class="p">管理版</p>
                                        <a class="link" href="staff/goToStaffLogin">进入</a>
                                    </li>
                                </ul>
                            </div>
                            <!--<div>管理版</div>-->
                        </div>
                    </div>
                </div>

                <div class=" col-offset-11">
                    <div class="ui ignored icon direction buttons">
                        <div class="ui button" data-animation="flip" title="向左翻页" data-direction="left"><i class="left long arrow icon"></i></div>
                        <div class="ui button" data-animation="flip" title="向上翻页" data-direction="up"><i class="up long arrow icon"></i></div>
                        <div class="ui button" data-animation="flip" title="向下翻页" data-direction="down"><i class="down long arrow icon"></i></div>
                        <div class="ui button" data-animation="flip" title="向右翻页" data-direction="right"><i class="right long arrow icon"></i></div>
                    </div>
                    <div class="ui ignored icon direction buttons">
                        <div class="ui button" title="转动" data-animation="flip" data-direction="over"><i class="retweet icon"></i></div>
                        <div class="ui button" title="转回来" data-animation="flip" data-direction="back"><i class="flipped retweet icon"></i></div>
                    </div>
                </div>
                <!--<div class="ui ignored divider"></div>-->
            </div>
            <div class="ui segment">
                <div class="ui header teal segment">
                    名医风采
                </div>
                <div>
                    <div id="loader_1" class="ui active inverted dimmer">
                        <div class="ui text loader">加载</div>
                    </div>
                    <div id="card_parent" class="ui link cards" style="min-height:100px">
                        <!--显示有头像的医生-->

                    </div>
                </div>

                <div>
                    <p id="pageText"></p>
                    <div id="PageButtons" class="mini ui basic buttons">

                    </div>

                    <label for="" class="ui label">跳转到：</label>
                    <!--发送ajax请求-->
                    <select id="pageSelecter" class="ui dropdown">
                        <option value="">页码</option>

                        <!--<option value="1">1</option>-->
                    </select>
                </div>



            </div>
            <div class="ui segment">
                <div class="ui header blue segment">医院内部导航</div>
                <!--<div class="ui segment">-->
                <div class="ui pointing menu">
                    <div id="tab_1" class="ui item active">一楼</div>
                    <div id="tab_2" class="ui item">二楼</div>
                    <div id="tab_3" class="ui item">三楼</div>
                    <div id="tab_4" class="ui item">三楼</div>
                    <div id="tab_5" class="ui item">四楼</div>
                    <div id="tab_6" class="ui item">五楼</div>
                </div>
                <div class="ui segment" style="text-align: center">
                    <img id="builderMap" src="resources/image/1楼.gif" alt="楼层分布">
                </div>
            </div>
            <div  class="ui segment">
                <div class="ui header blue segment">医院公告</div>
                <div id="departmentLoader" class="ui active inverted dimmer">
                    <div class="ui text loader">加载</div>
                </div>
                <div id="departmentList" class="ui segment">

                </div>

            </div>

            <div class="ui segment">
                <!--<img class="ui fluid image" src="resources/image/bgthird.png">-->
                
                <div class="ui header blue segment">医院简介</div>

                <div class="font_">
                    <p>1898年，滥觞于黄海之滨的德国野战医院，几乎与青岛市同时诞生。百年沧桑，守正出新，厚重的历史，一代又一代人薪火相传，非凡的发展历程及成就彰显了她在医学界显赫的地位和不朽功勋。她的创立演变史与青岛现代化开放发展史同步迈进，更与中国现代医院建设体系共时延伸。</p>
                    <p>一个多世纪的风云变幻，虽然历经磨难，但不坠亲民济世的青云之志。人道的从医精神和精细的技术追求在这里浩然传承。历代青医人以仁心妙术的医风，救死扶伤，发扬“大医精诚”风尚，铸就了她百年的荣光。今天的她，是一所集医疗、教学、科研、预防、保健、康复、业务技术指导为一体的省属大型综合性三级甲等医院。医院拥有四个院区——位于江苏路的市南院区，地处老城区，倚山靠海，古朴典雅；位于海尔路的崂山院区，地处青岛最繁华的东部，近海拥湾，端庄大气；位于青岛西海岸新区的西海岸院区，地处经济新区，气势恢弘，雄伟现代；位于老四方的市北院区，将建设成为以肿瘤综合诊治为主，内、外科门诊为辅的高端专科医院。2016年，医院门急诊量470万人次，居山东省第一位，连续三年跻身“中国最佳医院百强榜”。2017年开放床位3700余张，拥有国际一流的万元以上医学设备5800余台（件）。四个院区实行统一领导，不同院区各具特色、优势互补、协调发展。</p>
                    <p>医院设有临床业务科室75个，研究室（所）23个，拥有全国重点学科、省市重点学科、实验室及特色专业41个，其中，国家级重点学科（专科）2个，省级临床重点专科29个，省中医药重点专科3个。是临床医学、护理学一级学科博士学位培养单位，设有临床医学、护理学一级学科博士后科研流动站。</p>
                    <p>医院现有职工6000余人，其中高级专业技术人员800余名，博士生导师近百名，博士500余名，硕士1300余名，留学归国人员百余名。有各级各类学术专业委员会主委、副主委，享受国务院政府特殊津贴专家，有突出贡献中青年专家，山东省卫生系统杰出学科带头人和泰山学者岗位特聘专家，中青年重点科技人才等近200名，成为学科发展的中流砥柱。</p>
                    <p>以“博学慎思，笃行亲民”院训为指导，医院深入开展了“三百爱心工程”、“无障碍就医”等惠民、便民医疗服务和卫生强基、援边援外工作，探索建立了集团化发展模式，成功构建了惠及农村、城市社区群众的医疗集团纵向服务网络。</p>
                    <p>宏伟蓝图已绘就，扬帆前行正当时。承载着人类对生命的更高期望，盛世大任激励我们宏业图新。全院职工一定会不辱使命，站在新起点，实现新超越，开创一个良医济民、事业常青的新境界！</p>
                </div>
<!--                <a href="staff/goToExamineStaff">检查医生跳转</a>
                <br>
                <a href="staff/goToManageStaff">行政医生跳转</a>
                <br>-->
            </div>   
        </div>

        <div>

            <%--<jsp:include page="footerTemplete.jsp"/>--%>
        </div>
        <script>

            $(document).ready(function () {

                var url = 'staff/staffWithImage/page_key_word';
                fillForm("PageButtons", "pageText", "pageSelecter", currentPage = 1, url, getStaffWithImage, staffItemNumWithImage);

                $("#pageSelecter").on("change", function () {
                    var url = 'staff/staffWithImage/page_key_word';
                    goToThPage("PageButtons", "pageText", "pageSelecter", url, getStaffWithImage, staffItemNumWithImage);
                });


                $.ajax({
                    url: "getFirstPageImage",
                    type: 'POST',
                    success: function (data, textStatus, jqXHR) {
                        $.each(data, function (index, image) {
                            switch (image.imageId) {
                                case 1:
                                    $("#image_1").attr("src", image.imagePath);
                                    break;
                                case 2:
                                    $("#image_2").attr("src", image.imagePath);
                                    break;
                                case 3:
                                    $("#image_3").attr("src", image.imagePath);
                                    break;
                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败" + errorThrown);
                    }
                });

//                $.ajax({
//                    url: "staffWithImage/" + 1,
//                    type: 'POST',
//                    success: function (data, textStatus, jqXHR) {
//                       
//                    },
//                    error: function (jqXHR, textStatus, errorThrown) {
//                        toastError("请求失败" + errorThrown);
//                    }
//                });

                var
                        $demo = $('.demo'),
                        $dogDemo = $('.dog.shape'),
                        $directionButton = $('.direction .button'),
                        $shapeButton = $('.type.buttons .button'),
                        handler
                        ;

                // 事件处理程序
                handler = {
                    rotate: function () {
                        var
                                $shape = $('.slideImage').find('.ui.shape'),
                                direction = $(this).data('direction') || false,
                                animation = $(this).data('animation') || false
                                ;
                        if (direction && animation) {
                            var fun = $shape.shape(animation + '.' + direction);
                        }
                    },

                    removeShape: function () {
                        var
                                shape = $(this).data('shape') || false;
                        if (shape) {
                            $demo.removeClass(shape);
                        }
                    },

                    changeShape: function () {
                        var
                                $shape = $(this),
                                $otherShapes = $shape.siblings(),
                                shape = $shape.data('shape');
                        $shape.addClass('active');
                        $otherShapes.removeClass('active').each(handler.removeShape);
                        $demo.removeAttr('style').addClass(shape);
                    }
                };

                // 事件绑定
                $demo.shape();
                $directionButton.on('click', handler.rotate).popup({
                    delay: 0,
                    position: 'bottom center'
                });
                $shapeButton.on('click', handler.changeShape);

                $dogDemo.shape();

//                //进入时自动播放
//                var timer = setInterval(autoClick, 5000);
//                //鼠标放上时停止播放
//                $(".demo.square.ui.shape").on("mouseover", function () {
//                    clearInterval(timer);
//                });
//                //鼠标移出时开始计时播放
//                $(".demo.square.ui.shape").on("mouseout", function () {
//                    timer = setInterval(autoClick, 5000);
//                });

                //获取部门列表
                $.ajax({
                    url: "departmentList",
                    type: 'POST',
                    beforeSend: function () {
                        $("#departmentLoader").addClass('active');
                    },
                    success: function (data, textStatus, jqXHR) {
                        $("#departmentList").empty();
                        $.each(data, function (index, department) {
                            var str = "<a href=\"about\\" + department.departmentName + "\" class=\"ui blue button\">" + department.departmentName + " </a>";
                            $("#departmentList").append(str);
                        });
                    },
//                    complete: function () {
//                        $("#departmentLoader").removeClass("active");
//                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        toastError("请求失败！" + errorThrown);
                    }
                });

            });
            $(".ui.item").on("click", function () {
                $(".ui.item").removeClass("active");//去掉所有active
                $(this).addClass("active");//给当前点击的active
                var id = $(this).attr("id");//获取当前Id
                id = id.replace("tab_", "");//替换不需要的内容
                var path = "resources/image/" + id + "楼.gif";//构造img的路径
                $("#builderMap").attr("src", path);//替换
            });
            function autoClick() {
                $("[title='向右翻页']").trigger("click");
            }
            function staffItemNumWithImage() {
                var itemNum = 0;

                $.ajax({
                    url: "staff/getStaffWithImageItemNum/",
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
            function getStaffWithImage(data) {
                $("#loader_1").removeClass("active");
                $("#card_parent").empty();
                $.each(data, function (index, staff) {
                    var str = '\
            <div class="card">\n\
                <div class="image" >\n\
                    <img src="' + staff.image.imagePath + '">\n\
                </div>\n\
                <div class="content">\n\
                    <div class="header">姓名：' + staff.staffName + '</div>\n\
                    <div class="meta">座右铭</div>\n\
                    <div class="description">擅长领域：' + staff.specialty + '</div>\n\
                </div>\n\
                <div class="extra content">\n\
                    <span class="right floated">' + staff.department.departmentName + '</span>\n\
                    <span><i class="user icon"></i>' + staff.title.titleName + '</span>\n\
                </div>\n\
            </div > ';
                    $("#card_parent").append(str);

                });
            }

        </script>
    </body>
</html>
