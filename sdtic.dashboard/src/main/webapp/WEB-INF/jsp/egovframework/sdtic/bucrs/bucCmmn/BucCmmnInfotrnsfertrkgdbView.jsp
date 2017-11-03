<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>예약업무 Tracking process</title>
		<meta name="description" content="A responsive, magazine-like website layout with a grid item animation effect when opening the content" />
		<meta name="keywords" content="grid, layout, effect, animated, responsive, magazine, template, web design" />	
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bucrs/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/css/bucrs/style2_1.css" />
    <!-- including ECharts file -->
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script src="${contextPath}/js/bucrs/modernizr.custom.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
    <script type="text/javascript">
        $(window).load(function(){           
        	period = "${param.widgetTimer}";
        	
        	if(period == 0) {
        		period = 60 * 1000 * 60;
        	}
        	
        	setInterval(function() {
        		location.reload();
        	}, period);
        });
    </script>
    <style>
		body {
		  background: #ffffffff;
		  color: #7b7b7b;
		
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;
		  overflow: hidden;
		  /* force scroll to appear */
		}
		
		a {
		  outline: none;
		  color: #81c483;
		  text-decoration: none;
		}
		
		.grid__item {  
		  height: 35px;
		  width: inherit;
		  position: relative;
		  color: inherit;
		  background: #ffffffff;
		  cursor: pointer;
		  text-align: center;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-direction: normal;
		  -webkit-box-orient: vertical;
		  -webkit-flex-direction: row;
		  -ms-flex-direction: row;
		  flex-direction: row;
		  -webkit-justify-content: center;
		  justify-content: center;
		    /*??? ??*/
		  margin-top: 1px;
	        border: 1px solid rgba(74, 74, 74, 0.2);
		}
		
		.itemGroup{  
		  height: 30px;
		  width: inherit;
		  position: relative;
		  cursor: pointer;
		  text-align: center;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-direction: normal;
		  -webkit-box-orient: vertical;
		  -webkit-flex-direction: row;
		  -ms-flex-direction: row;
		  flex-direction: row;
		  -webkit-justify-content: center;
		  justify-content: center;
		    /*margin-top? ??*/
		  margin-top: 1px;
	      background:#ffffffff;
		  border: 1px solid rgba(74, 74, 74, 0.2);
		}
	    
	    .title {
		  margin: 0;
		  font-size: 15px;
		  color: #fff;
		  text-align: center;
		}
		
		.title--preview {
		/*  -webkit-flex: 0.3;*/
		/*  flex: 1;*/
		  display: -webkit-flex;
		  display: flex;
		  -webkit-align-items: center;
		  align-items: center;
		  -webkit-justify-content: center;
		  justify-content: center;
		}
		
		.group {
		  margin: 0;
		  font-size: 15px;
		  color:#fff;
		  text-align: center;
		}
		
		.group--preview {
		/*  -webkit-flex: 0.3;*/
		/*  flex: 1;*/
		  display: -webkit-flex;
		  display: flex;
		  -webkit-align-items: center;
		  align-items: center;
		  -webkit-justify-content: center;
		  justify-content: center;
		  background-color:#ffffffff;
		}
		
		    .grid__item--animate .title--preview {
      -webkit-transition-delay: 0s;
      transition-delay: 0s;
      opacity: 0;
      -webkit-transform: translate3d(0, -20px, 0);
      transform: translate3d(0, -20px, 0);
    }
    
    .title--preview,
    .loader
    .category{
      -webkit-transition: -webkit-transform 0.2s, opacity 0.2s;
      transition: transform 0.2s, opacity 0.2s;
      -webkit-transition-timing-function: cubic-bezier(0.7, 0, 0.3, 1);
      transition-timing-function: cubic-bezier(0.7, 0, 0.3, 1);
    }
    
    .title--preview {
      -webkit-transition-delay: 0.15s;
      transition-delay: 0.15s;
    }
    
	</style>
</head>
<body>
    <!-- prepare a DOM container with width and height -->
    <!-- height 수정-->
    <div id="main" style="width:350px; height:240px; float: left; margin-top: 10px"> </div>
    <script type="text/javascript">
    jQuery(document).ready(function($){
    	
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	        getBucCmmnInfotrnsfertrkgdbAjax();
    	       // getBucCmmnLoadinfomenudbgridAjax();
    	        

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    })
    
    var sendData = [];
    var recvData = [];
    var period = 0;
    
    function getBucCmmnInfotrnsfertrkgdbAjax(){
        	
        	 $.ajax({
        	 url : "${pageContext.request.contextPath}/buc/bucCmmnInfotrnsfertrkgdbAjax.do",
	            async : false,
	            dataType : 'json',	            
	            success :function(json) {
	            	if(json.chartdata.length > 0) {
	            		for(var chartCnt = 0; chartCnt < json.chartdata.length; chartCnt++){
	            			data[0].value = json.chartdata[chartCnt].sms;
	            			data[1].value = json.chartdata[chartCnt].email;
	            			data[2].value = json.chartdata[chartCnt].msgr;
	            			data[3].value = json.chartdata[chartCnt].popp;
			            	myChart.setOption(option);
	            		}
	            	}
	            	
	            	if(json.senddata.length > 0) {
	            		for(var sendCnt = 0; sendCnt < json.senddata.length; sendCnt++) {
	            			sendData[sendCnt] = json.senddata[sendCnt];
	            		}	            		
	            	}
	            	
	            	if(json.recvdata.length > 0) {
	            		for(var recvCnt = 0; recvCnt < json.recvdata.length; recvCnt++) {
	            			recvData[recvCnt] = json.recvdata[recvCnt];
	            		}
	            	}
	            }, error : function() {
	            	console.log(arguments);
	            }, complete: function(json) {
	            	initGrid();
	            	setTimeout(function(){
	            		changeSelection(selectorNum, dataNum);
	            	}, 6000);
	            }	            	
        	 });
        }        
		
    
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'),'dark');
        var colors= ['#61a0a8', '#d48265', '#91c7ae', '#ca8622'];
        
		var dataName = '';
         var data = [{
            value: 0,
            name: 'SMS'
        }, {
            value: 0,
            name: 'E-Mail'
        }, {
            value: 0,
            name: '사내메신저'
        }, {
            value: 0,
            name: '팝업'
        }];
        option = {
            //backgroundColor: '#fff',
            title: {
                text: '',
                //subtext: '2017년 7월',
                x: '35%',
                y: '40%',
                textStyle: {
                    fontWeight: 'bold',
                    fontSize: 14,
                    color: '#fff'
                }
            },
            tooltip: {
                show: false,
                trigger: 'item',
                formatter: "value"
            },
           /* legend: {
                orient: 'horizontal',
                bottom: '10%',
                data: ['SMS', 'Mail', '사내메신저', '팝업']
            },*/
            series: [{
                type: 'pie',
                selectedMode: 'single',
                radius: ['25%', '76%'],
                center: ['46%', '57%'],
                color: ['#61a0a8', '#d48265', '#91c7ae', '#ca8622'],
            

                label: {
                    normal: {
                        position: 'outside',
                        formatter: '{b}\n{c}건',
                        
                        textStyle: {
                            color: '#fff',
                            fontWeight: 'bold',
                            fontFamily: 'sans-serif',
                            fontSize: 14
                        }
                    },
                    labelLine:{
                    	show:true
                    },
                    emphasis: {
                     show: true,
                     textStyle: {
                         color: '#fff',
                         fontFamily: 'sans-serif',
                         fontSize: '18',
                         fontWeight: 'bold'
                     }
                 }
                },
              
                    itemStyle: {
                    normal: {
                        borderWidth: 2,
                        borderColor: '#ffffffff',
                    },
                    emphasis: {
                        borderWidth: 0,
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)',

                    }
                },
                data: data
            }]
        };
                                                  
            myChart.setOption(option);

    </script>
       
      <!--width 변경-->
		<div id="systext" style="width:910px; margin-right: 15px; height:15px; font-size:13px; text-align: right; color:#fff; background-color:#ffffffff">[전체]</div> 
    
		<div id="container_ID" class="container" style="position:absolute; left:360px; width:550px; height:240px; margin-top: 10px; float: left">			
		<div id="theGrid" class="main">
			<section class="grid">
                   <!-- 카테고리 추가-->
			    <a id="itemCategory" class="itemGroup" href="#">
					<div class="group group--preview" style="width: 15%">순위</div>
					<div class="group group--preview" style="width: 35%">상위부서</div>
					<div class="group group--preview" style="width: 35%">부서</div>
					<div class="group group--preview" style="width: 15%">사용건수</div>
				</a>
				<!-- 카테고리 추가-->
				<a id="gridItem1" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking1" style="width: 15%"></div>
					<div class="title title--preview" id="upDpt1" style="width: 35%"></div>
					<div class="title title--preview" id="downDpt1" style="width: 35%"></div>
					<div class="title title--preview" id="totalData1" style="width: 15%"></div>
				</a>
				<a id="gridItem2" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking2" style="width: 15%"></div>
					<div class="title title--preview" id="upDpt2" style="width: 35%"></div>
					<div class="title title--preview" id="downDpt2" style="width: 35%"></div>
					<div class="title title--preview" id="totalData2" style="width: 15%"></div>
				</a>
				<a id="gridItem3" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking3" style="width: 15%"></div>
					<div class="title title--preview" id="upDpt3" style="width: 35%"></div>
					<div class="title title--preview" id="downDpt3" style="width: 35%"></div>
					<div class="title title--preview" id="totalData3" style="width: 15%"></div>
				</a>
				<a id="gridItem4" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking4" style="width: 15%"></div>
					<div class="title title--preview" id="upDpt4" style="width: 35%"></div>
					<div class="title title--preview" id="downDpt4" style="width: 35%"></div>
					<div class="title title--preview" id="totalData4" style="width: 15%"></div>
				</a>
				<a id="gridItem5" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking5" style="width: 15%"></div>
					<div class="title title--preview" id="upDpt5" style="width: 35%"></div>
					<div class="title title--preview" id="downDpt5" style="width: 35%"></div>
					<div class="title title--preview" id="totalData5" style="width: 15%"></div>					
				</a>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">	
		var selectorNum = 1;
		var dataNum = 0;
		var toggle;
		var rankNum =0;
		var systexttoggle = 0;
	    
		//그리드 애니메이션 타이머. 상단 로우부터 아래로 내려감
	    function changeSelection() {
			rankNum =0;
	    	if(systexttoggle == 0) {
				systexttoggle = 1;
			} else {
				systexttoggle = 0;
			}
	    	toggle = setInterval(function() {  
	            if(selectorNum > 5){	            	
                    setTimeout(function() {  
                        if(selectorNum > 5){
                        	selectorNum = 1;
                        	dataNum =0;
                			rankNum = 0;
                			if(systexttoggle == 0) {
                				systexttoggle = 1;
                			} else {
                				systexttoggle = 0;
                			}
                        }
                    }, 1000);
	            } else {
	                rotateGrid(selectorNum, dataNum);
	                selectorNum++;    
	                dataNum++;
	            }
	        }, 1000);
	    }
	    
	    //그리드 데이터 초기화 함수
	    function initGrid() {
	    	$("#systext").text("[발송]");
	    	for(var i=0;i<5;i++) {
	    		if(sendData[i] != null){
	    			rankNum++;
	    			$('#tRanking' + (i+1)).text(rankNum);
		    		$('#upDpt' + (i+1)).text(sendData[i].hgrn_dptnm);
		        	$('#downDpt' + (i+1)).text(sendData[i].sndr_dptnm);
		        	$('#totalData' + (i+1)).text(sendData[i].cnt);		        	
	    		} else {
	    			$('#tRanking' + (i+1)).text('');
		    		$('#upDpt' + (i+1)).text('');
		        	$('#downDpt' + (i+1)).text('');
		        	$('#totalData' + (i+1)).text('');
	    		}
	    	}
	    }
	    
	    //그리드 애니메이션 함수
	    function rotateGrid(selectorNum, dataNum) {	    	
	    	if(systexttoggle == 0) {
	    		$("#systext").css("color", "#61a0a8");
	    		$("#systext").text("[발송]");
	    		$("#gridItem" + selectorNum).addClass("grid__item--animate");    		
	            setTimeout(function() {        
	            	if(sendData[dataNum] != null) {
	            		rankNum++;
	            		$('#tRanking' + selectorNum).text(rankNum);
		            	$('#upDpt' + selectorNum).text(sendData[dataNum].hgrn_dptnm);
		            	$('#donwDpt' + selectorNum).text(sendData[dataNum].sndr_dptnm);
		            	$('#totalData' + selectorNum).text(sendData[dataNum].cnt);
	            	} else {
	            		$('#tRanking' + selectorNum).text('');
		            	$('#upDpt' + selectorNum).text('');
		            	$('#downDpt' + selectorNum).text('');
		            	$('#totalData' + selectorNum).text('');
	            	}
	               $("#gridItem" + selectorNum).removeClass("grid__item--animate");
	            }, 500);	    
	    	} else {
	    		$("#systext").css("color", "#d48265");
	    		$("#systext").text("[수신]");
	    		$("#gridItem" + selectorNum).addClass("grid__item--animate");    		
	            setTimeout(function() {        
	            	if(recvData[dataNum] != null) {
	            		rankNum++;
	            		$('#tRanking' + selectorNum).text(rankNum);
		            	$('#upDpt' + selectorNum).text(recvData[dataNum].hgrn_dptnm);
		            	$('#donwDpt' + selectorNum).text(recvData[dataNum].recvr_dptnm);
		            	$('#totalData' + selectorNum).text(recvData[dataNum].cnt);
	            	} else {
	            		$('#tRanking' + selectorNum).text('');
		            	$('#upDpt' + selectorNum).text('');
		            	$('#downDpt' + selectorNum).text('');
		            	$('#totalData' + selectorNum).text('');
	            	}
	               $("#gridItem" + selectorNum).removeClass("grid__item--animate");
	            }, 500);
	    	}
	    }
	</script>
</body>
</html>