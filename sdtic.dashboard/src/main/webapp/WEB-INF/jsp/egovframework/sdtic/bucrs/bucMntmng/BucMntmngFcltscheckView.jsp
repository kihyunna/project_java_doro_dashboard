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
	 // based on prepared DOM, initialize echarts instance
	    var myChart = echarts.init(document.getElementById('main'), 'dark');      
	
	    var timeLineData = ['주요시설물','토공및배수/부대시설','기하구조/기타시설','안전시설1','안전시설2','포장1','포장2'];
	    var Rdata = ['공정율'];
	    var Title = {
	            '주요시설물' : ['교량','절토사면','터널','암거','출입시설'],
	            '토공및배수/부대시설': ['옹벽','석축','배수관','측구','도로중심선'],
	            '기하구조/기타시설' : ['평면선형','종단경사','제설시설','방음벽','정차대'],
	            '안전시설1' : ['중앙분리대','표지판','차량방호안전시설','충격흡수시설','시선유도봉'],
	            '안전시설2' : ['시선유도표지','과속카메라','갈매기표지','도로표지병','공구일반현황'],
	            '포장1' : ['포장일반현황','영업소','본선길어깨','휴게소','오르막차로'],
	            '포장2': ['그루빙','줄눈관리','차선도색','포장시공이력']
	            };
	
	        EData = {
	            '주요시설물' : [123, 134, 112, 145,141],
	            '토공및배수/부대시설':[68, 78, 92,54, 89],
	            '기하구조/기타시설' : [101, 83,81, 122, 123],
	            '안전시설1' :[98,89, 132, 152, 145],
	            '안전시설2' :[54, 67, 78, 124 , 74,],
	            '포장1' :[81, 89, 73,121, 122], 
	            '포장2' : [78,71,67,74]
	            };
	
	        PData = {
	            '주요시설물' : [134, 151, 150, 147,153],
	            '토공및배수/부대시설':[80, 91, 93,121, 90],
	            '기하구조/기타시설' : [109, 85,103, 142, 157],
	            '안전시설1' :[113,98, 134, 159, 145],
	            '안전시설2' :[79, 95, 102, 132 , 78,],
	            '포장1' :[99, 91, 85,128, 145], 
	            '포장2' : [101,100,89,78]
	            };


        option = {
            baseOption:{
            title : {        
            },
            //color : ['#61a0a8', '#d48265'],
            timeline: {
                show: false,
                axisType: 'category',
                autoPlay: true,
                left: 0,
                currentIndex: 0,
                top: 470,
                width: 1000,
                playInterval: 3000,
                label: {
                    normal: {
                        show: false,
                        interval: 'auto'
                    }
                },
                data: timeLineData
            },
            tooltip : {
            },
            legend: {
                data:['실적','계획'],
                left: '75%',
                top: 12
            },
            grid: {      
                left: 40,
                right: 15,
                bottom: 65
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : [],
                    axisLabel: {
                    	interval: 0,
                    	rotate: 30
                    }
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
                    text: timeLineData[n],
                    left:20,
                    top:9,
                    textStyle : {
                    	fontWeight: 'normal',
                    	fontSize: 18
                    }
                },
                xAxis: {
                    type : 'category',
                    data : Title[timeLineData[n]],
                    boudaryGap: false,
                    show : true
                },
                series: [{
                    name:'실적',
                    barGap: 0,
                    type:'bar',
                    barWidth:30,
                    data:EData[timeLineData[n]],
                    itemStyle: {
                    	 normal: {
                    		 color:new echarts.graphic.LinearGradient(0,0,0.5,1,[{
                                 offset:0,
                                 color:'rgba(164, 197, 230,1)'
                               },{
                                 offset:1,
                                 color:'rgba(163, 198, 215,.5)'
                               }]),
                    	 	borderWidth:2,
                         	barBorderRadius:[10,10,0,0]
                    	 }
                    }
                },
                {
                    name:'계획',
                    type:'bar',
                    barWidth:30,
                    data:PData[timeLineData[n]],
                    itemStyle: {
	                   	 normal: {
	                   		color:new echarts.graphic.LinearGradient(0,0,0.5,1,[{
                                offset:0,
                                color:'rgba(56, 151, 197,1)'
                              },{
                                offset:1,
                                color:'rgba(56, 151, 175,.5)'
                              }]),
	                   	 	borderWidth:2,
	                        barBorderRadius:[10,10,0,0]
	                   	 }
                   }
                }]
            });
        }




        myChart.setOption(option);
        
        
	    // use configuration item and data specified to show chart
		
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
