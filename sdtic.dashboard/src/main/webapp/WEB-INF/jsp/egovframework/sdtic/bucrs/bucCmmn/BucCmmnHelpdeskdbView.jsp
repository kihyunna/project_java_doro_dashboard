<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="utf-8">
    <title>비즈니스 공통 헬프데스크 처리현황 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>
    <!-- prepare a DOM container with width and height -->

    <div id="main" style="width:100%; height:190px;" ></div>

    <script type="text/javascript">


jQuery(document).ready(function($){

//-----------------------------------AJAX 호출 영역 ---------------------------------------

        getBucCmmnHelpdeskdbAjax();
        setDivHeight('main');

//-----------------------------------AJAX 호출 영 역 ---------------------------------------
})
    var timerValue = 0;
    $(window).load(function(){

        timerValue = "${param.widgetTimer}";
        
        if(timerValue == 0){
            timerValue = 60000*60;
        }
        
        window.setInterval("getBucCmmnHelpdeskdbAjax()",timerValue);
        
    });
    
   
    var data1 = new Array();
    var data2 = new Array();
    var data3 = new Array();
    
    function getBucCmmnHelpdeskdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnHelpdeskdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                	 	
                    for(var i=0; i<json.data.length; i++)
                    {
                        data1[i] = json.data[i].total;
                        data2[i] = json.data[i].un_processing;
                        data3[i] = json.data[i].completion;
                        
                      
                    }
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

        var myChart = echarts.init(document.getElementById('main'), 'dark');
		var colors = ['#91c7ae','#d48265','#bda29a'];
        // specify chart configuration item and data
        option = {
            //backgroundColor: '#ffff',
            
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
                }
            },
            legend: {
                data:['요청', '미처리', '처리완료'],
                top: '0%',
                right: '0%'
            },
            grid: {
                left: '3%',
                right: '4%',
               top: '15%',
                bottom: '0%',
                containLabel: true
               
            },
            xAxis : [
                {
                    type : 'value'
                }
            ],
            yAxis : [
                {
                    type : 'category',
                    axisTick : {show: false},
                    data : ['시설물','유지관리','건설','설계']
                }
            ],
            color: colors,
            series : [
                {
                    name:'요청',
                    type:'bar',
                    stack: 'success',
                    label: {
                        normal: {
                            show: true,
                            position: 'inside'
                        }
                    },
                    data:data1
                },
                {
                    name:'미처리',
                    type:'bar',
                    stack: 'fail',
                    label: {
                        normal: {
                            show: true,
                            position: 'inside'
                        }
                    },
                    data:data2

                },
                {
                    name:'처리완료',
                    type:'bar',
                    stack: 'wait',
                    label: {
                        normal: {
                            show: true,
                            position: 'inside'
                        }
                    },
                    data:data3
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