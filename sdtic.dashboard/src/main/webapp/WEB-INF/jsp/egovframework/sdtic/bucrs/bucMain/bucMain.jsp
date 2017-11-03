<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>건설사업단 공정율</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script src="${contextPath}/js/common/jquery-2.1.4.js"></script>

    

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
        height:500px;
    }

    .slide_sliding {
        width:3600px;
        height:500px;
        position:absolute;
        left:0;
    }
    .slide_sliding ul{
            font-size:0;
    }
    .slide_sliding li {
        display:inline-block;
        width:900px;
        height:500px;
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
			sliding_sliding(0)
		}else if(second>=15 && second<30){
			sliding_sliding(1)	
			
		}else if(second>=30 && second<45){
			sliding_sliding(2)
		}else if(second>=45){
			sliding_sliding(3)
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
    ><li><div id="main" style="width:900px;height:450px;"></div></li
    ><li><div id="main2" style="width:900px;height:450px;"></div></li
    ><li><div id="main3" style="width:900px;height:450px;"></div></li
    ><li><div id="main4" style="width:900px;height:450px;"></div></li
    ></ul>
</div>
	<script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
      var myChart = echarts.init(document.getElementById('main'));

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
				text: '주간설계반출입현황',
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
						color: '#fff'
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
						color: '#fff'
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
        // use configuration item and data specified to show chart

    </script>

    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main2'));

        var arrow = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWYAAAEBCAYAAABL1w/0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyBpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBXaW5kb3dzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkY5MjQ5QkU3MUI4NTExRTI5NEY0OEY2MTkwM0E4MjAwIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkY5MjQ5QkU4MUI4NTExRTI5NEY0OEY2MTkwM0E4MjAwIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjkyNDlCRTUxQjg1MTFFMjk0RjQ4RjYxOTAzQTgyMDAiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjkyNDlCRTYxQjg1MTFFMjk0RjQ4RjYxOTAzQTgyMDAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4OZ1bYAAAmB0lEQVR42uydXYxc5ZWu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';

        var human = 'data:image/png;base64,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';


        var timeLineData = ['건설사업단 구분1','건설사업단 구분2','건설사업단 구분3'];
        var timeLineGubun = {
            '건설사업단 구분1':['도로개량','구리포천','대구순환','밀양울산','안양영천'],
            '건설사업단 구분2':['창원김해','김해부산','창녕밀양','김포포천','포항영덕'],
            '건설사업단 구분3':['광주순환','이산천안','성남구리','수도권','홍천양양']
        };
        var data1 = {
            '건설사업단 구분1':[57,21,66,78,23],
            '건설사업단 구분2':[80,63,74,36,21],
            '건설사업단 구분3':[90,15,43,69,50]
        };
        var data2 = {
            '건설사업단 구분1':[84,29,73,91,95],
            '건설사업단 구분2':[88,93,34,56,69],
            '건설사업단 구분3':[96,23,15,26,120]
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
                    data: ['공정율', '인력투입수'],
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
                        symbolSize: ['80%', '60%'],
                        barCategoryGap: '40%',
                        symbol: 'image://'+arrow,

                        data: data1[timeLineData[i]]
                    }, {
                        name: '인력투입수',
                        type: 'pictorialBar',
                        barGap: '10%',
                        label: labelSetting,
                        symbolRepeat: true,
                        symbol: 'image://'+human,
                        symbolSize: ['80%', '100%'],
                        data: data2[timeLineData[i]]
                }]
            });
        }
        myChart.setOption(option);
    </script>
    
    
    <script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main3'));
		var now = new Date();
	
		var year = now.getFullYear(); 
		var month = now.getMonth()+1; 

			
		
		var xAxisMonth = [month+1+'월',month+2+'월',month+3+'월',month+4+'월',month+5+'월',month+6+'월',month-5+'월',month-4+'월',month-3+'월',month-2+'월',month-1+'월',month+'월'];
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
			'수도권본부':[169, 123, 156, 145, 149, 158, 163, 125, 75, 120, 178, 69],
			'강원본부':[36, 153, 145, 123, 132, 145, 126, 134, 178, 125, 125, 143],
			'대전충청본부':[72, 85, 132, 120, 135, 141, 125, 130, 45, 86, 96, 100],
			'전북본부':[120, 130, 100, 89, 110, 140, 160, 180, 150, 130, 75, 60],
			'광주전남본부':[75, 69, 145, 123, 124, 162, 178, 125, 46, 153, 192, 120],
			'대구경북본부':[100, 150, 142, 135, 165, 150, 120, 140, 80, 75, 85, 155],
			'부산경남본부':[150, 120, 140, 80, 75, 85, 155, 150, 142, 135, 165, 150],
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
									bottom:10
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
				series : [{
					name:legendList[0],
					type:'line',
					data:hqdata1[hqList[n]],
                    markPoint : {
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
				}]
			});	
		}
		
		myChart.setOption(option);


	</script>
	
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main4'));
		var now = new Date();
	
		var year = now.getFullYear(); 
		var month = now.getMonth()+1; 

			
		
		var xAxisMonth = [month+1+'월',month+2+'월',month+3+'월',month+4+'월',month+5+'월',month+6+'월',month-5+'월',month-4+'월',month-3+'월',month-2+'월',month-1+'월',month+'월'];
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
			'수도권본부':[169, 123, 156, 145, 149, 158, 163, 125, 75, 120, 178, 69],
			'강원본부':[36, 153, 145, 123, 132, 145, 126, 134, 178, 125, 125, 143],
			'대전충청본부':[72, 85, 132, 120, 135, 141, 125, 130, 45, 86, 96, 100],
			'전북본부':[120, 130, 100, 89, 110, 140, 160, 180, 150, 130, 75, 60],
			'광주전남본부':[75, 69, 145, 123, 124, 162, 178, 125, 46, 153, 192, 120],
			'대구경북본부':[100, 150, 142, 135, 165, 150, 120, 140, 80, 75, 85, 155],
			'부산경남본부':[150, 120, 140, 80, 75, 85, 155, 150, 142, 135, 165, 150],
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
									bottom:10
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
				series : [{
					name:legendList[0],
					type:'line',
					data:hqdata1[hqList[n]],
                    markPoint : {
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
				}]
			});	
		}
		
		myChart.setOption(option);


	</script>
</body>
</html>