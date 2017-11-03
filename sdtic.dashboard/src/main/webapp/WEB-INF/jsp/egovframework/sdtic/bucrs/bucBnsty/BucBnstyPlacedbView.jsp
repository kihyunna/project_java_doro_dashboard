<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 건설현장 현황</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:800px; height:600px;"></div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'),'dark');
        
        
        jQuery(document).ready(function($){
    		
        	//-----------------------------------AJAX 호출 영역 ---------------------------------------

        	       getBnstyPlacedbAjax();

        	//-----------------------------------AJAX 호출 영역 ---------------------------------------
        })

        // specify chart configuration item and data     
		var xData = new Array();
        
        var timeLineData = ['장비', '자재', '인력'];
		
        //금일			 
		//var data_now = [37, 24, 7, 26, 17, 4, 25, 42, 33, 24, 40, 13, 52, 17, 21];
		var todayData = {
				'장비' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'자재' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'인력' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
		};
		
		//전일
		//var data_bef = [35, 22, 9, 21, 15, 8, 21, 42, 31, 23, 46, 23, 12, 18, 26];
		var yesterData = {
				'장비' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'자재' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'인력' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
		};
		//금일 - 전일
		var data_dif = {
				'장비' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'자재' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'인력' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
		};

		//(금일 - 전일)의 절대값 -> 증감량 막대그래프에 사용
		
		var data_abs = {
				'장비' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'자재' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'인력' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
		};

		//금일 - (금일 - 전일)의 절대값 -> 금일 막대그래프에 사용
		var data_pro = {
				'장비' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'자재' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				'인력' : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
		};

		 
		function getBnstyPlacedbAjax(){
	        $.ajax({
	            url : "${pageContext.request.contextPath}/buc/bucBnstyPlacedbAjax.do",
	            async : false,
	            dataType : 'json',
	            success :function(json) {           

	                    if(json.data.length > 0 ){
	                        for(var i = 0; i < json.data.length; i++) {
	                            	todayData['장비'][i] = parseInt(json.data[i].eqpm);
	                            	todayData['자재'][i] = parseInt(json.data[i].mtri);
	                            	todayData['인력'][i] = parseInt(json.data[i].worker);
	                            	yesterData['장비'][i] = parseInt(json.data[i].eqpm_y);
	                            	yesterData['자재'][i] = parseInt(json.data[i].mtri_y);
	                            	yesterData['인력'][i] = parseInt(json.data[i].worker_y);
		                            xData[i] = json.data[i].kor_dptnm.replace('사업단', '');
		                            data_dif['장비'][i] = json.data[i].eqpm_cal;
		                            data_dif['자재'][i] = json.data[i].mtri_cal;
		                            data_dif['인력'][i] = json.data[i].worker_cal;
	                            
	                        }
	                       // alert(todayData['장비']);
	                    }	                    
	                    else{
	                    console.log(arguments);
	                    }
	                    
	                    for(var i=0;i < todayData['장비'].length; i++){
	            			//data_dif[i] = data_now[i] - data_bef[i];
	            			data_abs['장비'][i] = Math.abs(data_dif['장비'][i]);
	            			if(data_dif['장비'][i] > 0){
	            				data_pro['장비'][i] = todayData['장비'][i] - data_dif['장비'][i];
	            			}else{
	            				data_pro['장비'][i] = todayData['장비'][i] - data_abs['장비'][i];
	            			}
	            		} 
	                    for(var i=0;i < todayData['자재'].length; i++){
	            			//data_dif[i] = data_now[i] - data_bef[i];
	            			data_abs['자재'][i] = Math.abs(data_dif['자재'][i]);
	            			if(data_dif['자재'][i] > 0){
	            				data_pro['자재'][i] = todayData['자재'][i] - data_dif['자재'][i];
	            			}else{
	            				data_pro['자재'][i] = todayData['자재'][i] - data_abs['자재'][i];
	            			}
	            		} 
	                    for(var i=0;i < todayData['인력'].length; i++){
	            			//data_dif[i] = data_now[i] - data_bef[i];
	            			data_abs['인력'][i] = Math.abs(data_dif['인력'][i]);
	            			if(data_dif['인력'][i] > 0){
	            				data_pro['인력'][i] = todayData['인력'][i] - data_dif['인력'][i];
	            			}else{
	            				data_pro['인력'][i] = todayData['인력'][i] - data_abs['인력'][i];
	            			}
	            		} 
	                },error : function(){
	                    console.log(arguments);
	                }, complete : function() {
	                	option = {
	                			baseOption:{
	                			timeline: {
	                					show: false,
	                					axisType: 'category',
	                					autoPlay: true,
	                					left: 0,
	                					currentIndex: 0,
	                					bottom: 5,
	                					width: '100%',
	                					playInterval: 3000,
	                					label: {
	                						normal: {
	                							show: false,
	                							interval: 'auto'
	                						}
	                					},
	                					data: timeLineData,
	                				},
	                			"grid": {
	                				left:"15%",
	                				right:7,
	                				bottom:"25%"
	                			}, 
	                			"legend": {
	                				"right" : 10,
	                				"data": []
	                			}, 
	                			"calculable": true, 
	                			"xAxis": [
	                				{
	                					"type": "category", 
	                					"splitLine": {
	                						"show": false
	                					}, 
	                					"axisTick": {
	                						"show": false
	                					}, 
	                					"splitArea": {
	                						"show": false
	                					}, 
	                					"axisLabel": {
	                						"interval": 0, 
	                						"rotate": 45, 
	                						"show": true, 
	                						"splitNumber": 15, 
	                						"textStyle": {
	                							"fontSize": 12
	                						}
	                					}, 
	                					"data": xData,
	                				}
	                			], 
	                			"yAxis": [
	                				{
	                					"type": "value", 
	                					
	                					"splitLine": {
	                						"show": false
	                					}, 
	                					"axisLine": {
	                						"show": true
	                					}, 
	                					"axisTick": {
	                						"show": false
	                					}, 
	                					"splitArea": {
	                						"show": false
	                					}
	                				}
	                			], 
	                			"series": [
	                				{
	                					"name": "금일", 
	                					"type": "bar", 
	                					"stack": "bar", 
	                					"barMaxWidth": 50, 
	                					"barGap": "10%", 	                					
	                					"data": []
	                				}, 
	                				{
	                					"name": "증가량", 
	                					"type": "bar", 
	                					"stack": "bar",	                					 
	                					"data": []
	                				}
	                			]
	                		},
	                		options:[]
	                	};
	                		 for(var n = 0; n < timeLineData.length; n++)
	                		    {
	                			 	option.options.push({
	                		            title: {
	                		                show: true,
	                		                text:'건설현장현황 - ' + timeLineData[n]
	                		            },
	                		            series: [
	                		            {
	                		                name:'금일',
	                		                type:'bar',
		                					"stack": "bar","itemStyle": {
		                						"normal": {
		                							"barBorderRadius": 0, 
		                							"color": "rgba(60,169,196,0.5)", 
		                							"label": {
		                								"show": true, 
		                								"textStyle": {
		                									"color": "rgba(0,0,0,1)"
		                								}, 
		                								"position": "insideTop",
		                								formatter : function(p) 
		                								{
		                									return todayData[p.dataIndex];
		                								}
		                							}
		                						}
		                					}, 
		                					label: {
		                		            	normal: {
		                		                    show: true,
		                		                    position: 'outside',
		                		                    offset: [10, 0],
		                		                    textStyle: {
		                		                        fontSize: 16
		                		                    }
		                		                }
		                		            },
	                		                data: data_pro[timeLineData[n]]
	                		            },
	                		            {
	                		                name:'증가량',
	                		                type:'bar',
		                					"stack": "bar","itemStyle": {
		                						"normal": {
		                							"color": 
		                							function(p) {
		                								if(data_dif[p.dataIndex] > 0){
		                									return "rgba(51,204,112,1)";
		                								}else{
		                									return "rgba(193,35,43,1)";
		                								}
		                							}, 
		                							"barBorderRadius": 0, 
		                							"label": {
		                								"show": true, 
		                								"position": "top",
		                								formatter : 
		                								function(p) {
		                									if(data_dif[p.dataIndex] > 0){
		                										return p.value > 0 ? ('▲' + p.value + '') : '';
		                									}else{
		                										return p.value > 0 ? ('▼' + p.value + '') : '';
		                									}
		                								}
		                							}
		                						}
		                					},
		                					label: {
		                		            	normal: {
		                		                    show: true,
		                		                    position: 'outside',
		                		                    offset: [10, 0],
		                		                    textStyle: {
		                		                        fontSize: 16
		                		                    }
		                		                }
		                		            },
	                		                data: data_abs[timeLineData[n]]
	                		            }]
	                		        });
	                		    }
	                		
	                		myChart.setOption(option);

	                }
	            });
	        
	        }
		
		var timerValue = 0;
		$(window).load(function() {
			setDivHeight('main');
			
		    timerValue = "${param.widgetTimer}";
            
            if(timerValue == 0){
                timerValue = 60000*60;
            }
            
            window.setInterval("getBnstyPlacedbAjax()",timerValue);
			
			
		});
		
	    $(window).resize(function(){

	        setDivHeight('main');
	        
	        

	    });

	    function setDivHeight(objSet)
	    {

	        var objSet   = document.getElementById(objSet);
	        objSet.style.width  = ($(window).width()) + "px";
	        objSet.style.height  = ($(window).height()) + "px";
	       

	        $('#main').width(($(window).width()) + "px");
	        $('#main').height(($(window).height()) + "px");


	        myChart.resize({
	            width: $(window).width(),
	            height : $(window).height()
	            
	        });
	      
			
	    }
		
        // use configuration item and data specified to show chart
   
    </script>
</body>
</html>
