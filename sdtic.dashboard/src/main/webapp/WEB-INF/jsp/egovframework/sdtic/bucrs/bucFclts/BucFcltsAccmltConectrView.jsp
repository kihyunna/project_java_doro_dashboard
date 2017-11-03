<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>비즈니스 시설물 누적접속자 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>

    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/magicTime.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
</head>

<body>
    <div id="wrap_if">
        <div id="pln_main" class="sctSmrSys tpFclt">
            <div class="areaSys"><!--시설물--></div>
            <div class="areaIndC">
                <span class="txtItem">점검지적사항조치률</span><br /><span id="data1" class="txtNum">75 %</span>
            </div>
            <div class="areaCUsr">
                <span class="txtItem">금일누적접속자</span><br /><span id="JSobjectProp" class="txtNum">42명</span>
            </div>
        </div>
    </div>
    <%-- <div id="main" style="width:100%;height:90px; padding:0px;">

    <img id="img1" src="${contextPath}/images/bucrs/facility_top.png" width="100%" height="90px">
            <table >
                <tr style="height:55px;">
                    <td style="width:160px;" align='center'>
                        <table>
                            <tr>
                                <td><center><img src="${contextPath}/images/bucrs/facility3.png" width="80px" height="40px"></center></td>
                            </tr>
                            <tr>
                                <td align='center' valign='top'><font face="돋움" size="3px" color="#FFFFFF"><b>시설물</b></font></td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:300px;" >
                        <table>
                            <tr >
                                <td style="width:190px;" align='left' style="height:30px;">
                                    <font face="돋움" size="3px" color="#FFFFFF">
                                        <b>
                                            금일 누적 접속자
                                        </b>
                                    </font>
                                </td>
                                <td style="width:30px;" align='left'>
                                    <font face="돋움" size="3px" color="#FFFFFF">
                                        <b>
                                            <div id="JSobjectProp">
                                                100
                                            </div>
                                        </b>
                                    </font>

                                </td>
                                <td style="width:5px;">
                                    <font face="돋움" size="3px" color="#FFFFFF">
                                        <b>
                                            명
                                        </b>
                                    </font>
                                </td>
                                <td style="width:30px;">
                                </td>

                            </tr>

                            <tr style="height:25px;">
                                <td style="width:190px;" align='left'>
                                    <font face="돋움" size="3px" color="#FFFFFF">
                                        <b>
                                            점검 지적사항 조치율
                                        </b>
                                    </font>
                                </td>
                                <td colspan="3" align='left'>
                                    <font face="돋움" size="4px" color="#FFFFFF">
                                        <b>
                                            <div id="data1">56 %</div>
                                        </b>
                                    </font>
                                </td>
                                <td style="width:30px;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>--%>

        <script type="text/javascript">

            $(window).load(function() {
            	document.documentElement.style.overflow = 'hidden';
            //getFcltsAccmltConectr();
            //setDivHeight('main');
                timerStart();
                selecttimer();
            });

            $(window).resize(function(){

                //setDivHeight('main');

            });

            function setDivHeight(objSet)
            {


                var objSet   = document.getElementById(objSet);
                objSet.style.width  = 100 + "%";
                objSet.style.height  = $(window).height() + "px";

            }

            function getFcltsAccmltConectr(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/buc/bucFcltsAccmltConectr.do",
                    async : false,
                    dataType : 'json',
                    success :function(json) {

                        $('#JSobjectProp').text(json.data[0].temp3);

                    },error : function(){

                        console.log(arguments);
                    }
                });

                $.ajax({
                    url : "${pageContext.request.contextPath}/buc/bucFcltsRtAjax.do",
                    async : false,
                    dataType : 'json',
                    success :function(json) {

                        $('#data1').text(json.data[0].buc_fclts + " %");

                    },error : function(){

                        console.log(arguments);
                    }
                });

            }

            function randomCnt(){

                //var randdomdata = Math.floor(Math.random()*6)+1;
                var randdomdata1 = Math.floor(Math.random()*3)+1;

                //var prop1 = parseInt($('#JSobjectProp').text()) + randdomdata;
                var prop1 = parseInt($('#JSobjectProp').text());
                var myObject = { prop1: 0 };
                var JSobjectProp = anime({
                    targets: myObject,
                    prop1: prop1,
                    easing: 'linear',
                    round: 1,
                    update: function() {
                        var el = document.querySelector('#JSobjectProp');

                        var jsonString = JSON.stringify(myObject).replace('{"prop1":','').replace('"}','').replace('"','');

                        el.innerHTML = jsonString+ ' 명';
                    }
                });
                
                var prop2 = parseInt($('#data1').text());
                var myObject2 = { prop2: 0 };
                var JSobjectProp = anime({
                    targets: myObject2,
                    prop2: prop2,
                    easing: 'linear',
                    round: 1,
                    update: function() {
                        var el = document.querySelector('#data1');

                        var jsonString = JSON.stringify(myObject2).replace('{"prop2":','').replace('"}','').replace('"','');

                        el.innerHTML = jsonString + ' %';
                    }
                });

                /*
                var test2 = $('#data1').text().split(" ");

                var test3 = parseInt(test2[0]) + randdomdata1;

                if(test3 < 100){
                    $('#data1').text(test3 +" "+ test2[1]);
                }else{
                    $('#data1').text(100 +" "+ test2[1]);
                }
                */
            }

            function timerStart(){
                window.setInterval("randomCnt()",6000);
            }

            function selecttimer(){

                window.setInterval("divColorChange()",100);

            }

            function divColorChange(){

                var today = new Date();

                var second = today.getSeconds();

                if(second>=45){
                    //var divid = document.getElementById("main");

                    //divid.style.backgroundColor = "#a939c6";
                    $("#pln_main").addClass('sctSmrSys tpFclt active');
                    //var divid = document.getElementById("img1");
                    //divid.src = "${contextPath}/images/bucrs/facility_top_on.png";

                }else{

                    //var divid = document.getElementById("main");
                    $("#pln_main").removeClass("sctSmrSys tpFclt active");
                    $("#pln_main").addClass('sctSmrSys tpFclt');
                    //divid.style.backgroundColor = "#878787";
                    //var divid = document.getElementById("img1");
                       //divid.src = "${contextPath}/images/bucrs/facility_top.png";
                }


            }

        </script>
</body>
</html>
