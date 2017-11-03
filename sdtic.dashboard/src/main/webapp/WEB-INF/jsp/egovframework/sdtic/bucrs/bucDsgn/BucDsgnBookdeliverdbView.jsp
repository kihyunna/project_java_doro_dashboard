<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>설계도서납품현황</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>
	<div id="main" style="width:500px;height:500px;"></div>
    <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'), 'dark');   
    
	jQuery(document).ready(function($){
		
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	       getBucDsgnBookdeliverdbAjax();
    	       // getBucCmmnLoadinfomenudbgridAjax();
    	       
    	       
    	        

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    })
    
    
    
    function getBucDsgnBookdeliverdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucDsgnBookdeliverdb.do",
            async : false,
            dataType : 'json',
            success :function(json) {               
	                if(json.data.length > 0 ){
	                	for(var i = 0; i < json.data.length; i++) {
	                		Category[i] = json.data[i].category;
	                		data[i] = json.data[i].percentage;
	                		if(parseInt(json.data[i].percentage) >= 95) {
	                			barColor[i] = '#4C72B0';
	                		} else {
	                			barColor[i] = '#8DA6CE';
	                		}
	                	}
	                }
	                else{
	                console.log(arguments);
	                }
	
	            },error : function(){
	                console.log(arguments);
	            }, complete : function() {
	            	Etime();
	            	myChart.setOption(option);
	            }
	        });
		
	    }
    
     
	colors = ["#4C72B0", "#55A868", "#C44E52", "#8172B2", "#CCB974", "#64B5CD"],
    deemph_colors = ['#8DA6CE', '#A0CFAB']
    height = 300
    bar_category_gap = '28%'
    source_color = 'rgb(166,166,166)'
    label_emph_fontsize = 12
    label_emph_style = {
        show: true,
        position: 'insideTop',
        formatter: '{c}%',
        textStyle: {
            fontSize: label_emph_fontsize,
            color: '#fff'
        },
    }, 
    axis_line_color = 'rgb(135,135,135)'

    Category = []
    data = []
	barColor = []

    option = {
		grid: {
	            left:'7%',
	            right: 7,
	            top:'10%',
	            bottom:'27%'
	            // containLabel: true,
	    },/* 
        legend: {
            data: ['금주납품율', '전주납품율']
        }, */
        xAxis: [{
            
            type: 'category',
            data: Category,
            axisTick: {
                show: false
            },
            axisLine: {
            	show: true,
            	lineStyle: {
            		color: '#fff'
            	}
            },
            axisLabel: {
            	interval: 0,
            	rotate: 30
            }
        }],
        yAxis: [{
            axisLine: {
                show: true,
                lineStyle: {
                	color: '#fff'
                }
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                formatter: '{value}%',
                textStyle: {
                    color: '#fff'
                }
            },
            max: 100
        }, ],
        series: [{
            name: '금주납품율',
            type: 'bar',
            barCategoryGap: bar_category_gap,
            data: data,
            label: {
            	normal : label_emph_style
            },
            itemStyle: {
                normal: {
                	color: function(params) {
                        return barColor[params.dataIndex]
                    }	         
                },                     
                emphasis:{
                       color:new echarts.graphic.LinearGradient(0,0,0,1,[{
                         offset:0,
                         color:'rgba(13,164,171,1)'
                       },{
                         offset:1,
                         color:'rgba(64,180,157,.1)'
                       }]),
                       borderColor:'#0ea4a6',
                       borderWidth:2,
                       barBorderRadius:[9,9,0,0],
                       shadowBlur:30,
                       shadowColor:'rgba(32,188 ,157,0.8)',
            //           shadowOffsetX:10,
            //           shadowOffsetY:10,
                       opacity:.7
                     }
            }
        },
        // 전주납품율 꺾은선
       /*  {
            name: '전주납품율',
            type: 'line',
            lineStyle: {
                normal: {
                    width: 3,                        
                }
            },
            data: [45, 52, 46, 65, 74, 87, 89, 79, 100, 91, 69, 95]
        }, */

                
        ]
    };


	
	myChart.setOption(option);
    
	var timerValue = 0;
    $(window).load(function() {
    	setDivHeight('main');
        timerValue = "${param.widgetTimer}";
        
        if(timerValue == 0){
            timerValue = 60000*60;
        }
        
        window.setInterval("getBucDsgnBookdeliverdbAjax()",timerValue);
    });
    
    
    
    
    $(window).resize(function(){

            setDivHeight('main');
            
        });
    
    function Etime(){
       var count = 0;
       setInterval(function () {
            myChart.dispatchAction({
                type: 'downplay',
                seriesIndex: 0
            });
            myChart.dispatchAction({
                type: 'highlight',
                seriesIndex: 0,
                dataIndex: (count++) % 12
            });
   		}, 2000);
    }
    
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
        myChart.setOption(option);
    }
    </script>
</body>
</html>