<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>건설사업단 공정율(막대)</title>
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
	            설계도서 납품현황
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


        var timeLineData = ['설계도서 구분1','설계도서 구분2','설계도서 구분3'];
        var timeLineGubun = {
            '설계도서 구분1':['설계도서','보고서','계산서','예산서'],
            '설계도서 구분2':['시방서','인허가도서','민원','관계기관협의'],
            '설계도서 구분3':['기타','사진','기록영상','카다로그']
        };


        var data1 = {
            '설계도서 구분1':[5881, 7007, 3813, 3935],
            '설계도서 구분2':[3713,1658,1787,26],
            '설계도서 구분3':[37,0,0,0]
        };

        var data2 = {
            '설계도서 구분1':[402185, 201898, 476012, 240922],
            '설계도서 구분2':[26500,124,37033,477],
            '설계도서 구분3':[2303,16,0,40]
        };

        var data3 = {
            '설계도서 구분1':[468368, 1396, 216, 514],
            '설계도서 구분2':[152,0,0,11],
            '설계도서 구분3':[167,4,0,658]
        };

        var data4 = {
            '설계도서 구분1':[266513, 171033, 200591, 186441],
            '설계도서 구분2':[19862,185,11598,8],
            '설계도서 구분3':[6928,6,0,59]
        };


        option = {
            baseOption: {
                title: {
                    text: '설계도서 납품현황'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                timeline: {
                    show: true,
                    left: 20,
                    width: 850,
                    axisType: 'category',
                    autoPlay: true,
                    currentIndex: 0,
                    playInterval: 2000,
                    label: {
                        normal: {
                            show: true,
                            interval: 'auto',
                            formatter: '{value}',
                        },
                    },
                    data: [],
                },
                legend: {
                    data: ['기본설계', '실시설계', '시공단계', '준공단계'],
                    align: 'right',
                    right: 10
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '7%',
                    containLabel: true
                },
                xAxis: [],
                yAxis: [{
                    type: 'value',
                    name: '납품건수',
                    axisLabel: {
                        formatter: '{value}'
                    }
                }],

                series: []
            },
            options:[]
        };

        for (var i = 0; i < timeLineData.length; i++) {
            option.baseOption.timeline.data.push(timeLineData[i]);
            option.options.push({
                title: {
                    text: '설계도서 납품현황('+timeLineData[i]+')'
                },
                xAxis:{
                    type: 'category',
                    data: timeLineGubun[timeLineData[i]]
                },
                series: [{
                    name: '기본설계',
                    type: 'bar',
                    data: data1[timeLineData[i]],
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#fff',
                                fontSize: 12,

                            }
                        }
                    },

                }, {
                    name: '실시설계',
                    type: 'bar',
                    data: data2[timeLineData[i]],
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#fff',
                                fontSize: 12,

                            }
                        }
                    },

                }, {
                    name: '시공단계',
                    type: 'bar',
                    data: data3[timeLineData[i]],
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#fff',
                                fontSize: 12,

                            }
                        }
                    },

                }, {
                    name: '준공단계',
                    type: 'bar',
                    data: data4[timeLineData[i]],
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#fff',
                                fontSize: 12,

                            }
                        }
                    },

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