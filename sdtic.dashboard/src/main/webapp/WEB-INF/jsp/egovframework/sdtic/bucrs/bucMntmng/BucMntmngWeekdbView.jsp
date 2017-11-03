<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 유지관리 현황(주단위)</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:1000px; height:600px;"></div>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'), 'dark'); 

	var timeLineData = ['인력', '장비', '자재', 'KM'];
	

	var CompleteData = {
		'인력' : [121, 134, 78, 90, 119, 67, 83, 97],
		'장비' : [95, 102, 110, 89, 61, 114, 109, 73],
		'자재' : [109, 87, 91, 111, 89, 77, 124, 135],
		'KM'  : [88, 101, 137, 94, 129, 113, 109, 120]
	};

	var PlanData = {
		'인력' : [123, 134, 98, 93, 120, 75, 131, 123],
		'장비' : [107, 102, 116, 113, 78, 125, 109, 103],
		'자재' : [120, 90, 112, 134, 89, 114, 130, 135],
		'KM'  : [88, 105, 140, 115, 129, 129, 111, 131]
	};

	option = {
		
		baseOption:{
			
	    title : {        
	    },
		timeline: {
			show: true,
			axisType: 'category',
			autoPlay: true,
			left: 0,
			currentIndex: 0,
			top: 450,
			width: 1000,
			playInterval: 3000,
			label: {
				normal: {
					show: true,
					interval: 'auto'
				}
			},
			data: timeLineData
		},
	    tooltip : {
	    },
	    color : ['#749f83','#bda29a'],
	    legend: {
	        data:['실적','계획실적']
	    },
		grid: {
	        height: 370      
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            data : ['수도권', '강원', '대전/충청', '충북', '전북', '광주/전남', '대구/경북', '부산/경남']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        
	    ]
		},
		options:[]
	};
	
	for(var n = 0; n < timeLineData.length; n++)
	{
		option.options.push({
			title: {
				show: true,
				text: '유지관리-' + timeLineData[n]
			},
			series: [{
	            name:'실적',
	            type:'bar',
	            data:CompleteData[timeLineData[n]]          
	        },
	        {
	            name:'계획실적',
	            type:'bar',
	            data:PlanData[timeLineData[n]]
	        }]
		});
	}
	
	myChart.setOption(option);
	
    $(window).resize(function(){

        setDivHeight('main');

    });

    function setDivHeight(objSet)
    {

        var objSet   = document.getElementById(objSet);
        objSet.style.width  = ($(window).width()) + "px";
        objSet.style.height  = ($(window).height()) + "px";
        option.baseOption.timeline.width = ($(window).width()) + "px";


        $('#main').width(($(window).width()) + "px");
        $('#main').height(($(window).height()) + "px");


        myChart.resize({
            width: $(window).width(),
            height : $(window).height()
            
        });
        myChart.setOption(option);
		
    }
	</script>
</body>
</html>
