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
</head>
<script>
</script>
<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:500px; height:230px;"></div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'));

        // specify chart configuration item and data
        option = {
            backgroundColor: '#fff',
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
                }
            },
            legend: {
                data:['처리', '요청', '미처리']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
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
                    data : ['수도권본부','부산경남본부','대구경북본부','전북본부','대전충청본부','광주전남본부','강원본부']
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
                    data:[200, 170, 240, 244, 200, 220, 210]
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
                    data:[320, 302, 341, 374, 390, 450, 420]
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
                    data:[-120, -132, -101, -134, -190, -230, -210]
                }
            ]
        };

        myChart.setOption(option);

        // use configuration item and data specified to show chart

    </script>
</body>

</html>