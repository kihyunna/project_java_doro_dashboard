<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>비즈니스 공통 간이결재 처리현황 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts-liquidfill.min.js"></script>

    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body style="background-color : #000;">
    <!-- prepare a DOM container with width and height -->
    
    
    <div id="main" style="width:370px; height:205px;" ></div>

    <script type="text/javascript">

jQuery(document).ready(function($){

//-----------------------------------AJAX 호출 영역 ---------------------------------------

        //getBucCmmnSimplctysanctnAjax();
        setDivHeight('main');

//-----------------------------------AJAX 호출 영역 ---------------------------------------
})
    function getBucCmmnSimplctysanctnAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnSimplctysanctn.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++)
                    {
                        option.series[0].data[i].value = json.data[i].success_cnt;
                        option.series[1].data[i].value = json.data[i].fail_cnt;
                        option.series[2].data[i].value = json.data[i].wait_cnt;
                        
                        data4.push((parseInt(json.data[i].success_cnt) + parseInt(json.data[i].fail_cnt) + parseInt(json.data[i].wait_cnt)));
                        
                    }
                   
                }
                else{
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
            },completed : function(){
            	 myChart.setOption(option);
            }
        });

    }

        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'), 'dark');

        var data1 = [0, 0, 0, 0];
        var data2 = [0, 0, 0, 0];
        var data3 = [0, 0, 0, 0];
        var data4 = [53, 121, 79, 76];


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
                left: '0%',
                right: '30px',
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
                    data: [{value :24, name:'완료'},
                           {value :75, name:'완료'},
                           {value :36, name:'완료'},
                           {value :42, name:'완료'}]
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
                    data: [{value :8, name:'반려'},
                           {value :16, name:'반려'},
                           {value :7, name:'반려'},
                           {value :8, name:'반려'}]
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
                    data: [{value :21, name:'대기'},
                           {value :30, name:'대기'},
                           {value :36, name:'대기'},
                           {value :26, name:'대기'}]
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