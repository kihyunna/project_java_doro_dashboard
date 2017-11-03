<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>서버 상태</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	    
	    <script type="text/javascript" src="${contextPath}/js/common/jquery.vortex.js"></script>
	
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/vortex.css">
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/magicTime.css">
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcMainServerView.js"></script>
	    
	    <script type="text/javascript">
		    $(window).load(function(){
		    	initData();
		    });
	    </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <table border="0" cellpadding="0" cellspacing="0">
	        <tr>
	            <td height="43" width="700" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;">
	                &nbsp;서버
	            </td>
	        </tr>
	        <tr>
	            <td height="2" style="background-color:#3d4146;">
	            </td>
	        </tr>
	        <tr>
	            <td height="70">
	                <div id="vortex" style="width:600px;height:70px;">
	                </div>
	            </td>
	        </tr>
	        <tr>
	            <td height="200">
	                <div id="main" style="width:700px;height:200px;"></div>
	            </td>
	        </tr>
	    </table>
	
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	        function initData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcMainServer.do",
                    async : false,
                    dataType : 'json',
                    data:{},
                    success :function(json) {
                        
                        var target = document.getElementById('vortex');
                        
                        for(var i=0;i<json.data.length;i++){
                        	var div = document.createElement("DIV");
                        	div.id = json.data[i].gubun+"_"+json.data[i].group1+"_"+json.data[i].group2;
                        	div.className = "square-button";
                        	
                        	var img = document.createElement("IMG");
                        	img.src = "${contextPath}/images/ifcrs/"+json.data[i].gubun+"_"+json.data[i].group1+"_"+json.data[i].group2+".png";
                        	
                        	div.appendChild(img);
                        	target.appendChild(div);
                        }
                        
                        $('#vortex').vortex({
                            speed : 10,
                            manualAdvance : true,
                            clockwise : false,
                            initialPosition : 270
                        });
                        
                        var cpuData = 0;
                        var memData = 0;
                        var diskData = 0;
                        var oppCpuData = 0;
                        var oppMemData = 0;
                        var oppDiskData = 0;
                        
                        cpuData = json.data[0].cpu;
                        memData = json.data[0].memory;
                        diskData = json.data[0].disk;
                        
                        oppCpuData = 100 - cpuData;
                        oppMemData = 100 - memData;
                        oppDiskData = 100 - diskData;
                        
                        option.series[0].data[0].value = cpuData;
                        option.series[0].data[1].value = oppCpuData;
                        option.series[1].data[0].value = memData;
                        option.series[1].data[1].value = oppMemData;
                        option.series[2].data[0].value = diskData;
                        option.series[2].data[1].value = oppDiskData;
                        
                        myChart.setOption(option);
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
	        
	        function getData(id){
	        	var tmpArray = id.split("_");
	        	var dataGubun = "";
	        	var dataGroup1 = "";
	        	var dataGroup2 = "";
	        	
	        	if(tmpArray.length == 3){
	        		dataGubun = tmpArray[0];
	        		dataGroup1 = tmpArray[1];
	        		dataGroup2 = tmpArray[2];
	        	}
	        	
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcMainServer.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    : dataGubun
                       ,'group1'   : dataGroup1
                       ,'group2'   : dataGroup2
                    },
                    success :function(json) {
                    	var cpuData = 0;
                        var memData = 0;
                        var diskData = 0;
                        var oppCpuData = 0;
                        var oppMemData = 0;
                        var oppDiskData = 0;
                    	
                        cpuData = json.data[0].cpu;
                        memData = json.data[0].memory;
                        diskData = json.data[0].disk;
                        
                        oppCpuData = 100 - cpuData;
                        oppMemData = 100 - memData;
                        oppDiskData = 100 - diskData;
                        
                        option.series[0].data[0].value = cpuData;
                        option.series[0].data[1].value = oppCpuData;
                        option.series[1].data[0].value = memData;
                        option.series[1].data[1].value = oppMemData;
                        option.series[2].data[0].value = diskData;
                        option.series[2].data[1].value = oppDiskData;
                        
                        myChart.setOption(option);
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
	        
	        var timeTicketVortex = setInterval(function (){
	            $('#vortex').data('vortex').step(1);
	            getData($('#vortex').data('vortex').id());
	        }, 5000);
	    </script>
	</body>
</html>