<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="ECharts">
<script src="<%=request.getContextPath()%>/js/echarts/source/echarts.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/echarts/source/js/jquery.min.js"></script>

    
<style>
	class_table {text-align: center;
	
	}
</style>
</head>
<script>
$(function() {
	var bonbu=1;
	setTimeout($.proxy(function () {
		AjaxQuery("1", "2", '<%=request.getContextPath()%>'); 
	}, this), 500);	
	
	setInterval($.proxy(function () {
		if (bonbu==1)
			bonbu ++;
		else
			bonbu = 1;
		$( "#idDiv" ).fadeOut( "slow", function() {
			AjaxQuery(bonbu, "2", '<%=request.getContextPath()%>');
		});
	}, this), 10000);
});
</script>
<body style="overflow:hidden;">

<div id = "" style="background-color:transparent;">
	<div style="top:0px;margin-left:380px;">
			  	<a style="color:#f9f9f9;font-size:20px;"> MDT 운영현황</a>
	</div>
		
    <div id = "idDiv" style="width:100%;height: 275px; margin-top:5px;float:left;background-color:transparent;">	
	    <div id = "idChart" style="width:300px; height: 275px; top:0px; left:0px; float:left;">		
		</div>
				
		<div id = "idTable_mdt" style="height:275px;float:left;  margin-left:5px; ">
			<table class="class_table" style=" border-collapse:collapse; border:3px solid rgb(39,43,49) ; width:180px;" cellpadding="1" cellspacing="2" border="1" align="left" >
				<tr style="height:50px; ">				
					<th style="font-size:13px;width:100px; color:white;background-color:rgb(27,31,36);text-align: center;"> 수신율 구분 </th>
					<th colSpan="2" style="font-size:13px; width:80px; color:white;background-color:rgb(27,31,36);text-align: center;"> 운행차량</th>
				</tr>
				<tr style="height:37px;">								
					<td rowSpan="2" style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(22,96,74);"> 95%이상 </td>
				    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 금일 </td>				    
				    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 95 </td>
				</tr>
				<tr style="height:37px;">								
				    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 전일 </td>
				    <td style="font-size:13px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:40px;"> 85 </td>
				</tr>
				
				<tr style="height:37px;">
				    <td rowSpan="2"  style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(128,100,54)"> 85~94% </td>
				    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 금일 </td>
				    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;">  4 </td>
				</tr>
				<tr style="height:37px;">								
				    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 전일 </td>
				    <td style="font-size:13px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:40px;"> 20 </td>
				</tr>
				
				<tr style="height:37px;">
				    <td rowSpan="2"  style="font-size:12px;text-align: center; width:80px; color:white; background-color:rgb(112,46,33)"> 85%이하 </td>
				    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;"> 금일 </td>
				    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;">  1 </td>
				</tr>
				<tr style="height:37px;">								
				    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;"> 전일 </td>
				    <td style="font-size:13px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:40px;">  5 </td>
				</tr>
			
			</table>
		</div>
		<div id = "idTable_inform" style="width:400px;height: 275px; margin-left:5px;float:left;">
			<table class="class_table" style=" border-collapse:collapse; border:3px solid rgb(39,43,49); width:460px; margin-top:-1px;" cellpadding="1" cellspacing="2" border="1" align="left" >
				<tr style="height:50px; background-color:rgb(27,31,36);">				
					<th colSpan="4" style="font-size:13px;width:100%; color:white;"> 수신율 장애장비 정보</th>
				</tr>
				
				<tr style="height:37px; background-color:rgb(27,31,36);">
					<th style="font-size:13px;width:100px; color:white; text-align: center;"> 일련번호 </th>
					<th style="font-size:13px;width:130px; color:white; text-align: center;"> 지사 </th>
					<th style="font-size:13px;width:100px; color:white; text-align: center;"> 최종작업 </th>
					<th style="font-size:13px;width:130px; color:white; text-align: center;"> 최종위치 </th>
				</tr>
				
				<tr style="height:37px;">								
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00001 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 원주지사 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 염수살포</td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>				    
				</tr>
				<tr style="height:37px;">								
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00002 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 대관령지사 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 소금살포</td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>				    
				</tr>
				<tr style="height:37px;">								
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00003 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 홍천지사 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 모래살포</td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>				    
				</tr>
				<tr style="height:37px;">								
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00004 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 충주지사 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 제설작업</td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>				    
				</tr>
				<tr style="height:37px;">								
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 00005 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 춘천지사 </td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> 제설작업</td>
				    <td style="font-size:12px;text-align: center; color:white; background-color:rgb(27,31,36);width:20px;"> </td>				    
				</tr>
				
			</table>
		</div>
<!-- 		<div id = "idTable" loat:left;"> -->
<!-- 			<table class="class_table" border-collapse:collapse; border:3px solid rgb(39,43,49) ; width:100px;" cellpadding="1" cellspacing="2" border="1" align="left" > -->
<!-- 				<tr style="height:30px; background-color:rgb(20,23,27);">				 -->
<!-- 					<th style="font-size:12px;width:40px; color:white;"> 수신율 구분 </th> -->
<!-- 					<th colSpan="2" style="font-size:12px; width:100px; color:white;"> 운행차량</br>(전일/금일)</th> -->
<!-- 				</tr> -->
<!-- 				<tr style="height:30px;">								 -->
<!-- 				    <td style="font-size:12px;text-align: center; width:40px; color:white; background-color:rgb(22,96,74);"> 95%이상 </td> -->
<!-- 				    <td style="font-size:12px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:10px;"> 85 </td> -->
<!-- 				    <td style="font-size:12px;text-align: center; color:rgb(22,96,74); background-color:rgb(27,31,36); width:10px;"> 95 </td> -->
<!-- 				</tr> -->
<!-- 				<tr style="height:30px;"> -->
<!-- 				    <td style="font-size:12px;text-align: center; width:40px; color:white; background-color:rgb(128,100,54)"> 85~94% </td> -->
<!-- 				    <td style="font-size:12px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:10px;"> 20 </td> -->
<!-- 				    <td style="font-size:12px;text-align: center; color:rgb(128,100,54); background-color:rgb(27,31,36);width:10px;">  4 </td> -->
<!-- 				</tr> -->
<!-- 				<tr style="height:30px;"> -->
<!-- 				    <td style="font-size:12px;text-align: center; width:40px; color:white; background-color:rgb(112,46,33)"> 85%이하 </td> -->
<!-- 				    <td style="font-size:12px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:10px;">  5 </td> -->
<!-- 				    <td style="font-size:12px;text-align: center; color:rgb(112,46,33); background-color:rgb(27,31,36);width:10px;">  1 </td> -->
<!-- 				</tr> -->
			
<!-- 			</table> -->
<!-- 		</div> -->
    </div> 

	
</div>
<div id = "sidebar-code" style="display:none"></div>
<div id = "graphic" style="display:none"></div>
<div id = "wrong-message" style="display:none"></div>
<div id = "icon-resize" style="display:none"></div>
<script src="<%=request.getContextPath()%>/js/echarts/source/echartsMap.js"></script>
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/fecMdtoperation01.js" type="text/javascript"></script>

</body>


</html>