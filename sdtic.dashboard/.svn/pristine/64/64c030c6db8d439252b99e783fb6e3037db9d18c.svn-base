<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags" %>

<!doctype html>

<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Language" content="ko">
<meta name="robots" content="index, all" />

<title></title>	
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/vortex.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/fecmain.css">
<script type="text/javascript" src="${contextPath}/js/common/jquery.vortex.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/echarts/source/js/jquery.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/js/echarts/source/echarts.js" type="text/javascript"></script> --%>
<script src="<%=request.getContextPath()%>/js/echarts/dist/echarts.js" type="text/javascript"></script>
<!-- <script src="http://gallerybox.echartsjs.com/dep/echarts/latest/echarts.min.js" type="text/javascript"></script> -->
<!-- <script src="http://gallerybox.echartsjs.com/dep/jquery/jquery.js" type="text/javascript"></script> -->
<!-- <script src="http://gallerybox.echartsjs.com/dep/dat.gui.min.js" type="text/javascript"></script> -->
<!-- <script src="http://gallerybox.echartsjs.com/js/loadIframeScripts.js" type="text/javascript"></script> -->
<!-- <script src="http://gallerybox.echartsjs.com/js/run.js" type="text/javascript"></script> -->
<!-- <script src="http://gallerybox.echartsjs.com/dep/echarts/theme/dark.js" type="text/javascript"></script> -->

<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecMain.js"></script>
<script>
$(window).load(function(){
	var masterOption;
	var ColctOption;
	var DataOption;
	
	var masterChart = echarts.init(document.getElementById('fecMaster'),'dark');
	var ColctChart = echarts.init(document.getElementById('fecColct'),'dark');
	var DataChart = echarts.init(document.getElementById('fecData'),'dark');
	
	masterOption = setMasterChart();    
	ColctOption = setColctChart(); 
	DataOption = setDataChart(); 
	
	setTimeout($.proxy(function () {
		//setDeptforMap();
		setPowrChart();
	}, this), 500);	
	setTimeout($.proxy(function () {
		//chart();
	}, this), 1000);	
	
    $('#vortex').vortex({
        speed : 10,
        manualAdvance : true,
        initialPosition : 270
    });
    
    var timeTicketVortex = setInterval(function (){ 
        $('#vortex').data('vortex').step(1);
    }, 5000);
    
    
    setInterval(function() {
        var value = parseInt(Math.random() * 55) + 30,
            value_ = (100 - value) * 266 / 360;
        if (value < 80)
        	masterOption.series[0].color[0] = "red";
        else
        	masterOption.series[0].color[0] = "#9f8fc1";
        masterOption.title.subtext = value + "%";
        masterOption.series[1].data[0].value = value_;
        masterOption.series[1].data[1].value = 100 - value_;
        masterChart.setOption(masterOption, true);
    }, 3000);
    
    setInterval(function() {
        var value = parseInt(Math.random() * 55) + 30,
            value_ = (100 - value) * 266 / 360;
        if (value < 80)
        	ColctOption.series[0].color[0] = "red";
        else
        	ColctOption.series[0].color[0] = "#9f8fc1";
        ColctOption.title.subtext = value + "%";
        ColctOption.series[1].data[0].value = value_;
        ColctOption.series[1].data[1].value = 100 - value_;
        ColctChart.setOption(ColctOption, true);
    }, 3000);
    
    setInterval(function() {
        var value = parseInt(Math.random() * 55) + 30,
            value_ = (100 - value) * 266 / 360;
        if (value < 80)
        	DataOption.series[0].color[0] = "red";
        else
        	DataOption.series[0].color[0] = "#9f8fc1";
        DataOption.title.subtext = value + "%";
        DataOption.series[1].data[0].value = value_;
        DataOption.series[1].data[1].value = 100 - value_;
        DataChart.setOption(DataOption, true);
    }, 3000);
});
</script>
</head>
<body style="background-color:#171a1f">
<!-- -->
<div class="vortex_top">
	
</div>
<div id="fecMap" class="vortex_bottom" >
	<div id="vortex" style="background-color:black;width:400px;height:100px;">
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kyeonggi.png"/>경기본부</div> --%>
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kyeongnam.png"/>경남본부</div> --%>
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kyeongbuk.png"/>경북본부</div> --%>
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_jeonnam.png"/>전남본부</div> --%>
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_jeonbuk.png"/>전북본부</div> --%>
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_chungnam.png"/>충남본부</div> --%>
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_chungbuk.png"/>충북본부</div> --%>
<%--          <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kangwon.png"/>강원본부</div>        --%>
     </div>
</div>
<div id="fecSisul" class="table_style" style="width:550px;height:245px;border:1px solid white;background-color:black;">

<!-- 		<ul style="width:260px;text-align: center;"> -->
<!-- 			<li style="list-style-type: none;display:inline-block;">현장설비 가동현황</li>  -->
<!-- 		</ul> -->
<!-- 		<ul class="round" style="height:150px;border-radius:30px; width:260px; margin:5px;clear: left;">	 -->
<!-- 			<ul style="list-style-type: none;clear: left;"> -->
<!-- 				<li style="width:70px;">사면</li> -->
<!-- 				<li style="width:70px;margin-left:5px;">MDT</li> -->
<!-- 				<li style="width:60px;margin-left:5px;">염수</li> -->
<!-- 			</ul>	 -->
<!-- 			<ul style="list-style-type: none;clear: left;"> -->
<!-- 				<li style="width:60px;height:60px;margin-left:-5px;"><img src="/images/main/fec_slope.png" ></li> -->
<!-- 				<li style="width:60px;height:60px;margin-left:15px;"><img src="/images/main/fec_mdt.png" ></li> -->
<!-- 				<li style="width:60px;height:60px;margin-left:15px;"><img src="/images/main/fec_brine.png" ></li> -->
<!-- 			</ul> -->
<!-- 			<ul style="list-style-type: none;clear: left;"> -->
<!-- 				<li style="width:70px;margin-left:-10px;font-size:15px"><a style="color:red;">1266</a>/1267</li> -->
<!-- 				<li style="width:70px;margin-left:5px;font-size:15px">2000/2000</li> -->
<!-- 				<li style="width:70px;margin-left:5px;font-size:15px">51/51</li> -->
<!-- 			</ul>	 -->
<!-- 		</ul> -->
<!-- 		<ul class="round" style="height:150px;border-radius:30px; width:260px; margin:5px;float:left;">			 -->
<!-- 			<ul style="list-style-type: none;clear: left;"> -->
<!-- 				<li style="width:70px;">터널</li> -->
<!-- 				<li style="width:70px;margin-left:5px;">전기</li> -->
<!-- 				<li style="width:60px;margin-left:5px;">오수</li> -->
<!-- 			</ul>	 -->
<!-- 			<ul style="list-style-type: none;clear: left;"> -->
<!-- 				<li style="width:60px;height:60px;"><img src="/images/main/fec_tunnel.png" ></li> -->
<!-- 				<li style="width:60px;height:60px;margin-left:15px;"><img src="/images/main/fec_electricenergy.png" ></li> -->
<!-- 				<li style="width:60px;height:60px;margin-left:15px;"><img src="/images/main/fec_PltwtrProcess.png" ></li> -->
<!-- 			</ul> -->
<!-- 			<ul style="list-style-type: none;clear: left;"> -->
<!-- 				<li style="width:70px;margin-left:-10px;font-size:15px">786/786</li> -->
<!-- 				<li style="width:70px;margin-left:5px;font-size:15px"><a style="color:red;">2601</a>/2603</li> -->
<!-- 				<li style="width:70px;margin-left:5px;font-size:15px">52/52</li> -->
<!-- 			</ul>	 -->
			
<!-- 		</ul> -->
		
<!-- 		<ul style="height:39px;list-style-type: none;margin:5px;"> -->
<!-- 			<li style="font-size:18px;width:260px;"> 인터넷망 </li> -->
<!-- 			<li style="font-size:18px;width:260px;margin-left:10px;"> 제어망 </li>			 -->
<!-- 		</ul> -->
 	
 	
	
</div>
<div id="fecIOT" style="width:550px;height:200px;border:1px solid white;">
	<div id="fecMaster" style="width:183px;height:200px;float:left;">
	</div>
	<div id="fecColct" style="width:183px;height:200px;float:left;">
	</div>
	<div id="fecData" style="width:184px;height:200px;float:left;">
	</div>
</div>
<div style="background-color:black;width:550px;height:200px;border:1px solid white;">
	<div id="fecPower" style="width:580px;height:220px;">
		
	</div>
</div>
<div id = "idChart" style="width:200px; height: 200px; border:0px solid black">		
</div>

<%-- <script src="<%=request.getContextPath()%>/js/echarts/source/echartsMap.js"></script> --%>

</body>

</html>
