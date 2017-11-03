<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
</head>
<body>
	<style>
#gridTbl td, th {
	border: 1px solid white;
	border-collapse: collapse;
	font-family: NanumGothic;
}

#gridTbl tr {
	height: 24px;
}

#gridTbl th {
	font-size: 18px;
	background: #ffffffff;
	border-bottom: 1px solid #fff;
	color: #f9f9f9;
}

#gridTbl td {
	
	color: #669;
	border-top: 1px solid #fff;
	background: #ffffffff;
}

#gridTbl {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 18px;
	width: 930px;
	text-align: center;
	border-collapse: collapse;
	border-bottom: 1px solid #fff;
}

#gridTbl tr td {
	background: #ffffffff;
	font-size: 16px;
	color: #fff;
}

#tr_d {
	text-align: right;
}

#Rd1 {
	color: #FFFF7F;
}

#Rd5 {
	color: #FFFF7F;
}

#Rd9 {
	color: #FFFF7F;
}

#Rd2 {
	color: #69C5F4;
}

#Rd6 {
	color: #69C5F4;
}

#Rd10 {
	color: #69C5F4;
}

#Rd3 {
	color: #7ACFA1;
}

#Rd7 {
	color: #7ACFA1;
}

#Rd11 {
	color: #7ACFA1;
}

#Rd4 {
	color: #FF686A;
}

#Rd8 {
	color: #FF686A;
}

#Rd12 {
	color: #FF686A;
}

.str1 {
	color: red;
}
</style>

	<link rel="stylesheet" type="text/css"
		href="${contextPath}/css/bucrs/liMarquee.css">
	<!-- <link rel="stylesheet" type="text/css" href="${contextPath}/css/bucrs/style_tb.css">-->

	<script type="text/javascript"
		src="${contextPath}/js/fecrs/jquery-2.1.4.js"></script>
	<script type="text/javascript"
		src="${contextPath}/js/bucrs/jrolling/jquery.liMarquee.js"></script>

	<script type="text/javascript">
		$(window).load(function() {

			timer();
			divDate();
			$('.str1').liMarquee();

		});
		function math_random() {
			var foo = new Array();

			for (var i = 0; i < 7; i++) {
				foo[i] = Math.floor(Math.random() * 100) + 1;
				$('#Rd' + i).text(foo[i]);
			}

		}
		function timer() {
			window.setInterval("math_random()", 5000);
		}
		function divDate() {
			var today = new Date();

			var month = today.getMonth() + 1;
			var day = today.getDate();
			var year = today.getFullYear();
			if (day < 10) {
				day = '0' + day
			}

			if (month < 10) {
				month = '0' + month
			}

			$('#tr_d').text(+year + "-" + month + "-" + day);

		}
	</script>
<body>

	<table width="930px;" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td height="43" colspan="2"
				style="background-color: #ffffffff; color: #f9f9f9; font-weight: bolder;">

				정보이관 Tracking Process</td>
		</tr>
		<tr>
			<td height="2" colspan="5" style="background-color: #3d4146;"></td>
		</tr>
	</table>

	<table id="gridTbl" width="930px;"  height="130px" cellspacing="0" rules="rows"frame="void">
		<tr>
			<td id="tr_d" colspan="5" style="height:10px; background-color: #ffffffff; color: #f9f9f9; font-weight: bolder;"></td>
		</tr>
		<tr>
			<th rowspan="2" width="180px;">부서</th>
			<th rowspan="2" width="180px;">기한 내<br>미처리건
			</th>
			<th colspan="3">알림메세지</th>
		</tr>
		<tr>
			<th align="center" width="160px;">발송</th>
			<th align="center" width="160px;">처리</th>
			<th align="center" width="160px;">미처리</th>
		</tr>
		<tr>
			<td align="center">설계처</td>
			<td align="center"><div id=Rd1>4</div></td>
			<td align="center"><div id=Rd2>5</div></td>
			<td align="center"><div id=Rd3>7</div></td>
			<td align="center"><div id=Rd4>7</div></td>
		</tr>
		<tr>
			<td align="center">수도권건설 사업단</td>
			<td align="center"><div id=Rd5>7</div></td>
			<td align="center"><div id=Rd6>7</div></td>
			<td align="center"><div id=Rd7>4</div></td>
			<td align="center"><div id=Rd8>5</div></td>
		</tr>
		<tr>
			<td align="center">대구순환건설 사업단</td>
			<td align="center"><div id=Rd9>7</div></td>
			<td align="center"><div id=Rd10>7</div></td>
			<td align="center"><div id=Rd11>4</div></td>
			<td align="center"><div id=Rd12>5</div></td>

		</tr>
	</table>
	<div class="str1" style="width: 930px; height:12px; font-size: 20px; background: #ffffffff;">
		<p>★당일 경북본부 점용만료 5건 ★경남본부 하자만료 11건</p>
	</div>



</body>
</html>