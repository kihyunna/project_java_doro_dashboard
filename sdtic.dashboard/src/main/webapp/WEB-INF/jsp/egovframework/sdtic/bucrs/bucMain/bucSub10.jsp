<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
</head>
<body>
<div id="main" style="width:460px;height:250px;">
	<table>
		<tr>
			<td style="width:82px;height:90px;"><center><img src="${contextPath}/images/bucrs/plan2.png" width="80px" height="80px"></center></td>
			<td style="width:105px;height:90px;"><center><img src="${contextPath}/images/bucrs/arrow3.gif" width="80px" height="50px"></center></td>
			<td style="width:82px;height:90px;"><center><img src="${contextPath}/images/bucrs/build2.png" width="80px" height="80px"></center></td>
			<td style="width:105px;height:90px;"><center><img src="${contextPath}/images/bucrs/arrow3.gif" width="80px" height="50px"></center></td>
			<td style="width:82px;height:90px;"><center><img src="${contextPath}/images/bucrs/corrective2.png" width="80px" height="80px"></center></td>
		</tr>
		<tr>
			<td style="width:90px;height:142px;" ></td>
			<td style="width:90px;height:142px;" valign='top'><b><center>데이터입력<div id="data0">0 %</div>감독승인율<div id="data1">0 %</div>정보이관율<div id="data2">0 %</div><center></b></td>
			<td style="width:90px;height:142px;"></td>
			<td style="width:90px;height:142px;" valign='top'><b><center>데이터입력<div id="data3">0 %</div>감독승인율<div id="data4">0 %</div>정보이관율<div id="data5">0 %</div><center></b></td>
			<td style="width:90px;height:142px;"></td>
		</tr>
	</table>
	<script type="text/javascript">
		$(window).load(function() {
			timerStart();
		});
		
		function randomCnt(){
			
			var randdomdata = new Array();
			var divDataArray = new Array();
			
			for(var divData=0; divData < 6 ; divData++){
				divDataArray[divData] = $('#data'+divData).text().split(" ")[0];
				if(divDataArray[divData] == 100){
					divDataArray[divData] = 0;
				}
			}
			
			for(var i = 0 ; i<6;i++){
				randdomdata[i] = Math.floor(Math.random()*6)+1;
				divDataArray[i] = parseInt(divDataArray[i]) + randdomdata[i];
				if(divDataArray[i] > 100){
					$('#data'+i).text(100 + " %");
				}else{
					$('#data'+i).text(divDataArray[i] + " %");
				}
				
			}

    	}
		
		function timerStart(){
			window.setInterval("randomCnt()",1000);
		}
		
	</script>
</div>
</body>
</html>