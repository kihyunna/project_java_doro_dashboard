<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>데이타베이스 성능</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	    
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.3.6.2.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.new.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcDbDpmView.js"></script>
	
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/csshake.css">
	    
	    <style type="text/css">
			#sub{display:none;position:absolute;bottom:0;right:0;padding:10px 15px;font-size:14px;text-align:center;color:#fff;background-color:rgba(0,0,0,0.5);}
			#sub .txtNum{font-weight:bold;color:#f47920;}
			#grid{position:absolute;bottom:0px;right:0}
		</style>
	    
	    <script type="text/javascript">
            $(window).load(function(){
            	//이벤트
			    if(window.addEventListener) {
					window.addEventListener("message", uf_receiveMessage, false);
				}else if(window.attachEvent) {  //IE에서 이벤트 등록
					window.attachEvent("onmessage", uf_receiveMessage);
				}
            	
                getData();
                
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
		<div id="main" style="width:800px;height:535px;z-index:10;"></div>
		<div id="mainBorder" style="position:absolute;top:0px;left:0px;width:790px;height:535px;border:solid 5px #f00;display:none;z-index:1;"></div>
		
		<div id="grid">
			<table class="tblWgt tp03" summary="DPM 상세 정보를 보여 준다.">
				<caption>DPM 상세 정보</caption>
				<tbody>
					<tr>
						<th id="gridTitle" scope="col" colspan="2" class="titS">
						</th>
					</tr>
					<tr>
						<th scope="row">
							Total Sessions
						</th>
						<td id="ts">
						</td>
					</tr>
					<tr>
						<th scope="row">
							Active Sessions
						</th>
						<td id="as">
						</td>
					</tr>
					<tr>
						<th scope="row">
							Wait Time
						</th>
						<td id="wt">
						</td>
					</tr>
					<tr>
						<th scope="row">
							Execute Counts
						</th>
						<td id="ec">
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th scope="col" colspan="2" class="titS">
							Table Space
						</th>
					</tr>
					<tr>
						<th id="ts1Name" scope="row">
						</th>
						<td id="ts1">
						</td>
					</tr>
					<tr>
						<th id="ts2Name" scope="row">
						</th>
						<td id="ts2">
						</td>
					</tr>
					<tr>
						<th id="ts3Name" scope="row">
						</th>
						<td id="ts3">
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	        myChart.currentIndex = -1;
	        
	        var dataEtc = new Array();
	        var subServer = "";
	        var gridCnt = 0;
	        var dataLen = 0;
	        
	        var zoom = 0;
	        
	        var chkStyle = /\d/;
	        var widgetTimer = (60000 * 1) / 4;	//1분
	        var paramWidgetTimer = "${param.widgetTimer}";
	        if(paramWidgetTimer != null){
	        	if(chkStyle.test(paramWidgetTimer)){
	        		if(paramWidgetTimer != 0){
	        			widgetTimer = parseInt(paramWidgetTimer) / 4;	
	        		}
	        	}
	        }
	        
	        function getData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcDbDpm.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    	: 'DB'
                       ,'group1'   	: 'DPM'
                       ,'hostname1' : 'CIHMAN'
                       ,'hostname2' : 'CFACIL'
                       ,'hostname3' : 'CBDATA'
                       ,'hostname4' : 'CSM'
                    },
                    success :function(json) {
                    	zMax = 50;
                    	
                    	var tablespace = [["","","","","",""],["","","","","",""],["","","","","",""],["","","","","",""]];
                    	var tbCnt = 0;
                    	for(var i=0;i<json.data2.length;i++){
                    		if(json.data2[i].hostname == "CIHMAN"){
                    			if(json.data2[i].rownum == "1"){
                    				tablespace[0][0] = json.data2[i].tablespace_name;
                        			tablespace[0][1] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "2"){
                    				tablespace[0][2] = json.data2[i].tablespace_name;
                        			tablespace[0][3] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "3"){
                    				tablespace[0][4] = json.data2[i].tablespace_name;
                        			tablespace[0][5] = json.data2[i].used_percent;
                    			}
                    		}else if(json.data2[i].hostname == "CFACIL"){
                    			if(json.data2[i].rownum == "1"){
                    				tablespace[1][0] = json.data2[i].tablespace_name;
                        			tablespace[1][1] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "2"){
                    				tablespace[1][2] = json.data2[i].tablespace_name;
                        			tablespace[1][3] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "3"){
                    				tablespace[1][4] = json.data2[i].tablespace_name;
                        			tablespace[1][5] = json.data2[i].used_percent;
                    			}
                    		}else if(json.data2[i].hostname == "CBDATA"){
                    			if(json.data2[i].rownum == "1"){
                    				tablespace[2][0] = json.data2[i].tablespace_name;
                        			tablespace[2][1] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "2"){
                    				tablespace[2][2] = json.data2[i].tablespace_name;
                        			tablespace[2][3] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "3"){
                    				tablespace[2][4] = json.data2[i].tablespace_name;
                        			tablespace[2][5] = json.data2[i].used_percent;
                    			}
                    		}else if(json.data2[i].hostname == "CSM"){
                    			if(json.data2[i].rownum == "1"){
                    				tablespace[3][0] = json.data2[i].tablespace_name;
                        			tablespace[3][1] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "2"){
                    				tablespace[3][2] = json.data2[i].tablespace_name;
                        			tablespace[3][3] = json.data2[i].used_percent;
                    			}else if(json.data2[i].rownum == "3"){
                    				tablespace[3][4] = json.data2[i].tablespace_name;
                        			tablespace[3][5] = json.data2[i].used_percent;
                    			}
                    		}
                    	}
                    	
                    	for(var i=0;i<json.data1.length;i++){
                    		server[i] = json.data1[i].code_name;
                    		dataEtc[i] = [json.data1[i].wait_time, tablespace[i][0], tablespace[i][1], tablespace[i][2], tablespace[i][3], tablespace[i][4], tablespace[i][5]];
                    		
	                    	for(var j=0;j<gubun.length;j++){
	                    		if(j == 0){
	                    			data[(i*gubun.length)+j] = [i, j, json.data1[i].total_session];
	                    			if(zMax < json.data1[i].total_session){
	                                    zMax = json.data1[i].total_session;
	                                    zMax = Math.ceil(zMax/50) * 50;
	                                }
	                    		}else if(j == 1){
	                    			data[(i*gubun.length)+j] = [i, j, json.data1[i].active_session];
	                    			if(zMax < json.data1[i].active_session){
                                        zMax = json.data1[i].active_session;
                                        zMax = Math.ceil(zMax/50) * 50;
                                    }
	                    		}else if(j == 2){
	                    			data[(i*gubun.length)+j] = [i, j, json.data1[i].execute_counts];
	                    			if(zMax < json.data1[i].execute_counts){
                                        zMax = json.data1[i].execute_counts;
                                        zMax = Math.ceil(zMax/50) * 50;
                                    }
	                    		}
	                        }
                    	}
                    	
                    	myChart.setOption({
                    		visualMap: {
                    			max: zMax
                    		},
                    		xAxis3D: {
                    	        data: gubun
                    	    },
                    	    yAxis3D: {
                    	        data: server
                    	    },
                    	    zAxis3D: {
                    	        max: zMax
                    	    },
                            series:{
                                data: data.map(function(item) {
                                    return {
                                        value: [item[1], item[0], item[2]]
                                    }
                                })
                            }
                        });
                    	
                    	dataLen = data.length;
						zoom = data[(myChart.currentIndex + 1) % dataLen][0];
        	            
        	            if(zoom%2 == 1){
        	                myChart.setOption({
        	                    grid3D: {
        	                         viewControl: {
        	                            alpha:50,
        	                            distance: 150
        	                        }
        	                    }
        	                });
        	            }else if(zoom%2 == 0){
        	                myChart.setOption({
        	                    grid3D: {
        	                         viewControl: {
        	                            alpha:10,
        	                            distance: 250
        	                        }
        	                    }
        	                });
        	            }
                    	
                    	myChart.dispatchAction({
        	                type: 'downplay',
        	                seriesIndex: 0,
        	                dataIndex: myChart.currentIndex
        	            });
        	            
                    	myChart.currentIndex = (myChart.currentIndex + 1) % dataLen;
                    	
                    	myChart.dispatchAction({
        	                type: 'highlight',
        	                seriesIndex: 0,
        	                dataIndex: myChart.currentIndex
        	            });
        	
        	            subServer = server[data[myChart.currentIndex][0]];
        	            gridCnt = data[myChart.currentIndex][0];
        				
        				//grid 세팅
        				$("#gridTitle").html(subServer);
        				$("#ts").html(data[(gridCnt * gubun.length) + 0][2] + " 건");
        				$("#as").html(data[(gridCnt * gubun.length) + 1][2] + " 건");
        				$("#ec").html(data[(gridCnt * gubun.length) + 2][2] + " 건");
        				$("#wt").html(dataEtc[gridCnt][0] + " sec");
        				$("#ts1Name").html(dataEtc[gridCnt][1]);
        				$("#ts1").html(dataEtc[gridCnt][2] + " %");
        				$("#ts2Name").html(dataEtc[gridCnt][3]);
        				$("#ts2").html(dataEtc[gridCnt][4] + " %");
        				$("#ts3Name").html(dataEtc[gridCnt][5]);
        				$("#ts3").html(dataEtc[gridCnt][6] + " %"); 

                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
	        
	        var timeTicketData = setInterval(function () {
	        	getData();
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
							//setErrorBorder(true);
						}
	        		}
	        	}
			}
	    </script>		
	</body>
</html>