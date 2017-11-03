<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>대외연계 송수신현황</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<script>
</script>
<body>
  <table border="0" cellpadding="0" cellspacing="0">
    	<tr >
    		<tr >
    		<td height="43" style="background-color:#ffffffff;color:#f9f9f9;font-weight:bolder;">
    					대외연계 송/수신
    		</td>
    		</tr>
    	</tr>
    	<tr>
			<td height="2" style="background-color:#3d4146;">
			</td>
		</tr>
    	<tr>
    		<td height="205">
    <div id="main" style="width:530px;height:205px;" ></div>
    		</td>
    	</tr>
    </table>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'), 'dark');

        var myData = ['국토부', '환경공단', '시설공단', '기상청'];
        var databeast = {
            1: [389, 259, 262, 324],
            2: [111, 315, 139, 375],
            3: [227, 210, 328, 292],
            4: [100, 350, 300, 250],

        };
        var databeauty = {
            1: [121, 388, 233, 309],
            2: [200, 350, 300, 250],
            3: [380, 129, 173, 101],
            4: [363, 396, 388, 108],

        };
        var timeLineData = [1, 2, 3, 4];

        option = {
            baseOption: {
                //backgroundColor: '#FFF',
                timeline: {
                    show: false,
                    axisType: 'category',
                    tooltip: {
                        show: false
                    },
                    autoPlay: false,
                    currentIndex: 0,
                    playInterval: 2000,
                    label: {
                        normal: {
                            show: true,
                            interval: 'auto',
                            formatter: '{value}月',
                        },
                    },
                    data: [],
                },
                title: {
                     //text:'대외연계 송/수신',
                    textStyle: {
                        color: '#fff',
                        fontSize: 16,
                    }
                },
                legend: {
                    data: ['송신', '수신'],
                    top: '0%',
                    right: '0%',
                    textStyle: {
                        color: '#fff',
                    },
                },
                tooltip: {
                    show: true,
                    trigger: 'axis',
                    formatter: '{b}<br/>{a}: {c}',
                    axisPointer: {
                        type: 'shadow',
                    }
                },
                grid: [{
                    show: false,
                    left: '4%',
                    top: 30,
                    bottom: 30,
                    containLabel: true,
                    width: '46%',
                }, {
                    show: false,
                    left: '50.5%',
                    top: 50,
                    bottom: 30,
                    width: '0%',
                }, {
                    show: false,
                    right: '4%',
                    top: 30,
                    bottom: 30,
                    containLabel: true,
                    width: '46%',
                }, ],

                xAxis: [
                    {
                    type: 'value',
                    max:500,
                    inverse: true,
                    axisLine: {
                        show: true,
                    },
                    axisTick: {
                        show: true,
                    },
                    position: 'top',
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#fff',
                            fontSize: 12,
                        },
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: '#989898',
                            width: 1,
                            type: 'solid',
                        },
                    },
                }, {
                    gridIndex: 1,
                    show: false,
                }, {
                    gridIndex: 2,
                    type: 'value',
                    axisLine: {
                        show: true,
                    },
                    axisTick: {
                        show: true,
                    },
                    position: 'top',
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#fff',
                            fontSize: 12,
                        },
                    },
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: '#989898',
                            width: 1,
                            type: 'solid',
                        },
                    },
                }, ],
                yAxis: [{
                    type: 'category',
                    inverse: true,
                    position: 'right',
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        show: false,
                        margin: 8,
                        textStyle: {
                            color: '#9D9EA0',
                            fontSize: 12,
                        },

                    },
                    data: myData,
                }, {
                    gridIndex: 1,
                    type: 'category',
                    inverse: true,
                    position: 'left',
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#fff',
                            fontSize: 12,
                        },

                    },
                    data: myData.map(function(value) {
                        return {
                            value: value,
                            textStyle: {
                                align: 'center',
                            }
                        }
                    }),
                }, {
                    gridIndex: 2,
                    type: 'category',
                    inverse: true,
                    position: 'left',
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        show: false,
                        textStyle: {
                            color: '#9D9EA0',
                            fontSize: 12,
                        },

                    },
                    data: myData,
                }, ],
                series: [],

            },

            options: [],


        };

        for (var i = 0; i < timeLineData.length; i++) {
            option.baseOption.timeline.data.push(timeLineData[i]);
            option.options.push({
                title: {
                    //text: '대외연계 송/수신',
                },
                series: [{
                        name: '송신',
                        type: 'bar',
                        barGap: 20,
                        barWidth: 20,
                        label: {
                            normal: {
                                show: false,
                            },
                            emphasis: {
                                show: true,
                                position: 'left',
                                offset: [0, 0],
                                textStyle: {
                                    color: '#fff',
                                    fontSize: 14,
                                },
                            },
                        },
                        itemStyle: {
                            normal: {
                                color: '#08C7AE',
                            },
                            emphasis: {
                                color: '#009581',
                            },
                        },
                        data: databeast[timeLineData[i]],
                    },


                    {
                        name: '수신',
                        type: 'bar',
                        barGap: 20,
                        barWidth: 20,
                        xAxisIndex: 2,
                        yAxisIndex: 2,
                        label: {
                            normal: {
                                show: false,
                            },
                            emphasis: {
                                show: true,
                                position: 'right',
                                offset: [0, 0],
                                textStyle: {
                                    color: '#000000',
                                    fontSize: 14,
                                },
                            },
                        },
                        itemStyle: {
                            normal: {
                                color: '#F94646',
                            },
                            emphasis: {
                                color: '#bb0000',
                            },
                        },
                        data: databeauty[timeLineData[i]],
                    }
                ]
            });
        }
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
    </script>
    </div>
</body>
</html>