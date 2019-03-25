<%-- 
    Document   : departmentInfo
    Created on : 2019-3-17, 17:38:33
    Author     : Vector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="resourcesTemplete.jsp" />
        <title>科室信息</title>
        <style>
            .font_{
                color: #fe6673;
                font:18px/14px Georgia, "Times New Roman", Times, serif;
            }
        </style>
    </head>
    <body>
        <jsp:include page="patientHeaderTemplete.jsp" />
        <div class="ui centered grid">
            <div class="twelve wide column">
                <div class="ui segment">
                    <div>
                        <div class="ui header blue segment">科室信息</div>

                        <div class="ui centered grid">

                            <div class="six wide column">
                                <img src="resources/image/backgroundImage/11.jpg" alt="">
                            </div>
                            <div class="ten wide column">
                                <div class="ui grid">
                                    <div class="row">
                                        <div class="font_"  id="departmentInfo">
                                            <p>神经科，主要诊治脑血管疾病(脑梗塞、脑出血)、偏头痛、脑部炎症性疾病(脑炎、脑膜炎)、脊髓炎、癫痫(抽搐)、帕金森、癫痫、脑瘫、共济失调、扭转痉挛、孤独症、老年性痴呆、神经系统变性病、代谢病和遗传病、三叉神经痛、坐骨神经病、周围神经病(四肢麻木、无力)以及重症肌无力等神经疾病，采用CT、脑电图、TCD(经颅多普勒超声)及血流变学检查等检测手段。同时诊治神经衰弱、失眠等功能性疾患。</p>
                                        </div>
                                    </div>
                                    <div class="ui divider"></div>
                                    <div class="row">
                                        <div class="ui three column grid">
                                            <div class="row"  style="text-align: center">
                                                <div class="column">
                                                    <i class="user md huge icon"></i>
                                                    <!--<button class="ui button">挂号</button>-->
                                                    <h3>挂号</h3>
                                                </div>
                                                <div class="column"  style="text-align: center">
                                                    <i class="stethoscope huge icon"></i>
                                                    <h3>出诊信息</h3>
                                                </div>
                                                <div class="column"  style="text-align: center">
                                                    <i class="heart outline huge icon"></i>
                                                    <h3>待定</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ui divider"></div>
                                </div>

                            </div>
                        </div>


                    </div>
                    <br>
                    <div>
                        <div class="ui header blue segment">医疗团队</div>
                        <div>
                            <div id="card_parent" class="ui link cards" >
                                <!--显示有头像的医生-->
                                <div class="card"><div class="image"><img src="resources\image\s1.jpg"></div>
                                    <div class="content"><div class="header">555</div>
                                        <div class="meta">座右铭</div><div class="description">null</div></div>
                                    <div class="extra content"><span class="right floated">神经科</span><span><i class="user icon"></i>高级护士</span></div></div>
                            </div>
                        </div>

                        <div>
                            <p id="pageText"></p>
                            <div id="PageButtons" class="mini ui basic buttons">

                            </div>

                            <label for="" class="ui label">跳转到：</label>
                            <!--发送ajax请求-->
                            <select id="pageSelecter" class="mini ui button basic dropdown">
                                <option value="">页码</option>

                                <!--<option value="1">1</option>-->
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
