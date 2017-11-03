<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
    <head>
    <meta charset="utf-8" />
    <title>데이타베이스</title>
    <!-- including ECharts file -->
        <c:set var="contextPath" value="${pageContext.request.contextPath}" />
        
        <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
    
        <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    
        <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
        <script type="text/javascript" src="${contextPath}/js/main/MainDatabaseView.js"></script>
        
        <style type="text/css">
            
            #grid1 {position:absolute;top:0%;left:2%;}
            #grid2 {position:absolute;top:0%;right:2%;}
            #grid3 {position:absolute;bottom:2%;left:2%;}
            #grid4 {position:absolute;bottom:2%;right:2%;}
        </style>
        
        <script type="text/javascript">
            $(window).load(function(){
            	//이벤트
			    if(window.addEventListener) {
					window.addEventListener("message", uf_receiveMessage, false);
				}else if(window.attachEvent) {  //IE에서 이벤트 등록
					window.attachEvent("onmessage", uf_receiveMessage);
				}
            	
                getData(0);
                
                setDivHeight('main');
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
        <div id="main" style="width:600px;height:435px;z-index:10;"></div>
        <div id="mainBorder" style="position:absolute;top:0px;left:0px;width:590px;height:110px;border:solid 5px #f00;display:none;z-index:1;"></div>
        <div id="grid1">
            <table class="tblWgt tp04">
                <tbody>
 					<tr><th id="drTitle" scope="col" colspan="2" class="titS" style="color:#D6A569"></th></tr>
                    <tr><th scope="row">DISK</th><td id="drDisk"></td></tr>
                    <tr><th scope="row">CPU</th><td id="drCpu"></td></tr>
                    <tr><th scope="row">MEMORY</th><td id="drMemory"></td></tr>
                </tbody>
            </table>
        </div>

        <div id="grid2">
            <table class="tblWgt tp04">
                <tbody>
 					<tr><th id="ssTitle" scope="col" colspan="2" class="titS" style="color:#8CBC64"></th></tr>
                    <tr><th scope="row">DISK</th><td id="ssDisk"></td></tr>
                    <tr><th scope="row">CPU</th><td id="ssCpu"></td></tr>
                    <tr><th scope="row">MEMORY</th><td id="ssMemory"></td></tr>
                </tbody>
            </table>
        </div>

        <div id="grid3">
            <table class="tblWgt tp04">
                <tbody>
 					<tr><th id="bdTitle" scope="col" colspan="2" class="titS" style="color:#5AD6CE"></th></tr>
                    <tr><th scope="row">DISK</th><td id="bdDisk"></td></tr>
                    <tr><th scope="row">CPU</th><td id="bdCpu"></td></tr>
                    <tr><th scope="row">MEMORY</th><td id="bdMemory"></td></tr>
                </tbody>
            </table>
        </div>

        <div id="grid4">
            <table class="tblWgt tp04">
                <tbody>
 					<tr><th id="gjTitle" scope="col" colspan="2" class="titS" style="color:#6373C6"></th></tr>
                    <tr><th scope="row">DISK</th><td id="gjDisk"></td></tr>
                    <tr><th scope="row">CPU</th><td id="gjCpu"></td></tr>
                    <tr><th scope="row">MEMORY</th><td id="gjMemory"></td></tr>
                </tbody>
            </table>
        </div>
        <script type="text/javascript">
            var myChart = echarts.init(document.getElementById('main'), 'dark');
            myChart.setOption(option);
            
            var indexCnt = 0;
			
            var drTitle = "";
            var drDiskData = 0;
            var drCpuData = 0;
            var drMemoryData = 0;
            var arrDrData = new Array();
            
            var ssTitle = "";
            var ssDiskData = 0;
            var ssCpuData = 0;
            var ssMemoryData = 0;
            var arrSsData = new Array();
            
            var bdTitle = "";
            var bdDiskData = 0;
            var bdCpuData = 0;
            var bdMemoryData = 0;
            var arrBdData = new Array();
            
            var gjTitle = "";
            var gjDiskData = 0;
            var gjCpuData = 0;
            var gjMemoryData = 0;
            var arrGjData = new Array();
            
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
            
            function getData(index){
            	$.ajax({
                    url : "${pageContext.request.contextPath}/main/mainDatabase.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    : 'DB',
                        'group1'   : 'DBM'
                    },
                    success :function(json) {
                    	TOTAL_ALL = [];
                    	deviceData = [];
                    	
                    	drTitle = json.data[0].group2_name;
                    	drDiskData = json.data[0].disk;
                    	drCpuData = json.data[0].cpu;
                    	drMemoryData = json.data[0].memory;
                    	arrDrData = [];
                    	
                    	$("#drTitle").html(drTitle);
                    	$("#drDisk").html(drDiskData + "%");
                    	$("#drCpu").html(drCpuData + "%");
                    	$("#drMemory").html(drMemoryData + "%");
                    	
                    	if(drDiskData != 0){
                    		drDiskData = Math.round(drDiskData/10);
                    		if(drDiskData == 0){
                    			drDiskData = 1;
                    		}
                    	}
                    	if(drCpuData != 0){
                    		drCpuData = Math.round(drCpuData/10);
                    		if(drCpuData == 0){
                    			drCpuData = 1;
                    		}
                    	}
                    	if(drMemoryData != 0){
                    		drMemoryData = Math.round(drMemoryData/10);
                    		if(drMemoryData == 0){
                    			drMemoryData = 1;
                    		}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<drDiskData){
        						arrDrData.push(1);
        					}else{
        						arrDrData.push(0);
        					}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<drCpuData){
        						arrDrData.push(1);
        					}else{
        						arrDrData.push(0);
        					}
                    	}
        				for(var i=0;i<STEP;i++){
        					if(i<drMemoryData){
        						arrDrData.push(1);
        					}else{
        						arrDrData.push(0);
        					}
                    	}
        				
        				ssTitle = json.data[1].group2_name;
                    	ssDiskData = json.data[1].disk;
                    	ssCpuData = json.data[1].cpu;
                    	ssMemoryData = json.data[1].memory;
                    	arrSsData = [];
                    	
                    	$("#ssTitle").html(ssTitle);
                    	$("#ssDisk").html(ssDiskData + "%");
                    	$("#ssCpu").html(ssCpuData + "%");
                    	$("#ssMemory").html(ssMemoryData + "%");
                    	
                    	if(ssDiskData != 0){
                    		ssDiskData = Math.round(ssDiskData/10);
                    		if(ssDiskData == 0){
                    			ssDiskData = 1;
                    		}
                    	}
                    	if(ssCpuData != 0){
                    		ssCpuData = Math.round(ssCpuData/10);
                    		if(ssCpuData == 0){
                    			ssCpuData = 1;
                    		}
                    	}
                    	if(ssMemoryData != 0){
                    		ssMemoryData = Math.round(ssMemoryData/10);
                    		if(ssMemoryData == 0){
                    			ssMemoryData = 1;
                    		}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<ssDiskData){
        						arrSsData.push(1);
        					}else{
        						arrSsData.push(0);
        					}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<ssCpuData){
        						arrSsData.push(1);
        					}else{
        						arrSsData.push(0);
        					}
                    	}
        				for(var i=0;i<STEP;i++){
        					if(i<ssMemoryData){
        						arrSsData.push(1);
        					}else{
        						arrSsData.push(0);
        					}
                    	}
        				
        				bdTitle = json.data[2].group2_name;
        				bdDiskData = json.data[2].disk;
                    	bdCpuData = json.data[2].cpu;
                    	bdMemoryData = json.data[2].memory;
                    	arrBdData = [];
                    	
                    	$("#bdTitle").html(bdTitle);
                    	$("#bdDisk").html(bdDiskData + "%");
                    	$("#bdCpu").html(bdCpuData + "%");
                    	$("#bdMemory").html(bdMemoryData + "%");
                    	
                    	if(bdDiskData != 0){
                    		bdDiskData = Math.round(bdDiskData/10);
                    		if(bdDiskData == 0){
                    			bdDiskData = 1;
                    		}
                    	}
                    	if(bdCpuData != 0){
                    		bdCpuData = Math.round(bdCpuData/10);
                    		if(bdCpuData == 0){
                    			bdCpuData = 1;
                    		}
                    	}
                    	if(bdMemoryData != 0){
                    		bdMemoryData = Math.round(bdMemoryData/10);
                    		if(bdMemoryData == 0){
                    			bdMemoryData = 1;
                    		}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<bdDiskData){
        						arrBdData.push(1);
        					}else{
        						arrBdData.push(0);
        					}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<bdCpuData){
        						arrBdData.push(1);
        					}else{
        						arrBdData.push(0);
        					}
                    	}
        				for(var i=0;i<STEP;i++){
        					if(i<bdMemoryData){
        						arrBdData.push(1);
        					}else{
        						arrBdData.push(0);
        					}
                    	}
        				
        				gjTitle = json.data[3].group2_name;
        				gjDiskData = json.data[3].disk;
                    	gjCpuData = json.data[3].cpu;
                    	gjMemoryData = json.data[3].memory;
                    	arrGjData = [];
                    	
                    	$("#gjTitle").html(gjTitle);
                    	$("#gjDisk").html(gjDiskData + "%");
                    	$("#gjCpu").html(gjCpuData + "%");
                    	$("#gjMemory").html(gjMemoryData + "%");
                    	
                    	if(gjDiskData != 0){
                    		gjDiskData = Math.round(gjDiskData/10);
                    		if(gjDiskData == 0){
                    			gjDiskData = 1;
                    		}
                    	}
                    	if(gjCpuData != 0){
                    		gjCpuData = Math.round(gjCpuData/10);
                    		if(gjCpuData == 0){
                    			gjCpuData = 1;
                    		}
                    	}
                    	if(gjMemoryData != 0){
                    		gjMemoryData = Math.round(gjMemoryData/10);
                    		if(gjMemoryData == 0){
                    			gjMemoryData = 1;
                    		}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<gjDiskData){
        						arrGjData.push(1);
        					}else{
        						arrGjData.push(0);
        					}
                    	}
                    	for(var i=0;i<STEP;i++){
        					if(i<gjCpuData){
        						arrGjData.push(1);
        					}else{
        						arrGjData.push(0);
        					}
                    	}
        				for(var i=0;i<STEP;i++){
        					if(i<gjMemoryData){
        						arrGjData.push(1);
        					}else{
        						arrGjData.push(0);
        					}
                    	}
        				
        				if(index == 0){
                    		mvTable(index);
                    	}
                    	
                    	if(index == 1){
                    		mvTable(index);
                    	}
                    	
                    	if(index == 2){
                    		mvTable(index);
                    	}
                    	
                    	if(index == 3){
                    		mvTable(index);
                    	}
                    	
                    	for(var i=0;i<gubun.length;i++){
                    		if(i == 0){
                    			TOTAL_ALL[i] = arrDrData;
                    		}
                    		if(i == 1){
                    			TOTAL_ALL[i] = arrSsData;
                    		}
                    		if(i == 2){
                    			TOTAL_ALL[i] = arrBdData;
                    		}
                    		if(i == 3){
                    			TOTAL_ALL[i] = arrGjData;
                    		}
                    	}
                    	
                    	setDeviceData(index);
                    	
                    	option.series[1].data = deviceData[0];
                    	option.series[2].data = deviceData[1];
                    	option.series[3].data = deviceData[2];
                    	option.series[4].data = deviceData[3];
                    	
                    	myChart.setOption(option); 
                    	
                    	myChart.dispatchAction({
                            type: 'highlight',
                            seriesIndex: indexCnt+1
                        });
                    	
                    	setTimeout(function (){
        	            	myChart.dispatchAction({
        	                    type: 'downplay',
        	                    seriesIndex: indexCnt+1
        	                });
                    	},100);   
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
            
            function mvTable(index){
            	$('#drTitle').css("border","0px solid");
            	$('#ssTitle').css("border","0px solid");
            	$('#bdTitle').css("border","0px solid");
            	$('#gjTitle').css("border","0px solid");
            	
            	if(index == 0){
            		$('#drTitle').css("border","2px solid");
            	}else if(index == 1){
            		$('#ssTitle').css("border","2px solid");
            	}else if(index == 2){
            		$('#bdTitle').css("border","2px solid");
            	}else if(index == 3){
            		$('#gjTitle').css("border","2px solid");
            	}
            }
            
            timeTicketRun = setInterval(function (){
            	indexCnt++;
            	if(indexCnt == 4){
            		indexCnt = 0;
            	}
            	
            	//데이터 가져오기
                getData(indexCnt);
            }, widgetTimer);
            
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
			        	
						if(gubun == "DB"){
							setErrorBorder(true);
						}
	        		}
	        	}
			}
        </script>
    </body>
</html>
