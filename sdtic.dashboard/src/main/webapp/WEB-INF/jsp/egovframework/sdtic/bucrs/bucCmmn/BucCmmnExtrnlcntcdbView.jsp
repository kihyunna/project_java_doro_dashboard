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

    	        getBucCmmnExtrnlcntcdbAjax();
    	        setDivHeight('main');

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    	})
   	var snd_stm = new Array();
    var trst_ty = new Array();
    var trst_stat_r = new Array();
    var send = new Array();
    var sendfail = new Array();
    var recive = [0, 0, 0, 0];
    var recivefail =  [0, 0, 0, 0];
    
    
    var timerValue = 0;
    $(window).load(function(){

        timerValue = "${param.widgetTimer}";
        
        if(timerValue == 0){
            timerValue = 60000*60;
        }
        
        window.setInterval("getBucCmmnExtrnlcntcdbAjax()",timerValue);
        
    });
    
    
    function getBucCmmnExtrnlcntcdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnExtrnlcntcdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++)
                    {
                    	/* 
                         biz_nm[i]= json.data[i].biz_nm;
                    	 trst_ty[i]= json.data[i].trst_ty;
                    	 trst_stat_r[i]= json.data[i].trst_stat_r;
                         recive[i] = json.data[i].trst_stat_c;
                    	 recivefail[i] = json.data[i].trst_stat_e; */
                    	 if (json.data[i].biz_nm == '기상청')
                    	 {   
                    		 if(json.data[i].trst_stat_c != null)
                             	recive[1] = parseInt(json.data[i].trst_stat_c);
                    		 else 
                    			 recive[1] = 0;
                    		 if(json.data[i].trst_stat_e != null)
                        	 	recivefail[1] = parseInt(json.data[i].trst_stat_e);
                    		 else
                    			 recivefail[1] = 0;
                    	 } else if (json.data[i].biz_nm == '국민안전처') {
                    		 if(json.data[i].trst_stat_c != null)
                              	recive[0] = parseInt(json.data[i].trst_stat_c);
                     		 else 
                     			 recive[0] = 0;
                     		 if(json.data[i].trst_stat_e != null)
                         	 	recivefail[0] = parseInt(json.data[i].trst_stat_e);
                     		 else
                     			 recivefail[0] = 0;
                    	 } else if (json.data[i].biz_nm == '한국환경공단') {
                    		 if(json.data[i].trst_stat_c != null)
                               	recive[3] = parseInt(json.data[i].trst_stat_c);
                      		 else 
                      			 recive[3] = 0;
                      		 if(json.data[i].trst_stat_e != null)
                          	 	recivefail[3] = parseInt(json.data[i].trst_stat_e);
                      		 else
                      			 recivefail[1] = 0;
                     	 } else if (json.data[i].biz_nm == '시설안전공단') {
                    		 if(json.data[i].trst_stat_c != null)
                               	recive[2] = parseInt(json.data[i].trst_stat_c);
                      		 else 
                      			 recive[2] = 0;
                      		 if(json.data[i].trst_stat_e != null)
                          	 	recivefail[2] = parseInt(json.data[i].trst_stat_e);
                      		 else
                      			 recivefail[2] = 0;
                     	 }
                    	
/*                     	 databeast[i] = json.data[i].extrnlcntc1l;
                     	databeast[i] = json.data[i].extrnlcntc2l;
                     	databeast[i] = json.data[i].extrnlcntc3l;
                     	databeast[i] = json.data[i].extrnlcntc4l;
                     	
                     	databeauty[i] = json.data[i].extrnlcntc1r;
                     	databeauty[i] = json.data[i].extrnlcntc2r;
                     	databeauty[i] = json.data[i].extrnlcntc3r;
                     	databeauty[i] = json.data[i].extrnlcntc4r; */
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
        //var timeLineData = [1, 2];

        var myData = ['국민안전처', '기상청', '시설안전공단', '한국환경공단'];
        var databeast = [0, 0, 0, 0];
        var databeauty = [0, 0, 0, 0];
        var databeastFail = [0, 0, 0, 0];
        var databeautyFail = [0, 0, 0, 0];

        option = {
            
                //backgroundColor: '#000',
                title: {
                     //text:'대외연계 송/수신',
                    textStyle: {
                        color: '#fff',
                        fontSize: 16,
                    }
                },
                legend: {
                    data: ['송신실패', '수신실패', '송신', '수신'],
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
                    max:300,
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
                    interval : 1000,
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
                series: [{
                    name: '송신실패',
                    type: 'bar',
                    //barGap: 20,
                    barWidth: 8,
                    label: {
                        normal: {
                            show: false,
                        },

                    },
                    itemStyle: {
                        normal: {
                            color: '#2f4554',
                        },

                    },
                    data: databeastFail,
                },
                {
                    name: '수신실패',
                    type: 'bar',
                    barGap: 1,
                    barWidth: 8,
                    label: {
                        normal: {
                            show: false,
                        },
              
                    },
                    itemStyle: {
                        normal: {
                            color: '#c23531',
                        },
                        
                    },
                    data: recivefail,
                },


                {
                    name: '송신',
                    type: 'bar',
                    //barGap: 20,
                    barWidth: 8,
                    xAxisIndex: 2,
                    yAxisIndex: 2,
                    label: {
                        normal: {
                            show: false,
                        },
                    },
                    itemStyle: {
                        normal: {
                            color: '#749f83',
                        },
                    },
                    data: databeast,
                },
                
                {
                    name: '수신',
                    type: 'bar',
                    barGap: 1,
                    barWidth: 8,
                    xAxisIndex: 2,
                    yAxisIndex: 2,
                    label: {
                        normal: {
                            show: false,
                        },
                    },
                    itemStyle: {
                        normal: {
                            color: '#d48265',
                        },
                    },
                    data: recive,
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
    </script>

</body>
</html>