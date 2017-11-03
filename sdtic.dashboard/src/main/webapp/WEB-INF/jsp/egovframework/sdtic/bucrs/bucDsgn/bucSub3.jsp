<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>평균대비 차트</title>
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
	            기술자문 처리실적
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
        var myChart = echarts.init(document.getElementById('main'),'dark');

        option = {
            title: {
                text: '기술자문 처리실적'
            },
            backgroundColor: 'rgba(255,255,255,0)',
            toolbox: {
                show: true,
                feature: {
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            xAxis: {
                data: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
            },
            yAxis: {},
            series: [{
                type: 'line',
                data:[220, 182, 191, 234, 290, 330, 310]
            }]
        };

        this.title = '堆叠条形图';

        option = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data: ['기술자문 요청건수', '기술자문 처리건수']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis:  {
                type: 'value'
            },
            yAxis: {
                type: 'category',
                data: ['2017-01-07','2017-01-06','2017-01-05','2017-01-04','2017-01-03','2017-01-02','2017-01-01']
            },
            series: [
                {
                    name: '기술자문 처리건수',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight',
                            textStyle: {
                                color: '#3f3f3f',
                                fontSize: 20

                            }
                        }

                    },
                    itemStyle: {
                        normal: {
                            color: '#1FBCD2',

                        }
                    },
                    data: [108, 143, 176, 61, 156, 41, 62]
                },
                {
                    name: '기술자문 요청건수',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight',
                            textStyle: {
                                color: '#fff',
                                fontSize: 20

                            }
                        }

                    },
                    itemStyle: {
                        normal: {
                            color: '#E5F9FB',
                            borderWidth: 2,
                            borderColor: '#1FBCD2'

                        }
                    },

                    data: [119, 246, 216, 163, 225, 63, 85]
                },
                {
                    type: 'pie',
                    center: ['83%', '20%'],
                    radius: ['20%', '27%'],
                    label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: 335,
                        name: '污染来源分析',
                        itemStyle: {
                            normal: {
                                color: '#1FBCD2'
                            }
                        },
                        label: {
                            normal: {
                                formatter: '{d} %',
                                textStyle: {
                                    color: '#fff',
                                    fontSize: 20

                                }
                            }
                        }
                    }, {
                        value: 180,
                        name: '占位',
                        tooltip: {
                            show: false
                        },
                        itemStyle: {
                            normal: {
                                color: '#E5F9FB'
                            }
                        },
                        label: {
                            normal: {
                                textStyle: {
                                    color: '#fff',
                                },
                                formatter: '\n  \n연간 기술자문\n처리실적'
                            }
                        }
                    }]
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
    </script>
    </div>
</body>
</html>