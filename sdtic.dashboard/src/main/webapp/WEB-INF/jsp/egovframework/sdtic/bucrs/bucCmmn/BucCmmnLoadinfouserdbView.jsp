<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>도로정보시스템 사용자 Top10</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
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
		  height: 33px;
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
            
		  color: #fff;
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
		  justify-content: center;*/
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
	<div id="main" style="width:350px; height:265px; left: 560px; float: left"> </div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        jQuery(document).ready(function($){
	
	    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
					
	    	        getBucCmmnLoadinfouserdbAjax();
	    	       // getBucCmmnLoadinfomenudbgridAjax();
	    	        
	
	    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
	    })
	    
	    var griddata = [];
        var controlVal = 0;
        var animation;
        var chartNum = 0; 
		var rotateCnt=0;
		var usesystem = '';
		var userid = '';
		var emptydata = [ {rank: '', hgrn_systm_cd: '', kor_dptnm: '', rtur_id: '', rtur_nm: '', cnt: '', y_rank: ''}];
		var entire = 0;
    	var design = 10;
    	var constru = 20;
    	var mainte = 30;
    	var ferc = 40;
    	var chartTimeout;
    	var period = 0;
        
		// 파이 차트 데이터 ajax 함수
        function getBucCmmnLoadinfouserchartdbAjax(chartNum){
        	
        	 $.ajax({
        	 url : "${pageContext.request.contextPath}/buc/bucCmmnLoadinfouserdb.do",
	            async : false,
	            dataType : 'json',
	            // 그리드 데이터를 파라메터로 쿼리에 넘김
	            data:{
	            	'use_system' : usesystem,
	            	'user_id' : userid
	            },
	            success :function(json) {
	            	// 파이차트 데이터 맵핑
	            	if(json.data2.length < 5){
		            	for(var i =0;i<json.data2.length;i++) {
		            		chartdata[i].name = json.data2[i].use_systm_nm;
		            		chartdata[i].value = parseInt(json.data2[i].row_cnt);
		            	}
		            	for(var i = json.data2.length;i<5;i++) {
		            		chartdata[i].value = '';
		            		chartdata[i].name = '';
		            	}
	            	}
	            	else {
	            		for(var i =0;i<json.data2.length;i++) {
		            		chartdata[i].name = json.data2[i].use_systm_nm;
		            		chartdata[i].value = parseInt(json.data2[i].row_cnt);
		            	}
	            	}
	            }, error : function() {
	            	console.log(arguments);
	            }, complete: function(json) {
	            	myChart.setOption(option);
	            	chartTimeout = setTimeout(function() {	 
	            		 myChart.clear();	                     
	            		chartNum++;	  
	            		 if(0 <= chartNum && chartNum < 10) {
	            			if(entire == 0) {
	            				if(design == 10) {
	            					if(constru == 20) {
	            						if(mainte == 30) {
	            							if(ferc == 40) {
	            								chartNum = 0;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
	            							} else {
	            								chartNum = 40;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
	            							}
	            						} else{
	            							chartNum = 30;
			            					gridNum = 1;
			            					initGridSelection();
				            				changeSelection();
				            				setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
	            						}
	            					} else{
	            						chartNum = 20;
		            					gridNum = 1;
		            					initGridSelection();
			            				changeSelection();
			            				setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
	            					}
	            					
	            					
	            				} else {
		            				chartNum = 10;
		            				gridNum = 1;
		            				initGridSelection();
		            				changeSelection();
			            		    setTimeout(function() {
				            		    rotatetextColor(gridNum);
				            		    setParmas(chartNum);
				            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
			            		    }, 4700);
	            				}
	            			} else if(0 < entire && entire < 5) {
			            			if(chartNum == entire) {
			            				if(design == 10) {
			            					if(constru == 20) {
			            						if(mainte == 30) {
			            							if(ferc == 40) {
			            								chartNum = 0;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 40;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 30;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 20;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            					
			            				} else {
				            				chartNum = 10;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum < entire) {
			            				if(chartNum == 0) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		}  else if(5 <= entire && entire <= 10) {
			            			if(chartNum == entire) {
			            				if(design == 10) {
			            					if(constru == 20) {
			            						if(mainte == 30) {
			            							if(ferc == 40) {
			            								chartNum = 0;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 40;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 30;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 20;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 10;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum == 5) {
			            				initGridSelection();
			            				changeSelection();
			            				gridNum = 1;
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
			            			} else if((0 <= chartNum && chartNum < 5) || (5 < chartNum && chartNum < entire)) {
			            				if(chartNum == 0) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		}
		            		} else if(10 <= chartNum && chartNum < 20) {
		            			if(design == 10) {
		            				if(constru == 20) {
		            					if(mainte == 30) {
		            						if(ferc == 40) {
		            							if(entire == 0) {
		            								chartNum = 10;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							} else {
		            								chartNum = 0;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							}
		            						} else{
		            							chartNum = 40;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
		            						}
		            					} else{
		            						chartNum = 30;
			            					gridNum = 1;
			            					initGridSelection();
				            				changeSelection();
				            				setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
		            					}
		            					
		            				} else {
			            				chartNum = 20;
			            				gridNum = 1;
			            				initGridSelection();
			            				changeSelection();
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
		            				}
		            			} else if(10 < design && design < 15) {
			            			if(chartNum == design) {
			            				if(constru == 20) {
			            					if(mainte == 30) {
			            						if(ferc == 40) {
			            							if(entire == 0) {
			            								chartNum = 10;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 0;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 40;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 30;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 20;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum < design) {
			            				if(chartNum == 10){
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}else {
				            				setGridNum();
				            				rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
			            				}
			            			}
			            		} else if(15 <= design && design <= 20) {
			            			if(chartNum == design) {
			            				if(constru == 20) {
			            					if(mainte == 30) {
			            						if(ferc == 40) {
			            							if(entire == 0) {
			            								chartNum = 10;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 0;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 40;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 30;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 20;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum == 15) {
			            				initGridSelection();
			            				changeSelection();
			            				gridNum = 1;
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
			            			} else if((10 <= chartNum && chartNum < 15) || (15 < chartNum && chartNum < design)) {
			            				if(chartNum == 10) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		}
		            		} else if(20 <= chartNum && chartNum < 30) {
		            			if(contru == 20) {
		            				if(mainte == 30) {
		            					if(ferc == 40) {
		            						if(entire == 0) {
		            							if(design == 10) {
		            								chartNum = 20;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							} else {
		            								chartNum = 10;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							}
		            						} else{
		            							chartNum = 0;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
		            						}
		            					} else{
		            						chartNum = 40;
			            					gridNum = 1;
			            					initGridSelection();
				            				changeSelection();
				            				setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
		            					}
		            					
		            				} else {
			            				chartNum = 30;
			            				gridNum = 1;
			            				initGridSelection();
			            				changeSelection();
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
		            				}
		            			} else if(20 < constru && constru < 25) {
			            			if(chartNum == constru) {
			            				if(mainte == 30) {
			            					if(ferc == 40) {
			            						if(entire == 0) {
			            							if(design == 10) {
			            								chartNum = 20;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 10;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 0;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 40;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 30;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum < constru) {
			            				if(chartNum == 20) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		} else if(25 <= constru && constru <= 30) {
			            			if(chartNum == constru) {
			            				if(mainte == 30) {
			            					if(ferc == 40) {
			            						if(entire == 0) {
			            							if(design == 10) {
			            								chartNum = 20;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 10;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 0;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 40;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 30;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum == 25) {
			            				initGridSelection();
			            				changeSelection();
			            				gridNum = 1;
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
			            			} else if((20 <= chartNum && chartNum < 25) || (25 < chartNum && chartNum < constru)) {
			            				if(chartNum == 20) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		}
		            		} else if(30 <= chartNum && chartNum < 40) {
		            			if(mainte == 30) {
		            				if(ferc == 40) {
		            					if(entire == 0) {
		            						if(design == 10) {
		            							if(constru == 20) {
		            								chartNum = 30;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							} else {
		            								chartNum = 20;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							}
		            						} else{
		            							chartNum = 10;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
		            						}
		            					} else{
		            						chartNum = 0;
			            					gridNum = 1;
			            					initGridSelection();
				            				changeSelection();
				            				setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
		            					}
		            					
		            				} else {
			            				chartNum = 40;
			            				gridNum = 1;
			            				initGridSelection();
			            				changeSelection();
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
		            				}
		            			}else if(30 < mainte && mainte < 35) {
			            			if(chartNum == mainte) {
			            				if(ferc == 40) {
			            					if(entire == 0) {
			            						if(design == 10) {
			            							if(constru == 20) {
			            								chartNum = 30;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 20;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 10;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 0;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 40;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum < mainte) {
			            				if(chartNum == 30) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		} else if(35 <= mainte && mainte <= 40) {
			            			if(chartNum == mainte) {
			            				if(ferc == 40) {
			            					if(entire == 0) {
			            						if(design == 10) {
			            							if(constru == 20) {
			            								chartNum = 30;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 20;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 10;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 0;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 40;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum == 35) {
			            				initGridSelection();
			            				changeSelection();
			            				gridNum = 1;
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
			            			} else if((30 <= chartNum && chartNum < 35) || (35 < chartNum && chartNum < mainte)) {
			            				if(chartNum == 30) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		}
		            		} else if(40 <= chartNum && chartNum < 50) {
		            			if(ferc == 40) {
		            				if(entire == 0) {
		            					if(design == 10) {
		            						if(constru == 20) {
		            							if(mainte == 30) {
		            								chartNum = 40;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							} else {
		            								chartNum = 30;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
		            							}
		            						} else{
		            							chartNum = 20;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
		            						}
		            					} else{
		            						chartNum = 10;
			            					gridNum = 1;
			            					initGridSelection();
				            				changeSelection();
				            				setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
		            					}
		            					
		            				} else {
			            				chartNum = 0;
			            				gridNum = 1;
			            				initGridSelection();
			            				changeSelection();
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
		            				}
		            			}else if(40 < ferc && ferc < 45) {
			            			if(chartNum == ferc) {
			            				if(entire == 0) {
			            					if(design == 10) {
			            						if(constru == 20) {
			            							if(mainte == 30) {
			            								chartNum = 40;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 30;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 20;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 10;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 0;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum < ferc) {
			            				if(chartNum == 40) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		} else if(45 <= ferc && ferc <= 50) {
			            			if(chartNum == ferc) {
			            				if(entire == 0) {
			            					if(design == 10) {
			            						if(constru == 20) {
			            							if(mainte == 30) {
			            								chartNum = 40;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							} else {
			            								chartNum = 30;
						            					gridNum = 1;
						            					initGridSelection();
							            				changeSelection();
							            				setTimeout(function() {
									            		    rotatetextColor(gridNum);
									            		    setParmas(chartNum);
									            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
								            		    }, 4700);
			            							}
			            						} else{
			            							chartNum = 20;
					            					gridNum = 1;
					            					initGridSelection();
						            				changeSelection();
						            				setTimeout(function() {
								            		    rotatetextColor(gridNum);
								            		    setParmas(chartNum);
								            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
							            		    }, 4700);
			            						}
			            					} else{
			            						chartNum = 10;
				            					gridNum = 1;
				            					initGridSelection();
					            				changeSelection();
					            				setTimeout(function() {
							            		    rotatetextColor(gridNum);
							            		    setParmas(chartNum);
							            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
						            		    }, 4700);
			            					}
			            					
			            				} else {
				            				chartNum = 0;
				            				gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				}
			            			} else if(chartNum == 45) {
			            				initGridSelection();
			            				changeSelection();
			            				gridNum = 1;
				            		    setTimeout(function() {
					            		    rotatetextColor(gridNum);
					            		    setParmas(chartNum);
					            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
				            		    }, 4700);
			            			} else if((40 <= chartNum && chartNum < 45) || (45 < chartNum && chartNum < ferc)) {
			            				if(chartNum == 40) {
			            					gridNum = 1;
				            				initGridSelection();
				            				changeSelection();
					            		    setTimeout(function() {
						            		    rotatetextColor(gridNum);
						            		    setParmas(chartNum);
						            		    getBucCmmnLoadinfouserchartdbAjax(chartNum);
					            		    }, 4700);
			            				} else {
				            				setGridNum();
						            		rotatetextColor(gridNum);
						            		setParmas(chartNum);
						            		getBucCmmnLoadinfouserchartdbAjax(chartNum);			            					
			            				}
			            			}
			            		}
		            		}
	            		/* if(0 <= chartNum && chartNum < 10) {
		            		if(entire == 0) {
		            			chartNum = 10;
		            		} else if(entire <= 5) {
		            			if(chartNum == entire) {
		            				chartNum = 10;
		            			}
		            		}
	            		} else if(10 <= chartNum && chartNum < 20) {
		            		if(design == 10) {
		            			chartNum = 20;
		            		} else if(design <= 15) {
		            			if(chartNum == 15) {
		            				chartNum = 20;
		            			}
		            		}
	            		} else if(20 <= chartNum && chartNum < 30) {
		            		if(constru == 20) {
		            			chartNum = 30;
		            		} else if(constru <= 25) {
		            			if(chartNum == 25) {
		            				chartNum = 30;
		            			}
		            		}
	            		} else if(30 <= chartNum && chartNum < 40) {
		            		if(mainte == 30) {
		            			chartNum = 40;
		            		} else if(mainte <= 35) {
		            			if(chartNum == 35) {
		            				chartNum = 40;
		            			}
		            		}
	            		} else if(40 <= chartNum && chartNum < 50) {
		            		if(ferc == 40) {
		            			chartNum = 0;
		            		} else if(ferc <= 45) {
		            			if(chartNum == 45) {
		            				chartNum = 0;
		            			}
		            		}
	            		}
	            		
	            		
	            		if(griddata[chartNum] != null) {
	                		usesystem = griddata[chartNum].hgrn_systm_cd;
	                		userid = griddata[chartNum].rtur_id;
	                	} else {
	                		usesystem = '';
	                		userid = '';
	                	}
	            		gridNum++;
	            		controlVal++;	            		
	            		if(controlVal == 5) {
	            			if(gridNum>5){
	            				initGridSelection();
		                        gridNum=1;
		                        setTimeout(function() {
		                        	rotatetextColor(gridNum);  
		                        }, 4700);
		                    } else {                
		                        rotatetextColor(gridNum);                  
		                    }		            			
	            			
	            			animation = setInterval(function() {
	            				rotateSystem(selectorNum, dataNum);	  
	            				selectorNum++;
	            				rotateCnt++;
	            				dataNum++;
	            				if(rotateCnt % 5 ==0) {
	            					clearInterval(animation);
	            					selectorNum = 1;
	            					if(0 <= dataNum && dataNum < 10) {
	            						if(dataNum >= entire) {
	            							dataNum = 10;
	            						}
	            					} else if(10 <= dataNum && dataNum < 20) {
	            						if(dataNum >= design) {
	            							dataNum = 20;
	            						}
	            					} else if(20 <= dataNum && dataNum < 30) {
	            						if(dataNum >= constru) {
	            							dataNum = 30;
	            						}
	            					} else if(30 <= dataNum && dataNum < 40) {
	            						if(dataNum >= mainte) {
	            							dataNum = 40;
	            						}
	            					} else if(40 <= dataNum && dataNum < 50) {
	            						if(dataNum >= ferc) {
	            							dataNum = 0;
	            						}
	            					}
	            				}
	            			}, 700);
	            			controlVal=0;
	            			
	            			setTimeout(function() {			            		
			            		if(chartNum<50) {
			                         setTimeout(function() {
			                         	if(chartNum<50){
			                         		getBucCmmnLoadinfouserchartdbAjax(chartNum);
			                         	}
			                         },100);
			                     } else {
			                     	if(chartNum >=50){
			                         	chartNum=0;
			                         	getBucCmmnLoadinfouserchartdbAjax(chartNum);
			                     	}
			                     }   
	            			}, 4700);
		            	} else {
		            		clearInterval(animation);
		            		if(gridNum>5){
		            			initGridSelection();
		                        gridNum=1;
		                        setTimeout(function() {
		                        	rotatetextColor(gridNum);  
		                        }, 4000);
		                    } else {                
		                        rotatetextColor(gridNum);                  
		                    }
		            		
		            		if(chartNum<50) {
		                         setTimeout(function() {
		                         	if(chartNum<50){
		                         		getBucCmmnLoadinfouserchartdbAjax(chartNum);
		                         	}
		                         },100);
		                     } else {
		                     	if(chartNum >=50){
		                         	chartNum=0;
		                         	getBucCmmnLoadinfouserchartdbAjax(chartNum);
		                     	}
		                     }   
		            	}  */
	            	}, 4700);	            	
	            }	            	
        	 });
        }
        
		//그리드 데이터 ajax 함수
	    function getBucCmmnLoadinfouserdbAjax(){
	        $.ajax({
	            url : "${pageContext.request.contextPath}/buc/bucCmmnLoadinfouserdb.do",
	            async : false,
	            dataType : 'json',
	            success :function(json) {    
	                if(json.data1.length > 0 ){
	                	entire = 0;
	                	design = 10;
	                	constru = 20;
	                	mainte = 30;
	                	ferc = 40;
	                    for(var i=0; i<json.data1.length; i++)
	                    {
							if(json.data1[i].hgrn_systm_cd == 'ALL') {
								griddata[entire++] = json.data1[i];		
							} else if(json.data1[i].hgrn_systm_cd == 'DSG') {
								griddata[design++] = json.data1[i];
							} else if(json.data1[i].hgrn_systm_cd == 'CON') {
								griddata[constru++] = json.data1[i];								
							} else if(json.data1[i].hgrn_systm_cd == 'UKP') {
								griddata[mainte++] = json.data1[i];
							} else if(json.data1[i].hgrn_systm_cd == 'FCL') {
								griddata[ferc++] = json.data1[i];
							}
	                    }
	                }
	                else{
	                console.log(arguments);
	                }
	
	            },error : function(){
	                console.log(arguments);
	            }, complete : function() {
	            	initGrid(); 
	            	initDataNum();
	                setTimeout(function() {
	                    toggletextColor();                
	                }, 1000);
	            }
	        });
		
	    }
        
        var myChart = echarts.init(document.getElementById('main'),'dark');
        
       	chartdata = [{
            value: 0,
            name: ''
        }, {
            value: 0,
            name: ''
        }, {
            value: 0,
            name: ''
        }, {
            value: 0,
            name: ''
        }, {
            value: 0,
            name: ''
        }];
        option = {
            //backgroundColor: '#fff',
            title: {
                text: '',
                //subtext: '2017년 7월',
                x: '38%',
                y: '46%',
                textStyle: {
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
                radius: ['27%', '68%'],
                center: ['48%', '48%'],
                color: ['#91c7ae', '#c23531', '#2f4554', '#61a0a8', '#d48265'],

                label: {
                    normal: {
                    	formatter: function(o) {
                            var result = '';
                          	if(o.name == '전체'){
                          		result = o.name;
                          	}
                          	else{
                          		result = o.name + "\n" + o.value + "건";
                          	}
                            return result;
                        },
                        
                        textStyle: {
                            color: '#fff',
                            fontSize: 12
                        }
                    },
                    emphasis: {
                     show: true,
                     textStyle: {
                         color: '#fff',
                         fontFamily: 'sans-serif',
                         fontSize: '18',
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
                data: chartdata
            }]
        };

    </script>
    <div id="systext" style="width:550px; margin-right: 15px; height:15px; font-size:13px; text-align: right; color:#fff; background-color:#ffffffff">[전체]</div> 
    
	<div id="container_ID" class="container" style="position:absolute; width:550px; height:245px; margin-top: 10px; float: left">			
		<div id="theGrid" class="main">
			<section class="grid">
                   <!-- 카테고리 추가-->
			    <a id="itemCategory" class="itemGroup" href="#">
					<div class="group group--preview" style="width: 10%">순위</div>
					<div class="group group--preview" style="width: 40%">부서</div>
					<div class="group group--preview" style="width: 20%">이름</div>
					<div class="group group--preview" style="width: 15%">사용건수</div>
					<div class="group group--preview" style="width: 15%">전일순위</div>
				</a>
				<!-- 카테고리 추가-->
				<a id="gridItem1" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking1" style="width: 10%"></div>
					<div class="title title--preview" id="systemName1" style="width: 40%"></div>
					<div class="title title--preview" id="useMenu1" style="width: 20%"></div>
					<div class="title title--preview" id="totalData1" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking1" style="display: inline-block"></div><div id="yRankblock1_1" style="display:inline-block">( </div></td>
                                  <td style="width: 50%"><img id="rankingImg1" src="" width="20px" height="15px"><div id="yRankblock1_2" style="display:inline-block"> )</div></td>
                               </tr>
                       	</table>
					</div>
				</a>
				<a id="gridItem2" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking2" style="width: 10%"></div>
					<div class="title title--preview" id="systemName2" style="width: 40%"></div>
					<div class="title title--preview" id="useMenu2" style="width: 20%"></div>
					<div class="title title--preview" id="totalData2" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking2" style="display: inline-block"></div><div id="yRankblock2_1" style="display:inline-block">( </div></td>
                                  <td style="width: 50%"><img id="rankingImg2" src="" width="20px" height="15px"><div id="yRankblock2_2" style="display:inline-block"> )</div></td>
                               </tr>
                           </table>
					</div>
				</a>
				<a id="gridItem3" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking3" style="width: 10%"></div>
					<div class="title title--preview" id="systemName3" style="width: 40%"></div>
					<div class="title title--preview" id="useMenu3" style="width: 20%"></div>
					<div class="title title--preview" id="totalData3" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking3" style="display: inline-block"></div><div id="yRankblock3_1" style="display:inline-block">( </div></td>
                                  <td style="width: 50%"><img id="rankingImg3" src="" width="20px" height="15px"><div id="yRankblock3_2" style="display:inline-block"> )</div></td>
                               </tr>
                           </table>
                       </div>
				</a>
				<a id="gridItem4" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking4" style="width: 10%"></div>
					<div class="title title--preview" id="systemName4" style="width: 40%"></div>
					<div class="title title--preview" id="useMenu4" style="width: 20%"></div>
					<div class="title title--preview" id="totalData4" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                           <tr style="height: inherit">
                              <td style="width: 50%" align="right"><div id="yRanking4" style="display: inline-block"></div><div id="yRankblock4_1" style="display:inline-block">( </div></td>
                              <td style="width: 50%"><img id="rankingImg4" src="" width="20px" height="15px"><div id="yRankblock4_2" style="display:inline-block"> )</div></td>
                           </tr>
                           </table>
					</div>
				</a>
				<a id="gridItem5" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking5" style="width: 10%"></div>
					<div class="title title--preview" id="systemName5" style="width: 40%"></div>
					<div class="title title--preview" id="useMenu5" style="width: 20%"></div>
					<div class="title title--preview" id="totalData5" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                           <tr style="height: inherit">
                              <td style="width: 50%" align="right"><div id="yRanking5" style="display: inline-block"></div><div id="yRankblock5_1" style="display:inline-block">( </div></td>
                              <td style="width: 50%"><img id="rankingImg5" src="" width="20px" height="15px"><div id="yRankblock5_2" style="display:inline-block"> )</div></td>
                           </tr>
                           </table>
					</div>
				</a>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">	
        var selectorNum = 1;
        var gridNum = 1;
        var dataNum = 5;
        
        // ajax함수 및 그리드선택 함수 호출
        function toggletextColor(){
            rotatetextColor(gridNum);
            getBucCmmnLoadinfouserchartdbAjax(chartNum);
        }
        
        function setGridNum() {
		    if(gridNum > 5) {
		    	gridNum = 1;
		    } else {
    		    gridNum++;
		    }
        }
        
        function initDataNum() {
        	if(entire == 0) {
    			if(design == 10) {
					if(constru == 20) {
						if(mainte == 30){
							if(ferc == 40) {
								if(entire == 0) {
									dataNum = 10;
								} else {
									dataNum = 0;
								}
							} else {
								dataNum = 40;
							}
						} else {
							dataNum = 30;
						}
					} else {
						dataNum = 20;
					}
				}
    		} else if(0 < entire && entire <=5) {
    			dataNum = entire;
    			if(dataNum == entire) {
    				if(design == 10) {
						if(constru == 20) {
							if(mainte == 30){
								if(ferc == 40) {
									if(entire == 0) {
										dataNum = 10;
									} else {
										dataNum = 0;
									}
								} else {
									dataNum = 40;
								}
							} else {
								dataNum = 30;
							}
						} else {
							dataNum = 20;
						}
					}
    			}
    		} else if(5 < entire && entire <= 10) {
    			dataNum = 5;
    			if(dataNum == entire) {
    				if(design == 10) {
						if(constru == 20) {
							if(mainte == 30){
								if(ferc == 40) {
									if(entire == 0) {
										dataNum = 10;
									} else {
										dataNum = 0;
									}
								} else {
									dataNum = 40;
								}
							} else {
								dataNum = 30;
							}
						} else {
							dataNum = 20;
						}
					}
    			}
    		}
        }
	    
        //그리드 데이터 초기화 함수
        function initGrid() {
        	if(griddata[chartNum] != null) {
        		usesystem = griddata[chartNum].hgrn_systm_cd;
        		userid = griddata[chartNum].rtur_id;
        	} else {
        		usesystem = '';
        		userid = '';
        	}
        	for(var i =0; i< 5; i++) {
        		if(griddata[i] != null) {
	        		$('#tRanking' + (i+1)).text(griddata[i].rank);
	            	$('#systemName' + (i+1)).text(griddata[i].kor_dptnm);
	            	$('#useMenu' + (i+1)).text(griddata[i].rtur_nm);
	            	$('#totalData' + (i+1)).text(griddata[i].cnt);
	            	$('#yRankblock' + (i+1) + '_1').text('( ');
	            	$('#yRankblock' + (i+1) + '_2').text(' )');
	            	if(griddata[i].y_rank == null){
	            		$('#yRanking' + (i+1)).text("");
	            		$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/uparrow.png");
	            	} else {
	            		$('#yRanking' + (i+1)).text(griddata[i].y_rank);
	            		if(parseInt(griddata[i].y_rank) > parseInt(griddata[i].rank))
	            			$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/uparrow.png");
	            		else if(parseInt(griddata[i].y_rank) < parseInt(griddata[i].rank))
	            			$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/downarrow.png");
	            		else
	            			$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/minus.png");
	            	}
        		} else {
	        		$('#tRanking' + (i+1)).text('');
	            	$('#systemName' + (i+1)).text('');
	            	$('#useMenu' + (i+1)).text('');
	            	$('#totalData' + (i+1)).text('');
	            	$('#yRanking' + (i+1)).text('');
	            	$('#yRankblock' + (i+1) + '_1').text('');
	            	$('#yRankblock' + (i+1) + '_2').text('');
					$('#rankingImg' + (i+1)).attr('src', "");
        		}
        	}
        }
        
        function initGridSelection() {
        	$('#gridItem1').css('color', '#fff');
            $('#gridItem2').css('color', '#fff');
            $('#gridItem3').css('color', '#fff');
            $('#gridItem4').css('color', '#fff');
            $('#gridItem5').css('color', '#fff');
        }
        
        // 그리드 애니메이션 효과 타이머
	    function changeSelection() {
	    	animation = setInterval(function() {	    		
				rotateSystem(selectorNum, dataNum);	  
				selectorNum++;
				rotateCnt++;
				dataNum++;
				if(rotateCnt % 5 ==0) {
					clearInterval(animation);
					selectorNum = 1;
					if(0 <= dataNum && dataNum < 10) {
						if(entire == 0) {
							if(design == 10) {
								if(constru == 20){
									if(mainte == 30) {
										if(ferc == 40) {
											dataNum = 0;
										} else {
											dataNum = 40;
										}
									} else {
										dataNum = 30;
									}
								} else {
									dataNum = 20;
								}
							} else {
								dataNum = 10;
							}
						} else {
							if(dataNum >= entire) {
								if(design == 10) {
									if(constru == 20){
										if(mainte == 30) {
											if(ferc == 40) {
												dataNum = 0;
											} else {
												dataNum = 40;
											}
										} else {
											dataNum = 30;
										}
									} else {
										dataNum = 20;
									}
								} else {
									dataNum = 10;
								}
							}
						}
					} else if(10 <= dataNum && dataNum < 20) {
						if(design == 10) {
							if(constru == 20) {
								if(mainte == 30){
									if(ferc == 40) {
										if(entire == 0) {
											dataNum = 10;
										} else {
											dataNum = 0;
										}
									} else {
										dataNum = 40;
									}
								} else {
									dataNum = 30;
								}
							} else {
								dataNum = 20;
							}
						} else {
							if(dataNum >= design) {
								if(constru == 20) {
									if(mainte == 30){
										if(ferc == 40) {
											if(entire == 0) {
												dataNum = 10;
											} else {
												dataNum = 0;
											}
										} else {
											dataNum = 40;
										}
									} else {
										dataNum = 30;
									}
								} else {
									dataNum = 20;
								}
							}
						}
					} else if(20 <= dataNum && dataNum < 30) {
						if(constru == 20) {
							if(mainte == 30) {
								if(ferc == 40){
									if(entire == 0) {
										if(design == 10) {
											dataNum = 20;
										} else {
											dataNum = 10;
										}
									} else {
										dataNum = 0;
									}
								} else {
									dataNum = 40;
								}
							} else {
								dataNum = 30;
							}
						} else {
							if(dataNum >= constru) {
								if(mainte == 30) {
									if(ferc == 40){
										if(entire == 0) {
											if(design == 10) {
												dataNum = 20;
											} else {
												dataNum = 10;
											}
										} else {
											dataNum = 0;
										}
									} else {
										dataNum = 40;
									}
								} else {
									dataNum = 30;
								}
							}
						}
					} else if(30 <= dataNum && dataNum < 40) {
						if(mainte == 30) {
							if(ferc == 40) {
								if(entire == 0){
									if(design == 10) {
										if(constru == 20) {
											dataNum = 30;
										} else {
											dataNum = 20;
										}
									} else {
										dataNum = 10;
									}
								} else {
									dataNum = 0;
								}
							} else {
								dataNum = 40;
							}
						} else {
							if(dataNum >= mainte) {
								if(ferc == 40) {
									if(entire == 0){
										if(design == 10) {
											if(constru == 20) {
												dataNum = 30;
											} else {
												dataNum = 20;
											}
										} else {
											dataNum = 10;
										}
									} else {
										dataNum = 0;
									}
								} else {
									dataNum = 40;
								}
							}
						}
					} else if(40 <= dataNum && dataNum < 50) {
						if(ferc == 40) {
							if(entire == 0) {
								if(design == 10){
									if(constru == 20) {
										if(mainte == 30) {
											dataNum = 40;
										} else {
											dataNum = 30;
										}
									} else {
										dataNum = 20;
									}
								} else {
									dataNum = 10;
								}
							} else {
								dataNum = 0;
							}
						} else {
							if(dataNum >= ferc) {
								if(entire == 0) {
									if(design == 10){
										if(constru == 20) {
											if(mainte == 30) {
												dataNum = 40;
											} else {
												dataNum = 30;
											}
										} else {
											dataNum = 20;
										}
									} else {
										dataNum = 10;
									}
								} else {
									dataNum = 0;
								}
							}
						}
					}
				}
			}, 700);
	    }
        
        //차트 ajax 파라메터 셋팅 함수
        function setParmas(chartNum) {
		    if(griddata[chartNum] != null) {
        		usesystem = griddata[chartNum].hgrn_systm_cd;
        		userid = griddata[chartNum].rtur_id;
        	} else {
        		usesystem = '';
        		userid = '';
        	}
        }
        
	    // 그리드 애니메이션 효과 함수
        function rotateSystem(selectorNum, dataNum) {
	        if(dataNum >=0 && dataNum < 10)
				$('#systext').text('[전체]');
			else if(dataNum >= 10 && dataNum < 20)
				$('#systext').text('[설계]');    
			else if(dataNum >= 20 && dataNum < 30)
				$('#systext').text('[건설]');   
			else if(dataNum >= 30 && dataNum < 40)
				$('#systext').text('[유지관리]');   
			else if(dataNum >= 40 && dataNum < 50)
				$('#systext').text('[시설물]');   
	        	
     			$("#gridItem" + selectorNum).addClass("grid__item--animate");
     		 	setTimeout(function() {
      		 		if(griddata[dataNum] != null){
	       		 		$('#tRanking' + selectorNum).text(griddata[dataNum].rank);
	                	$('#systemName' + selectorNum).text(griddata[dataNum].kor_dptnm);
	                	$('#useMenu' + selectorNum).text(griddata[dataNum].rtur_nm);
	                	$('#totalData' + selectorNum).text(griddata[dataNum].cnt);
	                	$('#yRankblock' + selectorNum + '_1').text('( ');
	                	$('#yRankblock' + selectorNum + '_2').text(' )');
	                	if(griddata[dataNum].y_rank == null){
	                		$('#yRanking' + selectorNum).text("");
	                		$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                	} else {
	                		$('#yRanking' + selectorNum).text(griddata[dataNum].y_rank);
	                		if(parseInt(griddata[dataNum].y_rank) > parseInt(griddata[dataNum].rank))
	                			$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                		else if(parseInt(griddata[dataNum].y_rank) < parseInt(griddata[dataNum].rank))
	                			$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                		else
	                			$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/minus.png");
	                	}	
      		 		} else {
	       		 		$('#tRanking' + selectorNum).text("");
	                	$('#systemName' + selectorNum).text("");
	                	$('#useMenu' + selectorNum).text("");
	                	$('#totalData' + selectorNum).text("");
	                	$('#yRanking' + selectorNum).text("");
	                	$('#yRankblock' + selectorNum + '_1').text('');
	                	$('#yRankblock' + selectorNum + '_2').text('');
	                	$('#rankingImg' + selectorNum).attr('src', "");	                	
      		 		}                	
                   $("#gridItem" + selectorNum).removeClass("grid__item--animate");
               }, 350);	 
            
        }
        
        // 그리드 행선택 효과 함수
        function rotatetextColor(gridNum){
            if(gridNum == 1){
                $('#gridItem' + gridNum).css('color', '#fff');
                $('#gridItem' + (gridNum+1)).css('color', '#cccccc');
                $('#gridItem' + (gridNum+2)).css('color', '#cccccc');
                $('#gridItem' + (gridNum+3)).css('color', '#cccccc');
                $('#gridItem' + (gridNum+4)).css('color', '#cccccc');
                gridNum=1;
            } else if(gridNum == 2) {
                $('#gridItem' + (gridNum-1)).css('color', '#cccccc');
                $('#gridItem' + (gridNum)).css('color', '#fff');
                $('#gridItem' + (gridNum+1)).css('color', '#cccccc');
                $('#gridItem' + (gridNum+2)).css('color', '#cccccc');
                $('#gridItem' + (gridNum+3)).css('color', '#cccccc');
                gridNum=3;
            } else if(gridNum == 3) {
                $('#gridItem' + (gridNum-2)).css('color', '#cccccc');
                $('#gridItem' + (gridNum-1)).css('color', '#cccccc');
                $('#gridItem' + (gridNum)).css('color', '#fff');
                $('#gridItem' + (gridNum+1)).css('color', '#cccccc');
                $('#gridItem' + (gridNum+2)).css('color', '#cccccc');
                gridNum=4;
            } else if(gridNum == 4) {
                $('#gridItem' + (gridNum-3)).css('color', '#cccccc');
                $('#gridItem' + (gridNum-2)).css('color', '#cccccc');
                $('#gridItem' + (gridNum-1)).css('color', '#cccccc');
                $('#gridItem' + (gridNum)).css('color', '#fff');
                $('#gridItem' + (gridNum+1)).css('color', '#cccccc');
                gridNum=5;
            } else if(gridNum == 5) {
                $('#gridItem' + (gridNum-4)).css('color', '#cccccc');
                $('#gridItem' + (gridNum-3)).css('color', '#cccccc');
                $('#gridItem' + (gridNum-2)).css('color', '#cccccc');
                $('#gridItem' + (gridNum-1)).css('color', '#cccccc');
                $('#gridItem' + (gridNum)).css('color', '#fff');
                gridNum=6;
            }           
        }       
        
       
	</script>
</body>
</html>