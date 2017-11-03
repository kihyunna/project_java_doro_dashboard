<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>비즈니스 공통 대외연계 송수신현황 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>
    
    <div id="main" style="width:100%; height:190px;" ></div>
    
    <script type="text/javascript">
    
    jQuery(document).ready(function($){

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	        //getBucCmmnExtrnlcntcAjax();
    	        setDivHeight('main');

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    	})
    
    function getBucCmmnExtrnlcntcAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnExtrnlcntc.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++)
                    {
                        
                    	databeast[timeLineData[i]][0] = json.data[i].extrnlcntc1l;
                    	databeast[timeLineData[i]][1] = json.data[i].extrnlcntc2l;
                    	databeast[timeLineData[i]][2] = json.data[i].extrnlcntc3l;
                    	databeast[timeLineData[i]][3] = json.data[i].extrnlcntc4l;
                    	
                    	databeauty[timeLineData[i]][0] = json.data[i].extrnlcntc1r;
                    	databeauty[timeLineData[i]][1] = json.data[i].extrnlcntc2r;
                    	databeauty[timeLineData[i]][2] = json.data[i].extrnlcntc3r;
                    	databeauty[timeLineData[i]][3] = json.data[i].extrnlcntc4r;
                    	
                        myChart.setOption(option);
                    }
                }
                else{
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
            }
        });

    }
        var myChart = echarts.init(document.getElementById('main'), 'dark');
        
        var timeLineData = [1, 2];

        var myData = ['국토부', '환경공단', '시설공단', '기상청'];
        var databeast = {
            1: [389, 259, 262, 324],
            2: [111, 315, 139, 375]
          

        };
        var databeauty = {
            1: [121, 388, 233, 309],
            2: [200, 350, 300, 250]
            

        };

        
        var databeastFail = {
            1: [21, 23, 34, 31],
            2: [34, 32, 28, 29]
        };
        
        var databeautyFail = {
            1: [24, 25, 36, 22],
            2: [35, 31, 28, 32]
        };
       
       

        option = {
            baseOption: {
                //backgroundColor: '#FFF',
                timeline: {
                    show: false,
                    axisType: 'category',
                    tooltip: {
                        show: false
                    },
                    autoPlay: true,
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
                    data: ['송신', '송신실패', '수신', '수신실패'],
                    top: '0%',
                    right: '0%',
                    textStyle: {
                        color: '#fff',
                    },
                },
                tooltip: {
                    show: true,
                    trigger: 'axis',
                    //formatter: '{b}<br/>{a}: {c}',
                    axisPointer: {
                        type: 'shadow',
                    }
                },
                grid: [{
                    show: false,
                    left: '4%',
                    top: 30,
                    bottom: '5%',
                    containLabel: true,
                    width: '46%',
                }, {
                    show: false,
                    left: '50.5%',
                    top: 50,
                    bottom: '5%',
                    width: '0%',
                }, {
                    show: false,
                    right: '4%',
                    top: 30,
                    bottom: '5%',
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
                        },
                    },
                }, {
                    gridIndex: 1,
                    show: false,
                }, {
                    gridIndex: 2,
                    type: 'value',
                    max:500,
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
                        //barGap: 20,
                        barWidth: 8,
                        label: {
                            normal: {
                                show: false,
                            },
                            //emphasis: {
                            //    show: true,
                            //    position: 'left',
                            //    offset: [0, 0],
                            //    textStyle: {
                            //        color: '#fff',
                            //        fontSize: 14,
                            //    },
                            //},
                        },
                        itemStyle: {
                            normal: {
                                color: '#749f83',
                            },
                            //emphasis: {
                            //    color: '#009581',
                            //},
                        },
                        data: databeauty[timeLineData[i]],
                    },
                    {
                        name: '송신실패',
                        type: 'bar',
                        barGap: 1,
                        barWidth: 8,
                        label: {
                            normal: {
                                show: false,
                            },
                            //emphasis: {
                            //    show: true,
                            //    position: 'left',
                            //    offset: [0, 0],
                            //    textStyle: {
                            //        color: '#fff',
                            //        fontSize: 14,
                            //    },
                            //},
                        },
                        itemStyle: {
                            normal: {
                                color: '#c23531',
                            },
                            //emphasis: {
                            //    color: '#009581',
                            //},
                        },
                        data: databeautyFail[timeLineData[i]],
                    },


                    {
                        name: '수신',
                        type: 'bar',
                        //barGap: 20,
                        barWidth: 8,
                        xAxisIndex: 2,
                        yAxisIndex: 2,
                        label: {
                            normal: {
                                show: false,
                            },
                            //emphasis: {
                            //    show: true,
                            //    position: 'right',
                            //    offset: [0, 0],
                            //    textStyle: {
                            //        color: '#FFF',
                            //        fontSize: 14,
                            //    },
                            //},
                        },
                        itemStyle: {
                            normal: {
                                color: '#d48265',
                            },
                            //emphasis: {
                            //    color: '#bb0000',
                            //},
                        },
                        data: databeast[timeLineData[i]],
                    },
                    
                    {
                        name: '수신실패',
                        type: 'bar',
                        barGap: 1,
                        barWidth: 8,
                        xAxisIndex: 2,
                        yAxisIndex: 2,
                        label: {
                            normal: {
                                show: false,
                            },
                            //emphasis: {
                            //    show: true,
                            //    position: 'right',
                            //    offset: [0, 0],
                            //    textStyle: {
                            //        color: '#FFF',
                            //        fontSize: 14,
                            //    },
                            //},
                        },
                        itemStyle: {
                            normal: {
                                color: '#c23531',
                            },
                            //emphasis: {
                            //    color: '#bb0000',
                            //},
                        },
                        data: databeastFail[timeLineData[i]],
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
            objSet.style.width  = ($(window).width()) + "px";
            objSet.style.height  = ($(window).height()) + "px";
            
            
            $('#main').width(($(window).width()) + "px");
            $('#main').height(($(window).height()) + "px");
            
            
            myChart.resize({
                width: $(window).width(),
                height : $(window).height()
            });
            
        }
    </script>

</body>
</html>