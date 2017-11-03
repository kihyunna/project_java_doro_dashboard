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

<body style="background-color : #ffffffff;">
    <!-- prepare a DOM container with width and height -->
    
    
    <div id="main" style="width:370px; height:205px;" ></div>

    <script type="text/javascript">

		jQuery(document).ready(function($){
		 
		//-----------------------------------AJAX 호출 영역 ---------------------------------------
		
		        getBucCmmnSimplctysanctndbAjax();
		        setDivHeight('main');
		
		//-----------------------------------AJAX 호출 영역 ---------------------------------------
		})
	
		var completed = new Array();
		var rejection = new Array();
		var waiting = new Array();
		
		var timerValue = 0;
	    $(window).load(function(){

	        timerValue = "${param.widgetTimer}";
	        
	        if(timerValue == 0){
	            timerValue = 60000*60;
	        }
	        
	        window.setInterval("getBucCmmnSimplctysanctndbAjax()",timerValue);
	        
	    });
	    var myChart = echarts.init(document.getElementById('main'), 'dark');

		
    function getBucCmmnSimplctysanctndbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnSimplctysanctndbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++)
                    {

                    	if(json.data[i].aprvl_nm == '설계'){
                           completed[0] = json.data[i].completed;
                           rejection[0]= json.data[i].rejected;
                           waiting[0] = json.data[i].timed;
                           data4[0] = parseInt(json.data[i].completed) + parseInt(json.data[i].rejected) + parseInt(json.data[i].timed);
                        	}
                    	else if(json.data[i].aprvl_nm == '건설'){
                    		completed[1] = json.data[i].completed;
                    		rejection[1] = json.data[i].rejected;
                    		waiting[1] = json.data[i].timed;
                    		data4[1] = parseInt(json.data[i].completed) + parseInt(json.data[i].rejected) + parseInt(json.data[i].timed);
                        	}
	                  	 else if(json.data[i].aprvl_nm == '유지관리'){
	                  		completed[2] = json.data[i].completed;
	                  		rejection[2]= json.data[i].rejected;
	                  		waiting[2] = json.data[i].timed;
	                  		data4[2] = parseInt(json.data[i].completed) + parseInt(json.data[i].rejected) + parseInt(json.data[i].timed);
                    	}
	                	 else if(json.data[i].aprvl_nm == '시설물'){
		                  		completed[3] = json.data[i].completed;
		                  		rejection[3]= json.data[i].rejected;
		                  		waiting[3] = json.data[i].timed;
		                  		data4[3] = parseInt(json.data[i].completed) + parseInt(json.data[i].rejected) + parseInt(json.data[i].timed);
	                    	}
                        
                    }
                    var option = {
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
                                type: 'value',
                                max: 30,
                            },
                            yAxis: {
                                type: 'category',
                               
                                inverse: true,
                                data:['설계','건설','유지관리','시설물']
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
                                            formatter:function(v){
                                            	
                                            	if(v.value == 0)
                                            		{
                                                return '';
                                            		}
                                            	else{
                                            		return v.value;
                                            	}
                                            },
                                            position: 'insideRight'
                                        }
                                    },
                                    data: completed
                                },
                                {
                                    name: '반려',
                                    type: 'bar',
                                    stack: '总量',
                                    label: {
                                        normal: {
                                            show: true,
 											formatter:function(v){
                                            	if(v.value == 0)
                                            		{
                                                return '';
                                            		}
                                            	else{
                                            		return v.value;
                                            	}
                                            },
                                            position: 'insideRight'
                                        }
                                    },
                                    data: rejection
                                        
                                },
                                {
                                    name: '대기',
                                    type: 'bar',
                                    stack: '总量',
                                    label: {
                                        normal: {
                                            show: true,
                                            formatter:function(v){
                                            	if(v.value == 0)
                                            		{
                                                return '';
                                            		}
                                            	else{
                                            		return v.value;
                                            	}
                                            },
                                            position: 'insideRight'
                                        }
                                    },
                                    data: waiting
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
                                               }
                                          }]
                                }

                            ]
                        };

                    myChart.setOption(option);
                    
                }
                else{
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
            }
        });

    }

        // based on prepared DOM, initialize echarts instance
    
        var data1 = [0, 0, 0, 0];
        var data2 = [0, 0, 0, 0];
        var data3 = [0, 0, 0, 0];
        var data4 = ['','' ,'' ,'' ];


       
        

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