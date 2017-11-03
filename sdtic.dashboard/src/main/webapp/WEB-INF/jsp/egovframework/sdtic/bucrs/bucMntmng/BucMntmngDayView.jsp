<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 유지관리 현황</title>
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
	var myChart = echarts.init(document.getElementById('main'),'dark'); 

	var timeLineData = ['인력', '장비', '자재', 'KM'];

	var todayData = {
		'인력' : [10, 12, 8, 5, 3, 10, 8, 7],
		'장비' : [4, 6, 9, 4, 8, 14, 15, 2],
		'자재' : [3, 5, 20, 13, 8, 8, 5, 5],
		'KM'  : [9, 13, 12, 14, 21, 11, 5, 15]
	};

	var yesterdayData = {
		'인력' : [7, 15, 7, 10, 5, 15, 3, 7],
		'장비' : [8, 8, 9, 5, 11, 20, 13, 14],
		'자재' : [4, 10, 23, 14, 10, 8 ,6, 5],
		'KM'  : [15, 13, 15, 10, 17, 13, 7, 15]
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
		bottom: 5,
		width: '100%',
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
    color : ['#c23531','#546570'],
    legend: {
        data:['금일','전일']
    },
	grid: {
          left: '5%',
          right: 7,
          bottom: 80
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
            name:'금일',
            type:'bar',
            data:todayData[timeLineData[n]]          
        },
        {
            name:'전일',
            type:'bar',
            data:yesterdayData[timeLineData[n]]
        }]
	});
}
	
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
