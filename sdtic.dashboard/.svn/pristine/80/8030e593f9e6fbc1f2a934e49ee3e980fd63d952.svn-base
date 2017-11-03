<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>SMS발송현황</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
</head>
<script>
</script>
<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:300px; height:230px;"></div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'));

        // specify chart configuration item and data
     option = {
    backgroundColor : '#fff',

    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        x : 'center',
        y : 'bottom',
        data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
    },
    toolbox: {
        show : false,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['funnel']
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [

        {
            name:'SMS 발송현황',
            type:'pie',
            radius : [30, 100],
            roseType : 'area',
            data:[
                {value:10, name:'설계'},
                {value:5, name:'건설'},
                {value:15, name:'유지관리'},
                {value:25, name:'시설물'}
            ]
        }
    ]
};
        myChart.setOption(option);


        // use configuration item and data specified to show chart

    </script>
</body>
</html>