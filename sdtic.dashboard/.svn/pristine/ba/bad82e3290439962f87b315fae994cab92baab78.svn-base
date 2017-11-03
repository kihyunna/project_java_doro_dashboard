<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>수집/중계 서버</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcRlayServerView.js"></script>
	    
	    <script type="text/javascript">
            $(window).load(function(){
            	//이벤트
			    if(window.addEventListener) {
					window.addEventListener("message", uf_receiveMessage, false);
				}else if(window.attachEvent) {  //IE에서 이벤트 등록
					window.attachEvent("onmessage", uf_receiveMessage);
				}
            	
                initData();
                setDivHeight('main');
                setBorderDivHeight('mainBorder');
            });
            
            //리사이즈
            $(window).resize(function(){
                setDivHeight('main');
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
	    <div id="main" style="width:600px;height:255px;z-index:10;"></div>
	    <div id="mainBorder" style="position:absolute;top:0px;left:0px;width:590px;height:255px;border:solid 5px #f00;display:none;z-index:1;"></div>
	
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	        function initData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcRlayServer.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    : 'SVR'
                    },
                    success :function(json) {
                        var cnt1 = 0;
                        var cnt2 = 0;
                        var temp = "";
                        
                        for(var i=0;i<json.data.length;i++){
                            if(temp != json.data[i].group1){
                                timeLineData[cnt1] = json.data[i].group1_name;                                
                                temp = json.data[i].group1;
                                cnt1++;
                            }
                        }
                        
                        for(var i=0;i<timeLineData.length;i++){
                        	data[timeLineData[i]] = new Array();
                        	
                        	for(var j=0;j<json.data.length;j++){
                                if(timeLineData[i] == json.data[j].group1_name){
                                	data[timeLineData[i]][cnt2] = [json.data[j].group2_name, json.data[j].disk, json.data[j].cpu, json.data[j].memory];
                                    cnt2++;
                                }else{
                                    cnt2 = 0;
                                }
                            }
                        }
                        
                        var maxLength = 0;
                        var tmpLength = 0;
                        for(var i=0;i<timeLineData.length;i++){
                        	if(data[timeLineData[i]].length > maxLength){
                        		maxLength = data[timeLineData[i]].length;
                        	}
                        }
                        for(var i=0;i<timeLineData.length;i++){
                        	tmpLength = data[timeLineData[i]].length;
                            if(tmpLength < maxLength){
                            	for(var j=0;j<maxLength - tmpLength;j++){
                            		data[timeLineData[i]][tmpLength + j] = [];
                            	}
                            }
                        }
                        
                        //임계치 세팅
                        for(var i=0;i<json.limit.length;i++){
                        	if(json.limit[i].detailclse == "CPU"){
                        		limitCpuValue = json.limit[i].thrhld;
                    		}else if(json.limit[i].detailclse == "MEM"){
                    			limitMemoryValue = json.limit[i].thrhld;
                    		}else if(json.limit[i].detailclse == "DISK"){
                    			limitDiskValue = json.limit[i].thrhld;
                    		}
                        }
                        
                        for (var i = 0; i < timeLineData.length; i++) {
                            option.baseOption.timeline.data.push(timeLineData[i]);
                            option.options.push({
                            	//차트 배경색
                                //backgroundColor: '#000',
                                //상단 legend DISK, CPU, MEMORY 색상입니다.
                                color: [diskColor, '#fff', cpuColor, '#fff', memoryColor, '#fff'],
                                legend: [{
                                    show: true,
                                    x : 'right',
                                    y : 'top',
                                    data: ['DISK', 'CPU', 'MEMORY']
                                }],
                                series: createSeries(data[timeLineData[i]])
                            });
                        }             
                        myChart.setOption(option);  
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
            
            function getData(currentIndex){
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcRlayServer.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    : 'SVR'
                    },
                    success :function(json) {
                        var cnt = 0;
                        
                        for(var i=0;i<timeLineData.length;i++){
                            for(var j=0;j<json.data.length;j++){
                                if(timeLineData[i] == json.data[j].group1_name){
                                    data[timeLineData[i]][cnt] = [json.data[j].group2_name, json.data[j].disk, json.data[j].cpu, json.data[j].memory];
                                    cnt++;                                    
                                }else{
                                    cnt = 0;
                                }
                            }
                        }
                        
                        for(var i=0;i<timeLineData.length;i++){
                        	option.options[i].series = createSeries(data[timeLineData[i]]);
                        }
                        
                        option.baseOption.timeline.currentIndex = currentIndex;
                        myChart.setOption(option);
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
            
            myChart.on('timelinechanged', function (params) {
                getData(params.currentIndex);
            });
            
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
							setErrorBorder(true);
						}
	        		}
	        	}
			}
	    </script>
	</body>
</html>