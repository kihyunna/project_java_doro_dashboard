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
<script src="<%=request.getContextPath()%>/js/echarts/dist/echarts.js" type="text/javascript"></script>

</head>
<body style="background-color:#171a1f">

<div class="vortex_top">	
</div>
<div id="fecMap" class="vortex_bottom" >
	<div id="vortex" style="background-color:black;width:400px;height:100px;">
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kyeonggi.png"/>수도권본부</div>
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kyeongnam.png"/>경남본부</div>
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kyeongbuk.png"/>경북본부</div>
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_jeonnam.png"/>전남본부</div>
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_jeonbuk.png"/>전북본부</div>
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_chungnam.png"/>충남본부</div>
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_chungbuk.png"/>충북본부</div>
         <div class="square-button" style="text-align:center;color:white;"><img src="${contextPath}/images/main/fec_kangwon.png"/>강원본부</div>       
     </div>
</div>
<div id="fecSisul" class="table_style" style="width:500px;height:200px;border:1px solid white;background-color:black;">

		<ul style="width:260px;text-align: center;">
			<li style="list-style-type: none;display:inline-block;">현장설비 가동현황</li> 
		</ul>
		<ul class="round" style="height:120px;border-radius:30px; width:240px; margin-left:5px; margin-top:-5px; clear: left;">	
			<ul style="list-style-type: none;clear: left;height:30px;margin-top:5px;">
				<li style="width:60px;height:30px;margin-left:-10px;font-size:13px">사면</li>
				<li style="width:60px;height:30px;margin-left:15px;font-size:13px">MDT</li>
				<li style="width:60px;height:30px;margin-left:15px;font-size:13px">염수</li>
			</ul>	
			<ul style="list-style-type: none;clear: left;">
				<li style="width:50px;height:50px;margin-left:0px;"><img src="/images/main/fec_slope.png" ></li>
				<li style="width:50px;height:50px;margin-left:25px;"><img src="/images/main/fec_mdt.png" ></li>
				<li style="width:50px;height:50px;margin-left:25px;"><img src="/images/main/fec_brine.png" ></li>
			</ul>
			<ul style="list-style-type: none;clear: left;margin-top:-15px;border-radius:30px;height:30px;">
				<li style="width:70px;height:30px;margin-left:-15px;font-size:14px"><a style="color:red;">1266</a>/1267</li>
				<li style="width:70px;height:30px;margin-left:8px;font-size:14px">2000/2000</li>
				<li style="width:60px;height:30px;margin-left:8px;font-size:14px">51/51</li>
			</ul>	
		</ul>
		<ul class="round" style="height:120px;border-radius:30px; width:240px; margin-left:5px;margin-top:-5px;float:left;">			
			<ul style="list-style-type: none;clear: left;height:30px;margin-top:5px;">
				<li style="width:60px;height:30px;margin-left:-10px;font-size:13px">터널</li>
				<li style="width:60px;height:30px;margin-left:15px;font-size:13px">전기</li>
				<li style="width:60px;height:30px;margin-left:15px;font-size:13px">오수</li>
			</ul>	
			<ul style="list-style-type: none;clear: left;">
				<li style="width:50px;height:50px;margin-left:-5px;"><img src="/images/main/fec_tunnel.png" ></li>
				<li style="width:50px;height:50px;margin-left:25px;"><img src="/images/main/fec_electricenergy.png" ></li>
				<li style="width:50px;height:50px;margin-left:25px;"><img src="/images/main/fec_PltwtrProcess.png" ></li>
			</ul>
			<ul style="list-style-type: none;clear: left;margin-top:-15px;border-radius:30px;height:30px;">
				<li style="width:70px;height:30px;margin-left:-15px;font-size:14px">786/786</li>
				<li style="width:70px;height:30px;margin-left:8px;font-size:14px"><a style="color:red;">2601</a>/2603</li>
				<li style="width:60px;height:30px;margin-left:8px;font-size:14px">52/52</li>
			</ul>				
			
		</ul>
		
		<ul style="height:20px;list-style-type: none;">
			<li style="font-size:16px;width:220px;"> 인터넷망 </li>
			<li style="font-size:16px;width:220px;margin-left:10px;"> 제어망 </li>			
		</ul>
</div>
<div id="" style="background-color:black;width:500px;height:200px;border:1px solid white;">
	<div id="fecMaster" style="width:166px;height:200px;float:left;">
	</div>
	<div id="fecColct" style="width:166px;height:200px;float:left;">
	</div>
	<div id="fecData" style="width:166px;height:200px;float:left;">
	</div> 	
</div>

<div id="" style="background-color:black;width:500px;height:200px;border:1px solid white;">
 	<div id="fecIOT" style="width:540px;height:250px;margin-top:-30px;"> 	
 	</div> 
</div>
<div style="background-color:black;width:500px;height:200px;border:1px solid white;">
	<div id="fecPower" style="width:500px;height:200px;">
		
	</div>
</div>

<div id = "idChart" style="position:absolute; left: 700px; top : 200px; width:200px; height: 200px; border:0px solid black">		
</div>

<script src="<%=request.getContextPath()%>/js/main/FecMain.js"></script>
</body>

</html>
