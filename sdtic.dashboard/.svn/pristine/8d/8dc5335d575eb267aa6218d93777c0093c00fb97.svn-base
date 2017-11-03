<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>비즈니스 유지관리 누적접속자 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>

    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/magicTime.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
</head>

<body>
    <div id="wrap_if">
        <div id="pln_main" class="sctSmrSys tpMntn">
            <div class="areaSys"><!--유지관리--></div>
            <div class="areaIndC">
                <span class="txtItem">유지관리실적</span><br /><span id="data1" class="txtNum" > %</span>
            </div>
            <div class="areaCUsr">
                <span class="txtItem">금일누적접속자</span><br /><span id="JSobjectProp" class="txtNum">명</span>
            </div>
        </div>
    </div>
    <!-- <div id="main" style="width:100%;height:90px; padding:0px; "> //-->

    <%-- <img id="img1" src="${contextPath}/images/bucrs/corrective_top.png" width="100%" height="90px">
         <table>
            <tr style="height:55px;">
                <td style="width:160px;" align='center'>
                    <table>
                        <tr>
                            <td><center><img src="${contextPath}/images/bucrs/corrective.png" width="80px" height="40px"></center></td>
                        </tr>
                        <tr>
                            <td align='center' valign='top'><font face="돋움" size="3px" color="#FFFFFF"><b>유지관리</b></font></td>
                        </tr>
                    </table>
                </td>
                <td style="width:300px;" >
                    <table>
                        <tr >
                            <td style="width:190px;" align='left'>
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
                                        유지관리 실적
                                    </b>
                                </font>
                            </td>
                            <td colspan="3" align='left'>
                                <font face="돋움" size="3px" color="#FFFFFF">
                                    <b>
                                        <div id="data1">56  %</div>
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
		var usercnt = '';	
		var plan_km = '';
		var c_km = '';
		var complete_p = '';
		var ParamTime = 0;
		var timerFlag = 1;
		
         $(window).load(function() {
        	 document.documentElement.style.overflow = 'hidden';
        	 selecttimer();
			getMntmngAccmltConectrdb();
			 
			
		    ParamTime = "${param.widgetTimer}"
		    
		    	if(ParamTime == 15000){
                    timerFlag = 1;
                }else if(ParamTime == 30000){
                    timerFlag = 2;
                }else if(ParamTime == 60000){
                    timerFlag = 3;
                }else if(ParamTime == 300000){
                    timerFlag = 4;
                }else if(ParamTime == 600000){
                    timerFlag = 5;
                }else if(ParamTime == 1800000){
                    timerFlag = 6;
                }else if(ParamTime == 3600000){
                    timerFlag = 7;
                }
                
                if(ParamTime == 0){
                    ParamTime = 10000;
                }
		  //이벤트
            
		    
		  
            timerStart();
			
           
         	
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

         function getMntmngAccmltConectrdb(){
             $.ajax({
                 url : "${pageContext.request.contextPath}/buc/bucMntmngAccmltConectrdbAjax.do",
                 async : false,
                 dataType : 'json',
                 success :function(json) {


                	 $('#JSobjectProp').text(json.data[0].cnt + '명');

                 },error : function(){

                     console.log(arguments);
                 }
             });

             $.ajax({
                 url : "${pageContext.request.contextPath}/buc/bucMntmngRtdbAjax.do",
                 async : false,
                 dataType : 'json',
                 success :function(json) {

                	 $('#data1').text(json.data[0].complete_p + " %");

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
             var minute = today.getMinutes();

             switch(timerFlag){
             
             case 1:
                 if(second>=30 && second<45){
                     //var divid = document.getElementById("main");

                     //divid.style.backgroundColor = "#a939c6";
                     $("#pln_main").addClass('sctSmrSys tpMntn active');
                     //var divid = document.getElementById("img1");
                     //divid.src = "${contextPath}/images/bucrs/facility_top_on.png";

                 }else{

                     //var divid = document.getElementById("main");
                     $("#pln_main").removeClass("sctSmrSys tpMntn active");
                     $("#pln_main").addClass('sctSmrSys tpMntn');
                     //divid.style.backgroundColor = "#878787";
                     //var divid = document.getElementById("img1");
                        //divid.src = "${contextPath}/images/bucrs/facility_top.png";
                 }
                 
                   
                 break;
             case 2:
                 
                 minute%=2

                 if(minute == 0 && second <= 30){
                     //var divid = document.getElementById("main");

                     //divid.style.backgroundColor = "#a939c6";
                     $("#pln_main").addClass('sctSmrSys tpMntn active');
                     //var divid = document.getElementById("img1");
                     //divid.src = "${contextPath}/images/bucrs/facility_top_on.png";

                 }else{

                     //var divid = document.getElementById("main");
                     $("#pln_main").removeClass("sctSmrSys tpMntn active");
                     $("#pln_main").addClass('sctSmrSys tpMntn');
                     //divid.style.backgroundColor = "#878787";
                     //var divid = document.getElementById("img1");
                        //divid.src = "${contextPath}/images/bucrs/facility_top.png";
                 }
                 
                 break;
             case 3:
                 
                 minute%=4
                 
                 if(minute == 3){
                     //var divid = document.getElementById("main");

                     //divid.style.backgroundColor = "#a939c6";
                     $("#pln_main").addClass('sctSmrSys tpMntn active');
                     //var divid = document.getElementById("img1");
                     //divid.src = "${contextPath}/images/bucrs/facility_top_on.png";

                 }else{

                     //var divid = document.getElementById("main");
                     $("#pln_main").removeClass("sctSmrSys tpMntn active");
                     $("#pln_main").addClass('sctSmrSys tpMntn');
                     //divid.style.backgroundColor = "#878787";
                     //var divid = document.getElementById("img1");
                        //divid.src = "${contextPath}/images/bucrs/facility_top.png";
                 }
                 
                 
                 break;
             default:
                 
                 if(second>=30 && second<45){
                     //var divid = document.getElementById("main");

                     //divid.style.backgroundColor = "#a939c6";
                     $("#pln_main").addClass('sctSmrSys tpMntn active');
                     //var divid = document.getElementById("img1");
                     //divid.src = "${contextPath}/images/bucrs/facility_top_on.png";

                 }else{

                     //var divid = document.getElementById("main");
                     $("#pln_main").removeClass("sctSmrSys tpMntn active");
                     $("#pln_main").addClass('sctSmrSys tpMntn');
                     //divid.style.backgroundColor = "#878787";
                     //var divid = document.getElementById("img1");
                        //divid.src = "${contextPath}/images/bucrs/facility_top.png";
                 }
                 break;
             }

         } 

    </script>
</body>
</html>
