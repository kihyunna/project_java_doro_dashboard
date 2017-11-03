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
            SMS 발송 현황
        </td>
    </tr>
    <tr>
        <td height="2" style="background-color:#3d4146;">
        </td>
    </tr>
    <tr>
        <td height="200">
            <div id="main" style="width:370px; height:200px;" ></div>
        </td>
    </tr>
</table>

option = {
     "title": {
        "text": "SMS 발송 현황",
         x: "4%",

        textStyle: {
            color: '#000',
            fontSize: '22'
        },
        subtextStyle: {
            color: '#90979c',
            fontSize: '16',

        },
    },
    "tooltip": {
        "trigger": "axis",
        "axisPointer": {
            "type": "shadow",
            textStyle: {
                color: "#fff"
            }

        },
    },
    "grid": {
        "borderWidth": 0,
        "top": 110,
        "bottom": 95,
        textStyle: {
            color: "#fff"
        }
    },
    "legend": {
        x: '80%',
        top: '5%',
        textStyle: {
            color: '#90979c',
        },
        "data": ['금일', '전일']
    },
     

    "calculable": true,
    "xAxis": [{
        "type": "category",
        "axisLine": {
            lineStyle: {
                color: '#90979c'
            }
        },
        "splitLine": {
            "show": false
        },
        "axisTick": {
            "show": false
        },
        "splitArea": {
            "show": false
        },
        "axisLabel": {
            "interval": 0,

        },
        "data": ["설계", "건설","유지관리","시설물"],
    }],
    "yAxis": [{
        "type": "value",
        "splitLine": {
            "show": false
        },
        "axisLine": {
            lineStyle: {
                color: '#90979c'
            }
        },
        "axisTick": {
            "show": false
        },
        "axisLabel": {
            "interval": 0,

        },
        "splitArea": {
            "show": false
        },

    }],

    "series": [{
            "name": "전일",
            "type": "line",
            "stack": "总量",
            "itemStyle": {
                "normal": {
                    "color": "rgba(255,144,128,1)",
                    "label": {
                        "show": true,
                        "textStyle": {
                            "color": "#fff"
                        },
                        "position": "insideTop",
                        formatter: function(p) {
                            return p.value > 0 ? (p.value) : '';
                        }
                    }
                }
            },
            "data": [
                198,
                330,
                151,
                160
 
            ],
        },

        {
            "name": "금일",
            "type": "bar",
            "barWidth": 45,
            "stack": "总量",
            "itemStyle": {
                "normal": {
                    "color": "rgba(0,191,183,1)",
                    "barBorderRadius": 0,
                    "label": {
                        "show": true,
                        "position": "top",
                        formatter: function(p) {
                            return p.value > 0 ? (p.value) : '';
                        }
                    }
                }
            },
            "data": [
                82,
                67,
                62,
                59
               
            ]
        }
    ]
}

myChart.setOption(option);
</script>
</body>
</html>