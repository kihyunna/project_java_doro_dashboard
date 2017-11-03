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
        var timeLineData = ['정형데이터(Mb)','비정형데이터(Gb)'];
        
        var today = new Date();
        var test = today.getDay();
        
        var  JtimeData = {
        		'정형데이터(Mb)':[2,300,250,400,210,230,2],
        		'비정형데이터(Gb)':[0,15,25,30,15,20,0],
        };
        
        for(var i = test+1 ; i < 7 ; i++){
        	JtimeData['정형데이터(Mb)'][i] = null;
        	JtimeData['비정형데이터(Gb)'][i] = null;
        }
        
        var  BtimeData = {
        		'정형데이터(Mb)':[3,250,240,160,170,260,1],
				'비정형데이터(Gb)':[0,25,20,16,17,18,0],
				};
        // specify chart configuration item and data
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
    		        top: '5%',
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
                            playInterval: 3000,

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
            	text: timeLineData[n],
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