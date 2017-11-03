<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 메인관제 시설물 데이터 이관율 34종</title>
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

	        //getBucCmmnSmssndngAjax();
	        setDivHeight('main');

	//-----------------------------------AJAX 호출 영역 ---------------------------------------
	})
var myChart = echarts.init(document.getElementById('main'),'dark');

var today = new Date();
var test = today.getMonth();

var xAxisMonth = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
var hqList = ['수도권','강원','충청','전북','전남','경북','경남'];

var hqdata = {
            '수도권':[150, 120, 140, 80, 75, 85, 155, 150, 142, 135, 165, 150],
            '강원':[100, 150, 142, 135, 165, 150, 120, 140, 80, 75, 85, 155],
            '충청':[120, 130, 100, 89, 110, 140, 160, 180, 150, 130, 75, 60],
            '전북':[75, 69, 145, 123, 124, 162, 178, 125, 46, 153, 192, 120],
            '전남':[72, 85, 132, 120, 135, 141, 125, 130, 45, 86, 96, 100],
            '경북':[36, 153, 145, 123, 132, 145, 126, 134, 178, 125, 125, 143],
            '경남':[169, 123, 156, 145, 149, 158, 163, 125, 75, 120, 178, 69],
        };
        
		for(var i = test+1 ; i < 12 ; i++){
			hqdata['수도권'][i] = null;
			hqdata['강원'][i] = null;
			hqdata['충청'][i] = null;
			hqdata['전북'][i] = null;
			hqdata['전남'][i] = null;
			hqdata['경북'][i] = null;
			hqdata['경남'][i] = null;
		}

        option = {
                    baseOption: {
                        title: {},
                        grid:{
                        	left:60,
                        	right:20,
                        	top:10,
                        	bottom:50
                        },
                        
                        
                                calculable : true,
                                xAxis : [
                                    {
                                        type : 'category',
                                        boundaryGap : false,
                                        data : xAxisMonth,
                                        
                                    }
                                ],
                                yAxis : [
                                    {
                                        type : 'value',
                                        axisLabel : {
                                            formatter: '{value} kw'
                                        }
                                    }
                                ],
                        timeline: {
                                    show: false,
                                    axisType: 'category',
                                    autoPlay: true,
                                    left: 0,
                                    currentIndex: 0,
                                    top: 20,
                                    width: 800,
                                    playInterval: 10000,
                                    
                                    data: []
                                
                        },
                        legend: {
                                    data: [],
                                    bottom:5
                                },
                        series: []
                    },

                options :[]
        };
        for (var n = 0; n < hqList.length; n++) {
            
            option.baseOption.legend.data = hqList;
            option.baseOption.timeline.data.push(hqList[n]);
            switch (n) {
                case 0:
                    
                    option.options.push({
                        title :{
                            
                        },
                        tooltip : {
                            trigger: 'axis',
                            formatter: "{a0} {b0} : {c0} kw"
                        },
                        series : [{
                            name:hqList[0],
                            type:'line',
                            data:hqdata[hqList[0]]                          
                        }]
                    });
                    break;
                case 1:
                    option.options.push({
                        
                        tooltip : {
                            trigger: 'axis',
                            formatter: "{a0} {b0} : {c0} kw<br>{a1} {b1} : {c1} kw"
                        },
                        series : [{
                            name:hqList[0],
                            type:'line',
                            data:hqdata[hqList[0]]                          
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            data:hqdata[hqList[1]]
                        }]
                    });
                    break;
               case 2:
                    option.options.push({
                        
                        tooltip : {
                            trigger: 'axis',
                            formatter: "{a0} {b0} : {c0} kw<br>{a1} {b1} : {c1} kw<br>{a2} {b2} : {c2} kw"
                        },
                        series : [{
                            name:hqList[0],
                            type:'line',
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            data:hqdata[hqList[2]]
                        }]
                    });
                    break;
                    case 3:
                    option.options.push({
                        
                        tooltip : {
                            trigger: 'axis',
                            formatter: "{a0} {b0} : {c0} kw<br>{a1} {b1} : {c1} kw<br>{a2} {b2} : {c2} kw<br>{a3} {b3} : {c3} kw"
                        },
                        series : [{
                            name:hqList[0],
                            type:'line',
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            data:hqdata[hqList[3]]
                        }]
                    });
                    break;
                case 4:
                option.options.push({
                        
                        tooltip : {
                            trigger: 'axis',
                            formatter: "{a0} {b0} : {c0} kw<br>{a1} {b1} : {c1} kw<br>{a2} {b2} : {c2} kw<br>{a3} {b3} : {c3} kw<br>{a4} {b4} : {c4} kw"
                        },
                        series : [{
                            name:hqList[0],
                            type:'line',
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            data:hqdata[hqList[3]]
                        },
                        {
                            name:hqList[4],
                            type:'line',
                            data:hqdata[hqList[4]]
                        }]
                    });
                    break;
                case 5:
                option.options.push({
                        
                        tooltip : {
                            trigger: 'axis',
                            formatter: "{a0} {b0} : {c0} kw<br>{a1} {b1} : {c1} kw<br>{a2} {b2} : {c2} kw<br>{a3} {b3} : {c3} kw<br>{a4} {b4} : {c4} kw<br>{a5} {b5} : {c5} kw"
                        },
                        series : [{
                            name:hqList[0],
                            type:'line',
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            data:hqdata[hqList[3]]
                        },
                        {
                            name:hqList[4],
                            type:'line',
                            data:hqdata[hqList[4]]
                        },
                        {
                            name:hqList[5],
                            type:'line',
                            data:hqdata[hqList[5]]
                        }]
                    });
                    break;
                case 6:
                option.options.push({
                        
                        tooltip : {
                            trigger: 'axis',
                            formatter: "{a0} {b0} : {c0} kw<br>{a1} {b1} : {c1} kw<br>{a2} {b2} : {c2} kw<br>{a3} {b3} : {c3} kw<br>{a4} {b4} : {c4} kw<br>{a5} {b5} : {c5} kw<br>{a6} {b6} : {c6} kw"
                        },
                        series : [{
                            name:hqList[0],
                            type:'line',
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            data:hqdata[hqList[3]]
                        },
                        {
                            name:hqList[4],
                            type:'line',
                            data:hqdata[hqList[4]]
                        },
                        {
                            name:hqList[5],
                            type:'line',
                            data:hqdata[hqList[5]]
                        },
                        {
                            name:hqList[6],
                            type:'line',
                            data:hqdata[hqList[6]]
                        }]
                    });
                    break;
                default:
                    // code
            }
            
        }
        
        myChart.setOption(option);

        setInterval(function(){
            location.reload();
        },10000*7)

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