<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>메인관제 비즈니스 접속현황</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>

<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />

<style type="text/css">
    .lstSttAcc{padding:0 20px 0 20px;}
    .lstSttAcc li{overflow:hidden;float:left;width:25%;padding:0 10px;text-align:center;
        box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
    .lstSttAcc .tbTxt{font-family:"nanumB", "NanumGothicBold", "Nanum Gothic", "나눔고딕", "돋움", "Dotum";color:#fff;}
    .lstSttAcc .txtCnt{padding-bottom:8px;font-size:16px;}
    .lstSttAcc .txtSys{padding-top:5px;font-size:14px;}
/*     .lstSttAcc .txtSys.tpPln{color:#85bcd5;}
    .lstSttAcc .txtSys.tpCnst{color:#a2cccd;}
    .lstSttAcc .txtSys.tpMntn{color:#dcd0ad;}
    .lstSttAcc .txtSys.tpFclt{color:#a293c8;} */
      .lstSttAcc .txtSys.tpPln{color:#fff;}
    .lstSttAcc .txtSys.tpCnst{color:#fff;}
    .lstSttAcc .txtSys.tpMntn{color:#fff;}
    .lstSttAcc .txtSys.tpFclt{color:#fff;}
</style>
</head>

<body>

	<div id="wrap_if">
	    <ul class="lstSttAcc">
	        <li>
	            <div id="JSobjectProp1" class="tbTxt txtCnt">42명</div>
	            <img src="${contextPath}/images/main/sttAccPln.png" alt="설계">
	            <div class="tbTxt txtSys tpPln">설계</div>
	        </li>
	        <li>
	            <div id="JSobjectProp2" class="tbTxt txtCnt">51명</div>
	            <img src="${contextPath}/images/main/sttAccCnst.png" alt="건설">
	            <div class="tbTxt txtSys tpCnst">건설</div>
	        </li>
	        <li>
	            <div id="JSobjectProp3" class="tbTxt txtCnt">245명</div>
	            <img src="${contextPath}/images/main/sttAccMntn.png" alt="유지관리">
	            <div class="tbTxt txtSys tpMntn">유지관리</div>
	        </li>
	        <li>
	            <div id="JSobjectProp4" class="tbTxt txtCnt">42명</div>
	            <img src="${contextPath}/images/main/sttAccFclt.png" alt="시설물">
	            <div class="tbTxt txtSys tpFclt">시설물</div>
	        </li>
	    </ul>
	</div>

                   




    <script type="text/javascript">
        
         $(window).load(function() {

            //randomCnt();
            timerStart();
            //textMovetest();
            //arrayTest();

        });
        
        function randomCnt(){
            
            var randdomdata = new Array();

            for(var i = 0 ; i<4;i++){
                randdomdata[i] = Math.floor(Math.random()*6)+1;
            }
            
            /*
            var prop1 = parseInt($('#JSobjectProp1').text()) + randdomdata[0];
            var prop2 = parseInt($('#JSobjectProp2').text()) + randdomdata[1];
            var prop3 = parseInt($('#JSobjectProp3').text()) + randdomdata[2];
            var prop4 = parseInt($('#JSobjectProp4').text()) + randdomdata[3];
            */
            var prop1 = parseInt($('#JSobjectProp1').text());
            var prop2 = parseInt($('#JSobjectProp2').text());
            var prop3 = parseInt($('#JSobjectProp3').text());
            var prop4 = parseInt($('#JSobjectProp4').text());
            
            var myObject1 = { prop1: 0 };
            var myObject2 = { prop2: 0 };
            var myObject3 = { prop3: 0 };
            var myObject4 = { prop4: 0 };

            var JSobjectProp1 = anime({
                targets: myObject1,
                prop1: prop1,
                easing: 'linear',
                round: 1,
                update: function() {
                    var el = document.querySelector('#JSobjectProp1');
                
                    var jsonString = JSON.stringify(myObject1).replace('{"prop1":','').replace('"}','').replace('"','');
                
                    el.innerHTML = jsonString+'명';
                }
            });

            var JSobjectProp2 = anime({
                targets: myObject2,
                prop2: prop2,
                easing: 'linear',
                round: 1,
                update: function() {
                    var el = document.querySelector('#JSobjectProp2');
                
                    var jsonString = JSON.stringify(myObject2).replace('{"prop2":','').replace('"}','').replace('"','');
                
                    el.innerHTML = jsonString+'명';
                }
            });

            var JSobjectProp3 = anime({
                targets: myObject3,
                prop3: prop3,
                easing: 'linear',
                round: 1,
                update: function() {
                    var el = document.querySelector('#JSobjectProp3');
                
                    var jsonString = JSON.stringify(myObject3).replace('{"prop3":','').replace('"}','').replace('"','');
                
                    el.innerHTML = jsonString+'명';
                }
            });

            var JSobjectProp4 = anime({
                targets: myObject4,
                prop4: prop4,
                easing: 'linear',
                round: 1,
                update: function() {
                    var el = document.querySelector('#JSobjectProp4');
                
                    var jsonString = JSON.stringify(myObject4).replace('{"prop4":','').replace('"}','').replace('"','');
                
                    el.innerHTML = jsonString+'명';
                }
            });
        }

        function timerStart(){
            window.setInterval("randomCnt()",6000);
            
        } 
        

    </script>
</body>
</html>