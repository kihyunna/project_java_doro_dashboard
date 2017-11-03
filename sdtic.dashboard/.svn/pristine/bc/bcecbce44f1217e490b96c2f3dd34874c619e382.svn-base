<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>현장 중계기</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/macarons.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcSptServerView.js"></script>
	    
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
	    <div id="main" style="width:700px;height:255px;z-index:10;"></div>
	    <div id="mainBorder" style="position:absolute;top:0px;left:0px;width:690px;height:255px;border:solid 5px #f00;display:none;z-index:1;"></div>
	
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	        function initData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcSptServer.do",
                    async : false,
                    dataType : 'json',
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
                        	regionData[timeLineData[i]] = new Array();
                        	diskData[timeLineData[i]] = new Array();
                        	cpuData[timeLineData[i]] = new Array();
                        	memoryData[timeLineData[i]] = new Array();
                        	
                        	for(var j=0;j<json.data.length;j++){
                                if(timeLineData[i] == json.data[j].group1_name){
                                	regionData[timeLineData[i]][cnt2] = json.data[j].group2_name;
                                	diskData[timeLineData[i]][cnt2] = json.data[j].disk;
                                	cpuData[timeLineData[i]][cnt2] = json.data[j].cpu;
                                	memoryData[timeLineData[i]][cnt2] = json.data[j].memory;
                                    cnt2++;
                                }else{
                                    cnt2 = 0;
                                }
                            }
                        }
                        
                        for(var i =0;i<timeLineData.length;i++) {
        	                option.baseOption.timeline.data.push(timeLineData[i]);
        	                option.options.push({
        	                	xAxis: [{
        	                        gridIndex: 0,
        	                        show: false,
        	                        data: regionData[timeLineData[i]]
        	                    }, {
        	                        gridIndex: 1,
        	                        show: false,
        	                        data: regionData[timeLineData[i]]
        	                    }, {
        	                        gridIndex: 2,
        	                        data: regionData[timeLineData[i]]
        	                    }],
        	                    series: [
        	                        {
        	                            type: 'bar',
        	                            name: 'DISK',
        	                            xAxisIndex: 0,
        	                            yAxisIndex: 0,

        	                            data: diskData[timeLineData[i]]
        	                        },
        	                        {
        	                            type: 'bar',
        	                            name: 'CPU',
        	                            xAxisIndex: 1,
        	                            yAxisIndex: 1,

        	                            data: cpuData[timeLineData[i]]
        	                        },
        	                        {
        	                            type: 'bar',
        	                            name: 'MEMORY',
        	                            xAxisIndex: 2,
        	                            yAxisIndex: 2,

        	                            data: memoryData[timeLineData[i]]
        	                        }
        	                    ]
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
                	url : "${pageContext.request.contextPath}/ifc/ifcSptServer.do",
                    async : false,
                    dataType : 'json',
                    success :function(json) {
                        var cnt = 0;
                        
                        for(var i=0;i<timeLineData.length;i++){
                            for(var j=0;j<json.data.length;j++){
                                if(timeLineData[i] == json.data[j].group1_name){
                                	diskData[timeLineData[i]][cnt] = json.data[j].disk;
                                	cpuData[timeLineData[i]][cnt] = json.data[j].cpu;
                                	memoryData[timeLineData[i]][cnt] = json.data[j].memory;
                                	cnt++;                                    
                                }else{
                                    cnt = 0;
                                }
                            }
                        }
                        
                        for(var i=0;i<timeLineData.length;i++){
                        	option.options[i].series[0].data = diskData[timeLineData[i]];
                        	option.options[i].series[1].data = cpuData[timeLineData[i]];
                        	option.options[i].series[2].data = memoryData[timeLineData[i]];
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
			        	
						if(gubun == "SPT" || gubun == "TNL" || gubun == "ELC"){
							setErrorBorder(true);
						}
	        		}
	        	}
			}
	    </script>
	</body>
</html>