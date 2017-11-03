<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>비즈니스 공통 매인 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script src="${contextPath}/js/common/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<style>

    .slide_sliding, .slidectrl_sliding {
        list-style:none;
        padding:0;
        margin:0;
    }

    .slidebox_sliding {
        width:900px;
        overflow:hidden;
        position:relative;
        height:520px;
    }

    .slide_sliding {
        width:3600px;
        height:520px;
        position:absolute;
        left:0;
    }
    .slide_sliding ul{
            font-size:0;
    }
    .slide_sliding li {
        display:inline-block;
        width:900px;
        height:520px;
        text-align:center;
        color:white;
        font-size:0;
        line-height:900px;
        margin-right:-2px;
    }
</style>

<script>
    var idx_sliding = 0;
    var slidemax_sliding = 3;
    var pos_sliding = 900;
    var test = 0;
    function sliding_sliding(add_sliding) {
        idx_sliding = add_sliding;
        if(idx_sliding < 0) idx_sliding = slidemax_sliding;
        else if(idx_sliding > slidemax_sliding) idx_sliding = 0;
        $('.slide_sliding').stop().animate({'left' : -(idx_sliding*pos_sliding)+"px"}, "fast");
    }

    function timerStart(){

        var today = new Date();

        var second = today.getSeconds();

        if(second<15){
            //sliding_sliding(0)
        }else if(second>=15 && second<30){
            //sliding_sliding(1)

        }else if(second>=30 && second<45){
            //sliding_sliding(2)
        }else if(second>=45){
            //sliding_sliding(3)
        }
    }


    autoslide_sliding = setInterval(function() { timerStart() }, 100);

    function after_sliding() {
        setTimeout(function() {
            clearInterval(autoslide_sliding);
            autoslide_sliding = setInterval(function() { sliding_sliding(1) }, 3000);
        }, 60000);
    }

</script>
</head>

<body>
<div class="slidebox_sliding">
    <ul class="slide_sliding"
    ><li><div id="main" style="width:900px;height:520px; left:28px;"></div></li
    ><li><div id="main2" style="width:900px;height:520px; left:28px;"></div></li
    ><li><div id="main3" style="width:900px;height:520px; left:28px;"></div></li
    ><li><div id="main4" style="width:900px;height:520px; left:28px;"></div></li
    ></ul>
</div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
      var myChart = echarts.init(document.getElementById('main'), 'dark');
        // specify chart configuration item and data
      var builderJson = {
          "all": 41384,
          "charts": {
            "설계도면": 32,
            "보고서": 21,
            "계산서": 75,
            "예산서": 77,
            "시방서": 73,
            "인허가도서": 24,
            "민원": 18,
            "관계기관협의": 20,
            "기타": 17,
            "사진": 15,
            "기록영상": 20,
            "카다로그": 15
          },
          "components": {
            "설계도면": 27,
            "보고서": 95,
            "계산서": 94,
            "예산서": 94,
            "시방서": 92,
            "인허가도서": 34,
            "민원": 29,
            "관계기관협의": 27,
            "기타": 27,
            "사진": 24,
            "기록영상": 30,
            "카다로그": 19
          },
          "ie": 9743
        };

        var downloadJson = {
            "설계도면": 32,
            "보고서": 21,
            "계산서": 75,
            "예산서": 77,
            "시방서": 73,
            "인허가도서": 24,
            "민원": 18,
            "관계기관협의": 20,
            "기타": 17,
            "사진": 15,
            "기록영상": 20,
            "카다로그": 15
          }

        var themeJson = {
            "설계도면": 27,
            "보고서": 95,
            "계산서": 94,
            "예산서": 94,
            "시방서": 92,
            "인허가도서": 34,
            "민원": 29,
            "관계기관협의": 27,
            "기타": 27,
            "사진": 24,
            "기록영상": 30,
            "카다로그": 19
          }

        option = {
            tooltip: {

            },

            title: [{
                text: '주간설계반출입현황',
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
                containLabel: true,
               
            }, {
                show: false,
                top: '55%',
                width: '65%',
                bottom: 20,
                left: 10,
                containLabel: true
            }],
            xAxis: [{
                type: 'value',
                max:150,
                splitLine: {
                    show: false
                }
            }, {
                type: 'value',
                max:150,
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
            }, /* {
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
            }, */ {
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
            }, /* {
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
            }, */
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
                            color: '#c23531'
                        }
                    },
                    label: {
                        normal: {
                            formatter: '{d} %',
                            textStyle: {
                                color: '#c23531',
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
                                color: '#c23531',
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
                            color: '#2f4554'
                        }
                    },
                    label: {
                        normal: {
                            formatter: '{d} %',
                            textStyle: {
                                color: '#2f4554',
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
                                color: '#2f4554',
                                fontSize: 25
                            },
                            formatter: '\n반출율'
                        }
                    }
                }]
            }]
        }
        myChart.setOption(option);
        // use configuration item and data specified to show chart

    </script>

    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main2'), 'dark');

        var arrow = 'data:image/png;base64,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';

        var human = 'data:image/png;base64,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';


        var timeLineData = ['건설사업단 구분1','건설사업단 구분2','건설사업단 구분3'];
        var timeLineGubun = {
            '건설사업단 구분1':['도로개량','구리포천','대구순환','밀양울산','안양영천'],
            '건설사업단 구분2':['창원김해','김해부산','창녕밀양','김포포천','포항영덕'],
            '건설사업단 구분3':['광주순환','이산천안','성남구리','수도권','홍천양양']
        };
        var data1 = {
            '건설사업단 구분1':[92,90,97,99,91],
            '건설사업단 구분2':[99,95,100,92,92],
            '건설사업단 구분3':[99,100,94,96,92]
        };
        var data2 = {
            '건설사업단 구분1':[84,29,73,91,95],
            '건설사업단 구분2':[88,93,34,56,69],
            '건설사업단 구분3':[96,23,15,26,91]
        };

        var labelSetting = {
            normal: {
                show: true,
                position: 'outside',
                offset: [10, 0],
                textStyle: {
                    fontSize: 16
                }
            }
        };

        option = {
            baseOption: {
                title: {
                    text: '건설사업단 공정율'
                },
                legend: {
                    data: ['공정율', '인력투입(명)'],
                    align: 'right',
                    right: '8%',
                    top:'5%'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                timeline: {
                    show: false,
                    left: 20,
                    width: 800,
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
                grid: {
                    height: 420
                },
                yAxis: {
                    data: ['도로개량','구리포천','대구순환','밀양울산','안양영천'],
                    inverse: true,
                    axisLine: {show: false},
                    axisTick: {show: false},
                    axisLabel: {
                        margin: 30,
                        textStyle: {
                            fontSize: 14
                        }
                    }
                },
                xAxis: {
                    splitLine: {show: false},
                    axisLabel: {show: false},
                    axisTick: {show: false},
                    axisLine: {show: false}
                },
                series: []

            },
            options : []
        };


        for (var i = 0; i < timeLineData.length; i++) {
            option.baseOption.timeline.data.push(timeLineData[i]);
            option.options.push({
                title: {
                    text: '건설사업단 공정율'
                },
                yAxis: {
                    data: timeLineGubun[timeLineData[i]],
                    inverse: true,
                    axisLine: {show: false},
                    axisTick: {show: false},
                    axisLabel: {
                        margin: 30,
                        textStyle: {
                            fontSize: 14
                        }
                    }
                },
                series: [{
                        name: '공정율',
                        type: 'pictorialBar',
                        label: labelSetting,
                        symbolRepeat: true,
                        symbolSize: ['60%', '60%'],
                        barCategoryGap: '40%',
                        symbol: 'image://'+arrow,

                        data: data1[timeLineData[i]]
                    }, {
                        name: '인력투입(명)',
                        type: 'pictorialBar',
                        barGap: '10%',
                        label: labelSetting,
                        symbolRepeat: true,
                        symbol: 'image://'+human,
                        symbolSize: ['60%', '60%'],
                        data: data2[timeLineData[i]]
                }]
            });
        }
        myChart.setOption(option);
    </script>


    <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main3'), 'dark');

    var timeLineData = ['인력', '장비', '자재', '이동거리'];

    var CompleteData = {
            '인력' : [42, 40, 50, 30, 27, 15, 8, 22],
            '장비' : [32, 41, 9, 4, 8, 55, 20, 12],
            '자재' : [18, 17, 20, 13, 8, 8, 5, 5],
            '이동거리'  : [9, 13, 12, 14, 21, 30, 41, 40]
     };
    
        var TotalData = {
            '인력' : [51, 48, 60, 32, 28, 15, 10, 27],
            '장비' : [36, 43, 9, 5, 11, 61, 21, 14],
            '자재' : [20, 19, 23, 14, 10, 8 ,6, 5],
            '이동거리'  : [10, 13, 15, 17, 21, 33, 42, 45]
        };

option = {
    baseOption:{
        title : {
        },
        color: ['#d48265','#749f83'],
        timeline: {
            show: false,
            axisType: 'category',
            autoPlay: true,
            left: 0,
            currentIndex: 0,
            top: 470,
            width: 900,
            playInterval: 3000,
            label: {
                normal: {
                    show: true,
                    interval: 'auto'
                }
            },
            data: timeLineData
        },
        tooltip : {
        },
        legend: {
            data:['처리건수','총건수']
        }, 
        grid: {
            height: 390
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : ['수도권', '강원', '대전/충청', '충북', '전북', '광주/전남', '대구/경북', '부산/경남']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [

        ]
        },
    options:[]
    };

    for(var n = 0; n < timeLineData.length; n++)
    {
        option.options.push({
            title: {
                show: true,
                text: '유지관리-' + timeLineData[n]
            },
            series: [{
                name:'처리건수',
                type:'bar',
                data:CompleteData[timeLineData[n]]
            },
            {
                name:'총건수',
                type:'bar',
                data:TotalData[timeLineData[n]]
            }]
        });
    }
    myChart.setOption(option);

    </script>

    <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main4'), 'dark');
        var now = new Date();

        var year = now.getFullYear();
        //var month = now.getMonth()+1;
        
        var xAxisMonth = new Array('1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월');
        
        //var xAxisMonth = [createMonth[11]+'월',createMonth[10]+'월',createMonth[9]+'월',createMonth[8]+'월',createMonth[7]+'월',createMonth[6]+'월',createMonth[5]+'월',createMonth[4]+'월',createMonth[3]+'월',createMonth[2]+'월',createMonth[1]+'월',createMonth[0]+'월'];
        var hqList = ['수도권본부','강원본부','대전충청본부','전북본부','광주전남본부','대구경북본부','부산경남본부'];
        var legendList = [year-1+'년',year+'년'];

        var hqdata1 = {
            '수도권본부':[150, 120, 140, 80, 75, 85, 155, 150, 142, 135, 165, 150],
            '강원본부':[100, 150, 142, 135, 165, 150, 120, 140, 80, 75, 85, 155],
            '대전충청본부':[120, 130, 100, 89, 110, 140, 160, 180, 150, 130, 75, 60],
            '전북본부':[75, 69, 145, 123, 124, 162, 178, 125, 46, 153, 192, 120],
            '광주전남본부':[72, 85, 132, 120, 135, 141, 125, 130, 45, 86, 96, 100],
            '대구경북본부':[36, 153, 145, 123, 132, 145, 126, 134, 178, 125, 125, 143],
            '부산경남본부':[169, 123, 156, 145, 149, 158, 163, 125, 75, 120, 178, 69],
        };

        var hqdata2 = {
            '수도권본부':[149, 158, 163, 125, 75, 120, 178, 69, , , , ],
            '강원본부':[132, 145, 126, 134, 178, 125, 125, 143, , , , ],
            '대전충청본부':[135, 141, 125, 130, 45, 86, 96, 100, , , , ],
            '전북본부':[110, 140, 160, 180, 150, 130, 75, 60, , , , ],
            '광주전남본부':[124, 162, 178, 125, 46, 153, 192, 120, , , , ],
            '대구경북본부':[165, 150, 120, 140, 80, 75, 85, 155, , , , ],
            '부산경남본부':[75, 85, 155, 150, 142, 135, 165, 150, , , , ],
        };

        option = {
        			
                    baseOption: {
                        title: {},
                        tooltip : {
                            trigger: 'axis'
                        },

                                calculable : true,
                                xAxis : [
                                    {
                                        type : 'category',
                                        boundaryGap : false,
                                        data : xAxisMonth
                                    }
                                ],
                                yAxis : [
                                    {
                                        type : 'value',
                                        axisLabel : {
                                            formatter: '{value} ,000원'
                                        }
                                    }
                                ],
                        timeline: {
                                    show: false,
                                    axisType: 'category',
                                    autoPlay: true,
                                    left: 0,
                                    currentIndex: 0,
                                    top: 20,
                                    width: 800,
                                    playInterval: 3000,

                                    data: []

                        },
                        legend: {
                                    data: [],
                                    bottom:0
                                },
                        series: [],
                        animationEasing: 'linear',
                    },

                options :[]
        };
        for (var n = 0; n < hqList.length; n++) {
            option.baseOption.legend.data = legendList;
            option.baseOption.timeline.data.push(hqList[n]);

            option.options.push({
                title :{
                    text: '한전전기 납부현황'+' - '+hqList[n]

                },
                color: ['#d48265','#749f83'],
                series : [{
                    name:legendList[0],
                    type:'line',
                    data:hqdata1[hqList[n]],
                    grid: {
                        height: 390
                    },
                    markPoint : {
                    	label:{
                    		normal:{
                    			textStyle : {
                    				color: '#000'
                    				}
                    			}
                    		},
                        data : [
                            {type : 'max', name: '최고점'},
                            {type : 'min', name: '최소점'}
                       		 ]
                   		 },
                    
                    markLine : {
                        data : [
                            {type : 'average', name: '평균'}
                        ]
                    }
                },
               
                {
                    name:legendList[1],
                    type:'line',
                    data:hqdata2[hqList[n]],
                    markPoint : {
                    	label:{
                    		normal:{
                    			textStyle : {
                    				color: '#000'
                    				}
                    			}
                    		},
                        data : [
                            {type : 'max', name: '최고점'},
                            {type : 'min', name: '최소점'},
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '평균'}
                        ]
                    }
                }]
            });
        }

        myChart.setOption(option);
        
        $(window).load(function(){
        	
        	
        	test = "${param.widgetTimer}"
        	
        	
            //이벤트
            if(window.addEventListener) {
                window.addEventListener("message", uf_receiveMessage, false);
            }else if(window.attachEvent) {  //IE에서 이벤트 등록
                window.attachEvent("onmessage", uf_receiveMessage);
            }

            
        });
        
        function uf_receiveMessage(e){
                var command = e.data.command;
                switch(command){
                    case 'bucDsgn' : {
                        
                        sliding_sliding(parseInt(e.data.data.bucData));
                        fn_tranServer(e.data.data.bucData, 1);
                        break;
                    }
                    case 'bucBnsty' : {
                    	
                        sliding_sliding(parseInt(e.data.data.bucData));
                        fn_tranServer(e.data.data.bucData, 2);
                        break;
                    }
                    case 'bucMntmng' : {
                    	
                        sliding_sliding(parseInt(e.data.data.bucData));
                        fn_tranServer(e.data.data.bucData, 3);
                        break;
                    }
                    case 'bucFclts' : {
                    	
                        sliding_sliding(parseInt(e.data.data.bucData));
                        fn_tranServer(e.data.data.bucData, 0);
                        
                        break;
                    }
                    default : {
                        break;
                    } 
                }
            }
        
        function fn_tranServer(data, index){
        	
        	if(data == 0){
        		var callCommandVariable = {
                        classType: "1",
                        command : "ReturnbucDsgn",
                        data : {
                            bucData : index
                        }
                    };
        	}else if(data == 1){
        		var callCommandVariable = {
                        classType: "1",
                        command : "ReturnbucBnsty",
                        data : {
                            bucData : index
                        }
                    };
        	}else if(data == 2){
        		var callCommandVariable = {
                        classType: "1",
                        command : "ReturnbucMntmng",
                        data : {
                            bucData : index
                        }
                    };
        	}else if(data == 3){
        		var callCommandVariable = {
                        classType: "1",
                        command : "ReturnbucFclts",
                        data : {
                            bucData : index
                        }
                    };
        	}
            
            setTimeout(function(){
                parent.postMessage(callCommandVariable, "*");
            }, 1000 * test * 2 * 15);
        }


    </script>
</body>
</html>