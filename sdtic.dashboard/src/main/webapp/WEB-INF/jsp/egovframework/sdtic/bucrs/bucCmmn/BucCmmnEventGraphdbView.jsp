<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 유지관리 현황</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:100%; height:600px;"></div>
	<script type="text/javascript">
	
	var myChart = echarts.init(document.getElementById('main'), 'dark'); 
					jQuery(document).ready(function($){
		
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	       getBucEventGraphdbAjax();
    	       setDivHeight('main');

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    })
    var interval = new Array();
    function getBucEventGraphdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnEventGraphdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {     
            	var sudoCnt = 0;
            	var kangwonCnt = 0;
            	var chungnamCnt = 0;
            	var jeonbukCnt = 0;
            	var jeonnamCnt = 0;
            	var kyungbukCnt = 0;
            	var kyungnamCnt = 0;
            	var chungbukCnt = 0;
	                if(json.data.length > 0 ){
	                	for(var i = 0; i < json.data.length; i++) {
	                		

	                		if(json.data[i].kor_dptnm == '수도권본부') {
	                			CompleteData['수도권'][sudoCnt++] = json.data[i].use_end;
	        				} else if(json.data[i].kor_dptnm == '강원본부') {
	        					CompleteData['강원'][kangwonCnt++] = json.data[i].use_end;
	        				} else if(json.data[i].kor_dptnm == '대전충남본부') {
	        					CompleteData['대전충남'][chungnamCnt++] = json.data[i].use_end;
	        				}  else if(json.data[i].kor_dptnm == '충북본부') {
	        					CompleteData['충북'][chungbukCnt++] = json.data[i].use_end;
	        				} else if(json.data[i].kor_dptnm == '대구경북본부') {
	        					CompleteData['대구경북'][kyungbukCnt++] = json.data[i].use_end;
	        				} else if(json.data[i].kor_dptnm == '전북본부') {
	        					CompleteData['전북'][jeonbukCnt++] = json.data[i].use_end;
	        				} else if(json.data[i].kor_dptnm == '광주전남본부') {
	        					CompleteData['광주전남'][jeonnamCnt++] = json.data[i].use_end;
	        				} else if(json.data[i].kor_dptnm == '부산경남본부') {
	        					CompleteData['부산경남'][chungbukCnt++] = json.data[i].use_end;
	        				}  
	                	}
	                }
	                else{
	                console.log(arguments);
	                }
	
	            },error : function(){
	                console.log(arguments);
	            }, complete : function() {
	            	myChart.setOption(option);
	            }
	        });
		
	    }
	var timeLineData = ['수도권', '강원', '대전충남', '충북', '대구경북', '전북', '광주전남', '부산경남'];
	


	var CompleteData = {
			'수도권':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	        '강원':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	        '대전충남':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	        '충북':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	        '대구경북':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	        '전북':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	        '광주전남':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	        '부산경남':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	       
	       
	};
	

	var option = {
		
		baseOption:{
			
		timeline: {
			show: true,
			axisType: 'category',
			autoPlay: true,
			left: 0,
			currentIndex: 0,
			//top:500,
			width: 1000,
			playInterval: 3000,
			label: {
				normal: {
					show: true,
					interval: 'auto'
				}
			},
			data: timeLineData
		},
		color: ['#3398DB'],
	    legend: {
	    	top:10,
	    	right: 25,
	        data:['점용만료']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: 50,
	        containLabel: true
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            data : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	        }
	    ],
	    yAxis : [
	        {
	        	 axisTick: {
	                 alignWithLabel: true
	             }
	        }
	    ],
	    series : []
		},
		options:[]
	};
	for(var n = 0; n < timeLineData.length; n++)
	{
		option.options.push({

			series: [{
	            name:'점용만료',
	            type:'bar',
	            data:CompleteData[timeLineData[n]],
	            barWidth: 20,
	            label: {
	                normal: {
	                    show: true,
	                    position: 'top',
	                }
	            },
	       		 itemStyle: {
	                    normal: {
	                        barBorderRadius: 100,
	                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                            offset: 0,
	                            color: 'rgba(135, 58, 165, 1)'
	                        }, {
	                            offset: 1,
	                            color: 'rgba(135, 58, 165, 0.1)'
	                        }]),
	                        shadowColor: 'rgba(0, 0, 0, 0.1)',
	                        shadowBlur: 10
	                    }
	                },
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
        option.baseOption.timeline.width = ($(window).width()) + "px";


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
