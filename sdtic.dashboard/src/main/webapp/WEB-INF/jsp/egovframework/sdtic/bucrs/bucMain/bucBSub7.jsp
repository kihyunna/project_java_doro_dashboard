<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>간이결재처리현황</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.js""></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts-liquidfill.min.js"></script>
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
    					금일 간이결재 처리현황
    		</td>
    	</tr>
    	<tr>
			<td height="2" style="background-color:#3d4146;">
			</td>
		</tr>
    	<tr>
    		<td height="205">
    			<div id="main" style="width:370px; height:205px;" ></div>
    		</td>
    	</tr>
    </table>
   
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'), 'dark');

        var data1 = [33, 39, 33, 32];
        var data2 = [13, 63, 23, 21];
        var data3 = [23, 29, 33, 31];
        var data4 = [];

        for (var i = 0; i<4; i++){
            data4.push((data1[i] + data2[i] + data3[i]))
        }
        option = {
            tooltip : {
                show:false,
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data: ['완료', '반려','대기'],
                top: '0%',
                right: '0%'
            },
            grid: {
            	top: '13%',
            	left: '3%',
                right: '10%',
                bottom: '3%',
                containLabel: true
            },
            xAxis:  {
                type: 'value'
            },
            yAxis: {
                type: 'category',
                data: ['시설물','유지관리','건설','설계']
            },
            label: {
                normal: {
                    show: true,
                    position: 'insideRight'
                }
            },
            series: [

                {
                    name: '완료',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    data: [{value:data1[0], name:'완료'},
                           {value:data1[1], name:'완료'},
                           {value:data1[2], name:'완료'},
                           {value:data2[3], name:'완료'}]
                },
                {
                    name: '반려',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    data: [{value:data2[0], name:'반려'},
                           {value:data2[1], name:'반려'},
                           {value:data2[2], name:'반려'},
                           {value:data2[3], name:'반려'}]
                },
                {
                    name: '대기',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'insideRight'
                        }
                    },
                    data: [{value:data3[0], name:'대기'},
                           {value:data3[1], name:'대기'},
                           {value:data3[2], name:'대기'},
                           {value:data3[3], name:'대기'}]
                },
                {
                    name: '합계',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: [20,50],
                            formatter:function(v){
                                return (data1[0]+data2[0]+data3[0])+' 건';
                            },
                        }
                    },
                    data: [{value:0, name:'합계',
                                label: {
                                    normal: {
                                        formatter:function(v){
                                            return '총 '+data4[0]+' 건';
                                        },
                                        textStyle: {
                                        	color: '#FFF',
                                            fontSize: 12
                                        },
                                        position: 'right'
                                    }
                                }
                            },
                           {value:0, name:'합계',

                                label: {
                                    normal: {
                                        formatter:function(v){
                                            return '총 '+data4[1]+' 건';
                                        },
                                        textStyle: {
                                        	color: '#FFF',
                                            fontSize: 12
                                        },
                                        position: 'right'
                                    }
                                }
                           },
                           {value:0, name:'합계',
                                label: {
                                    normal: {
                                        formatter:function(v){
                                            return '총 '+data4[2]+' 건';
                                        },
                                        textStyle: {
                                        	color: '#FFF',
                                            fontSize: 12
                                        },
                                        position: 'right'
                                    }
                                }
                           },
                           {value:0, name:'합계',
                                label: {
                                    normal: {
                                        formatter:function(v){
                                            return '총 '+data4[3]+' 건';
                                        },
                                        textStyle: {
                                            color: '#FFF',
                                            fontSize: 12
                                        },
                                        position: 'right'
                                    }
                                }}]
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

        // use configuration item and data specified to show chart

    </script>
</body>

</html>