<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>업무별 인프라 관제</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	    
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	
		<script type="text/javascript" src="${contextPath}/js/main/common.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcUnitView.js"></script>
	    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/js/maki_jquery.js"></script>
    	<script src="<%=request.getContextPath()%>/js/fecrs/facilities/js/makisu.js"></script>
	    
	    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ifcrs/event_style.css">
	    
	    <style type="text/css">
			#menu {position:absolute;top:20px;left:19px;}
			#legend {position:absolute;top:120px;left:10px;}
			#button {position:absolute;top:120px;left:1750px;}
			#grid1 {border:1px solid #666;position:absolute;top:160px;left:20px;background-color:#000;}
			#grid2 {border:1px solid #666;position:absolute;top:160px;left:475px;background-color:#000;}
			#grid3 {border:1px solid #666;position:absolute;top:160px;left:930px;background-color:#000;}
			#grid4 {border:1px solid #666;position:absolute;top:160px;left:1385px;background-color:#000;}
			#grid5 {border:1px solid #666;position:absolute;top:430px;left:20px;background-color:#000;}
			#grid6 {border:1px solid #666;position:absolute;top:430px;left:475px;background-color:#000;}
			#grid7 {border:1px solid #666;position:absolute;top:430px;left:930px;background-color:#000;}
			#grid8 {border:1px solid #666;position:absolute;top:430px;left:1385px;background-color:#000;}
			#grid9 {border:1px solid #666;position:absolute;top:700px;left:20px;background-color:#000;}
			#grid10 {border:1px solid #666;position:absolute;top:700px;left:475px;background-color:#000;}
			#event {border:1px solid #666;position:absolute;top:700px;left:930px;background-color:#000;}
			
			.areaLstBiz{overflow:hidden;width:1808px;height:82px;margin-bottom:10px;*zoom:1;}
			.areaLstBiz:after{content:"";display:block;clear:both;}
			.areaLstBiz li{overflow:hidden;float:left;width:256px;height:100%;margin:0 1px;}
			.areaLstCtrl{height:24px;margin-bottom:10px;*zoom:1;}
			.areaLstCtrl:after{content:"";display:block;clear:both;}
			.areaLstCtrl ul{float:right;}
			.areaLstCtrl li{float:left;margin-left:8px;}
			.tpSttCntn{width:200px;margin:0 auto;}
		</style>
		
	    <script type="text/javascript">
            $(window).load(function(){
            	//initMenu();
                initData();
                fn_menuRotation();
                getTroblData();
                changeGridData();
                
            });
        </script>
	</head>
	
	<body style="background-color:#171a1f;">
		<input type="hidden" id="selMenu" value="" />
		<input type="hidden" id="isRotation" value="" />
		
		<div id="menu" class="areaLstBiz">
			<ul>
				<li><img id="imgEXD" src="${contextPath}/images/ifcrs/biz01_on.png" alt="설계" style="cursor:pointer;" onclick="fn_selMenu('EXD','N');" /></li>
				<li><img id="imgCPM" src="${contextPath}/images/ifcrs/biz02.png" alt="건설" style="cursor:pointer;" onclick="fn_selMenu('CPM','N');" /></li>
				<li><img id="imgCNK" src="${contextPath}/images/ifcrs/biz03.png" alt="지식" style="cursor:pointer;" onclick="fn_selMenu('CNK','N');" /></li>
				<li><img id="imgEXM" src="${contextPath}/images/ifcrs/biz04.png" alt="도로관리" style="cursor:pointer;" onclick="fn_selMenu('EXM','N');" /></li>
				<li><img id="imgAFM" src="${contextPath}/images/ifcrs/biz05.png" alt="부대시설" style="cursor:pointer;" onclick="fn_selMenu('AFM','N');" /></li>
				<li><img id="imgSTM" src="${contextPath}/images/ifcrs/biz06.png" alt="구조물" style="cursor:pointer;" onclick="fn_selMenu('STM','N');" /></li>
				<li><img id="imgTRS" src="${contextPath}/images/ifcrs/biz07.png" alt="교통안내" style="cursor:pointer;" onclick="fn_selMenu('TRS','N');" /></li>
			</ul>
		</div>
		<div id="legend" class="areaLstCtrl">
			<ul>
				<li><img src="${contextPath}/images/ifcrs/unitLegend.png" /></li>
			</ul>
		</div>
		<div id="button" class="areaLstCtrl">
			<ul>
				<li>
					<a href="#" onclick="fn_menuRotation();return false;"><img id="rotIcon" src="${contextPath}/images/ifcrs/btn_stop.png" alt="정지" /></a>
				</li>
				<li>
					<a href="#" onclick="fn_unitSetup();return false;"><img src="${contextPath}/images/ifcrs/btn_set.png" alt="설정" /></a>
				</li>
			</ul>
		</div>
		
	    <div id="grid1" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title1" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main1" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con1" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC1" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid2" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title2" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main2" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con2" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC2" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid3" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title3" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main3" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con3" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC3" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid4" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title4" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main4" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con4" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC4" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div id="grid5" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title5" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main5" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con5" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC5" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid6" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title6" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main6" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con6" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC6" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid7" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title7" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main7" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con7" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC7" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid8" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title8" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main8" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con8" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC8" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div id="grid9" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title9" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main9" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con9" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC9" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="grid10" style="width:435px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="title10" width="401px" class="titS">
						&nbsp;
						</th>
					</tr>
					<tr>
						<td>
						<div id="main10" style="width:395px;height:100px;"></div>
						</td>
					</tr>
					<tr>
						<td>
						<table id="con10" class="tblWgt tp02 tpSttCntn"></table>
						<table id="conC10" class="tblWgt tp02 tpSttCntn"></table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="event" style="width:890px;height:250px;">
	    	<table class="tblWgt tp03">
				<tbody>
					<tr>
						<th id="eventTitle" width="890px" class="titS">
						이벤트
						</th>
					</tr>
					<%-- <tr>
						<td>
						<table id="con10" border="1" class="tblWgt tp03" style="width:100%;border:solid 1px #444;">
							<colgroup>
								<col width="25%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
								<col width="35%">
							</colgroup>
							<tbody id="eventTbody">
								<tr>
									<th scope="row" class="titS">발생일시</th>
									<th scope="row" class="titS">호스트명</th>
									<th scope="row" class="titS">등급</th>
									<th scope="row" class="titS">상태</th>
									<th scope="row" class="titS">이벤트 메세지</th>
								<tr>
							</tbody>
								
						</table>
						</td>
					</tr> --%>
				</tbody>
			</table>	
			<div style="top: 32px; left:-30px; width: 890px">
			    <section class="demo" style="top: 32px; left:-30px; width: 890px">      
				  <ul class="ul_table" style="text-align: center; top: 32px; left:-30px; width: 890px">
					<li>
						<dl class="list maki" style="width: 220px">
							<dt style="width: 100%;">발생일시</dt>
							<dd style="width: 100%; height: 27px"><a id="eventDate1"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventDate2"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventDate3"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventDate4"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventDate5"></a></dd>
						</dl>
					</li>
			        <li>
						<dl class="list maki" style="width: 178px">
							<dt style="width: 100%;">호스트명</dt>
							<dd style="width: 100%; height: 27px"><a id="hostName1"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="hostName2"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="hostName3"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="hostName4"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="hostName5"></a></dd>			
						</dl>
					</li>
					<li>
						<dl class="list maki" style="width: 89px">
							<dt style="width: 100%;">등급</dt>
							<dd style="width: 100%; height: 27px"><a id="eventGrade1"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventGrade2"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventGrade3"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventGrade4"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventGrade5"></a></dd>
						</dl>
					</li>
					<li>
						<dl class="list maki" style="width: 89px">
							<dt style="width: 100%;">상태</dt>
							<dd style="width: 100%; height: 27px"><a id="eventState1"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventState2"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventState3"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventState4"></a></dd>
							<dd style="width: 100%; height: 27px"><a id="eventState5"></a></dd>
						</dl>
					</li>
					<li>
						<dl class="list maki" style="width: 308px">
							<dt style="width: 100%;">이벤트 메세지</dt>
							<dd style="width: 100%; text-align:left; height: 27px"><a id="eventMessage1"></a></dd>
							<dd style="width: 100%; text-align:left; height: 27px"><a id="eventMessage2"></a></dd>
							<dd style="width: 100%; text-align:left; height: 27px"><a id="eventMessage3"></a></dd>
							<dd style="width: 100%; text-align:left; height: 27px"><a id="eventMessage4"></a></dd>
							<dd style="width: 100%; text-align:left; height: 27px"><a id="eventMessage5"></a></dd>
						</dl>
					</li>
					
				</ul>
			    </section>
			</div>
		</div>
	    
	    <script type="text/javascript">
		    var myChart1;
		    var myChart2;
		    var myChart3;
		    var myChart4;
		    var myChart5;
		    var myChart6;
		    var myChart7;
		    var myChart8;
		    var myChart9;
		    var myChart10;
		    
		    var option1 = {};
		    var option2 = {};
		    var option3 = {};
		    var option4 = {};
		    var option5 = {};
		    var option6 = {};
		    var option7 = {};
		    var option8 = {};
		    var option9 = {};
		    var option10 = {};
		    
		    var data1 = new Array();
		    var data2 = new Array();
		    var data3 = new Array();
		    var data4 = new Array();
		    var data5 = new Array();
		    var data6 = new Array();
		    var data7 = new Array();
		    var data8 = new Array();
		    var data9 = new Array();
		    var data10 = new Array();
		    
		    var eventArr = new Array();
		    var eventCnt = 0;
		    var dataNum =0;
		    
		    function Request(){	
		    	var requestParam = "";	
		            this.getParameter = function(param){	
		        	var url = unescape(location.href);	
		            var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");	
		            for(var i = 0 ; i < paramArr.length ; i++){	
		                var temp = paramArr[i].split("=");
		                if(temp[0].toUpperCase() == param.toUpperCase()){
		                	requestParam = paramArr[i].split("=")[1];
		                    break;
		                }
		            }
		            return requestParam;
		        };
		    }
		    
		    var request = new Request();
		    $("#selMenu").val(request.getParameter("selMenu"));
		    $("#isRotation").val(request.getParameter("isRotation"));

		    var menu = ['EXD','CPM','CNK','EXM','AFM','STM','TRS'];
		    var menuText = ['설계','건설','지식','도로관리','부대시설','구조물','교통안전'];
		    var gubun = new Array();
		    var gubun_name = new Array();
	    	
	    	if($("#selMenu").val().length < 1){
	    		$("#selMenu").val("EXD");
	    	}
	    	if($("#isRotation").val().length < 1){
	    		$("#isRotation").val("Y");
	    	}
	    	
	    	for(var i=0;i<menu.length;i++){
   				if($("#selMenu").val() == menu[i]){
   					$("#img"+menu[i]).attr("src", "${contextPath}/images/ifcrs/biz0"+(i+1)+"_on.png");
   				}else{
   					$("#img"+menu[i]).attr("src", "${contextPath}/images/ifcrs/biz0"+(i+1)+".png");
   				}
	    	}
	    	
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
	    	
	    	var menuTimeTicketRun;
	    	
	    	function fn_startMenu(){
	    		menuTimeTicketRun = setInterval(function (){
		        	var menu_tmp = "";
		        	var cnt = 0;
		        	for(var i=0;i<menu.length;i++){
		        		if($("#selMenu").val() == menu[i]){
		        			cnt = i + 1;
		        			if(cnt == menu.length){
		        				cnt = 0;
		        			}
		        			menu_tmp = menu[cnt];
		        		}
		        	}
		        	fn_selMenu(menu_tmp, 'Y');
	            }, widgetTimer);
	    	}
	    	
	    	function fn_stopMenu(){
	    		clearInterval(menuTimeTicketRun);
	    	}
	    	
	    	function fn_menuRotation(){
	    		if($("#isRotation").val() == "Y"){
	    			$("#isRotation").val("N");
	    			$("#rotIcon").attr("src","${contextPath}/images/ifcrs/btn_stop.png");
	    			$("#rotIcon").attr("title","정지");
	    			fn_startMenu();
	    		}else{
	    			$("#isRotation").val("Y");
	    			$("#rotIcon").attr("src","${contextPath}/images/ifcrs/btn_play.png");
	    			$("#rotIcon").attr("title","시작");
	    			fn_stopMenu();
	    		}
	    	}

			function fn_selMenu(menu, isRotation){
	        	if(menu != ""){
	        		location.href = "${pageContext.request.contextPath}/ifc/ifcUnitView.do?selMenu="+menu+"&isRotation="+isRotation;
	        		return false;
	        	}
	        }
	        
	        function initData(){
                $.ajax({
                    url : '${pageContext.request.contextPath}/ifc/ifcUnit.do',
                    async : false,
                    dataType : 'json',
                    data:{
                        'unit'    : $("#selMenu").val(),
                        'rownum'  : 100,
                        'istoday' : 'Y'
                    },
                    success :function(json) {
                    	var cnt = 0;
                    	var data_cnt = 0;
                    	var gubun_tmp = "";
                    	var con_cnt = 0;
                    	eventCnt = 0;
                    	
                    	for(var i=0;i<json.data.length;i++){
                        	if(gubun_tmp != json.data[i].gubun){
                        		gubun[cnt] = json.data[i].gubun;
                        		gubun_tmp = json.data[i].gubun;
                        		cnt++;
                        		data_cnt = 0;
                        		con_cnt = 0;
                        		
                        		//타이틀 세팅
                            	$("#title" + cnt).html(json.data[i].gubun_name);
                        	}
                        	
                        	if(json.data[i].server_gubun == "WAS" || json.data[i].server_gubun == "WEB"){
                        		var data_tmp = eval("data" + cnt);
                        		data_tmp[data_cnt] = [json.data[i].hostname, json.data[i].disk, json.data[i].cpu, json.data[i].memory];
                        		data_cnt++;
                        	}
                        	
                        	if(json.data[i].server_gubun == "CON"){
                        		var tagetId = "con" + cnt;
                        		if(con_cnt > 1){
                        			var target_ori = document.getElementById(tagetId);
                        			tagetId = "conC" + cnt;
                        		}
                   				var target = document.getElementById(tagetId);
                   				if(con_cnt > 1){
                   					target_ori.style.float = "left";
                   					target.style.float = "left";
                        		}
                   				
                   				var tr = document.createElement("TR");
                   				var th = document.createElement("TH");
                   				th.innerHTML =  json.data[i].hostname;
                   				tr.appendChild(th);
                   				var td = document.createElement("TD");
                   				td.style.textAlign = "center";
                   				var img = document.createElement("IMG");
                   				if(json.data[i].con_yn == "N"){
                   					img.src = "${contextPath}/images/ifcrs/icoPrbBgCb.png";
                   				}else{
                   					img.src = "${contextPath}/images/ifcrs/icoNmlBgCb.png";
                   				}
                                td.appendChild(img);
                   				tr.appendChild(td);
                   				target.appendChild(tr);
                   				con_cnt++;
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
                    	
                    	for(var i=1;i<=gubun.length;i++){
                    		var myChart_tmp = eval("myChart" + i);
                    		var option_tmp = eval("option" + i);
                    		var data_tmp = eval("data" + i);
                    		
                    		myChart_tmp = echarts.init(document.getElementById("main" + i), 'dark');
                    		option_tmp = {
                               	color: [diskColor, '#fff', cpuColor, '#fff', memoryColor, '#fff'],
                                   legend: [{
                                       show: false,
                                       x : 'center',
                                       y : 'top',
                                       data: ['DISK', 'CPU', 'MEMORY']
                                   }],
                                   series: createSeries(data_tmp)
                               }
                    		myChart_tmp.setOption(option_tmp);
                    	}
                    	
                    	//이벤트
                    	for(var i=0;i<json.eventData.length;i++){
                    		eventArr[i] = json.eventData[i];
                    		eventCnt++;
	           				/* var target = document.getElementById("eventTbody");
	           				var tr = document.createElement("TR");
	           				var td = document.createElement("TD");
	           				td.style.textAlign = "center";
	           				td.style.padding = "6px 15px 5px 15px"
	           				td.innerHTML = json.eventData[i].inst_date;
	           				tr.appendChild(td);
	           				var td = document.createElement("TD");
	           				td.style.textAlign = "center";
	           				td.style.padding = "7px 15px 6px 15px"
	           				td.innerHTML = json.eventData[i].hostname;
	           				tr.appendChild(td);
	           				var td = document.createElement("TD");
	           				td.style.textAlign = "center";
	           				td.style.padding = "7px 15px 6px 15px"
	           				td.innerHTML = json.eventData[i].troblgradse + "등급";
	           				tr.appendChild(td);
	           				var td = document.createElement("TD");
	           				td.style.textAlign = "center";
	           				td.style.padding = "7px 15px 6px 15px"
	           				td.innerHTML = json.eventData[i].troblprocesssttus;
	           				tr.appendChild(td);
	           				var td = document.createElement("TD");
	           				td.style.textAlign = "left";
	           				td.style.padding = "7px 15px 6px 15px"
	           				td.innerHTML = json.eventData[i].troblcn;
	           				tr.appendChild(td);
	           				target.appendChild(tr); */
                    	}
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
	        
	        function fn_unitSetup(){
	        	var url = "${pageContext.request.contextPath}/ifc/ifcUnitSetupView.do";
	        	var name = "unitSetup";
	        	var width = 1000;
	        	var height = 600;
	        	var opt = "";
	        	
	        	WinPop(url, name, width, height, opt);
	        }
	        
	        function getTroblData(){
                $.ajax({
                    url : '${pageContext.request.contextPath}/ifc/ifcUnitTrobl.do',
                    async : false,
                    dataType : 'json',
                    success :function(json) {
                    	for(var i=0;i<json.data.length;i++){
                    		for(var j=0;j<menu.length;j++){
                    			if(menu[j] == json.data[i].unit){
                    				if(menu[j] != $("#selMenu").val()){	//현재 선택된 업무는 바뀌지 않음
                    					$("#img" + menu[j]).attr("src","${contextPath}/images/ifcrs/biz0"+(j+1)+"_err.png");
                    				}
                    			}
                    		}
                    	}
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
	        
	        /*****************이벤트 함수*******************/	        
	        
	        if ( $.fn.makisu.enabled ) {

	            var $maki = $( '.maki' );

	            // Create Makisus
	  
	            $maki.makisu({
	                selector: 'dd',
//	                 overlap: 0.6,
	                overlap: 0.2,
	                speed: 0.85,
	 
	            });

	            // Open all
	            
	            $( '.list' ).makisu( 'open' );

	            // Toggle on click

	            $( '.toggle' ).on( 'click', function() {
	                $( '.list' ).makisu( 'toggle' );
	            });

	            // Disable all links

	            $( '.demo a' ).click( function( event ) {
	                event.preventDefault();
	            });

	        } else {

	            $( '.warning' ).show();
	        }
	        
	        var fnTimeout = setInterval(function(){
            	$( '.list' ).makisu( 'toggle' )
            	setTimeout(function() {
            		$( '.list' ).makisu( 'open' );
                	changeGridData();
            	}, 3000);
            }, 10000);
	        
	        function changeGridData() {
	        	for(var rowNum = 1; rowNum <6; rowNum++) {
	        		if(eventCnt == 0) {
	        			$('#eventDate' + rowNum).text('');
	        			$('#hostName' + rowNum).text('');
	        			$('#eventGrade' + rowNum).text('');
	        			$('#eventState' + rowNum).text('');
	        			$('#eventMessage' + rowNum).text('');
	        		}
	        		else {
	        			if(eventArr[dataNum] != null) {
	            			$('#eventDate' + rowNum).text(eventArr[dataNum].inst_date);
	            			$('#hostName' + rowNum).text(eventArr[dataNum].hostname);
	            			$('#eventGrade' + rowNum).text(eventArr[dataNum].troblgradse + "등급");
            				$('#eventState' + rowNum).text(eventArr[dataNum].troblprocesssttus);	            			
            				$('#eventMessage' + rowNum).text(eventArr[dataNum].troblcn);	            			           			
	            		} else {
	            			$('#eventDate' + rowNum).text('');
	            			$('#hostName' + rowNum).text('');
	            			$('#eventGrade' + rowNum).text('');
	            			$('#eventState' + rowNum).text('');
	            			$('#eventMessage' + rowNum).text('');
	            		}
	        		}  
	        		dataNum++;
	        	}
	        	if(dataNum >= eventCnt) {
	        		dataNum = 0;
	        	}
	        }
	        
	        /*****************이벤트 함수*******************/
	        
	        timeTicketRun = setInterval(function (){
            	//장애 조회
                getTroblData();
            }, 60000);	//1분
	    </script>
	</body>
</html>