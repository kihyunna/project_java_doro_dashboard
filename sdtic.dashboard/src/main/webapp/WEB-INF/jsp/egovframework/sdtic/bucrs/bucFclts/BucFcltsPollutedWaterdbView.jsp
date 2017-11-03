<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 오수 유입/방출량</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>

    <div id="main" style="width:513px; height:190px;" ></div>

<script>

jQuery(document).ready(function($){ 

	//-----------------------------------AJAX 호출 영역 ---------------------------------------

	       getBucFcltsPollutedWaterdbAjax();
	        setDivHeight('main');

	//-----------------------------------AJAX 호출 영역 ---------------------------------------
})
var timerValue = 0;
$(window).load(function() {

    if(timerValue == 0){
        timerValue = 60000*60;
    }
            
    window.setInterval("getBucFcltsPollutedWaterdbAjax()",timerValue);
        
});

function getBucFcltsPollutedWaterdbAjax(){
    $.ajax({
        url : "${pageContext.request.contextPath}/buc/bucFcltsPollutedWaterdbAjax.do",
        async : false,
        dataType : 'json',
        success :function(json) {if(json.data.length > 0 ){
         	
            for(var i=0; i<json.data.length; i++){
           		if(json.data[i].flow_type == '유입') {
       				if(json.data[i].svar_nm == '수도권본부') {
       					hqdata['수도권본부'][0] = json.data[i].t01;
       					hqdata['수도권본부'][1] = json.data[i].t02;
       					hqdata['수도권본부'][2] = json.data[i].t03;
       					hqdata['수도권본부'][3] = json.data[i].t04;
       					hqdata['수도권본부'][4] = json.data[i].t05;
       					hqdata['수도권본부'][5] = json.data[i].t06;
       					hqdata['수도권본부'][6] = json.data[i].t07;
       					hqdata['수도권본부'][7] = json.data[i].t08;
       					hqdata['수도권본부'][8] = json.data[i].t09;
       					hqdata['수도권본부'][9] = json.data[i].t10;
       					hqdata['수도권본부'][10] = json.data[i].t11;
       					hqdata['수도권본부'][11] = json.data[i].t12;
       				} else if(json.data[i].svar_nm == '강원본부') {
       					hqdata['강원본부'][0] = json.data[i].t01;  
       					hqdata['강원본부'][1] = json.data[i].t02;  
       					hqdata['강원본부'][2] = json.data[i].t03;  
       					hqdata['강원본부'][3] = json.data[i].t04;  
       					hqdata['강원본부'][4] = json.data[i].t05;  
       					hqdata['강원본부'][5] = json.data[i].t06;  
       					hqdata['강원본부'][6] = json.data[i].t07;  
       					hqdata['강원본부'][7] = json.data[i].t08;  
       					hqdata['강원본부'][8] = json.data[i].t09;  
       					hqdata['강원본부'][9] = json.data[i].t10;  
       					hqdata['강원본부'][10] = json.data[i].t11; 
       					hqdata['강원본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '대전충남본부') {
       					hqdata['대전충남본부'][0] = json.data[i].t01; 
       					hqdata['대전충남본부'][1] = json.data[i].t02;  
       					hqdata['대전충남본부'][2] = json.data[i].t03;  
       					hqdata['대전충남본부'][3] = json.data[i].t04;  
       					hqdata['대전충남본부'][4] = json.data[i].t05;  
       					hqdata['대전충남본부'][5] = json.data[i].t06;  
       					hqdata['대전충남본부'][6] = json.data[i].t07;  
       					hqdata['대전충남본부'][7] = json.data[i].t08;  
       					hqdata['대전충남본부'][8] = json.data[i].t09;  
       					hqdata['대전충남본부'][9] = json.data[i].t10;  
       					hqdata['대전충남본부'][10] = json.data[i].t11; 
       					hqdata['대전충남본부'][11] = json.data[i].t12; 
       				}  else if(json.data[i].svar_nm == '전북본부') {
       					hqdata['전북본부'][0] = json.data[i].t01; 
       					hqdata['전북본부'][1] = json.data[i].t02;  
       					hqdata['전북본부'][2] = json.data[i].t03;  
       					hqdata['전북본부'][3] = json.data[i].t04;  
       					hqdata['전북본부'][4] = json.data[i].t05;  
       					hqdata['전북본부'][5] = json.data[i].t06;  
       					hqdata['전북본부'][6] = json.data[i].t07;  
       					hqdata['전북본부'][7] = json.data[i].t08;  
       					hqdata['전북본부'][8] = json.data[i].t09;  
       					hqdata['전북본부'][9] = json.data[i].t10;  
       					hqdata['전북본부'][10] = json.data[i].t11; 
       					hqdata['전북본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '광주전남본부') {
       					hqdata['광주전남본부'][0] = json.data[i].t01; 
       					hqdata['광주전남본부'][1] = json.data[i].t02;  
       					hqdata['광주전남본부'][2] = json.data[i].t03;  
       					hqdata['광주전남본부'][3] = json.data[i].t04;  
       					hqdata['광주전남본부'][4] = json.data[i].t05;  
       					hqdata['광주전남본부'][5] = json.data[i].t06;  
       					hqdata['광주전남본부'][6] = json.data[i].t07;  
       					hqdata['광주전남본부'][7] = json.data[i].t08;  
       					hqdata['광주전남본부'][8] = json.data[i].t09;  
       					hqdata['광주전남본부'][9] = json.data[i].t10;  
       					hqdata['광주전남본부'][10] = json.data[i].t11; 
       					hqdata['광주전남본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '대구경북본부') {
       					hqdata['대구경북본부'][0] = json.data[i].t01; 
       					hqdata['대구경북본부'][1] = json.data[i].t02;  
       					hqdata['대구경북본부'][2] = json.data[i].t03;  
       					hqdata['대구경북본부'][3] = json.data[i].t04;  
       					hqdata['대구경북본부'][4] = json.data[i].t05;  
       					hqdata['대구경북본부'][5] = json.data[i].t06;  
       					hqdata['대구경북본부'][6] = json.data[i].t07;  
       					hqdata['대구경북본부'][7] = json.data[i].t08;  
       					hqdata['대구경북본부'][8] = json.data[i].t09;  
       					hqdata['대구경북본부'][9] = json.data[i].t10;  
       					hqdata['대구경북본부'][10] = json.data[i].t11; 
       					hqdata['대구경북본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '부산경남본부') {
       					hqdata['부산경남본부'][0] = json.data[i].t01; 
       					hqdata['부산경남본부'][1] = json.data[i].t02;  
       					hqdata['부산경남본부'][2] = json.data[i].t03;  
       					hqdata['부산경남본부'][3] = json.data[i].t04;  
       					hqdata['부산경남본부'][4] = json.data[i].t05;  
       					hqdata['부산경남본부'][5] = json.data[i].t06;  
       					hqdata['부산경남본부'][6] = json.data[i].t07;  
       					hqdata['부산경남본부'][7] = json.data[i].t08;  
       					hqdata['부산경남본부'][8] = json.data[i].t09;  
       					hqdata['부산경남본부'][9] = json.data[i].t10;  
       					hqdata['부산경남본부'][10] = json.data[i].t11; 
       					hqdata['부산경남본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '충북본부') {
       					hqdata['충북본부'][0] = json.data[i].t01; 
       					hqdata['충북본부'][1] = json.data[i].t02;  
       					hqdata['충북본부'][2] = json.data[i].t03;  
       					hqdata['충북본부'][3] = json.data[i].t04;  
       					hqdata['충북본부'][4] = json.data[i].t05;  
       					hqdata['충북본부'][5] = json.data[i].t06;  
       					hqdata['충북본부'][6] = json.data[i].t07;  
       					hqdata['충북본부'][7] = json.data[i].t08;  
       					hqdata['충북본부'][8] = json.data[i].t09;  
       					hqdata['충북본부'][9] = json.data[i].t10;  
       					hqdata['충북본부'][10] = json.data[i].t11; 
       					hqdata['충북본부'][11] = json.data[i].t12; 
       				}
       				
       			}
           		else if(json.data[i].flow_type == '방출') {
       				if(json.data[i].svar_nm == '수도권본부') {
       					hqdata2['수도권본부'][0] = json.data[i].t01;
       					hqdata2['수도권본부'][1] = json.data[i].t02;
       					hqdata2['수도권본부'][2] = json.data[i].t03;
       					hqdata2['수도권본부'][3] = json.data[i].t04;
       					hqdata2['수도권본부'][4] = json.data[i].t05;
       					hqdata2['수도권본부'][5] = json.data[i].t06;
       					hqdata2['수도권본부'][6] = json.data[i].t07;
       					hqdata2['수도권본부'][7] = json.data[i].t08;
       					hqdata2['수도권본부'][8] = json.data[i].t09;
       					hqdata2['수도권본부'][9] = json.data[i].t10;
       					hqdata2['수도권본부'][10] = json.data[i].t11;
       					hqdata2['수도권본부'][11] = json.data[i].t12;
       				} else if(json.data[i].svar_nm == '강원본부') {
       					hqdata2['강원본부'][0] = json.data[i].t01;  
       					hqdata2['강원본부'][1] = json.data[i].t02;  
       					hqdata2['강원본부'][2] = json.data[i].t03;  
       					hqdata2['강원본부'][3] = json.data[i].t04;  
       					hqdata2['강원본부'][4] = json.data[i].t05;  
       					hqdata2['강원본부'][5] = json.data[i].t06;  
       					hqdata2['강원본부'][6] = json.data[i].t07;  
       					hqdata2['강원본부'][7] = json.data[i].t08;  
       					hqdata2['강원본부'][8] = json.data[i].t09;  
       					hqdata2['강원본부'][9] = json.data[i].t10;  
       					hqdata2['강원본부'][10] = json.data[i].t11; 
       					hqdata2['강원본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '대전충남본부') {
       					hqdata2['대전충남본부'][0] = json.data[i].t01; 
       					hqdata2['대전충남본부'][1] = json.data[i].t02;  
       					hqdata2['대전충남본부'][2] = json.data[i].t03;  
       					hqdata2['대전충남본부'][3] = json.data[i].t04;  
       					hqdata2['대전충남본부'][4] = json.data[i].t05;  
       					hqdata2['대전충남본부'][5] = json.data[i].t06;  
       					hqdata2['대전충남본부'][6] = json.data[i].t07;  
       					hqdata2['대전충남본부'][7] = json.data[i].t08;  
       					hqdata2['대전충남본부'][8] = json.data[i].t09;  
       					hqdata2['대전충남본부'][9] = json.data[i].t10;  
       					hqdata2['대전충남본부'][10] = json.data[i].t11; 
       					hqdata2['대전충남본부'][11] = json.data[i].t12; 
       				}  else if(json.data[i].svar_nm == '전북본부') {
       					hqdata2['전북본부'][0] = json.data[i].t01; 
       					hqdata2['전북본부'][1] = json.data[i].t02;  
       					hqdata2['전북본부'][2] = json.data[i].t03;  
       					hqdata2['전북본부'][3] = json.data[i].t04;  
       					hqdata2['전북본부'][4] = json.data[i].t05;  
       					hqdata2['전북본부'][5] = json.data[i].t06;  
       					hqdata2['전북본부'][6] = json.data[i].t07;  
       					hqdata2['전북본부'][7] = json.data[i].t08;  
       					hqdata2['전북본부'][8] = json.data[i].t09;  
       					hqdata2['전북본부'][9] = json.data[i].t10;  
       					hqdata2['전북본부'][10] = json.data[i].t11; 
       					hqdata2['전북본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '광주전남본부') {
       					hqdata2['광주전남본부'][0] = json.data[i].t01; 
       					hqdata2['광주전남본부'][1] = json.data[i].t02;  
       					hqdata2['광주전남본부'][2] = json.data[i].t03;  
       					hqdata2['광주전남본부'][3] = json.data[i].t04;  
       					hqdata2['광주전남본부'][4] = json.data[i].t05;  
       					hqdata2['광주전남본부'][5] = json.data[i].t06;  
       					hqdata2['광주전남본부'][6] = json.data[i].t07;  
       					hqdata2['광주전남본부'][7] = json.data[i].t08;  
       					hqdata2['광주전남본부'][8] = json.data[i].t09;  
       					hqdata2['광주전남본부'][9] = json.data[i].t10;  
       					hqdata2['광주전남본부'][10] = json.data[i].t11; 
       					hqdata2['광주전남본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '대구경북본부') {
       					hqdata2['대구경북본부'][0] = json.data[i].t01; 
       					hqdata2['대구경북본부'][1] = json.data[i].t02;  
       					hqdata2['대구경북본부'][2] = json.data[i].t03;  
       					hqdata2['대구경북본부'][3] = json.data[i].t04;  
       					hqdata2['대구경북본부'][4] = json.data[i].t05;  
       					hqdata2['대구경북본부'][5] = json.data[i].t06;  
       					hqdata2['대구경북본부'][6] = json.data[i].t07;  
       					hqdata2['대구경북본부'][7] = json.data[i].t08;  
       					hqdata2['대구경북본부'][8] = json.data[i].t09;  
       					hqdata2['대구경북본부'][9] = json.data[i].t10;  
       					hqdata2['대구경북본부'][10] = json.data[i].t11; 
       					hqdata2['대구경북본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '부산경남본부') {
       					hqdata2['부산경남본부'][0] = json.data[i].t01; 
       					hqdata2['부산경남본부'][1] = json.data[i].t02;  
       					hqdata2['부산경남본부'][2] = json.data[i].t03;  
       					hqdata2['부산경남본부'][3] = json.data[i].t04;  
       					hqdata2['부산경남본부'][4] = json.data[i].t05;  
       					hqdata2['부산경남본부'][5] = json.data[i].t06;  
       					hqdata2['부산경남본부'][6] = json.data[i].t07;  
       					hqdata2['부산경남본부'][7] = json.data[i].t08;  
       					hqdata2['부산경남본부'][8] = json.data[i].t09;  
       					hqdata2['부산경남본부'][9] = json.data[i].t10;  
       					hqdata2['부산경남본부'][10] = json.data[i].t11; 
       					hqdata2['부산경남본부'][11] = json.data[i].t12; 
       				} else if(json.data[i].svar_nm == '충북본부') {
       					hqdata2['충북본부'][0] = json.data[i].t01; 
       					hqdata2['충북본부'][1] = json.data[i].t02;  
       					hqdata2['충북본부'][2] = json.data[i].t03;  
       					hqdata2['충북본부'][3] = json.data[i].t04;  
       					hqdata2['충북본부'][4] = json.data[i].t05;  
       					hqdata2['충북본부'][5] = json.data[i].t06;  
       					hqdata2['충북본부'][6] = json.data[i].t07;  
       					hqdata2['충북본부'][7] = json.data[i].t08;  
       					hqdata2['충북본부'][8] = json.data[i].t09;  
       					hqdata2['충북본부'][9] = json.data[i].t10;  
       					hqdata2['충북본부'][10] = json.data[i].t11; 
       					hqdata2['충북본부'][11] = json.data[i].t12; 
       				
       				}  
           		}
           	 }
           }
   	
   },error : function(){
           console.log(arguments);
        }, complete : function() {
        	myChart.setOption(option);
	         	
        }
    });		
}

var myChart = echarts.init(document.getElementById('main'),'dark');

var today = new Date();
var test = today.getMonth();

var xAxisMonth = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
var hqList = ['수도권본부','강원본부','대전충남본부','전북본부','광주전남본부','대구경북본부','부산경남본부', '충북본부'];

var hqdata = {
        '수도권본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '강원본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '대전충남본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '전북본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '광주전남본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '대구경북본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '부산경남본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '충북본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    };

var hqdata2 = {
		'수도권본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '강원본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '대전충남본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '전북본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '광주전남본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '대구경북본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '부산경남본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        '충북본부':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
};
		option = {
		    baseOption : {
		        timeline: {
		    					show: false,
		    					axisType: 'category',
		    					autoPlay: true,
		    					currentIndex: 0,
		    					bottom: 5,
		    					width: '70%',
		    					playInterval: 3000,
		    					label: {
		    						normal: {
		    							show: true,
		    							interval: 'auto'
		    						}
		    					},
		    					data: hqList
		    			    },
		        legend: {
		        	right: 10,
		            data:['유입', '방출']
		        },
		        xAxis: {
		            type: 'category',
		            // boundaryGap: [0, 0],
		            
		            splitLine: {
		                show: false
		            },
		            data : xAxisMonth
		        },
		        yAxis: {
		            type: 'value',
		            name: '단위: 톤',
		            axisTick: {
		                inside: false
		            },
		            splitLine: {
		                show: false
		            },
		            axisLabel: {
		                inside: false,
		                formatter: '{value}\n'
		            },
		            z: 10
		        },
		        grid: {
		            right: 15,
		            bottom: 30,
		            left: 70,
		        },
		        series: []
		    },
		    options:[]
		};

		for(var i=0;i<hqList.length;i++) {
		    option.options.push({
		    	title: {
		    		show: true,
		    		left: 10,
		    		text: hqList[i]
		    	},
				series: [{
		            name:'유입',
		            type:'line',
		            smooth: true,
		            symbol : 'circle',
		            symbolSize: 5,
		            itemStyle: {
		                normal: {
		                    color: '#61a0a8'
		                }
		            },
		            areaStyle: {
		                normal: {
		                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		                        offset: 0,
		                        color: '#61a0a8'
		                    }, {
		                        offset: 1,
		                        color: '#ffe'
		                    }])
		                }
		            },
		            data: hqdata[hqList[i]]
		        },
		        {
		            name:'방출',
		            type:'line',
		            smooth:true,
		            symbol : 'circle',
		            symbolSize: 5,
		            itemStyle: {
		                normal: {
		                    color: '#d68262'
		                }
		            },
		            areaStyle: {
		                normal: {
		                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		                        offset: 0,
		                        color: '#d68262'
		                    }, {
		                        offset: 1,
		                        color: '#ffe'
		                    }])
		                }
		            },
		            data: hqdata2[hqList[i]]
		        }]
			});
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
</script>
</body>
</html>