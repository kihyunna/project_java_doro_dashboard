<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>WEB/WAS 성능</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/common/showModalDialog.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcWebPrfomncView.js"></script>
	
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/csshake.css">
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/magicTime.css">
	
	    <script type="text/javascript">	
	   		$(window).load(function(){
		    	//이벤트
			    if(window.addEventListener) {
					window.addEventListener("message", uf_receiveMessage, false);
				}else if(window.attachEvent) {  //IE에서 이벤트 등록
					window.attachEvent("onmessage", uf_receiveMessage);
				}
		    	
			    group1 = "COM";
	            initData();
	            
	            setDivHeight('main');
	            setBorderDivHeight('mainBorder');
	        });
	   		
	   		var group1 = "COM";
		    
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
					case 'runPrfomnc' : {
						group1 = e.data.data.group1Data;
			            initData();
			            break;
			        }
					case 'ifcConError' : {
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
	    <div id="main" style="width:600px;height:380px;z-index:10;"></div>
	    <div id="mainBorder" style="position:absolute;top:0px;left:0px;width:590px;height:380px;border:solid 5px #f00;display:none;z-index:1;"></div>
	
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	      	//임계치 설정(최대 수치는 70)
          	var max_limit = 70;
            var exec_cnt_limit = 0;
            var concurrent_vs_limit = 0;
            var avg_resp_time_limit = 0;
            var init_exec_cnt_limit = 50000;
            var init_concurrent_vs_limit = 500;
            var init_avg_resp_time_limit = 100;
	
	        function initData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcWebPrfomnc.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    : 'WEB',
                        'group1'   : group1
                    },
                    success :function(json) {
                        var cnt = 0;
                        var temp = "";
                        var gubunTemp = -1;
                        var cntTemp = 0;
                        timeLineData = [];
                        
                        for(var i=0;i<json.data.length;i++){
                            if(temp != json.data[i].group2){
                                timeLineData[cnt] = json.data[i].group2_name;                                
                                temp = json.data[i].group2;
                                cnt++;
                            }
                        }
                        
                        //초기화
                        for(var i=0;i<timeLineData.length;i++){
                            data[timeLineData[i]] = new Array();
                            for(var j=0;j<prfGubun.length;j++){
                        		for(var k=0;k<hours.length;k++){
                        			data[timeLineData[i]][k+(j*hours.length)] = new Array();
                                    data[timeLineData[i]][k+(j*hours.length)][0] = j;
                                    data[timeLineData[i]][k+(j*hours.length)][1] = k;
                                    data[timeLineData[i]][k+(j*hours.length)][2] = 0;
                        		}
                        	}
                        }
                        
                        exec_cnt_limit = init_exec_cnt_limit;
                        concurrent_vs_limit = init_concurrent_vs_limit;
                        avg_resp_time_limit = init_avg_resp_time_limit;
                        
                      	//MAX값 세팅
                      	for(var i=0;i<json.data.length;i++){
                            if(timeLineData[0] == json.data[i].group2_name){
                           		if(exec_cnt_limit < parseInt(json.data[i].exec_cnt)){
                           			exec_cnt_limit = json.data[i].exec_cnt;
                           		}
                           		if(concurrent_vs_limit < parseInt(json.data[i].concurrent_vs)){
                           			concurrent_vs_limit = json.data[i].concurrent_vs;
                           		}
                           		if(avg_resp_time_limit < parseInt(json.data[i].avg_resp_time)){
                           			avg_resp_time_limit = json.data[i].avg_resp_time;
                           		}
                            }
                        }
                        
                        //값세팅
                        for(var i=0;i<timeLineData.length;i++){
                            for(var j=0;j<json.data.length;j++){
                                if(timeLineData[i] == json.data[j].group2_name){
                                	for(var k=0;k<hours.length;k++){
                                		if(k == Number(json.data[j].hh)){
                                			data[timeLineData[i]][Number(json.data[j].hh)][2] = (parseInt(json.data[j].exec_cnt) * max_limit) / exec_cnt_limit;
                                			data[timeLineData[i]][Number(json.data[j].hh)+hours.length][2] = (parseInt(json.data[j].concurrent_vs) * max_limit) / concurrent_vs_limit;
                                			data[timeLineData[i]][Number(json.data[j].hh)+(hours.length*2)][2] = (parseInt(json.data[j].avg_resp_time) * max_limit) / avg_resp_time_limit;
                                		}
                                	}
                                }
                            }
                        }
                        
                        option.baseOption.timeline.data = [];
                        option.baseOption.timeline.autoPlay = true;
                        option.baseOption.timeline.currentIndex = 0;
                        
                        for (var i = 0; i < timeLineData.length; i++) {
						    option.baseOption.timeline.data.push(timeLineData[i]);
						
						    dataTmp0 = new Array();
						    dataTmp1 = new Array();
						    dataTmp2 = new Array();
						
						    for (var j = 0; j < data[timeLineData[i]].length; j++) {
						        if(data[timeLineData[i]][j][0] == 0){
						            dataTmp0.push(data[timeLineData[i]][j]);
						        }
						        if(data[timeLineData[i]][j][0] == 1){
						            dataTmp1.push(data[timeLineData[i]][j]);
						        }
						        if(data[timeLineData[i]][j][0] == 2){
						            dataTmp2.push(data[timeLineData[i]][j]);
						        }
						    }
						
						    dataTmp0 = dataTmp0.map(function (item) {
						        return [item[1], item[0], item[2]];
						    });
						    dataTmp1 = dataTmp1.map(function (item) {
						        return [item[1], item[0], item[2]];
						    });
						    dataTmp2 = dataTmp2.map(function (item) {
						        return [item[1], item[0], item[2]];
						    });
						
						    option.options.push({
						        title: [{
						            textBaseline: 'middle',
						            top: (0 + 0.5) * 80 / 3 + '%',
						            text: prfGubun[0],
						            textStyle: {
						                fontSize: 16
						            }
						        },{
						            textBaseline: 'middle',
						            top: (1 + 0.5) * 80 / 3 + '%',
						            text: prfGubun[1],
						            textStyle: {
						                fontSize: 16
						            }
						        },{
						            textBaseline: 'middle',
						            top: (2 + 0.5) * 80 / 3 + '%',
						            text: prfGubun[2],
						            textStyle: {
						                fontSize: 16
						            }
						        }],
						        //색상을 배열로 정의하면 차례에 맞게 색상이 표현됩니다.
						        //색상을 정의하지 않으면 기본색을 표현합니다.
						        //color: ['#ff0000','#00ff00','#0000ff', '#ffff00'],    //주석을 제거해서 테스트하시면 됩니다.
						        singleAxis: [{
						            left: 150,
						            type: 'category',
						            boundaryGap: false,
						            data: hours,
						            top: (0 * 80 / 3 + 5) + '%',
						            height: (80 / 3 - 10) + '%',
						            axisLabel: {
						                interval: 2
						            }
						        },
						        {
						            left: 150,
						            type: 'category',
						            boundaryGap: false,
						            data: hours,
						            top: (1 * 80 / 3 + 5) + '%',
						            height: (80 / 3 - 10) + '%',
						            axisLabel: {
						                interval: 2
						            }
						        },
						        {
						            left: 150,
						            type: 'category',
						            boundaryGap: false,
						            data: hours,
						            top: (2 * 80 / 3 + 5) + '%',
						            height: (80 / 3 - 10) + '%',
						            axisLabel: {
						                interval: 2
						            }
						        }],
						        series: [{
						            singleAxisIndex: 0,
						            coordinateSystem: 'singleAxis',
						            type: 'scatter',
						            data: dataTmp0,
						            symbolSize: function (dataItem) {
						                return dataItem[2] * 1;
						            }
						        },
						        {
						            singleAxisIndex: 1,
						            coordinateSystem: 'singleAxis',
						            type: 'scatter',
						            data: dataTmp1,
						            symbolSize: function (dataItem) {
						                return dataItem[2] * 1;
						            }
						        },
						        {
						            singleAxisIndex: 2,
						            coordinateSystem: 'singleAxis',
						            type: 'scatter',
						            data: dataTmp2,
						            symbolSize: function (dataItem) {
						                return dataItem[2] * 1;
						            }
						        }]
						
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
	                    url : "${pageContext.request.contextPath}/ifc/ifcWebPrfomnc.do",
	                    async : false,
	                    dataType : 'json',
	                    data:{
	                        'gubun'    : 'WEB',
	                        'group1'   : group1
	                    },
	                    success :function(json) {
	                        var temp = "";
	                        var gubunTemp = -1;
	                        var cntTemp = 0;
	                        
	                      	//초기화
                            for(var i=0;i<timeLineData.length;i++){
                                data[timeLineData[i]] = new Array();
                                for(var j=0;j<prfGubun.length;j++){
                            		for(var k=0;k<hours.length;k++){
                            			data[timeLineData[i]][k+(j*hours.length)] = new Array();
                                        data[timeLineData[i]][k+(j*hours.length)][0] = j;
                                        data[timeLineData[i]][k+(j*hours.length)][1] = k;
                                        data[timeLineData[i]][k+(j*hours.length)][2] = 0;
                            		}
                            	}
                            }
                            exec_cnt_limit = init_exec_cnt_limit;
                            concurrent_vs_limit = init_concurrent_vs_limit;
                            avg_resp_time_limit = init_avg_resp_time_limit;
                            
                          	//MAX값 세팅
                          	for(var i=0;i<json.data.length;i++){
                          		if(timeLineData[currentIndex] == json.data[i].group2_name){
                                	if(exec_cnt_limit < parseInt(json.data[i].exec_cnt)){
                                 		exec_cnt_limit = json.data[i].exec_cnt;
                               		}
                               		if(concurrent_vs_limit < parseInt(json.data[i].concurrent_vs)){
                               			concurrent_vs_limit = json.data[i].concurrent_vs;
                               		}
                               		if(avg_resp_time_limit < parseInt(json.data[i].avg_resp_time)){
                               			avg_resp_time_limit = json.data[i].avg_resp_time;
                               		}
                            	}
                            }
                          	
                          	//값세팅
                            for(var i=0;i<timeLineData.length;i++){
                                for(var j=0;j<json.data.length;j++){
                                    if(timeLineData[i] == json.data[j].group2_name){
                                    	for(var k=0;k<hours.length;k++){
                                    		if(k == Number(json.data[j].hh)){
                                    			data[timeLineData[i]][Number(json.data[j].hh)][2] = (parseInt(json.data[j].exec_cnt) * max_limit) / exec_cnt_limit;
                                    			data[timeLineData[i]][Number(json.data[j].hh)+hours.length][2] = (parseInt(json.data[j].concurrent_vs) * max_limit) / concurrent_vs_limit;
                                    			data[timeLineData[i]][Number(json.data[j].hh)+(hours.length*2)][2] = (parseInt(json.data[j].avg_resp_time_limit) * max_limit) / avg_resp_time_limit;
                                    		}
                                    	}
                                    }
                                }
                            }
	                        
	                        for (var i = 0; i < timeLineData.length; i++) {
	                            dataTmp0 = new Array();
	                            dataTmp1 = new Array();
	                            dataTmp2 = new Array();
	                        
	                            for (var j = 0; j < data[timeLineData[i]].length; j++) {
	                                if(data[timeLineData[i]][j][0] == 0){
	                                    dataTmp0.push(data[timeLineData[i]][j]);
	                                }
	                                if(data[timeLineData[i]][j][0] == 1){
	                                    dataTmp1.push(data[timeLineData[i]][j]);
	                                }
	                                if(data[timeLineData[i]][j][0] == 2){
	                                    dataTmp2.push(data[timeLineData[i]][j]);
	                                }
	                            }
	                        
	                            dataTmp0 = dataTmp0.map(function (item) {
	                                return [item[1], item[0], item[2]];
	                            });
	                            dataTmp1 = dataTmp1.map(function (item) {
	                                return [item[1], item[0], item[2]];
	                            });
	                            dataTmp2 = dataTmp2.map(function (item) {
	                                return [item[1], item[0], item[2]];
	                            });
	                            
	                            option.options[i].series[0].data = dataTmp0;                                
                                option.options[i].series[1].data = dataTmp1;                                
                                option.options[i].series[2].data = dataTmp2;
	                        }
	                        
	                        option.baseOption.timeline.currentIndex = currentIndex;
	                        myChart.setOption(option); 
	                    },error : function(){
	                        console.log(arguments);
	                    }
	                });
            }
	        
	      	//WEB서버 위젯으로 서버통신
	        function fn_tranServer(){
	        	var callCommandVariable = {
    	        	classType: "1",
    	        	command : "runWebSvr"
    	        };
	        	setTimeout(function(){
		        	parent.postMessage(callCommandVariable, "*");
	        	}, 1000);
	        }
	        	        
            myChart.on('timelinechanged', function (params) {
            	if(params.currentIndex == 0){
            		//멈춤
    	        	option.baseOption.timeline.autoPlay = false;
    	        	myChart.setOption(option);
    	        	
    	        	//웹서버 위젯에 통신
    	        	fn_tranServer();
            	}else{
                	getData(params.currentIndex);
            	}
            });

            function setErrorBorder(isError){
	        	if(isError){
	        		$("#mainBorder").show();
	        	}else{
	        		$("#mainBorder").hide();
	        	}
	        }
            
            function setError(val){
            	/*
	        	if(val != "" && val != null && val != "undefined"){
	        		var valArr = new Array();
		        	valArr = val.split(",");
		        	
		        	if(valArr.length > 3){
			        	var gubun = valArr[0];
			        	var group1 = valArr[1];
			        	var group2 = valArr[2];
			        	var hostname = valArr[3];
			        	
						if(gubun == "WEB"){
							setErrorBorder(true);
						}
	        		}
	        	}
            	*/
	        	//setErrorBorder(true);
			}
	    </script>
	</body>
</html>