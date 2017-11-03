<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>메인 대외연계</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<style type="text/css">
    .lstCnctM{padding-top:15px;}
    .lstCnctM li{overflow:hidden;float:left;width:25%;min-width:99px;padding:0 1px;text-align:center;
        box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
    .lstCnctM .txtNm{display:inline-block;padding-top:5px;font-size:14px;letter-spacing:-1px;font-family:"nanumB", "NanumGothicBold", "Nanum Gothic", "나눔고딕", "돋움", "Dotum";color:#fff;}
    
    .areaChart{overflow:hidden;clear:both;width:45px;height:110px;margin:0 auto;}
    .areaChart .tpInb{float:left;}
    .areaChart .tpOutb{float:right;}
    .areaChart .indGrd{overflow:hidden;width:22px;height:10px;margin-bottom:1px;}
    .areaChart.site01 .indGrd{background-color:rgba(243,137,61,0.4);}
    .areaChart.site02 .indGrd{background-color:rgba(129,220,242,0.4);}
    .areaChart.site03 .indGrd{background-color:rgba(131,241,201,0.4);}
    .areaChart.site04 .indGrd{background-color:rgba(127,173,244,0.4);}
    .areaChart.site05 .indGrd{background-color:rgba(128,243,129,0.4);}
    .areaChart.site01 .indGrd.check{background-color:rgba(243,137,61,1.0);}
    .areaChart.site02 .indGrd.check{background-color:rgba(129,220,242,1.0);}
    .areaChart.site03 .indGrd.check{background-color:rgba(131,241,201,1.0);}
    .areaChart.site04 .indGrd.check{background-color:rgba(127,173,244,1.0);}
    .areaChart.site05 .indGrd.check{background-color:rgba(128,243,129,1.0);}
</style>
</head>

<body>
<div id="systext" style="width:inherit; margin-right: 10px; height:15px; font-size:13px; text-align: right; color:#fff; background-color:#ffffffff">Inbound/Outbound</div>
<div id="wrap_if">
    <ul class="lstCnctM"> 
        <li>
            <!--Chart: 국민안전처-->
            <div class="areaChart site03">
                <!--Inbound-->
                <div class="tpInb">
                    <div id="safeIn10" class="indGrd grd10 "></div>
                    <div id="safeIn09" class="indGrd grd09 "></div>
                    <div id="safeIn08" class="indGrd grd08 "></div>
                    <div id="safeIn07" class="indGrd grd07 "></div>
                    <div id="safeIn06" class="indGrd grd06 "></div>
                    <div id="safeIn05" class="indGrd grd05 "></div>
                    <div id="safeIn04" class="indGrd grd04 "></div>
                    <div id="safeIn03" class="indGrd grd03 "></div>
                    <div id="safeIn02" class="indGrd grd02 "></div>
                    <div id="safeIn01" class="indGrd grd01 "></div>
                </div>
                <!--//Inbound-->
                <!--Outbound-->
                <div class="tpOutb">
                    <div id="safeOut10" class="indGrd grd10"></div>
                    <div id="safeOut09" class="indGrd grd09"></div>
                    <div id="safeOut08" class="indGrd grd08"></div>
                    <div id="safeOut07" class="indGrd grd07 "></div>
                    <div id="safeOut06" class="indGrd grd06 "></div>
                    <div id="safeOut05" class="indGrd grd05 "></div>
                    <div id="safeOut04" class="indGrd grd04 "></div>
                    <div id="safeOut03" class="indGrd grd03 "></div>
                    <div id="safeOut02" class="indGrd grd02 "></div>
                    <div id="safeOut01" class="indGrd grd01 "></div>
                </div>
                <!--//Outbound-->
            </div>
            <!--//Chart: 국민안전처-->
            <span class="txtNm">국민안전처</span>
        </li>       
        <li>
            <!--Chart: 기상청-->
            <div class="areaChart site02">
                <!--Inbound-->
                <div class="tpInb">
                    <div id="weatherIn10" class="indGrd grd10"></div>
                    <div id="weatherIn09" class="indGrd grd09 "></div>
                    <div id="weatherIn08" class="indGrd grd08 "></div>
                    <div id="weatherIn07" class="indGrd grd07 "></div>
                    <div id="weatherIn06" class="indGrd grd06 "></div>
                    <div id="weatherIn05" class="indGrd grd05 "></div>
                    <div id="weatherIn04" class="indGrd grd04 "></div>
                    <div id="weatherIn03" class="indGrd grd03 "></div>
                    <div id="weatherIn02" class="indGrd grd02 "></div>
                    <div id="weatherIn01" class="indGrd grd01 "></div>
                </div>
                <!--//Inbound-->
                <!--Outbound-->
                <div class="tpOutb">
                    <div id="weatherOut10" class="indGrd grd10"></div>
                    <div id="weatherOut09" class="indGrd grd09"></div>
                    <div id="weatherOut08" class="indGrd grd08"></div>
                    <div id="weatherOut07" class="indGrd grd07"></div>
                    <div id="weatherOut06" class="indGrd grd06"></div>
                    <div id="weatherOut05" class="indGrd grd05 "></div>
                    <div id="weatherOut04" class="indGrd grd04 "></div>
                    <div id="weatherOut03" class="indGrd grd03 "></div>
                    <div id="weatherOut02" class="indGrd grd02 "></div>
                    <div id="weatherOut01" class="indGrd grd01 "></div>
                </div>
                <!--//Outbound-->
            </div>
            <!--//Chart: 기상청-->
            <span class="txtNm">기상청</span>
        </li>
        
        <li>
            <!--Chart: 한국시설안전공단-->
            <div class="areaChart site04">
                <!--Inbound-->
                <div class="tpInb">
                    <div id="ferIn10" class="indGrd grd10"></div>
                    <div id="ferIn09" class="indGrd grd09"></div>
                    <div id="ferIn08" class="indGrd grd08 "></div>
                    <div id="ferIn07" class="indGrd grd07 "></div>
                    <div id="ferIn06" class="indGrd grd06 "></div>
                    <div id="ferIn05" class="indGrd grd05 "></div>
                    <div id="ferIn04" class="indGrd grd04 "></div>
                    <div id="ferIn03" class="indGrd grd03 "></div>
                    <div id="ferIn02" class="indGrd grd02 "></div>
                    <div id="ferIn01" class="indGrd grd01 "></div>
                </div>
                <!--//Inbound-->
                <!--Outbound-->
                <div class="tpOutb">
                    <div id="ferOut10" class="indGrd grd10"></div>
                    <div id="ferOut09" class="indGrd grd09"></div>
                    <div id="ferOut08" class="indGrd grd08"></div>
                    <div id="ferOut07" class="indGrd grd07"></div>
                    <div id="ferOut06" class="indGrd grd06 "></div>
                    <div id="ferOut05" class="indGrd grd05 "></div>
                    <div id="ferOut04" class="indGrd grd04 "></div>
                    <div id="ferOut03" class="indGrd grd03 "></div>
                    <div id="ferOut02" class="indGrd grd02 "></div>
                    <div id="ferOut01" class="indGrd grd01 "></div>
                </div>
                <!--//Outbound-->
            </div>
            <!--//Chart: 한국시설안전공단-->
            <span class="txtNm">시설안전공단</span>
        </li>
        <li>
            <!--Chart: 한국환경공단-->
            <div class="areaChart site05">
                <!--Inbound-->
                <div class="tpInb">
                    <div id="environIn10" class="indGrd grd10"></div>
                    <div id="environIn09" class="indGrd grd09"></div>
                    <div id="environIn08" class="indGrd grd08"></div>
                    <div id="environIn07" class="indGrd grd07 "></div>
                    <div id="environIn06" class="indGrd grd06 "></div>
                    <div id="environIn05" class="indGrd grd05 "></div>
                    <div id="environIn04" class="indGrd grd04 "></div>
                    <div id="environIn03" class="indGrd grd03 "></div>
                    <div id="environIn02" class="indGrd grd02 "></div>
                    <div id="environIn01" class="indGrd grd01 "></div>
                </div>
                <!--//Inbound-->
                <!--Outbound-->
                <div class="tpOutb">
                    <div id="environOut10" class="indGrd grd10"></div>
                    <div id="environOut09" class="indGrd grd09"></div>
                    <div id="environOut08" class="indGrd grd08"></div>
                    <div id="environOut07" class="indGrd grd07"></div>
                    <div id="environOut06" class="indGrd grd06 "></div>
                    <div id="environOut05" class="indGrd grd05 "></div>
                    <div id="environOut04" class="indGrd grd04 "></div>
                    <div id="environOut03" class="indGrd grd03 "></div>
                    <div id="environOut02" class="indGrd grd02 "></div>
                    <div id="environOut01" class="indGrd grd01 "></div>
                </div>
                <!--//Outbound-->
            </div>
            <!--//Chart: 한국환경공단-->
            <span class="txtNm">한국환경공단</span>
        </li>
    </ul>
</div>


<script type="text/javascript">
	var inWeather = 0;
	var outWeather = 0;
	var inTraffic = 0;
	var outTraffic = 0;
	var inSafe = 0;
	var outSafe = 0;
	var inFercility = 0;
	var outFercility = 0;
	var inEnviron = 0;
	var outEnviron = 0;

	jQuery(document).ready(function($){
		
		//-----------------------------------AJAX 호출 영역 ---------------------------------------
	
		        getBucMainExtrnlCntcdbAjax();
		        
	
		//-----------------------------------AJAX 호출 영역 ---------------------------------------
	})
	
	function getBucMainExtrnlCntcdbAjax(){
	    $.ajax({
	        url : "${pageContext.request.contextPath}/buc/bucMainExtrnlCntcdbAjax.do",
	        async : false,
	        dataType : 'json',
	        success :function(json) {    
	        		initBlocks();
	                if(json.data.length > 0 ){
	                    for(var i=0; i<json.data.length; i++)
	                    {
							if(json.data[i].biz_nm == '기상청') {
								if(json.data[i].trst_ty == 'R') {
									inWeather = (parseInt(json.data[i].trst_stat_r) + 
												parseInt(json.data[i].trst_stat_c) +
												parseInt(json.data[i].trst_stat_e)) / 1000;
								} else if(json.data[i].trst_ty == 'S') {
									outWeather = (parseInt(json.data[i].trst_stat_r) + 
											parseInt(json.data[i].trst_stat_c) +
											parseInt(json.data[i].trst_stat_e)) / 1000;
								}
							} else if(json.data[i].biz_nm == '국민안전처') {
								if(json.data[i].trst_ty == 'R') {
									inSafe = (parseInt(json.data[i].trst_stat_r) + 
												parseInt(json.data[i].trst_stat_c) +
												parseInt(json.data[i].trst_stat_e)) / 1000;
								} else if(json.data[i].trst_ty == 'S') {
									outSafe = (parseInt(json.data[i].trst_stat_r) + 
											parseInt(json.data[i].trst_stat_c) +
											parseInt(json.data[i].trst_stat_e)) / 1000;
								}
							} else if(json.data[i].biz_nm == '시설안전관리공단') {
								if(json.data[i].trst_ty == 'R') {
									inFercility = (parseInt(json.data[i].trst_stat_r) + 
												parseInt(json.data[i].trst_stat_c) +
												parseInt(json.data[i].trst_stat_e)) / 1000;
								} else if(json.data[i].trst_ty == 'S') {
									outFercility = (parseInt(json.data[i].trst_stat_r) + 
											parseInt(json.data[i].trst_stat_c) +
											parseInt(json.data[i].trst_stat_e)) / 1000;
								}
							} else if(json.data[i].biz_nm == '한국환경공단-올바로시스템') {
								if(json.data[i].trst_ty == 'R') {
									inEnviron = (parseInt(json.data[i].trst_stat_r) + 
												parseInt(json.data[i].trst_stat_c) +
												parseInt(json.data[i].trst_stat_e)) / 1000;
								} else if(json.data[i].trst_ty == 'S') {
									outEnviron = (parseInt(json.data[i].trst_stat_r) + 
											parseInt(json.data[i].trst_stat_c) +
											parseInt(json.data[i].trst_stat_e)) / 1000;
								}
							}
	                    }
	                }
	                else{
	                console.log(arguments);
	                }
	
	            },error : function(){
	                console.log(arguments);
	            }, complete : function() {	            	
	            	for(var i =0; i<inWeather; i++) {
	            		$('#weatherIn0' + (i+1)).addClass('check');
	            	}
	            	for(var i =0; i<outWeather; i++) {
	            		$('#weatherOut0' + (i+1)).addClass('check');
	            	}	            	
	            	for(var i =0; i<inSafe; i++) {
	            		$('#safeIn0' + (i+1)).addClass('check');
	            	}
	            	for(var i =0; i<outSafe; i++) {
	            		$('#safeOut0' + (i+1)).addClass('check');
	            	}
	            	for(var i =0; i<inFercility; i++) {
	            		$('#ferIn0' + (i+1)).addClass('check');
	            	}
	            	for(var i =0; i<outFercility; i++) {
	            		$('#ferOut0' + (i+1)).addClass('check');
	            	}
	            	for(var i =0; i<inEnviron; i++) {
	            		$('#environIn0' + (i+1)).addcClass('check');
	            	}
	            	for(var i =0; i<outEnviron; i++) {
	            		$('#evironOut0' + (i+1)).addClass('check');
	            	}	            	
	            }
	     });
	}
	
	function initBlocks() {
		for(var i = 0; i < 10; i++) {
			$('#weatherIn0' + (i+1)).removeClass('check');
			$('#weatherOut0' + (i+1)).removeClass('check');			
			$('#safeIn0' + (i+1)).removeClass('check');
			$('#safeOut0' + (i+1)).removeClass('check');
			$('#ferIn0' + (i+1)).removeClass('check');
			$('#ferOut0' + (i+1)).removeClass('check');
			$('#environIn0' + (i+1)).removeClass('check');
			$('#evironOut0' + (i+1)).removeClass('check');
		}
	}
		
        
	var timerValue = 0;
    $(window).load(function(){

        timerValue = "${param.widgetTimer}";
        
        if(timerValue == 0){
            timerValue = 60000*60;
        }
        
        window.setInterval("getBucMainExtrnlCntcdbAjax()",timerValue);
        
    }); 
        
        /* function timer(){
        	var toggle =0;
        	setInterval(function() {
        		if(toggle==0) {
        			$('#trafficIn09').addClass('check');
        			$('#trafficOut07').addClass('check');
        			$('#weatherIn09').removeClass('check');
        			$('#weatherOut07').addClass('check');
        			$('#weatherOut06').addClass('check');
        			$('#safeIn10').removeClass('check');
        			$('#safeIn09').removeClass('check');
        			$('#safeOut07').removeClass('check');
        			$('#safeOut06').removeClass('check');
        			$('#ferIn08').removeClass('check');
        			$('#ferOut06').removeClass('check');
        			$('#ferOut05').removeClass('check');
        			$('#environIn10').addClass('check');
        			$('#environIn09').addClass('check');
        			$('#environIn08').addClass('check');
        			$('#environOut08').addClass('check');
        			$('#environOut07').addClass('check');
        			toggle = 1;
        		} else {
        			$('#trafficIn09').removeClass('check')
        			$('#trafficOut07').removeClass('check');
        			$('#weatherIn09').addClass('check');
        			$('#weatherOut07').removeClass('check');
        			$('#weatherOut06').removeClass('check');
        			$('#safeIn10').addClass('check');
        			$('#safeIn09').addClass('check');
        			$('#safeOut07').addClass('check');
        			$('#safeOut06').addClass('check');
        			$('#ferIn08').addClass('check');
        			$('#ferOut06').addClass('check');
        			$('#ferOut05').addClass('check');
        			$('#environIn10').removeClass('check');
        			$('#environIn09').removeClass('check');
        			$('#environIn08').removeClass('check');
        			$('#environOut08').removeClass('check');
        			$('#environOut07').removeClass('check');
        			toggle =0;
        		}
        	}, 3000);
        } */
    </script>
</body>
</html>