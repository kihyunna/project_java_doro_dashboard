<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name='author' content='ese, 이에스이' />
<meta http-equiv='description' content='RINO UXP - User Experience Platform(UX 플랫폼)' />
<title>현장센서</title>
<link href="<%=request.getContextPath()%>/css/fecrs/css/default.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/echarts/source/js/jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/js/main/mainSptSensorView.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/css/../default.css" /> -->
<style type="text/css">
	.tblPS{width:100%;border-spacing:0;font-size:14px;font-family:"nanumB", "NanumGothicBold", "Nanum Gothic", "나눔고딕", "돋움", "Dotum";color:#ccc;}
	.tblPS caption{overflow:hidden;position:absolute;left:-2000%;z-index:-1;font-size:0;line-height:0;}
	.tblPS tr.tpInert{color:#5d5f63;}
	.tblPS tr.tpInert td img{opacity:0.3;}
	.tblPS td{height:30px;padding:5px 18px;border-bottom:2px solid #435f8d;text-align:center;
		box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
	.tblPS td.cellIco{position:relative;}
	.tblPS .barTblPS{position:absolute;right:0;top:10px;}
	.tblPS tr td:first-child, 
	.tblPS tr td:last-child{background:url("/images/main/lineTblPS.png") no-repeat left bottom;}
	.tblPS tr td:last-child{background-position:right bottom;}
	.tblPS .numPrb{}
	.tblPS tr.tpWrn .numPrb{color:#f47920;}/*f8375a*/
	.tblPS tr.tpWrn .bgBarChart .checkBarChart{background:rgba(244,121,32,1.0);}
	.bgBarChart{position:relative;width:100%;height:100%;background:rgba(47,69,84,1.0);}/*#2f4554*/
	.bgBarChart .checkBarChart{position:absolute;width:0%;height:100%;background:rgba(8,142,171,1.0);}/*#7ea7f2(126,167,242) #088eab(8,142,171)*/
	
</style>
</head>
<script>

$(function() {	
	AjaxQuery();
	
	setInterval($.proxy(function () {
		AjaxQuery();
	}, this), 1000*60*6);
	
});
</script>
<body>
<div id="wrap_if">
	<table class="tblPS" summary="현장센서별 총갯수와 문제발생갯수를 보여 준다.">
		<caption>현장센서</caption>
		<colgroup>
			<col width="80" />
			<col width="100" />
			<col width="100" />
			<col width="*" />
		</colgroup>
		<tbody>
<!-- 			<tr class="tpWrn"> -->
			<tr id="tr_mdt">
				<td class="cellIco">
					<img src="/images/main//icoFclt02.png" alt="MDT" />
					<img src="/images/main//barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>MDT</td>
				<td id="td_mdt"><span class="numPrb">0</span>/0</td>
				<td>
					<div class="bgBarChart">
						<div  id="div_mdt" class="checkBarChart" style="width:0%;"></div>
					</div>
				</td>
			</tr>
			<tr id="tr_tunnel">
				<td class="cellIco">
					<img src="/images/main//icoFclt04.png" alt="터널" />
					<img src="/images/main//barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>터널</td>
				<td id="td_tunnel"><span class="numPrb">0</span>/0</td>
				<td>
					<div class="bgBarChart">
						<div id="div_tunnel" class="checkBarChart" style="width:0%;"></div>
					</div>
				</td>
			</tr>
			<tr id="tr_elcts">
				<td class="cellIco">
					<img src="/images/main//icoFclt05.png" alt="전기" />
					<img src="/images/main//barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>전기</td>
				<td id="td_elcts"><span class="numPrb">0</span>/0</td>
				<td>
					<div class="bgBarChart">
						<div id="div_elcts" class="checkBarChart" style="width:0%;"></div>
					</div>					
				</td>
			</tr>
			<tr id="tr_slp">
				<td class="cellIco">
					<img src="/images/main//icoFclt01.png" alt="사면" />
					<img src="/images/main//barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>사면</td>
				<td id="td_slp"><span class="numPrb">0</span>/0</td>
				<td>
					<div class="bgBarChart">
						<div id="div_slp" class="checkBarChart" style="width:0%;"></div>
					</div>
				</td>
			</tr>
			<tr id="tr_svar">
				<td class="cellIco">
					<img src="/images/main//icoFclt06.png" alt="오수" />
					<img src="/images/main//barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>오수</td>
				<td id="td_svar"><span class="numPrb">0</span>/0</td>
				<td>
					<div class="bgBarChart">
						<div id="div_svar" class="checkBarChart" style="width:0%;"></div>
					</div>
				</td>
			</tr>
			<tr id="tr_cctv">
				<td class="cellIco">
					<img src="/images/main/icoFclt08.png" alt="CCTV" />
					<img src="/images/main/barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>CCTV</td>
				<td id="td_cctv"><span class="numPrb">0</span>/0</td>
				<td>
					<div class="bgBarChart">
						<div id="div_cctv" class="checkBarChart" style="width:0%;"></div>
					</div>
				</td>
			</tr>
			<tr class="tpInert">
				<td class="cellIco">
					<img src="/images/main/icoFclt03.png" alt="염수" />
					<img src="/images/main/barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>염수</td>
				<td>-</td>
				<td>					
				</td>
			</tr>			
			<tr class="tpInert">
				<td class="cellIco">
					<img src="/images/main/icoFclt07.png" alt="교량" />
					<img src="/images/main/barTblPS.png" alt="" class="barTblPS" />
				</td>
				<td>교량</td>
				<td>-</td>
				<td></td>
			</tr>
			<tr class="tpInert">
				<td class="cellIco"></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>