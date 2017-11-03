<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>비즈니스 공통 데이터 증가율 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
    
<style type="text/css">
  
</style>
</head>

<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:1000px; height:500px;"></div>
    
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'),'dark');
        var timeLineData = ['정형데이터(MB)','비정형데이터(GB)'];
        
        var today = new Date();
        var test = today.getDay();
        
   
        
        var  JtimeData = {
        		'정형데이터(MB)':[0, 0, 0, 0, 0, 0, 0],
        		'비정형데이터(GB)':[0, 0, 0, 0, 0, 0, 0],
        };
        
        for(var i = test ; i < 7 ; i++){
        	JtimeData['비정형데이터(GB)'][i] = null;
        }
        for(var j = test+1; j<7;j++) {
        	JtimeData['정형데이터(MB)'][j] = null;
        }
        
        var  BtimeData = {
        		'정형데이터(MB)':[0, 0, 0, 0, 0, 0, 0],
        		'비정형데이터(GB)':[0, 0, 0, 0, 0, 0, 0],
        };
        // specify chart configuration item and data
        
        jQuery(document).ready(function($){

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	        getBucCmmnDataicrrtdbAjax();

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
   	});   
        
        var timerValue = 0;
        $(window).load(function(){

            timerValue = "${param.widgetTimer}";
            
            if(timerValue == 0){
                timerValue = 60000*60;
            }
            
            window.setInterval("getBucCmmnDataicrrtdbAjax()",timerValue);
            
        });
    
   
    function getBucCmmnDataicrrtdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnDataicrrtdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {
            	var thisweek1 = [0, 0, 0, 0, 0, 0, 0];
            	var lastweek1 = [0, 0, 0, 0, 0, 0, 0, 0];
            	var thisweek2 = [0, 0, 0, 0, 0, 0, 0];
            	var lastweek2 = [0, 0, 0, 0, 0, 0, 0, 0];
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++) {	
                    	if(json.data[i].sys_gubun == '정형'){
                    		
                    		if(json.data[i].gubun == 'THISWEEK'){
                    			var test = new Date();
                    			test = test.getDay();
                    			thisweek1[json.data[i].gubun_day - 1] =  json.data[i].use_value;
                        	}
                    		else if(json.data[i].gubun == 'LASTWEEK'){
                    			lastweek1[json.data[i].gubun_day - 1] =  json.data[i].use_value;
                    		}
                    		else if(json.data[i].gubun == 'DATEWEEK'){
                    			lastweek1[7] =  json.data[i].use_value;
                    		}
                    	}
                    	else if(json.data[i].sys_gubun == '비정형'){
                    		
							if(json.data[i].gubun == 'THISWEEK'){
								thisweek2[json.data[i].gubun_day - 1] =  json.data[i].use_value;
                        	}
                    		else if(json.data[i].gubun == 'LASTWEEK'){
                    			lastweek2[json.data[i].gubun_day - 1] =  json.data[i].use_value;
                    		}
                    		else if(json.data[i].gubun == 'DATEWEEK'){
                    			lastweek2[7] =  json.data[i].use_value;
                    		}
                    	}                    	
                   }
                    
                    for(var i=0; i<7; i++){
                		if( i == 0){
                			if(JtimeData['정형데이터(MB)'][i] != null)
                    			JtimeData['정형데이터(MB)'][i] = (thisweek1[i] - lastweek1[6]).toFixed(1);                        		
                			if(JtimeData['비정형데이터(GB)'][i] != null)
                    			JtimeData['비정형데이터(GB)'][i] = (thisweek2[i] - lastweek2[6]).toFixed(1);
                			
                			BtimeData['정형데이터(MB)'][i] = (lastweek1[i] - lastweek1[7]).toFixed(1);
                    		BtimeData['비정형데이터(GB)'][i] = (lastweek2[i] - lastweek2[7]).toFixed(1);
                    			
                		}
                		else{
                			
                			if(JtimeData['정형데이터(MB)'][i] != null)
                    			JtimeData['정형데이터(MB)'][i] = (thisweek1[i] - lastweek1[i-1]).toFixed(1);
                			if(JtimeData['비정형데이터(GB)'][i] != null)
                    			JtimeData['비정형데이터(GB)'][i] = (thisweek2[i] - lastweek2[i-1]).toFixed(1);
                			

                    		BtimeData['정형데이터(MB)'][i] = (lastweek1[i] - lastweek1[i-1]).toFixed(1);
                    		BtimeData['비정형데이터(GB)'][i] = (lastweek2[i] - lastweek2[i-1]).toFixed(1);
                			
                		}
                	}
                    
                }
                else{
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
            }, complete : function() {
            	myChart.setOption(option);
            	
            }
        });

    }
      option = {
    		  baseOption: {
    			
    			title: {
    				top:'10px',
    				textStyle: {
    		            fontSize: 14,
    		            color: '#F1F1F3',
    		            fontWeight: 'normal'
    		        }
    			},
    			tooltip: {
    		        trigger: 'axis',
    		        axisPointer: {
    		            lineStyle: {
    		                color: '#57617B'
    		            }
    		        }
    		    },
    		    legend: {
    		        icon: 'rect',
    		        itemWidth: 14,
    		        itemHeight: 5,
    		        itemGap: 13,
    		        data: ['금주', '전주'],
    		        left: '75%',
    		        right: '6%',
    		        top: 10,
    		        textStyle: {
    		            fontSize: 12,
    		            color: '#F1F1F3'
    		        }
    		    },
    		    textStyle: {
    	            fontWeight: 'normal',
    	            fontSize: 18,
    	            color: '#F1F1F3'
    	        },
    	        left: '6%',
    	        top: '10px',
    		    grid: {

    		        left: '3%',
    		        right: '4%',
    		        bottom: '3%',
    		        containLabel: true
    		    },
    		    	
    		    	 xAxis: [{
    		    	        type: 'category',
    		    	        boundaryGap: false,
    		    	        axisLine: {
    		    	            lineStyle: {
    		    	                color: '#F1F1F3`'
    		    	            }
    		    	        },
    		    	        data: ['일', '월', '화', '수', '목', '금', '토']
    		    	    }],
    		    	    yAxis: [{
    		    	        type: 'value',
    		    	       // max: 100,
    		    	        axisTick: {
    		    	            show: false
    		    	        },
    		    	        axisLine: {
    		    	            lineStyle: {
    		    	                color: '#F1F1F3'
    		    	            }
    		    	        },
    		    	        axisLabel: {
    		    	            margin: 10,
    		    	            textStyle: {
    		    	                fontSize: 14
    		    	            }
    		    	        },
    		    	        splitLine: {
    		    	            lineStyle: {
    		    	                color: '#57617B'
    		    	            }
    		    	        }
    		    	    }],
    		    	    
    		    	    timeline: {
                            show: false,
                            axisType: 'category',
                            autoPlay: true,
                            left: 0,
                            currentIndex: 0,
                            top: 20,
                            width: 800,
                            playInterval: 10000,

                            data: []

    		    	    },
    		    	    series:[],
        
    		    	    animationEasing: 'linear',
    		    	   
			      },
     		 options :[]
        };
			
    for (var n = 0; n < timeLineData.length; n++) {
        option.baseOption.timeline.data.push(timeLineData[n]);
        
        option.options.push({
            title :{
            	text: timeLineData[n]  ,
            	left: '10px'
            },
    	series: [{
	        name: '금주',
	        type: 'line',
	        lineStyle: {
	            normal: {
	                width: 1
	            }
	        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgba(137, 189, 27, 0.3)'
                }, {
                    offset: 0.8,
                    color: 'rgba(137, 189, 27, 0)'
                }], false),
                shadowColor: 'rgba(0, 0, 0, 0.1)',
                shadowBlur: 10
            }
        },
        itemStyle: {
            normal: {
                color: 'rgb(137,189,27)'
            }
        },
        data: JtimeData[timeLineData[n]]
    }, {
        name: '전주',
        type: 'line',
        //smooth: true,
        lineStyle: {
            normal: {
                width: 1
            }
        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgba(0, 136, 212, 0.3)'
                }, {
                    offset: 0.8,
                    color: 'rgba(0, 136, 212, 0)'
                }], false),
                shadowColor: 'rgba(0, 0, 0, 0.1)',
                shadowBlur: 10
            }
        },
        itemStyle: {
            normal: {
                color: 'rgb(0,136,212)'
            }
        },
        data:BtimeData[timeLineData[n]]
    }, 
         ]
        });
};       



            myChart.setOption(option);
            $(window).load(function() {
                setDivHeight('main');
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