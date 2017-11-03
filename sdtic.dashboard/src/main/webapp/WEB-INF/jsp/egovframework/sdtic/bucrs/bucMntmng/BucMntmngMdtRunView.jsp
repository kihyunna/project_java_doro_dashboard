<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>MDT 운행현황</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
 <script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>
</head>

<body>
	<div id="main" style="width:100%;height:280px;"></div>
	<script type="text/javascript">
	
				 
		var myChart = echarts.init(document.getElementById('main'),'dark');
	
		var myData = ['수도권', '강원', '대전충청', '충북준비단', '전북', '광주전남', '대구경북', '부산경남'];
		var databeast = {
			'장비': [31, 39, 10, 23, 12, 18, 17, 18],
			'운행거리(km)': [105, 130, 30, 75, 40, 60, 63, 60]

		};
		var databeauty = {
			'장비': [39, 41, 29, 41, 32, 52, 17, 22],
			'운행거리(km)': [130, 152, 35, 94, 45, 60, 69, 72]

		};
		var timeLineData = ['장비', '운행거리(km)'];
		
		var legendGap = Math.round($('#main').width(($(window).width())) * 0.4);

		deemph_color = 'rgb(165,165,165)'
		emph_color = 'rgb(79,129,189)'
		height = 300
		grid_top = 50
		bar_category_gap = '28%'
		colors = ["#4C72B0", "#55A868", "#C44E52", "#8172B2", "#CCB974", "#64B5CD"],
		    deemph_colors = ['#8DA6CE', '#A0CFAB']
		axis_line_color = 'rgb(135,135,135)'

		option = {
			baseOption: {
				timeline: {
						show: true,
						left: 0,
						width: '95%',
						axisType: 'category',
						tooltip: {
							show: true,
							formatter: function(params) {
								console.log(params);
								return params.name;
							}
						},
						autoPlay: true,
						currentIndex: 0,
						playInterval: 2000,
						label: {
							normal: {
								show: true,
								interval: 'auto',
								formatter: '{value}',
								color: '#fff'
							},
						},
						data: [],
				},
				title: [{
				
					text: '',
					textStyle: {
						fontWeight: 'normal',
						fontSize: 11
					},
					bottom: 20,
				}],
				tooltip: {
					trigger: 'axis',
					axisPointer: {
						type: 'shadow'
					}
				},
				legend:{
					data : ['전일', '금일'],					
					top: 10,
					right: 10
				},
			
				grid: [{
					left: 100,
					right: '47%',
				}, {
					left: '55%',
					right: 3,
				}],
				yAxis: [{
					type: 'category',
					boundaryGap: true,
					data: myData,
					inverse: true,
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
					},
					axisLabel: {
						show: true,
					},
				}, {
					gridIndex: 1,
					type: 'category',
					boundaryGap: true,
					data: myData,
					position: 'top',
					inverse: true,
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
					},
					type: 'category',
					data: myData,
					inverse: true,
					axisLabel: {
						show: false,
					}
				}],
				xAxis: [{
					name: '',
					nameLocation: 'middle',
					position: 'top',
					type: 'value',
					nameTextStyle: {
						color: '#fff',
						fontSize: 15,
					},
					nameGap: 5,
					splitLine: {
						show: false
					},
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
						lineStyle: {
							color: axis_line_color,
							width: 1.5,
						}
					},
					axisLabel: {
						show: false,
						textStyle: {
							fontSize: 10,
						},
					},
				}, {
					gridIndex: 1,
					name: '',
					nameLocation: 'middle',
					position: 'top',
					type: 'value',
					splitLine: {
						show: false
					},
					nameTextStyle: {
						color: '#000',
						fontSize: 15,
					},
					nameGap: 5,
					splitLine: {
						show: false
					},
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
						lineStyle: {
							color: axis_line_color,
							width: 1.5,
						}
					},
					axisLabel: {
						show: false,
					},
				}, ],

				series: [],
			},

			options: [],

		};
			for (var i = 0; i < timeLineData.length; i++) {
				option.baseOption.timeline.data.push(timeLineData[i]);
				option.options.push({
					series: [{
						name: '전일',
						type: 'bar',
						data: databeast[timeLineData[i]],
						barCategoryGap: bar_category_gap,
						label: {
							normal: {
								show: true,
								position: 'right',
								textStyle: {
									color: '#fff'
								},
							}
						},
						itemStyle: {
							normal: {
								color: deemph_colors[0]
							}
						},
					}, {
						name: '금일',
						type: 'bar',
						xAxisIndex: 1,
						yAxisIndex: 1,
						data: databeauty[timeLineData[i]],
						barCategoryGap: bar_category_gap,
						label: {
							normal: {
								show: true,
								position: 'right',
							textStyle: {
								color: '#fff'
							},
							}
						},
						itemStyle: {
							normal: {
								color: deemph_colors[1]
							}
						},
					}]
			
				});
			}
		
		
		myChart.setOption(option);	
		
		$(window).load(function() {
			setDivHeight('main');
		});
		
	    $(window).resize(function(){

	        setDivHeight('main');

	    });

	    function setDivHeight(objSet)
	    {

	        var objSet   = document.getElementById(objSet);
	        objSet.style.width  = ($(window).width()) + "px";
	        objSet.style.height  = ($(window).height()) + "px";
	        option.baseOption.timeline.width = ($(window).width() - 10) + "px";


	        $('#main').width(($(window).width()) + "px");
	        $('#main').height(($(window).height()) + "px");


	        myChart.resize({
	            width: $(window).width(),
	            height : $(window).height()
	            
	        });
	        myChart.setOption(option);
			
	    }
		         
	</script>
	</div>
</body>
</html>