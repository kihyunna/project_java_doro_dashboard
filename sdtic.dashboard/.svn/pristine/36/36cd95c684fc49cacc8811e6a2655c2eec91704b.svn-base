<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 공통 SMS 발송현황 화면</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr >
        <td  height="43" style="background-color:#ffffffff; color:#f9f9f9; font-weight:bolder;">
            연간설계도서납품현황
        </td>
    </tr>
    <tr>
        <td height="2" style="background-color:#3d4146;">
        </td>
    </tr>
    <tr>
        <td height="160">
            <div id="main" style="width:500px;height:160px; " ></div>
        </td>
    </tr>
</table>

<script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));
        
        option = {
            
            tooltip: {
                trigger: 'axis',
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data: ['납품현황', '납품목표'],
                align: 'right',
                right: 10,
                textStyle: {
                    color: '#fff',
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                data: ['2013년', '2014년', '2015년', '2016년', '2017년'],
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff'
                    }
                }
            }],
            yAxis: [{
                type: 'value',
                name: '건수',
                axisLabel: {
                    formatter: '{value}',
                    show: true,
                    textStyle: {
                        color: '#fff'
                    }
                }
            }],
            series: [{
                name: '납품현황',
                type: 'bar',
                data: [130, 125, 150, 185, 90],
                itemStyle: {
                    normal: {
                        color: '#0071c8',
                        borderWidth: 2,
                        borderColor: '#004a83'
                    }
                },
                textStyle: {
                    color: '#fff',
                }
            }, {
                name: '납품목표',
                type: 'bar',
                data: [150, 185, 150, 200, 220],
                itemStyle: {
                    normal: {
                        color: '#95009a',
                        borderWidth: 2,
                        borderColor: '#6f0073'
                    }
                },
                textStyle: {
                    color: '#fff',
                }
            }]
        };

        myChart.setOption(option);
    </script>
</body>
</html>