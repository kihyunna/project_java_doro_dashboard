<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>데이터증가율</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<script>
</script>
<body>
    <!-- prepare a DOM container with width and height -->
    <table border="0" cellpadding="0" cellspacing="0">
    	<tr >
    		<td height="43" style="background-color:#ffffffff;color:#f9f9f9;font-weight:bolder;">

    			데이터 증가율

    		</td>
    	</tr>
    	<tr>
			<td height="2" style="background-color:#3d4146;">
			</td>
		</tr>
    	<tr>
    		<td height="200">
    			<div id="main" style="width:450px; height:200px;" ></div>
    		</td>
    	</tr>
    </table>
    
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'), 'dark');

        // specify chart configuration item and data
		var paper = "image://${contextPath}/images/bucrs/dbicon.png";
		//var paper = 'image://data:image/png;base64,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';
		var startData = 600;
		var maxData = 1200;
		var minData = 800;
		
		option = {
		    //backgroundColor: '#fff',
		    tooltip: {},
		    legend: {
		        data: ['DATA'],
		        textStyle: {color: '#ddd'}
		    },
		    grid: {
		        right: 20,
		        left: 50,
		        top:20,
		        bottom: 25
		    },
		    xAxis: {
		    	
		        data: ['정형', '비정형'],
		        axisTick: {show: false},
		        axisLine: {
		            lineStyle: {
		                color: '#ddd'
		            }
		        },
		        axisLabel: {show: true}
		    },
		    yAxis: {
		    	max:maxData,
		        splitLine: {show: false},
		        axisTick: {
		            lineStyle: {
		                color: '#ddd'
		            }
		        },
		        axisLine: {
		            lineStyle: {
		                color: '#ddd'
		            }
		        },
		        axisLabel: {
		            textStyle: {
		                color: '#ffffff'
		            }
		        }
		    },
		    animationEasing: 'cubicOut',
		    animationDuration: 100,
		    animationDurationUpdate: 2000,
		    series: [{
		        type: 'pictorialBar',
		        name: 'all',
		        id: 'paper',
		        hoverAnimation: true,
		        label: {
		            normal: {
		                show: true,
		                position: 'top',
		                formatter: '{c} GB',
		                textStyle: {
		                    fontSize: 16,
		                    color: '#e54035'
		                }
		            }
		        },
		        symbol: paper,
		        symbolSize: ['60%', 30],
		        symbolMargin: '-35%',
		        data: [{
		            value: 242,
		            symbolRepeat: true
		        }, {
		            value: startData,
		            symbolRepeat: true
		        }],
		        markLine: {
		            symbol: ['none', 'none'],
		            label: {
		                normal: {show: false}
		            },
		            lineStyle: {
		                normal: {
		                    color: '#e54035'
		                }
		            },
		            data: [{
		                yAxis: startData
		            }]
		        }
		    }]
		};



		setInterval(function () {
		    var dynamicData = Math.round(Math.random() * (maxData - minData) + minData);
		    var dynamicData1 = Math.round(Math.random() * (300 - 200) + 200);
		    myChart.setOption({
		        series: [{
		            id: 'paper',
		            data: [{
		                value: dynamicData1,
		                symbolRepeat: true
		            }, {
		                value: dynamicData,
		                symbolRepeat: true
		            }],
		            markLine: {
		                data: [{
		                    yAxis: dynamicData
		                }]
		            }
		        }]
		    });
		}, 3000);




// Add descriptions.
//function addDescriptions() {
//    var descriptions = [
//        [
//            'symbolBoundingData:',
//            'value:',
//            'symbolRepeat:',
//            'characteristic:',
//        ],
//        [
//            'default',
//            'max value',
//            'true (auto)',
//            'This is a standard'
//        ],
//        [
//            'default',
//            'current value',
//            'true (auto)',
//            'Not accurate\nSymbol gap stable\nAppropriate to compare\nwith other bar'
//        ],
//        [
//            'current value',
//            'current value',
//            'true (auto)',
//            'Accurate\nSymbol gap unstable\nInappropriate to compare\nwith other bar'
//        ],
//        [
//            'current value',
//            'current value',
//            '20 (a fixed number)',
//            'Accurate\nSymbol gap unstable\nNot responsive'
//        ]
//    ];
//
//    myChart.setOption({
//        graphic: echarts.util.map(descriptions, function (item, index) {
//            var pos = myChart.convertToPixel('grid', [Math.max(index - 1, 0), -1000]);
//
//            return {
//                type: 'group',
//                position: pos,
//                left: index ? null : 10,
//                children: [{
//                    type: 'text',
//                    left: 'center',
//                    top: 0,
//                    style: {
//                        text: descriptions[index].join('\n\n'),
//                        fill: index ? '#fff' : 'yellow',
//                        textAlign: index ? 'left' : 'right'
//                    },
//                    z: 101
//                }]
//            };
//        })
//    }, {silent: true});
//}
//
//setTimeout(function () {
//    addDescriptions();
//    myChart.on('updated', addDescriptions);
//}, 100);

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

        // use configuration item and data specified to show chart

    </script>
</body>
</html>