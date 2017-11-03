<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>설계도서 반입반출율</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>

</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr >
	        <td  height="43" style="background-color:#ffffffff; color:#f9f9f9; font-weight:bolder;">
	            주간설계반출입현황
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
    <script type="text/javascript">
    jQuery(document).ready(function($){

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	             setDivHeight('main');

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    	})
    	
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'),'dark');

        // specify chart configuration item and data
      var builderJson = {
          "all": 41384,
          "charts": {
            "설계도면": 3237,
            "보고서": 2164,
            "계산서": 7561,
            "예산서": 7778,
            "시방서": 7355,
            "인허가도서": 2405,
            "민원": 1842,
            "관계기관협의": 2090,
            "기타": 1762,
            "사진": 1593,
            "기록영상": 2060,
            "카다로그": 1537
          },
          "components": {
            "설계도면": 2788,
            "보고서": 9575,
            "계산서": 9400,
            "예산서": 9466,
            "시방서": 9266,
            "인허가도서": 3419,
            "민원": 2984,
            "관계기관협의": 2739,
            "기타": 2744,
            "사진": 2466,
            "기록영상": 3034,
            "카다로그": 1945
          },
          "ie": 9743
        };

        var downloadJson = {
            "설계도면": 3237,
            "보고서": 2164,
            "계산서": 7561,
            "예산서": 7778,
            "시방서": 7355,
            "인허가도서": 2405,
            "민원": 1842,
            "관계기관협의": 2090,
            "기타": 1762,
            "사진": 1593,
            "기록영상": 2060,
            "카다로그": 1537
          }

        var themeJson = {
            "설계도면": 2788,
            "보고서": 9575,
            "계산서": 9400,
            "예산서": 9466,
            "시방서": 9266,
            "인허가도서": 3419,
            "민원": 2984,
            "관계기관협의": 2739,
            "기타": 2744,
            "사진": 2466,
            "기록영상": 3034,
            "카다로그": 1945
          }

        option = {
            tooltip: {
                
            },
            title: [{
                text: '',
                subtext: '합계 ' + builderJson.all,
                x: '25%',
                textAlign: 'center'
            }, {
                text: '주간반입량',
                
                x: '80%',
                textAlign: 'center'
            }, {
                text: '주간반출량',
               
                x: '80%',
                y: '50%',
                textAlign: 'center'
            }],
            grid: [{
                show: false,
                top: 50,
                width: '65%',
                bottom: '45%',
                left: 10,
                containLabel: true
            }, {
                show: false,
                top: '55%',
                width: '65%',
                bottom: 0,
                left: 10,
                containLabel: true
            }],
            xAxis: [{
                type: 'value',
                max:20000,
                splitLine: {
                    show: false
                }
            }, {
                type: 'value',
                max:20000,
                gridIndex: 1,
                splitLine: {
                    show: false
                }
            }],
            yAxis: [{
                type: 'category',
                data: Object.keys(builderJson.charts),
                axisLabel: {
                    interval: 0,
                    rotate: 30
                },
                splitLine: {
                    show: false
                }
            }, {
                gridIndex: 1,
                type: 'category',
                data: Object.keys(builderJson.components),
                axisLabel: {
                    interval: 0,
                    rotate: 30
                },
                splitLine: {
                    show: false
                }
            }],
            series: [{
                type: 'bar',
                stack: 'chart',
                z: 3,
                label: {
                    normal: {
                        position: 'right',
                        show: true
                    }
                },
                data: Object.keys(builderJson.charts).map(function (key) {
                    return builderJson.charts[key];
                })
            }, {
                type: 'bar',
                stack: 'chart',
                silent: true,
                itemStyle: {
                    normal: {
                        color: '#171a1f'
                    }  
                },
                data: Object.keys(builderJson.charts).map(function (key) {
                    return builderJson.all - builderJson.charts[key];
                })
            }, {
                type: 'bar',
                stack: 'component',
                xAxisIndex: 1,
                yAxisIndex: 1,
                z: 3,
                label: {
                    normal: {
                        position: 'right',
                        show: true
                    }
                },
                data: Object.keys(builderJson.components).map(function (key) {
                    return builderJson.components[key];
                })
            }, {
                type: 'bar',
                stack: 'component',
                silent: true,
                xAxisIndex: 1,
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        color: '#171a1f'
                    }  
                },
                data: Object.keys(builderJson.components).map(function (key) {
                    return builderJson.all - builderJson.components[key];
                })
            },
            {
                type: 'pie',
                center: ['80%', '25%'],
                radius: ['25%', '30%'],
                label: {
                    normal: {
                        position: 'center'
                    }
                },
                data: [{
                    value: 335,
                    name: '반입반출파이그래프',
                    itemStyle: {
                        normal: {
                            color: '#dfa800'
                        }
                    },
                    label: {
                        normal: {
                            formatter: '{d} %',
                            textStyle: {
                                color: '#dfa800',
                                fontSize: 25

                            }
                        }
                    }
                }, {
                    value: 180,
                    name: '반입',
                    tooltip: {
                        show: false
                    },
                    itemStyle: {
                        normal: {
                            color: '#bebbba'
                        }
                    },
                    label: {
                        normal: {
                            textStyle: {
                                color: '#dfa800',
                                fontSize: 25
                            },
                            formatter: '\n반입율'
                        }
                    }
                }]
            },
            {
                type: 'pie',
                center: ['80%', '75%'],
                radius: ['25%', '30%'],
                label: {
                    normal: {
                        position: 'center'
                    }
                },
                data: [{
                    value: 10000,
                    name: '반입반출파이그래프',
                    itemStyle: {
                        normal: {
                            color: '#ff733f'
                        }
                    },
                    label: {
                        normal: {
                            formatter: '{d} %',
                            textStyle: {
                                color: '#ff733f',
                                fontSize: 25

                            }
                        }
                    }
                }, {
                    value: 31384,
                    name: '반출',
                    tooltip: {
                        show: false
                    },
                    itemStyle: {
                        normal: {
                            color: '#bebbba'
                        }
                    },
                    label: {
                        normal: {
                            textStyle: {
                                color: '#ff733f',
                                fontSize: 25
                            },
                            formatter: '\n반출율'
                        }
                    }
                }]
            }]
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
</body>
</html>