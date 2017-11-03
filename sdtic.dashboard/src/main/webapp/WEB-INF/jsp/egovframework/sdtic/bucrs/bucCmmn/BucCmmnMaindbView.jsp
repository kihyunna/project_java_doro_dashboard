<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>비즈니스 공통 매인 화면</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script src="${contextPath}/js/common/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<style>

    .slide_sliding, .slidectrl_sliding {
        list-style:none;
        padding:0;
        margin:0;
    }

    .slidebox_sliding {
        width:900px;
        overflow:hidden;
        position:relative;
        height:520px;
    }

    .slide_sliding {
        width:3600px;
        height:520px;
        position:absolute;
        left:0;
    }
    .slide_sliding ul{
            font-size:0;
    }
    .slide_sliding li {
        display:inline-block;
        width:900px;
        height:520px;
        text-align:center;
        color:white;
        font-size:0;
        line-height:900px;
        margin-right:-2px;
    }
</style>

<script>
    var idx_sliding = 0;
    var slidemax_sliding = 3;
    var pos_sliding = 900;
    var test = 0;
 
    function sliding_sliding(add_sliding) {
        idx_sliding = add_sliding;
        if(idx_sliding < 0) idx_sliding = slidemax_sliding;
        else if(idx_sliding > slidemax_sliding) idx_sliding = 0;
        $('.slide_sliding').stop().animate({'left' : -(idx_sliding*pos_sliding)+"px"}, "fast");
    }

    function timerStart(){

        var today = new Date();

        var second = today.getSeconds();
        var minute = today.getMinutes();
        
        switch(timerFlag){
        
        case 1:
        	if(second<15){
                sliding_sliding(0)
            } else if(second>=15 && second<30){
                sliding_sliding(1)
            } else if(second>=30 && second<45){
                sliding_sliding(2)
            } else if(second<60){
                sliding_sliding(3)
            } 
            
              
            break;
        case 2:
            
            minute%=2

            if(minute != 0 && second < 30){
                sliding_sliding(0)
            } else if(minute != 0 && second >= 30){
                sliding_sliding(1)
            } else if(minute == 0 && second < 30){
                sliding_sliding(2)
            } else if(minute == 0 && second >= 30){
                sliding_sliding(3)
            } 
            
            break;
        case 3:
            
            minute%=4
            
            if(minute == 1){
                sliding_sliding(0)
            } else if(minute == 2){
                sliding_sliding(1)
            } else if(minute == 3){
                sliding_sliding(2)
            } else if(minute == 0){
                sliding_sliding(3)
            } 
            
            
            break;
        default:
            
        	if(second<15){
                sliding_sliding(0)
            } else if(second>=15 && second<30){
                sliding_sliding(1)
            } else if(second>=30 && second<45){
                sliding_sliding(2)
            } else if(second<60){
                sliding_sliding(3)
            } 
            break;
        }
        
        
    }


    autoslide_sliding = setInterval(function() { timerStart() }, 100);

    function after_sliding() {
        setTimeout(function() {
            clearInterval(autoslide_sliding);
            autoslide_sliding = setInterval(function() { sliding_sliding(1) }, 3000);
        }, 60000);
    }

</script>
</head>

<body>
<div class="slidebox_sliding">
    <ul class="slide_sliding"
    ><li><div id="main" style="width:900px;height:520px; left:28px;"></div></li
    ><li><div id="main2" style="width:900px;height:520px; left:28px;"></div></li
    ><li><div id="main3" style="width:900px;height:520px; left:28px;"></div></li
    ><li><div id="main4" style="width:900px;height:520px; left:28px;"></div></li
    ></ul>
</div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
      var myChart = echarts.init(document.getElementById('main'), 'dark');
        // specify chart configuration item and data
        
      	jQuery(document).ready(function($){
		
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	       getBucCmmnMaindbAjax();    	        

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    })
    function isNumeric(num, opt){
        num = String(num).replace(/^\s+|\s+$/g, "");
        if(typeof opt == "undefined" || opt == "1"){
            var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
        }else if(opt == "2"){
        	var regex = /^(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
	    }else if(opt == "3"){
	        var regex = /^[0-9]+(\.[0-9]+)?$/g;
	    }else{
	        var regex = /^[0-9]$/g;
	    }
	
	    if( regex.test(num) ){
	        num = num.replace(/,/g, "");
	        return isNaN(num) ? false : true;
	    }else{ return false;  }
	}
    function getNumeric(str, opt){
        if(isNumeric(str, opt)){
      	    str = String(str).replace(/^\s+|\s+$/g, "").replace(/,/g, "");
      	    return Number(str);
      	}else{
      		return str;

      	}

    }

    function formatNumber(str, opt){

      var rstr = "", sign = "";

      if(isNumeric(str, opt)){

    	    str = String(getNumeric(str, opt));

    	    if(str.substr(0, 1) == "-" ){

    	    	    sign = "-";

    	    	    str = str.substr(1);

    	    }

    	    var arr = str.split(".");

    	    for(var ii = 0 ; ii < arr[0].length ; ii++){

    	    	  if( ii % 3 == 0 && ii > 0){

    	    		    rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + "," + rstr;

    	    	 }else{

    	         rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + rstr;

    	         }

    	    }

		    rstr = sign + rstr;
		
		    return arr.length > 1 ? rstr + "." + arr[1] : rstr;

		}else{

	return str;

  }

}

    var option;
    function getBucCmmnMaindbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnMaindb.do",
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
	            	var sudoCnt2 = 0;
	            	var kangwonCnt2 = 0;
	            	var chungnamCnt2 = 0;
	            	var jeonbukCnt2 = 0;
	            	var jeonnamCnt2 = 0;
	            	var kyungbukCnt2 = 0;
	            	var kyungnamCnt2 = 0;
	            	var chungbukCnt2 = 0;

	                
	                if(json.data.length > 0 ){
	                	for(var i = 0; i < json.data.length; i++) {
	                		//alert(Object.keys(builderJson.charts).length);
	                		for(var j=0; j < Object.keys(builderJson.charts).length; j++) {
	                			if(Object.keys(builderJson.charts)[j] == json.data[i].dsgng_book_clsfc_nm) {
	                				builderJson.charts[Object.keys(builderJson.charts)[j]] = parseInt(json.data[i].cnt);
	                			}
	                		}
	                		for(var k=0; k < Object.keys(builderJson.components).length; k++) {
	                			if(Object.keys(builderJson.components)[k] == json.data[i].dsgng_book_clsfc_nm) {
	                				builderJson.components[Object.keys(builderJson.components)[k]] = parseInt(json.data[i].cnt);
	                			}
	                		}
	                		//builderJson['charts'][0] = json.data[i].cnt;
	                	}
	                }
	                else{
	                console.log(arguments);
	                }
	                
	                if(json.data2.length > 0 ){
                	 	
	                	var cnt = -1;
	                    for(var i=0; i<json.data2.length; i++)
	                    {
	                    	if(i%5 == 0){
	                    		cnt++;
	                    		timeLineGubun[timeLineData2[cnt]] = new Array();
	                    		plan[timeLineData2[cnt]] = new Array();
	                    		complete[timeLineData2[cnt]] = new Array();
	                    	}
	                    	timeLineGubun[timeLineData2[cnt]][i-(cnt*5)] = json.data2[i].biz_mgmt_nm;
	                    	plan[timeLineData2[cnt]][i-(cnt*5)] = json.data2[i].whol_plan_rate;
	                    	complete[timeLineData2[cnt]][i-(cnt*5)] = json.data2[i].whol_efcn_rate;
	                    }
	                    
	                    for (var i = 0; i < timeLineData2.length; i++) {
	                        option2.baseOption.timeline.data.push(timeLineData2[i]);
	                        option2.options.push({
	                            title: {
	                                text: '건설사업단 공정율'
	                            },
	                            yAxis: {
	                                data: timeLineGubun[timeLineData2[i]],
	                                inverse: true,
	                                axisLine: {show: false},
	                                axisTick: {show: false},
	                                axisLabel: {
	                                    margin: 30,
	                                    textStyle: {
	                                        fontSize: 12
	                                    }
	                                }
	                            },
	                            series: [{
	                                    name: '실적',
	                                    type: 'pictorialBar',
	                                    label: labelSetting,
	                                    symbolRepeat: true,
	                                    symbolSize: ['60%', '60%'],
	                                    barCategoryGap: '40%',
	                                    symbol: 'image://'+arrow,

	                                    data: complete[timeLineData2[i]]
	                                }, {
	                                    name: '계획',
	                                    type: 'pictorialBar',
	                                    barGap: '10%',
	                                    label: labelSetting,
	                                    symbolRepeat: true,
	                                    symbol: 'image://'+human,
	                                    symbolSize: ['60%', '60%'],
	                                    data: plan[timeLineData2[i]]
	                            }]
	                        });
	                    }
	                    myChart2.setOption(option2);
	                    
	                }	               
	                else{
	                console.log(arguments);
	                }
					if(json.data3.length > 0 ){
                	 	
	                    for(var i=0; i<json.data3.length; i++)
	                    {
	                    	
	                    		CompleteData['인력'][i] = parseInt(json.data3[i].worker_cnt);
	                    		CompleteData['거리'][i] = parseInt(json.data3[i].c_km);
	                    		CompleteData['장비'][i] = parseInt(json.data3[i].eqp_cnt);
                           
                            	TotalData['인력'][i] = parseInt(json.data3[i].plan_worker_cnt);
                            	TotalData['거리'][i] = parseInt(json.data3[i].plan_km);
                            	TotalData['장비'][i] = parseInt(json.data3[i].plan_eqp_cnt);
                            	
                            
	                    }
	                   
	                    myChart3.setOption(option3);
	                    
	                }	               
	                else{
	                console.log(arguments);
	                }
	                
	                if(json.data4.length > 0) {
	                	for(var i = 0; i < json.data4.length; i++) {
	                		if(parseInt(json.data4[i].sept_year) == year - 1) {
	                			if(json.data4[i].intg_dptnm == '수도권본부') {
	            					hqdata1['수도권본부'][sudoCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '강원본부') {
	            					hqdata1['강원본부'][kangwonCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '대전충남본부') {
	            					hqdata1['대전충남본부'][chungnamCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				}  else if(json.data4[i].intg_dptnm == '전북본부') {
	            					hqdata1['전북본부'][jeonbukCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '광주전남본부') {
	            					hqdata1['광주전남본부'][jeonnamCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '대구경북본부') {
	            					hqdata1['대구경북본부'][kyungbukCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '부산경남본부') {
	            					hqdata1['부산경남본부'][kyungnamCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '충북본부') {
	            					hqdata1['충북본부'][chungbukCnt++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				}  
	                		} else if(parseInt(json.data4[i].sept_year) == year) {
	                			if(json.data4[i].intg_dptnm == '수도권본부') {
	            					hqdata2['수도권본부'][sudoCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '강원본부') {
	            					hqdata2['강원본부'][kangwonCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '대전충남본부') {
	            					hqdata2['대전충남본부'][chungnamCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				}  else if(json.data4[i].intg_dptnm == '전북본부') {
	            					hqdata2['전북본부'][jeonbukCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '광주전남본부') {
	            					hqdata2['광주전남본부'][jeonnamCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '대구경북본부') {
	            					hqdata2['대구경북본부'][kyungbukCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '부산경남본부') {
	            					hqdata2['부산경남본부'][kyungnamCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} else if(json.data4[i].intg_dptnm == '충북본부') {
	            					hqdata2['충북본부'][chungbukCnt2++] = Math.round(parseInt(json.data4[i].used_cost) / 1000000);
	            				} 
	                		}
	                	}
	                	myChart4.setOption(option4);
	                }	                
	
	            },error : function(){
	                console.log(arguments);
	            }, complete : function() {
	            	option = {
	        	            tooltip: {

	        	            },

	        	            title: [{
	        	                text: '주간설계반출입현황',
	        	                x: '25%',
	        	                textAlign: 'center'
	        	            }, {
	        	                text: '주간반출량',

	        	                x: '80%',
	        	                textAlign: 'center'
	        	            }, {
	        	                text: '주간반입량',

	        	                x: '80%',
	        	                y: '50%',
	        	                textAlign: 'center'
	        	            }],
	        	            grid: [{
	        	                show: false,
	        	                top: 50,
	        	                width: '65%',
	        	                bottom: '45%',
	        	                left: 10,
	        	                containLabel: true,
	        	               
	        	            }, {
	        	                show: false,
	        	                top: '55%',
	        	                width: '65%',
	        	                bottom: 20,
	        	                left: 10,
	        	                containLabel: true
	        	            }],
	        	            xAxis: [{
	        	                type: 'value',
	        	                splitLine: {
	        	                    show: false
	        	                }
	        	            }, {
	        	                type: 'value',
	        	                gridIndex: 1,
	        	                splitLine: {
	        	                    show: false
	        	                }
	        	            }],
	        	            yAxis: [{
	        	                type: 'category',
	        	                data: Object.keys(builderJson.charts),
	        	                axisLabel: {
	        	                    interval: 0,
	        	                    rotate: 30
	        	                },
	        	                splitLine: {
	        	                    show: false
	        	                }
	        	            }, {
	        	                gridIndex: 1,
	        	                type: 'category',
	        	                data: Object.keys(builderJson.components),
	        	                axisLabel: {
	        	                    interval: 0,
	        	                    rotate: 30
	        	                },
	        	                splitLine: {
	        	                    show: false
	        	                }
	        	            }],
	        	            series: [{
	        	                type: 'bar',
	        	                stack: 'chart',
	        	                z: 3,
	        	                label: {
	        	                    normal: {
	        	                        position: 'right',
	        	                        show: true
	        	                    }
	        	                },
	        	                data: Object.keys(builderJson.charts).map(function (key) {
	        	                    return builderJson.charts[key];
	        	                })
	        	            }, /* {
	        	                type: 'bar',
	        	                stack: 'chart',
	        	                silent: true,
	        	                itemStyle: {
	        	                    normal: {
	        	                        color: '#171a1f'
	        	                    }
	        	                },
	        	                data: Object.keys(builderJson.charts).map(function (key) {
	        	                    return builderJson.all - builderJson.charts[key];
	        	                })
	        	            }, */ {
	        	                type: 'bar',
	        	                stack: 'component',
	        	                xAxisIndex: 1,
	        	                yAxisIndex: 1,
	        	                z: 3,
	        	                label: {
	        	                    normal: {
	        	                        position: 'right',
	        	                        show: true
	        	                    }
	        	                },
	        	                data: Object.keys(builderJson.components).map(function (key) {
	        	                    return builderJson.components[key];
	        	                })
	        	            }, /* {
	        	                type: 'bar',
	        	                stack: 'component',
	        	                silent: true,
	        	                xAxisIndex: 1,
	        	                yAxisIndex: 1,
	        	                itemStyle: {
	        	                    normal: {
	        	                        color: '#171a1f'
	        	                    }
	        	                },
	        	                data: Object.keys(builderJson.components).map(function (key) {
	        	                    return builderJson.all - builderJson.components[key];
	        	                })
	        	            }, */
	        	            {
	        	                type: 'pie',
	        	                center: ['80%', '25%'],
	        	                radius: ['25%', '30%'],
	        	                label: {
	        	                    normal: {
	        	                        position: 'center'
	        	                    }
	        	                },
	        	                data: [{
	        	                    value: 0,
	        	                    name: '반입반출파이그래프',
	        	                    itemStyle: {
	        	                        normal: {
	        	                            color: '#c23531'
	        	                        }
	        	                    },
	        	                    label: {
	        	                        normal: {
	        	                            formatter: '{d} %',
	        	                            textStyle: {
	        	                                color: '#c23531',
	        	                                fontSize: 25

	        	                            }
	        	                        }
	        	                    }
	        	                }, {
	        	                    value: 0,
	        	                    name: '반출',
	        	                    tooltip: {
	        	                        show: false
	        	                    },
	        	                    itemStyle: {
	        	                        normal: {
	        	                            color: '#bebbba'
	        	                        }
	        	                    },
	        	                    label: {
	        	                        normal: {
	        	                            textStyle: {
	        	                                color: '#c23531',
	        	                                fontSize: 25
	        	                            },
	        	                            formatter: '\n반출율'
	        	                        }
	        	                    }
	        	                }]
	        	            },
	        	            {
	        	                type: 'pie',
	        	                center: ['80%', '75%'],
	        	                radius: ['25%', '30%'],
	        	                label: {
	        	                    normal: {
	        	                        position: 'center'
	        	                    }
	        	                },
	        	                data: [{
	        	                    value: 0,
	        	                    name: '반입반출파이그래프',
	        	                    itemStyle: {
	        	                        normal: {
	        	                            color: '#2f4554'
	        	                        }
	        	                    },
	        	                    label: {
	        	                        normal: {
	        	                            formatter: '{d} %',
	        	                            textStyle: {
	        	                                color: '#2f4554',
	        	                                fontSize: 25

	        	                            }
	        	                        }
	        	                    }
	        	                }, {
	        	                    value: 0,
	        	                    name: '반입',
	        	                    tooltip: {
	        	                        show: false
	        	                    },
	        	                    itemStyle: {
	        	                        normal: {
	        	                            color: '#bebbba'
	        	                        }
	        	                    },
	        	                    label: {
	        	                        normal: {
	        	                            textStyle: {
	        	                                color: '#2f4554',
	        	                                fontSize: 25
	        	                            },
	        	                            formatter: '\n반입율'
	        	                        }
	        	                    }
	        	                }]
	        	            }]
	        	        }
	            	myChart.setOption(option);
	            }
	        });
		
	    } 
        
      
      var builderJson = {
          "all": 41384,
          "charts": {
            "설계도면": 0,
            "보고서": 0,
            "계산서": 0,
            "예산서": 0,
            "시방서": 0,
            "인허가도서": 0,
            "민원": 0,
            "관계기관협의": 0,
            "기타": 0,
            "사진": 0,
            "기록영상": 0,
            "카다로그": 0
          },
          "components": {
            "설계도면": 0,
            "보고서": 0,
            "계산서": 0,
            "예산서": 0,
            "시방서": 0,
            "인허가도서": 0,
            "민원": 0,
            "관계기관협의": 0,
            "기타": 0,
            "사진": 0,
            "기록영상": 0,
            "카다로그": 0
          },
          "ie": 9743
        };

        var downloadJson = {
            "설계도면": 32,
            "보고서": 21,
            "계산서": 75,
            "예산서": 77,
            "시방서": 73,
            "인허가도서": 24,
            "민원": 18,
            "관계기관협의": 20,
            "기타": 17,
            "사진": 15,
            "기록영상": 20,
            "카다로그": 15
          }

        var themeJson = {
            "설계도면": 27,
            "보고서": 95,
            "계산서": 94,
            "예산서": 94,
            "시방서": 92,
            "인허가도서": 34,
            "민원": 29,
            "관계기관협의": 27,
            "기타": 27,
            "사진": 24,
            "기록영상": 30,
            "카다로그": 19
          }

        option = {
            tooltip: {

            },

            title: [{
                text: '주간설계반출입현황',
                x: '25%',
                textAlign: 'center'
            }, {
                text: '주간반입량',

                x: '80%',
                textAlign: 'center'
            }, {
                text: '주간반출량',

                x: '80%',
                y: '50%',
                textAlign: 'center'
            }],
            grid: [{
                show: false,
                top: 50,
                width: '65%',
                bottom: '45%',
                left: 10,
                containLabel: true,
               
            }, {
                show: false,
                top: '55%',
                width: '65%',
                bottom: 20,
                left: 10,
                containLabel: true
            }],
            xAxis: [{
                type: 'value',
                splitLine: {
                    show: false
                }
            }, {
                type: 'value',
                gridIndex: 1,
                splitLine: {
                    show: false
                }
            }],
            yAxis: [{
                type: 'category',
                data: Object.keys(builderJson.charts),
                axisLabel: {
                    interval: 0,
                    rotate: 30
                },
                splitLine: {
                    show: false
                }
            }, {
                gridIndex: 1,
                type: 'category',
                data: Object.keys(builderJson.components),
                axisLabel: {
                    interval: 0,
                    rotate: 30
                },
                splitLine: {
                    show: false
                }
            }],
            series: [{
                type: 'bar',
                stack: 'chart',
                z: 3,
                label: {
                    normal: {
                        position: 'right',
                        show: true
                    }
                },
                data: Object.keys(builderJson.charts).map(function (key) {
                    return builderJson.charts[key];
                })
            }, /* {
                type: 'bar',
                stack: 'chart',
                silent: true,
                itemStyle: {
                    normal: {
                        color: '#171a1f'
                    }
                },
                data: Object.keys(builderJson.charts).map(function (key) {
                    return builderJson.all - builderJson.charts[key];
                })
            }, */ {
                type: 'bar',
                stack: 'component',
                xAxisIndex: 1,
                yAxisIndex: 1,
                z: 3,
                label: {
                    normal: {
                        position: 'right',
                        show: true
                    }
                },
                data: Object.keys(builderJson.components).map(function (key) {
                    return builderJson.components[key];
                })
            }, /* {
                type: 'bar',
                stack: 'component',
                silent: true,
                xAxisIndex: 1,
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        color: '#171a1f'
                    }
                },
                data: Object.keys(builderJson.components).map(function (key) {
                    return builderJson.all - builderJson.components[key];
                })
            }, */
            {
                type: 'pie',
                center: ['80%', '25%'],
                radius: ['25%', '30%'],
                label: {
                    normal: {
                        position: 'center'
                    }
                },
                data: [{
                    value: 0,
                    name: '반입반출파이그래프',
                    itemStyle: {
                        normal: {
                            color: '#c23531'
                        }
                    },
                    label: {
                        normal: {
                            formatter: '{d} %',
                            textStyle: {
                                color: '#c23531',
                                fontSize: 25

                            }
                        }
                    }
                }, {
                    value: 0,
                    name: '반입',
                    tooltip: {
                        show: false
                    },
                    itemStyle: {
                        normal: {
                            color: '#bebbba'
                        }
                    },
                    label: {
                        normal: {
                            textStyle: {
                                color: '#c23531',
                                fontSize: 25
                            },
                            formatter: '\n반입율'
                        }
                    }
                }]
            },
            {
                type: 'pie',
                center: ['80%', '75%'],
                radius: ['25%', '30%'],
                label: {
                    normal: {
                        position: 'center'
                    }
                },
                data: [{
                    value: 0,
                    name: '반입반출파이그래프',
                    itemStyle: {
                        normal: {
                            color: '#2f4554'
                        }
                    },
                    label: {
                        normal: {
                            formatter: '{d} %',
                            textStyle: {
                                color: '#2f4554',
                                fontSize: 25

                            }
                        }
                    }
                }, {
                    value: 0,
                    name: '반출',
                    tooltip: {
                        show: false
                    },
                    itemStyle: {
                        normal: {
                            color: '#bebbba'
                        }
                    },
                    label: {
                        normal: {
                            textStyle: {
                                color: '#2f4554',
                                fontSize: 25
                            },
                            formatter: '\n반출율'
                        }
                    }
                }]
            }]
        }
        myChart.setOption(option);
        // use configuration item and data specified to show chart

    </script>

    <script type="text/javascript">
  
        var myChart2 = echarts.init(document.getElementById('main2'), 'dark');
        
        var arrow = 'data:image/png;base64,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';
        var human = 'data:image/png;base64,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';
	
        
        var plan = new Array();
        var complete = new Array();
        var group = new Array();
        var timeLineGubun = new Array();
        jQuery(document).ready(function($){
        	//-----------------------------------AJAX 호출 영역 ---------------------------------------
        	
          
            

    		//-----------------------------------AJAX 호출 영역 ---------------------------------------
        
        })
        
    function getbucCmmnMaindbFcltsAjax(){
		
    	 $.ajax({
	            url : "${pageContext.request.contextPath}/buc/bucCmmnMaindb2.do",
	            async : false,
	            dataType : 'json',
	            success :function(json) {
	               

	            },error : function(){
	                console.log(arguments);
	            }
	        });
	      

	    }    

	             

        var timeLineData2 = ['건설사업단 구분1','건설사업단 구분2','건설사업단 구분3'];

        var labelSetting = {
            normal: {
                show: true,
                position: 'outside',
                offset: [10, 0],
                textStyle: {
                    fontSize: 16
                }
            }
        };

        option2 = {
            baseOption: {
                title: {
                    text: '건설사업단 공정율'
                },
                legend: {
                    data: ['실적', '계획'],
                    align: 'right',
                    right: '8%',
                    top:'5%'
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                timeline: {
                    show: false,
                    left: 20,
                    width: 800,
                    axisType: 'category',
                    autoPlay: true,
                    currentIndex: 0,
                    playInterval: 2000,
                    label: {
                        normal: {
                            show: true,
                            interval: 'auto',
                            formatter: '{value}',
                        },
                    },
                    data: [],
                },
                grid: {
                    height: 420,
                    left: 170

                    
                },
                yAxis: {
                    data: ['도로개량','구리포천','대구순환','밀양울산','안양영천'],
                    inverse: true,
                    axisLine: {show: false},
                    axisTick: {show: false},
                    axisLabel: {
                        margin: 30,
                        textStyle: {
                            fontSize: 14
                        }
                    }
                },
                xAxis: {
                    splitLine: {show: false},
                    axisLabel: {show: false},
                    axisTick: {show: false},
                    axisLine: {show: false}
                },
                series: []

            },
            options : []
        };

		/*
        for (var i = 0; i < timeLineData.length; i++) {
            option.baseOption.timeline.data.push(timeLineData[i]);
            option.options.push({
                title: {
                    text: '건설사업단 공정율'
                },
                yAxis: {
                    data: timeLineGubun[timeLineData[i]],
                    inverse: true,
                    axisLine: {show: false},
                    axisTick: {show: false},
                    axisLabel: {
                        margin: 30,
                        textStyle: {
                            fontSize: 14
                        }
                    }
                },
                series: [{
                        name: '실적',
                        type: 'pictorialBar',
                        label: labelSetting,
                        symbolRepeat: true,
                        symbolSize: ['60%', '60%'],
                        barCategoryGap: '40%',
                        symbol: 'image://'+arrow,

                        data: complete[timeLineData[i]]
                    }, {
                        name: '계획',
                        type: 'pictorialBar',
                        barGap: '10%',
                        label: labelSetting,
                        symbolRepeat: true,
                        symbol: 'image://'+human,
                        symbolSize: ['60%', '60%'],
                        data: plan[timeLineData[i]]
                }]
            });
        }
        myChart.setOption(option);
        */
        myChart2.setOption(option2);
    </script>


    <script type="text/javascript">
    
 // 숫자 타입에서 쓸 수 있도록 format() 함수 추가

    Number.prototype.format = function(){

        if(this==0) return 0;

        var reg = /(^[+-]?\d+)(\d{3})/;

        var n = (this + '');

        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

        return n;

    };

     

    // 문자열 타입에서 쓸 수 있도록 format() 함수 추가

    String.prototype.format = function(){

        var num = parseFloat(this);

        if( isNaN(num) ) return "0";

        return num.format();

    };
    var myChart3 = echarts.init(document.getElementById('main3'), 'dark');

    var timeLineData3 = ['인력', '장비', '거리'];

    var CompleteData = {
    		'인력' : [0, 0, 0, 0, 0, 0, 0, 0],
    		'장비' : [0, 0, 0, 0, 0, 0, 0, 0],
    		'거리' : [0, 0, 0, 0, 0, 0, 0, 0] 
     };
    
        var TotalData = {
        		'인력' : [0, 0, 0, 0, 0, 0, 0, 0],
    			'장비' : [0, 0, 0, 0, 0, 0, 0, 0],
    			'거리' : [0, 0, 0, 0, 0, 0, 0, 0] 
        };

	option3 = {
	    baseOption:{
	        title : {
	        },
	        color : ['#749f83','#bda29a'],
	        timeline: {
	            show: false,
	            axisType: 'category',
	            autoPlay: true,
	            left: 0,
	            currentIndex: 0,
	            top: 470,
	            width: 900,
	            playInterval: 3000,
	            label: {
	                normal: {
	                    show: true,
	                    interval: 'auto'
	                }
	            },
	            data: timeLineData3
	        },
	        tooltip : {
	        },
	        legend: {
	            data:['주간계획','주간실적']
	        }, 
	        grid: {
	            height: 390
	        },
	        calculable : true,
	        xAxis : [
	            {
	                type : 'category',
	                data : ['수도권', '강원', '대전충청', '전북', '광주전남', '대구경북', '부산경남','충북']
	            }
	        ],
	        yAxis : [
	            {
	                type : 'value'
	            }
	        ],
	        series : [
	
	        ]
	        },
	    options:[]
	    };
	
	    for(var n = 0; n < timeLineData3.length; n++)
	    {
	        option3.options.push({
	            title: {
	                show: true,
	                text: '유지관리-' + timeLineData3[n]
	            },
	            series: [{
	                name:'주간실적',
	                type:'bar',
	                data:CompleteData[timeLineData3[n]],
	                label: {
	                	normal: {
	                        show: true,
	                        position: 'outside',
	                        offset: [0, 0],
	                        textStyle: {
	                            fontSize: 16
	                        },
	                        formatter:function(value) {
                                var texts = formatNumber(value.value);
                                return texts 
                               
                            }
	                    }
	                }
	            },
	            {
	                name:'주간계획',
	                type:'bar',
	                data:TotalData[timeLineData3[n]],
	                label: {
	                	normal: {
	                        show: true,
	                        position: 'outside',
	                        offset: [0, 0],
	                        textStyle: {
	                            fontSize: 16
	                        },formatter:function(value) {
	                            var texts = formatNumber(value.value);
	                            return texts 
	                           
	                        }
	                    }
	                }
	            }]
	        });
	    }
	    myChart3.setOption(option3);

    </script>

    <script type="text/javascript">
    var myChart4 = echarts.init(document.getElementById('main4'), 'dark');
        var now = new Date();

        var year = now.getFullYear();
        //var month = now.getMonth()+1;
        
        var xAxisMonth = new Array('1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월');
        
        //var xAxisMonth = [createMonth[11]+'월',createMonth[10]+'월',createMonth[9]+'월',createMonth[8]+'월',createMonth[7]+'월',createMonth[6]+'월',createMonth[5]+'월',createMonth[4]+'월',createMonth[3]+'월',createMonth[2]+'월',createMonth[1]+'월',createMonth[0]+'월'];
        var hqList = ['수도권본부','강원본부','대전충남본부','전북본부','광주전남본부','대구경북본부','부산경남본부','충북본부'];
        var legendList = [year-1+'년',year+'년'];

        var hqdata1 = {
                '수도권본부':[, , , , , , , , , , , ],
                '강원본부':[, , , , , , , , , , , ],
                '대전충남본부':[, , , , , , , , , , , ],
                '전북본부':[, , , , , , , , , , , ],
                '광주전남본부':[, , , , , , , , , , , ],
                '대구경북본부':[, , , , , , , , , , , ],
                '부산경남본부':[, , , , , , , , , , , ],
                '충북본부':[, , , , , , , , , , , ],
        };

        var hqdata2 = {
                '수도권본부':[, , , , , , , , , , , ],
                '강원본부':[, , , , , , , , , , , ],
                '대전충남본부':[, , , , , , , , , , , ],
                '전북본부':[, , , , , , , , , , , ],
                '광주전남본부':[, , , , , , , , , , , ],
                '대구경북본부':[, , , , , , , , , , , ],
                '부산경남본부':[, , , , , , , , , , , ],
                '충북본부':[, , , , , , , , , , , ],
        };

        option4 = {
        			
                    baseOption: {
                        title: {},
                        tooltip : {
                            trigger: 'axis'
                        },

                                calculable : true,
                                xAxis : [
                                    {
                                        type : 'category',
                                        boundaryGap : false,
                                        data : xAxisMonth
                                    }
                                ],
                                yAxis : [
                                    {
                                        type : 'value',
                                       	name : '단위: 백만원',
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
                                    playInterval: 3000,

                                    data: []

                        },
                        legend: {
                                    data: legendList,
                                    top: 10,
                                    right: 50
                                },
                        series: [],
                        animationEasing: 'linear',
                    },

                options :[]
        };
        for (var n = 0; n < hqList.length; n++) {
            option4.baseOption.legend.data = legendList;
            option4.baseOption.timeline.data.push(hqList[n]);

            option4.options.push({
                title :{
                    text: '한전전기 납부현황'+' - '+hqList[n]

                },
                color: ['#d48265','#749f83'],
                series : [{
                    name:legendList[0],
                    type:'line',
                    data:hqdata1[hqList[n]],
                    grid: {
                        height: 390
                    },
                    markPoint : {
                    	label:{
                    		normal:{
                    			textStyle : {
                    				color: '#000'
                    				}
                    			}
                    		},
                        data : [
                            {type : 'max', name: '최고점'},
                            {type : 'min', name: '최소점'}
                       		 ]
                   		 },
                    
                    markLine : {
                        data : [
                            {type : 'average', name: '평균'}
                        ]
                    }
                },
               
                {
                    name:legendList[1],
                    type:'line',
                    data:hqdata2[hqList[n]],
                    markPoint : {
                    	label:{
                    		normal:{
                    			textStyle : {
                    				color: '#000'
                    				}
                    			}
                    		},
                        data : [
                            {type : 'max', name: '최고점'},
                            {type : 'min', name: '최소점'},
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '평균'}
                        ]
                    }
                }]
            });
        }

        myChart4.setOption(option4);
        
        var timerFlag = 1;
        
        $(window).load(function(){
            
            
            test = "${param.widgetTimer}"
            
            if(test == 15000){
            	timerFlag = 1;
            }else if(test == 30000){
            	timerFlag = 2;
            }else if(test == 60000){
            	timerFlag = 3;
            }else if(test == 300000){
            	timerFlag = 4;
            }else if(test == 600000){
            	timerFlag = 5;
            }else if(test == 1800000){
            	timerFlag = 6;
            }else if(test == 3600000){
            	timerFlag = 7;
            }
            
            alert(timerFlag);
            
            
            if(test == 0){
                test = 60000*60;
            }
            
            
            
            window.setInterval("getBucCmmnMaindbAjax()",test);
            
        });
        
        


    </script>
</body>
</html>