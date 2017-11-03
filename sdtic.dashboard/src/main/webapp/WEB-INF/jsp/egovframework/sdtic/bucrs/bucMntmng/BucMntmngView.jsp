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

    <table border="0" cellpadding="0" cellspacing="0">
        <tr >
            <td height="43" style="background-color:#ffffffff;color:#f9f9f9;font-weight:bolder;">
                        비즈니스 유지관리현황
            </td>
        </tr>
        <tr>
            <td height="2" style="background-color:#3d4146;">
            </td>
        </tr>
        <tr>
            <td height="200px">
                <div id="main" style="width:530px; height:500px;" ></div>
            </td>
        </tr>
    </table>

    <!--
    <div id="main" style="width:100%; height:100%;" ></div>
    -->
	   <script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'),'dark'); 
	
		var timeLineData = ['인력', '장비', '자재', 'KM'];
	
		var CompleteData = {
			'인력' : [42, 40, 50, 30, 27, 15, 8, 22],
			'장비' : [32, 41, 9, 4, 8, 55, 20, 12],
			'자재' : [18, 17, 20, 13, 8, 8, 5, 5],
			'KM'  : [9, 13, 12, 14, 21, 30, 41, 40]
		};
	
		var TotalData = {
			'인력' : [51, 48, 60, 32, 28, 15, 10, 27],
			'장비' : [36, 43, 9, 5, 11, 61, 21, 14],
			'자재' : [20, 19, 23, 14, 10, 8 ,6, 5],
			'KM'  : [10, 13, 15, 17, 21, 33, 42, 45]
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
			width: 500,
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
	    legend: {
	        data:['처리건수','총건수']
	    },
		grid: {
	        height: 300      
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
	            name:'처리건수',
	            type:'bar',
	            data:CompleteData[timeLineData[n]]          
	        },
	        {
	            name:'총건수',
	            type:'bar',
	            data:TotalData[timeLineData[n]]
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
