<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>빅데이타 분석#2</title> 
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/main/MainBigData2View.js"></script>
	    
	    <script type="text/javascript">
            $(window).load(function(){
            	//이벤트
			    if(window.addEventListener) {
					window.addEventListener("message", uf_receiveMessage, false);
				}else if(window.attachEvent) {  //IE에서 이벤트 등록
					window.attachEvent("onmessage", uf_receiveMessage);
				}
            	
                getData();
                timeTicketRunFnc();
                
                setDivHeight('main');
                setBorderDivHeight('mainBorder');
            });
            
            //리사이즈
            $(window).resize(function(){
                setDivHeight('main');
                setBorderDivHeight('mainBorder');
            });
            
            function setDivHeight(objSet){ 
                var objSet   = document.getElementById(objSet); 
                objSet.style.width  = ($(window).width()) + "px";
                objSet.style.height  = ($(window).height()) + "px";
                
                $(objSet).width(($(window).width()) + "px");
                $(objSet).height(($(window).height()) + "px");
                
                myChart.resize({
                    width: $(window).width(),
                    height : $(window).height()
                });
            } 
            
            function setBorderDivHeight(objSet){ 
            	var objSet   = document.getElementById(objSet); 
                objSet.style.width  = ($(window).width() - 10) + "px";
                objSet.style.height  = ($(window).height() - 10) + "px";
                
                $(objSet).width(($(window).width() - 10) + "px");
                $(objSet).height(($(window).height() - 10) + "px");
            }
            
            function uf_receiveMessage(e){
				var command = e.data.command;
				switch(command){
					case 'ifcDiskError' : {
						setError(e.data.data.data);
			            break;
			        }
					case 'ifcNetError' : {
						setError(e.data.data.data);
			            break;
			        }
					case 'ifcAllClear' : {
						setErrorBorder(false);
			            break;
			        }
			        default : {
			        	break;
			        } 
			    }
			}
        </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <div id="main" style="width:260px;height:120px;z-index:10;"></div>
	    <div id="mainBorder" style="position:absolute;top:0px;left:0px;width:250px;height:110px;border:solid 5px #f00;display:none;z-index:1;"></div>
	
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	        var cpuData = 0;
            var memoryData = 0;
            var diskData = 0;
            
            var chkStyle = /\d/;
            var widgetTimer = 60000 * 1;	//1분
            var paramWidgetTimer = "${param.widgetTimer}";
            if(paramWidgetTimer != null){
            	if(chkStyle.test(paramWidgetTimer)){
            		if(paramWidgetTimer != 0){
            			widgetTimer = paramWidgetTimer;
            		}
            	}
            }
            
            function getData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/main/mainBigData2.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'hostname'    : 'cclwas035'
                    },
                    success :function(json) {
                        cpuData = 0;
                        memoryData = 0;
                        diskData = 0;
                        
                      	//DISK
                        if(json.data[0] != null && json.data[0].disk != null){
                            diskData = json.data[0].disk;
                        }
                        option.series[0].data[0].value = diskData;
                        
                        //CPU
                        if(json.data[0] != null && json.data[0].cpu != null){
                            cpuData = json.data[0].cpu;
                        }
                        option.series[1].data[0].value = cpuData;
                        
                        //MEMORY
                        if(json.data[0] != null && json.data[0].memory != null){
                            memoryData = json.data[0].memory;
                        }
                        option.series[2].data[0].value = memoryData;
                        
                        myChart.setOption(option);                      
                    },error : function(){
                        console.log(arguments);
                    }
                });

            	myChart.setOption(option);  
            }
	
			var timeTicketRun;
	        
	        function timeTicketRunFnc(){
	        	timeTicketRun = setInterval(function (){
	            	//데이터 가져오기
                    getData();
		        }, widgetTimer);
	        }
	        
	        function setErrorBorder(isError){
	        	if(isError){
	        		$("#mainBorder").show();
	        	}else{
	        		$("#mainBorder").hide();
	        	}
	        }
	        
	        function setError(val){
	        	if(val != "" && val != null && val != "undefined"){
	        		var valArr = new Array();
		        	valArr = val.split(",");
		        	
		        	if(valArr.length > 3){
			        	var gubun = valArr[0];
			        	var group1 = valArr[1];
			        	var group2 = valArr[2];
			        	var hostname = valArr[3];
			        	
						if(gubun == "SVR"){
							if(group2 == "BDS"){
								if(hostname == "cclwas035"){
									setErrorBorder(true);
								}
							}
						}
	        		}
	        	}
			}
	    </script>
	</body>
</html>