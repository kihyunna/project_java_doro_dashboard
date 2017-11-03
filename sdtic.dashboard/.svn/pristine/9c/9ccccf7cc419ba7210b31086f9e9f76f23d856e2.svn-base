<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>MDT 운행현황</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
 <script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>
</head>

<body>
	<div id="main" style="width:100%;height:280px;"></div>
	<script type="text/javascript">
		jQuery(document).ready(function($){
		
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	        getBucMntmngVehicleCtldbAjax();
    	       // getBucCmmnLoadinfomenudbgridAjax();
    	        

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
		 
		var myChart = echarts.init(document.getElementById('main'),'dark');
		 function getBucMntmngVehicleCtldbAjax(){
		        $.ajax({
		            url : "${pageContext.request.contextPath}/buc/bucMntmngVehicleCtldbAjax.do",
		            async : false,
		            dataType : 'json',
		            success :function(json) { 
		            	var vhclcnt = 0;
		            	var distance = 0;
		            	var vhclcnt2 = 0;
		            	var distance2 = 0;
			                if(json.data.length > 0 ){
			                	for(var i = 0; i < json.data.length; i++) {
			                		if(json.data[i].gubun_date == 'T'){
				                		if(json.data[i].kor_dptnm == '수도권본부') {
				                			databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '강원본부') {
				        					databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '대전충남본부') {
				        					databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				}  else if(json.data[i].kor_dptnm == '충북본부') {
				        					databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '대구경북본부') {
				        					databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '전북본부') {
				        					databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '광주전남본부') {
				        					databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '부산경남본부') {
				        					databeauty['장비'][vhclcnt++] = json.data[i].vhclcnt;
					                    	databeauty['운행거리'][distance++] = json.data[i].distance;
				        				}  
			                		}
			                		else if(json.data[i].gubun_date == 'Y'){
			                			if(json.data[i].kor_dptnm == '수도권본부') {
			                				databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
			                				databeast['운행거리'][distance2++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '강원본부') {
				        					databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
				        					databeast['운행거리'][distance2++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '대전충남본부') {
				        					databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
				        					databeast['운행거리'][distance2++] = json.data[i].distance;
				        				}  else if(json.data[i].kor_dptnm == '충북본부') {
				        					databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
				        					databeast['운행거리'][distance2++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '대구경북본부') {
				        					databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
				        					databeast['운행거리'][distance2++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '전북본부') {
				        					databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
				        					databeast['운행거리'][distance2++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '광주전남본부') {
				        					databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
				        					databeast['운행거리'][distance2++] = json.data[i].distance;
				        				} else if(json.data[i].kor_dptnm == '부산경남본부') {
				        					databeast['장비'][vhclcnt2++] = json.data[i].vhclcnt;
				        					databeast['운행거리'][distance2++] = json.data[i].distance;
				        				}  
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
		
		
		
		var myData = ['수도권', '강원', '대전충남',  '전북', '광주전남', '대구경북', '부산경남','충북'];
		var databeast = {
			'장비': [0, 0, 0, 0, 0, 0, 0, 0],
			'운행거리': [0, 0, 0, 0, 0, 0, 0, 0]

		};
		var databeauty = {
			'장비': [0, 0, 0, 0, 0, 0, 0, 0],
			'운행거리': [0, 0, 0, 0, 0, 0, 0, 0]

		};
		var timeLineData = ['장비', '운행거리'];
		
		var legendGap = Math.round($('#main').width(($(window).width())) * 0.4);

		deemph_color = 'rgb(165,165,165)'
		emph_color = 'rgb(79,129,189)'
		height = 300
		grid_top = 50
		bar_category_gap = '28%'
		colors = ["#4C72B0", "#55A868", "#C44E52", "#8172B2", "#CCB974", "#64B5CD"],
		    deemph_colors = ['#8DA6CE', '#A0CFAB']
		axis_line_color = 'rgb(135,135,135)'

		option = {
			baseOption: {
				timeline: {
						show: true,
						left: 0,
						width: '95%',
						axisType: 'category',
						tooltip: {
							show: true,
							formatter: function(params) {
								console.log(params);
								return params.name;
							}
						},
						autoPlay: true,
						currentIndex: 0,
						playInterval: 2000,
						label: {
							normal: {
								show: true,
								interval: 'auto',
								formatter: '{value}',
								color: '#fff'
							},
						},
						data: [],
				},
				title: [{
				
					text: '',
					textStyle: {
						fontWeight: 'normal',
						fontSize: 11
					},
					bottom: 20,
				}],
				tooltip: {
					trigger: 'axis',
					axisPointer: {
						type: 'shadow'
					}
				},
				legend:{
					data : ['전일', '금일'],					
					top: 10,
					right: 10
				},
			
				grid: [{
					left: 100,
					right: '47%',
				}, {
					left: '55%',
					right: 3,
				}],
				yAxis: [{
					type: 'category',
					boundaryGap: true,
					data: myData,
					inverse: true,
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
					},
					axisLabel: {
						show: true,
					},
				}, {
					gridIndex: 1,
					type: 'category',
					boundaryGap: true,
					data: myData,
					position: 'top',
					inverse: true,
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
					},
					type: 'category',
					data: myData,
					inverse: true,
					axisLabel: {
						show: false,
					}
				}],
				xAxis: [{
					name: '',
					nameLocation: 'middle',
					position: 'top',
					type: 'value',
					nameTextStyle: {
						color: '#fff',
						fontSize: 15,
					},
					nameGap: 5,
					splitLine: {
						show: false
					},
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
						lineStyle: {
							color: axis_line_color,
							width: 1.5,
						}
					},
					axisLabel: {
						show: false,
						textStyle: {
							fontSize: 10,
						},
					},
				}, {
					gridIndex: 1,
					name: '',
					nameLocation: 'middle',
					position: 'top',
					type: 'value',
					splitLine: {
						show: false
					},
					nameTextStyle: {
						color: '#000',
						fontSize: 15,
					},
					nameGap: 5,
					splitLine: {
						show: false
					},
					axisTick: {
						show: false,
					},
					axisLine: {
						show: false,
						lineStyle: {
							color: axis_line_color,
							width: 1.5,
						}
					},
					axisLabel: {
						show: false,
					},
				}, ],

				series: [],
			},

			options: [],

		};
			for (var i = 0; i < timeLineData.length; i++) {
				option.baseOption.timeline.data.push(timeLineData[i]);
				option.options.push({
					series: [{
						name: '전일',
						type: 'bar',
						data: databeast[timeLineData[i]],
						barCategoryGap: bar_category_gap,
						label: {
							normal: {
								show: true,
								position: 'insideRight',
								textStyle: {
									color: '#fff'
								},
								formatter:function(value) {
		                            var texts = formatNumber(value.value);
		                            return texts 
								}
							}
						},
						itemStyle: {
							normal: {
								color: deemph_colors[0]
							}
						},
					}, {
						name: '금일',
						type: 'bar',
						xAxisIndex: 1,
						yAxisIndex: 1,
						data: databeauty[timeLineData[i]],
						barCategoryGap: bar_category_gap,
						label: {
							normal: {
								show: true,
								position: 'insideRight',
							textStyle: {
								color: '#fff'
							},
							formatter:function(value) {
	                            var texts = formatNumber(value.value);
	                            return texts 
							}
							}
						},
						itemStyle: {
							normal: {
								color: deemph_colors[1]
							}
						},
					}]
			
				});
			}
		
		
		myChart.setOption(option);	
		var period = 0;
		$(window).load(function() {
			setDivHeight('main');
			period = "${param.widgetTimer}";
        	
        	if(period == 0) {
        		period = 60 * 1000 * 60;
        	}
        	
        	setInterval(function() {
        		getBucMntmngVehicleCtldbAjax();
        	}, period);
		});
		
	    $(window).resize(function(){

	        setDivHeight('main');

	    });

	    function setDivHeight(objSet)
	    {

	        var objSet   = document.getElementById(objSet);
	        objSet.style.width  = ($(window).width()) + "px";
	        objSet.style.height  = ($(window).height()) + "px";
	        option.baseOption.timeline.width = ($(window).width() - 10) + "px";


	        $('#main').width(($(window).width()) + "px");
	        $('#main').height(($(window).height()) + "px");


	        myChart.resize({
	            width: $(window).width(),
	            height : $(window).height()
	            
	        });
	        myChart.setOption(option);
			
	    }
		         
	</script>
	</div>
</body>
</html>