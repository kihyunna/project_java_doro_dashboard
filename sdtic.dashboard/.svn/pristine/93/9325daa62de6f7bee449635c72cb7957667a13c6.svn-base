<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
	<!DOCTYPE html>
	<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv='description' content='' />
	<title>설계도서 반입 반출율</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	 <script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>
	</head>
</head>
<body>

    <!-- prepare a DOM container with width and height -->
    <script type="text/javascript">
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
								fontSize: 20

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
								fontSize: 20
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
								fontSize: 20

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
								fontSize: 20
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
	        objSet.style.width  = ($(window).width()) + "px";
	        objSet.style.height  = ($(window).height()) + "px";


	        $('#main').width(($(window).width()) + "px");
	        $('#main').height(($(window).height()) + "px");


	        myChart.resize({
	            width: $(window).width(),
	            height : $(window).height()
	            
	        });
	     
			
	    }
        // use configuration item and data specified to show chart
   
    </script>
</body>
</html>