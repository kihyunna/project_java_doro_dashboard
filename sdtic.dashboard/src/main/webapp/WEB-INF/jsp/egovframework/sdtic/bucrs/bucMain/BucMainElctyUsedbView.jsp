<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 메인관제 전기사용량</title>
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
	        getBucMainElctyUsedbAjax();
	        setDivHeight('main');

	//-----------------------------------AJAX 호출 영역 ---------------------------------------
})

var today = new Date();
var test = today.getMonth();
var year = today.getFullYear();

function getBucMainElctyUsedbAjax(){
    $.ajax({
        url : "${pageContext.request.contextPath}/buc/bucMainElctyUsedbAjax.do",
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
        	if(json.data.length > 0) {
        		for(var i=0;i<json.data.length;i++){
        			if(parseInt(json.data[i].sept_year) == year) {
        				if(json.data[i].intg_dptnm == '수도권본부') {
        					hqdata['수도권'][sudoCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
        				} else if(json.data[i].intg_dptnm == '강원본부') {
        					hqdata['강원'][kangwonCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
        				} else if(json.data[i].intg_dptnm == '대전충남본부') {
        					hqdata['충남'][chungnamCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
        				}  else if(json.data[i].intg_dptnm == '전북본부') {
        					hqdata['전북'][jeonbukCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
        				} else if(json.data[i].intg_dptnm == '광주전남본부') {
        					hqdata['전남'][jeonnamCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
        				} else if(json.data[i].intg_dptnm == '대구경북본부') {
        					hqdata['경북'][kyungbukCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
        				} else if(json.data[i].intg_dptnm == '부산경남본부') {
        					hqdata['경남'][kyungnamCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
        				} else if(json.data[i].intg_dptnm == '충북본부') {
        					hqdata['충북'][chungbukCnt++] = Math.round(parseInt(json.data[i].used_amount) / 1000);
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

var xAxisMonth = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
var hqList = ['수도권','강원','충남','전북','전남','경북','경남', '충북'];

var hqdata = {
            '수도권':[, , , , , , , , , , , ],
            '강원':[, , , , , , , , , , , ],
            '충남':[, , , , , , , , , , , ],
            '전북':[, , , , , , , , , , , ],
            '전남':[, , , , , , , , , , , ],
            '경북':[, , , , , , , , , , , ],
            '경남':[, , , , , , , , , , , ],
            '충북':[, , , , , , , , , , , ],
        };
        
		for(var i = test+1 ; i < 12 ; i++){
			hqdata['수도권'][i] = null;
			hqdata['강원'][i] = null;
			hqdata['충남'][i] = null;
			hqdata['전북'][i] = null;
			hqdata['전남'][i] = null;
			hqdata['경북'][i] = null;
			hqdata['경남'][i] = null;
			hqdata['충북'][i] = null;
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
            option.baseOption.legend.itemGap = 5;
            option.baseOption.timeline.data.push(hqList[n]);
            switch (n) {
                case 0:
                    
                    option.options.push({
                        series : [{
                            name:hqList[0],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[0]]                          
                        }]
                    });
                    break;
                case 1:
                    option.options.push({
                        series : [{
                            name:hqList[0],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[0]]                          
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[1]]
                        }]
                    });
                    break;
               case 2:
                    option.options.push({
                        series : [{
                            name:hqList[0],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[2]]
                        }]
                    });
                    break;
                    case 3:
                    option.options.push({
                        series : [{
                            name:hqList[0],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[3]]
                        }]
                    });
                    break;
                case 4:
                option.options.push({
                        series : [{
                            name:hqList[0],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[3]]
                        },
                        {
                            name:hqList[4],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[4]]
                        }]
                    });
                    break;
                case 5:
                option.options.push({
                        series : [{
                            name:hqList[0],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[3]]
                        },
                        {
                            name:hqList[4],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[4]]
                        },
                        {
                            name:hqList[5],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[5]]
                        }]
                    });
                    break;
                case 6:
                option.options.push({
                        series : [{
                            name:hqList[0],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[0]]
                        },
                        {
                            name:hqList[1],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[1]]
                        },
                        {
                            name:hqList[2],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[2]]
                        },
                        {
                            name:hqList[3],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[3]]
                        },
                        {
                            name:hqList[4],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[4]]
                        },
                        {
                            name:hqList[5],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[5]]
                        },
                        {
                            name:hqList[6],
                            type:'line',
                            symbolSize:10,
                            data:hqdata[hqList[6]]
                        }]
                    });
                    break;
                case 7:
                    option.options.push({
                            series : [{
                                name:hqList[0],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[0]]
                            },
                            {
                                name:hqList[1],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[1]]
                            },
                            {
                                name:hqList[2],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[2]]
                            },
                            {
                                name:hqList[3],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[3]]
                            },
                            {
                                name:hqList[4],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[4]]
                            },
                            {
                                name:hqList[5],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[5]]
                            },
                            {
                                name:hqList[6],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[6]]
                            },
                            {
                                name:hqList[7],
                                type:'line',
                                symbolSize:10,
                                data:hqdata[hqList[7]]
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
        },10000*8)

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