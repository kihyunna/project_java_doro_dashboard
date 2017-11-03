<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags" %>

<!doctype html>
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!-->
<!-- <html class="no-js"> -->
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<meta http-equiv="Content-Language" content="ko">
<meta name="robots" content="index, all" />

<title></title>	
<!-- 	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> -->
	<link href="<%=request.getContextPath()%>/css/fecrs/css/default.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fecrs/css/mainMapstyle.css" />
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/fecrs/facilities/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/proj4js/lib/proj4js.js"></script>
    
    <script src="<%=request.getContextPath()%>/js/fecrs/facilities/infra/js/ol.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/fecrs/facilities/infra/js/ol-infra.min.js"></script>	

    <style type="text/css">
		.bodyOverflow {
					-webkit-backface-visibility: hidden;
					-moz-backface-visibility: hidden;
					-webkit-transform: translate3d(0, 0, 0);
					-moz-transform: translate3d(0, 0, 0);		
		} 
		
		
		.areaSlctTit{position:absolute;top:30px;text-align:center;}
	
		/*Type01*/
		select{height:33px;padding:4px 7px 5px 8px;font-size:18px;font-family:"nanumB", "NanumGothicBold", "Nanum Gothic", "나눔고딕", "돋움", "Dotum";font-weight:bold;border-color:#000;
		box-shadow:0px 0px 7px 2px rgba(0,0,0,0.3);
		-webkit-box-shadow:0px 0px 7px 2px rgba(0,0,0,0.3);
		-moz-box-shadow:0px 0px 7px 2px rgba(0,0,0,0.3);
		-o-box-shadow:0px 0px 7px 2px rgba(0,0,0,0.3);}
		/*Type02*/
		.areaSlctTit.tp02 select{color:#eee;border-color:#666;background-color:rgba(0,0,0,0.6);}
		/*Type03*/
		.areaSlctTit.tp03 select{
		background-image:-moz-linear-gradient(top, #fff, #fff, #eee, #ccc);
		background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#fff), to(#ccc));
		background-image:-webkit-linear-gradient(top, #fff, #fff, #eee, #ccc);
		background-image:-o-linear-gradient(top, #fff, #fff, #eee, #ccc);
		background-image:linear-gradient(to bottom, #fff, #fff, #eee, #ccc);
		background-repeat: repeat-x;
		border-radius:0.2em;
		-webkit-border-radius:0.2em;
		-moz-border-radius:0.2em;
		-o-border-radius:0.2em;}
		/*Type04*/
		.areaSlctTit.tp04 select{color:#fff;
		background-color:#30a5ff;
		background-image:-moz-linear-gradient(top, #fff, #fff, #eee, #ccc);
		background-image:-webkit-gradient(linear, 0 0, 0 100%, from(#fff), to(#ccc));
		background-image:-webkit-linear-gradient(top, #fff, #fff, #eee, #ccc);
		background-image:-o-linear-gradient(top, #fff, #fff, #eee, #ccc);
		background-image:linear-gradient(to bottom, #30a5ff, #0090ff, #0090ff, #0090ff, #006fc4, #005ea6);
		background-repeat: repeat-x;}
		
		/*Select box 스타일 초기화(화살표 제거)*/
		.areaSlctTit.tpNoArr select{-webkit-appearance:none;-moz-appearance: none;appearance:none;}
		.areaSlctTit.tpNoArr select::-ms-expand{display: none;}/*IE*/
	</style>	
	
<script type="text/javascript">	
	var fac_kind = 2;//1: MDT, 2:터널, 3:전기, 4:사면
	var fac_box_top = 5;
	var eventCount = 0;
	
	var boxChange = null;
	var bonbuChange = null;	
	
	var iconData = [];		
	
	var deptcodearr =  ['N01795','N01796','N02723','N01797','N01798','N01799','N01800','N01801'];
	var deptidx = 1;
	var interval_Dept = null;
	var interval_widget = null;
	
	var interval_cctv = null;
	
	var arryTunnelEventInstance = [];
	var arryElctsEventInstance = [];
	var arrySvarEventInstance = [];
	var arrySlopeEventInstance = [];
	
	var deptCode = '';
	
	$(function() {
	    //위젯간 통신
	    if(window.addEventListener) {
	       window.addEventListener("message", uf_receiveMessage, false);
	    }else if(window.attachEvent) {  //IE에서 이벤트 등록
	       window.attachEvent("onmessage", uf_receiveMessage);
	    }
	    
	    $('#idSelectBonbu').change(function(){
	    	    
// 	    	    alert(map.getView().getCenter());  
// 	    	    alert(map.getView().getZoom());
				var index = $("#idSelectBonbu option").index($("#idSelectBonbu option:selected"));
	    	    moveMapLocationDept(index);
	    		
	    		if ($(this).val() == 'N00002')
	    		{
	    			deptCode = '';
	    			SelectAllDept();
	    			//전체 장애 Cctv 타이머 생성
	    		    showCctv('');
	    		}else
	    		{
	    			deptCode = $(this).val();
	    			SelectDept($(this).val());
	    			//전체 장애 Cctv 타이머 생성
	    		    showCctv(deptCode);
	    		}
	          
		});
	    moveMapLocationDept(0);
	    
	    // 본부 및 지사 위치 가져오기 및 아이콘 표시
	    getDeptCoordAjax();
	    
	    
	    // 본부 전체 화면 및 로테이션 관제
	    SelectAllDept();
	    
	    //전체 장애 Cctv 타이머 생성
	    showCctv('');
	    
	});
	
	//다른 위젯으로 데이터 보내기
    function fn_tranServer(data){
    	var callCommandVariable = {
        	classType: "1",
        	command : "Level1MapDeptCode",
        	data : {
        		DeptCode : data
        	}
        };
    	
    	setTimeout($.proxy(function () {
    		parent.postMessage(callCommandVariable, "*");
		}, this), 1000);    	
    }
	
    //UXP에서 데이터 받기
    function uf_receiveMessage(e){	   
    	  var command = e.data.command;
    	  switch(command){
    	        case 'Level1MapDeptCode' :    { //레벨2, 레벨1 : fecLevel2
    	           //AjaxQuery(e.data.data.DeptCode); 
    	           break;
    	        }
    	        case 'EventTunnel' :    {
    	        	AjaxQueryEventTunnel(deptCode);
    		        break;
    		    }
    	        case 'EventElcts' :    {
    	        	AjaxQueryEventElcts(deptCode);
     		        break;
     		    }
    	        case 'EventSvar' :    {
    	        	AjaxQueryEventSvar(deptCode);
     		        break;
     		    }
    	        case 'EventSlope' :    {
    	        	AjaxQueryEventSlope(deptCode);
     		        break;
     		    }
    	        default : {
    	           break;
    	        } 
    	     }
    	}
	
    // 부서가 전체인 경우
	function SelectAllDept(){
    	// 본부 선택시 생성된 interval 제거
		closeOtherDatatoWidget();
    	
		// 본부 선택
		if (interval_Dept == null){
			deptidx = 1;
			fn_tranServer(deptcodearr[0]);
			
			setTimeout($.proxy(function () {
				setDept(deptidx);
			}, this), 500);	
			
			interval_Dept = setInterval($.proxy(function () {
				deptidx++;
				if (deptidx > 8)
					deptidx = 1;
				setTimeout($.proxy(function () {
					fn_tranServer(deptcodearr[deptidx-1]);
		    	}, this), 500);		
				
				setDept(deptidx);
			}, this), 1000*60*5); // 지도 타이머 설정	
		}
		
		//이벤트 데이터
    	setTimeout($.proxy(function () {
	    	AjaxQueryEventTunnel('');
		    AjaxQueryEventElcts('');
		    AjaxQueryEventSvar('');
		    AjaxQueryEventSlope('');
		}, this), 1000);
	}
    
    function moveMapLocationDept(val){
 		var coord = [];   	
        var scale = 5;
    	if (val == 0){
    		scale = 3;
    		coord.push(14215197.085733153,4355182.443855665);
    	}else if (val == 1){
    		scale = 6;
    		coord.push(14161513.302195935,4496142.785307987);    		           
    	}else if (val == 2){
    		coord.push(14286941.21726954,4543637.895780546);
    		scale = 5;
    	}else if (val == 3){
    		coord.push(14242255.901361777,4405425.7447349075);
    		scale = 6;
    	}else if (val == 4){
    		coord.push(14132975.869532099,4368793.531766744);
    		scale = 7;
    	}else if (val == 5){
    		coord.push(14154892.852679744,4260345.273125588);
    		scale = 7;
    	}else if (val == 6){
    		coord.push(14150845.511405142,4178068.638224006);
    		scale = 6;
    	}else if (val == 7){
    		coord.push(14323556.770116365,4344411.793634113);
    		scale = 5;
    	}else if (val == 8){
    		coord.push(14298667.78584609,4239263.678643962);
    		scale = 4;
    	}
 
        map.getView().animate({
 	       center: coord,
 	       duration: 2000
 	     });     
 	     
 	     map.getView().animate({
 	       zoom: scale - 2,
 	       duration: 1000
 	     }, {
 	       zoom: scale ,
 	       duration: 1000      
 	     });
    }
    
    
	// 본부 선택시
	function SelectDept(val){
		// 본부 선택시 생성된 interval 제거
		closeOtherDatatoWidget();
		// 전체 선택시 생성된 interval 제거
		if (interval_Dept != null)
			clearInterval(interval_Dept);
		interval_Dept = null;
		
		// 본부 선택 삭제
		setDept(0);
		fn_tranServer(val);
		
		setTimeout($.proxy(function () {
			sendOtherDatatoWidget();//5초 후 위젯으로 명령 Interval 실행
    	}, this), 500);	
		
		//이벤트 데이터
		setTimeout($.proxy(function () {
	    	AjaxQueryEventTunnel(val);
		    AjaxQueryEventElcts(val);
		    AjaxQueryEventSvar(val);
		    AjaxQueryEventSlope(val);
		}, this), 1000);
		
	}
	
	function sendOtherDatatoWidget(){	
		if (interval_widget == null){
			interval_widget = setInterval($.proxy(function () {
				fn_tranServer(deptcodearr[deptidx]);	
			}, this), 1000*60*5); // 지도 타이머 설정	
		}
	}
	
	function closeOtherDatatoWidget(){		
		if (interval_widget != null)
			clearInterval(interval_widget);
		interval_widget = null;
	}
	
	function setDept(val){
		
		map.getLayer("gangwon_map").setVisible(false);
		map.getLayer("gyeongbuk_map").setVisible(false);		
		map.getLayer("chungnam_map").setVisible(false);
		map.getLayer("chungbuk_map").setVisible(false);
		map.getLayer("gyeonggi_map").setVisible(false);
		map.getLayer("gyeongnam_map").setVisible(false);
		map.getLayer("jeonbuk_map").setVisible(false);
		map.getLayer("jeonnam_map").setVisible(false);
		
		if (val==2)
			map.getLayer("gangwon_map").setVisible(true);
		else if (val==3)
			map.getLayer("chungbuk_map").setVisible(true);
		else if (val==4)
			map.getLayer("chungnam_map").setVisible(true);
		else if (val==5)
			map.getLayer("jeonbuk_map").setVisible(true);
		else if (val==6)
			map.getLayer("jeonnam_map").setVisible(true);
		else if (val==7)
			map.getLayer("gyeongbuk_map").setVisible(true);
		else if (val==8)
			map.getLayer("gyeongnam_map").setVisible(true);
		else if (val==1)
			map.getLayer("gyeonggi_map").setVisible(true);
	}
	
	function showCctv(val){
		if (interval_cctv != null)
			clearInterval(interval_cctv);
		AjaxQueryEventCctv(val);
		interval_cctv = setInterval($.proxy(function () {
			AjaxQueryEventCctv(val);
		}, this), 1000*60*10); 
		
	}
	
	function closePopup(){
		$("#divPopup").animate({
		    left: "-400"
		}, 1000,function(){
			$("#divDeptPopup").html("");
  	  		$("#divFacPopup").html("");
  	  		$("#divContentPopup").html("");			
		});
	}
 </script>
</head>
<body style="overflow:hidden;top:0px;left:0px;background-color:rgba(23,26,31,0);" >

<div id="map" style="width:900px;height:1000px;" >
</div>

<div id = "idSearch" class="areaSlctTit tp02 tpNoArr" style="left : 16px; z-index:102; width:157px; top : 30px;">	
	<select id="idSelectBonbu" style="width:157px;">
		<option value="N00002" selected>전체</option>
		<option value="N01795" >수도권본부</option>
		<option value="N01796" >강원본부</option>
		<option value="N02723" >충북본부</option>
		<option value="N01797" >대전충남본부</option>
		<option value="N01798" >전북본부</option>
		<option value="N01799" >광주전남본부</option>
		<option value="N01800" >대구경북본부</option>
		<option value="N01801" >부산경남본부</option>
	</select>
</div>

<!--장비수-->
<div class="areaNumEqp" style="z-index:101;top : 60px;">
	<ul style="padding-left: 0px;">
		<li style="list-style-type : none;"> <input type="checkbox" checked="checked"  onClick="layerOnOff(this, 'tunnel');" style="width: 18px; height:16px;vertical-align: middle;"> 
		<img src="/images/fecrs/grade/mIco_tunnel_grd00.png" style="width: 26px; height:26px; vertical-align: middle;"> 
		터널: <span id="spanTunnel" class="txtNum">0</span>건
		</li>
		<li style="list-style-type : none;"> <input type="checkbox" checked="checked"  onClick="layerOnOff(this, 'electronic');"style="width: 18px; height:16px;vertical-align: middle;">
		<img src="/images/fecrs/grade/mIco_electronic_grd00.png" style="width: 26px; height:26px; vertical-align: middle;"> 
		전기: <span id="spanElcts" class="txtNum">0</span>건
		</li>
		<li style="list-style-type : none;"> <input type="checkbox" checked="checked"  onClick="layerOnOff(this, 'slope');"style="width: 18px; height:16px;vertical-align: middle;">
		<img src="/images/fecrs/grade/mIco_slope_grd00.png" style="width: 26px; height:26px; vertical-align: middle;"> 
		사면: <span id="spanSlope" class="txtNum">0</span>건
		</li>
		<li style="list-style-type : none;"> <input type="checkbox" checked="checked"  onClick="layerOnOff(this, 'pltwtr');"style="width: 18px; height:16px;vertical-align: middle;">
		<img src="/images/fecrs/grade/mIco_pltwtr_grd00.png" style="width: 26px; height:26px; vertical-align: middle;"> 
		오수: <span id="spanSvar" class="txtNum">0</span>건
		</li>
		<li style="list-style-type : none;"> <input type="checkbox" checked="checked"  onClick="layerOnOff(this, 'cctv');"style="width: 18px; height:16px;vertical-align: middle;">
		<img src="/images/fecrs/grade/mIcon_CCTV_grd00.png" style="width: 26px; height:26px; vertical-align: middle;"> 
		CCTV: <span id="spanCctv" class="txtNum">0</span>건
		</li>
<!-- 		<li style="list-style-type : none;"> <input type="checkbox" checked="checked"  onClick="layerOnOff(this, 'facilities');"style="width: 18px; height:16px;vertical-align: middle;"> -->
<!-- 		<img src="/images/fecrs/grade/mIco_tunnel_grd03.png" style="width: 26px; height:26px; vertical-align: middle;">  -->
<!-- 		염수: <span class="txtNum">0</span>건 -->
<!-- 		</li> -->
		
	</ul>
</div>

<div id="divPopup"  style="top:320px;; left : -400px; width:350px;height:400px;position:absolute; z-index:10002; background-color:rgba(50,50,50,1);">
	<div style="height:24px;width:100%;">
		<img src="/images/fecrs/ico_pop_close.png" align="right" width="24px;" onclick="closePopup();" >
	</div>
	<table summary="" style="border: 3px solid rgba(255,255,255,0.2);width: 100%; height:100%;border-collapse: separate;text-align: left;background-color:rgba(0,0,0,1);">
		<colgroup>		
			<col width="90" />
			<col width="*" />
		</colgroup>
		<tbody style="display: table-row-group;vertical-align: middle;border-color: inherit;">
			<tr style="height:40px;">
				<th scope="row" style="padding: 6px 6px 6px 10px;font-size:14px;background-color: #2e3641;">
					<label for="">
						<span  style="background: url(/images/fecrs/blt_bs.png) no-repeat left 5px;padding-left: 14px;word-spacing: -1px;">관리부서</span>
					</label>
				</th>
				<td id="divDeptPopup" style="padding: 6px 6px 6px 10px;font-size:14px;background-color:rgba(255,255,255,0.1);">
				</td>
			</tr>
			<tr style="height:40px;">
				<th scope="row" style="padding: 6px 6px 6px 10px;font-size:14px;background-color: #2e3641;">
					<label for="">
						<span  style="background: url(/images/fecrs/blt_bs.png) no-repeat left 5px;padding-left: 14px;word-spacing: -1px;">시설명</span>
					</label>
				</th>
				<td id="divFacPopup" style="padding: 6px 6px 6px 10px;font-size:14px;background-color:rgba(255,255,255,0.1);">
				</td>
			</tr>
			<tr>
				<th scope="row" style="padding: 6px 6px 6px 10px;font-size:14px;background-color: #2e3641;vertical-align: text-top;">
					<label for="">
						<span  style="background: url(/images/fecrs/blt_bs.png) no-repeat left 5px;padding-left: 14px;word-spacing: -1px;">내용</span>
					</label>
				</th>
				<td id="divContentPopup" style="padding: 6px 6px 6px 10px;font-size:14px;background-color:rgba(255,255,255,0.1);">					
				</td>
			</tr>
			
		</tbody>
	</table>

</div>

<script>

 function layerOnOff(obj, layerName){
	 var checked = obj.checked;
	 map.getLayer(layerName).setVisible(checked);
	 
	 if (layerName == 'tunnel'){
		 if (checked)
			 showTunnelEventEffect(effectTunnelFeatures); 
		 else
			 closeTunnelEventEffect();	
	 }else if (layerName == 'electronic'){
		 if (checked)
			 showElctsEventEffect(effectElctsFeatures); 
		 else
			 closeElctsEventEffect(); 
	 }else if (layerName == 'slope'){
		 if (checked)
			 showSlopeEventEffect(effectSlopeFeatures); 
		 else
			 closeSlopeEventEffect(); 	
	 }else if (layerName == 'pltwtr'){
		 if (checked)
			 showSvarEventEffect(effectSvarFeatures); 
		 else
			 closeSvarEventEffect();	 
	 } 
 }
</script>
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecMainMapLv1.js"></script>
</body>
</html>
