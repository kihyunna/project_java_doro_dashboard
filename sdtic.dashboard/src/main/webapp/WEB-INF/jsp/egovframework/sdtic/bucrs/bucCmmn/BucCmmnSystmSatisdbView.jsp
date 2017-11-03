<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 시스템 별 만족도 </title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>

    <div id="main" style="width:513px; height:190px;" ></div>

<script>

	jQuery(document).ready(function($){

	//-----------------------------------AJAX 호출 영역 ---------------------------------------

	        getBucCmmnSystmSatisdbAjax();
	        setDivHeight('main');

	//-----------------------------------AJAX 호출 영역 ---------------------------------------
	})
	
	
	var timerValue = 0;
        $(window).load(function(){

            timerValue = "${param.widgetTimer}";
            
            if(timerValue == 0){
                timerValue = 60000*60;
            }
            
            window.setInterval("getBucCmmnSystmSatisdbAjax()",timerValue);
            
        });
	var myChart = echarts.init(document.getElementById('main'),'dark');
	
	var defaultFontSize = 16,
	defaultTextColor = '#cccccc',
	defaultGlobalColor = ['#5d9cec', '#62c87f', '#f15755', '#fc863f', '#7053b6'],
	defaultFontFamily = 'microsoft yahei',
	defaultBackgroundColor = '#ffffffff',
	defaultShadowColor = 'rgba(204, 214, 235, 0.247059)';
	
	var xDataCategory= ['설계', '건설', '유지관리', '시설물', '공통'];
	var legendData = ['매우만족', '만족', '보통', '불만족', '매우불만족'];
	function getBucCmmnSystmSatisdbAjax(){
	var very_good = new Array();
	var good = new Array();
	var soso = new Array();
	var bad = new Array();
	var very_bad = new Array();

	
		$.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnSystmSatisdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++)
                    {
                    	very_good[i] = json.data[i].very_good;
                    	good[i] = json.data[i].good;
                    	soso[i] = json.data[i].soso;
                    	bad[i] = json.data[i].bad;
                    	very_bad[i] = json.data[i].very_bad;

                        
                    }

                	option = {
                	    title: {
                	        
                	    },
                	    backgroundColor: defaultBackgroundColor, 
                	    color: defaultGlobalColor,
                	    textStyle: {
                	        color: defaultTextColor
                	    },
                	    legend: {
                	        itemGap: 8,
                	        itemWidth: 20,
                	        right: 10,
                	        data: legendData
                	    },
                	    tooltip: {
                	        trigger: 'axis', 
                	        axisPointer: { 
                	            type: 'shadow', 
                	            shadowStyle: {
                	                color: defaultShadowColor
                	            }
                	        }
                	    },
                	    grid: { 
                	        // show: true,
                	        top: 60,
                	        right: 10,
                	        bottom: 20,
                	        left: 10,
                	        containLabel: true
                	    },
                	    xAxis: [{// x轴
                	        type: 'category',
                	        data: xDataCategory,
                	        axisTick: { 
                	            alignWithLabel: true
                	        },
                	        axisLine: { 
                	            lineStyle: {
                	                color: '#6a7791'
                	            }
                	        },
                	        axisLabel: { 
                	            textStyle: {
                	                color: defaultTextColor
                	            }
                	        }
                	    }],
                	    yAxis: [{// y轴
                	        type: 'value',
                	        
                	        nameTextStyle:{
                	        },
                	        nameGap: 15, 
                	        axisTick:{ 
                	            show:false
                	        },
                	        axisLine:{ 
                	            show:false
                	        },
                	        splitLine:{ 
                	            lineStyle:{
                	                color: '#eae9e9'
                	            }
                	        },
                	        axisLabel: { 
                	            textStyle: {
                	                color: defaultTextColor
                	            }
                	        }
                	    }],
                	    series: [{
                	        name: '매우만족', 
                	        type: 'bar',
                	        data: very_good
                	    },{
                	        name: '만족', 
                	        type: 'bar',
                	        data: good
                	    },{
                	        name: '보통', 
                	        type: 'bar',
                	        data: soso
                	    },{
                	        name: '불만족', 
                	        type: 'bar',
                	        data: bad
                	    },{
                	        name: '매우불만족',
                	        type: 'bar',
                	        data: very_bad
                	    }]
                	};
                  
                }
                
                else{
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
            },complete : function(){
            	myChart.setOption(option);	 
            }    
        });

    }
       
	
	
	


        
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
</script>
</body>
</html>