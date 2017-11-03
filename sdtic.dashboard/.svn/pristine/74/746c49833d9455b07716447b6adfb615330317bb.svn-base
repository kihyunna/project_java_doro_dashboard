<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>헬프데스크 운영현황</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<script>
</script>
<body>

    <!-- prepare a DOM container with width and height -->
      
    <table border="0" cellpadding="0" cellspacing="0">
    	<tr >
    		<td height="43" style="background-color:#ffffffff;color:#f9f9f9;font-weight:bolder;">
    					금일 헬프데스크 운영
    		</td>
    	</tr>
    	<tr>
			<td height="2" style="background-color:#3d4146;">
			</td>
		</tr>
    	<tr>
    		<td height="200px">
    			<div id="main" style="width:530px; height:200px;" ></div>
    		</td>
    	</tr>
    </table>
    
    <!--
    <div id="main" style="width:100%; height:100%;" ></div>
    -->
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'), 'dark');

        // specify chart configuration item and data
        option = {
            //backgroundColor: '#fff',
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
                }
            },
            legend: {
                data:['처리', '요청', '미처리'],
                top: '0%',
                right: '0%'
            },
            grid: {
                left: '3%',
                right: '4%',
               top: '13%',
                bottom: '0%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'value'
                }
            ],
            yAxis : [
                {
                    type : 'category',
                    axisTick : {show: false},
                    data : ['설계','건설','유지관리','시설물']
                }
            ],
            series : [
                {
                    name:'처리',
                    type:'bar',
                    label: {
                        normal: {
                            show: true,
                            position: 'inside'
                        }
                    },
                    data:[100, 85, 120, 122]
                },
                {
                    name:'요청',
                    type:'bar',
                    stack: '처리',
                    label: {
                        normal: {
                            show: true
                        }
                    },
                    data:[160, 151, 170, 182]
                },
                {
                    name:'미처리',
                    type:'bar',
                    stack: '처리',
                    label: {
                        normal: {
                            show: true,
                            position: 'left'
                        }
                    },
                    data:[-60, -66, -50, -60]
                }
            ]
        };

        myChart.setOption(option);
        
        $(window).resize(function(){

        	setDivHeight('main');
        	
        });
        
        function setDivHeight(objSet)
        { 
        	
        	var objSet   = document.getElementById(objSet); 
          	objSet.style.width  = ($(window).width()-20) + "px";
          	objSet.style.height  = ($(window).height()-65) + "px";
          	
          	
          	$('#main').width(($(window).width()-20) + "px");
          	$('#main').height(($(window).height()-65) + "px");
          	
        	
			myChart.resize({
				width: $(window).width()-20,
				height : $(window).height()-65
			});
          	
        } 

        // use configuration item and data specified to show chart

    </script>
</body>

</html>