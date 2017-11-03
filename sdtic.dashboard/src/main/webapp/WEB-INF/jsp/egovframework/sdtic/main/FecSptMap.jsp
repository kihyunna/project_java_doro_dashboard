<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags" %>

<!doctype html>
<html lang="ko" class="cnt_if">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Language" content="ko">
<meta name="robots" content="index, all" />

<title></title>	
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/vortex.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/fecmain.css">
<script type="text/javascript" src="${contextPath}/js/common/jquery.vortex.js"></script>
    
<%-- 차트 사용 jquery  
<script src="<%=request.getContextPath()%>/js/echarts/js/jquery.min.js"></script>
 --%> 
<%-- 자바스크립트  --%>
<script src="<%=request.getContextPath()%>/js/main/FecSptMap.js" type="text/javascript"></script>

</head>

<script>
var idx = 0;
var arrDept =['N01795','N01796','N02723','N01797','N01798','N01799','N01800','N01801'];
$(function() {
    //위젯간 통신
    if(window.addEventListener) {
       window.addEventListener("message", uf_receiveMessage, false);
    }else if(window.attachEvent) {  //IE에서 이벤트 등록
       window.attachEvent("onmessage", uf_receiveMessage);
    }
    //////////////////
    $('#vortex').vortex({
        speed : 80,
        manualAdvance : true
    });
    
    AjaxQuery(arrDept[idx]);
    
    var timeTicketVortex = setInterval(function (){ 
    	if (idx >= 7)
    		idx = 0;
    	else 
    		idx++;
        $('#vortex').data('vortex').step(1);
        AjaxQuery(arrDept[idx]);
    }, 10000);  
	
});

//위젯간 통신
function uf_receiveMessage(e){	   
	  var command = e.data.command;
	  switch(command){
	        case 'MainMapDeptCode' :    { //레벨2, 레벨1 : Level1MapDeptCode
	        	AjaxQuery(e.data.data.DeptCode);
	           break;
	        }
	        
	        default : {
	           break;
	        } 
	     }
	}
</script>

<script type="text/javascript">
    $(window).load(function() 
    {
        $('html').css("overflow","hidden");  // 레이어 뜬상태에서 html 스크롤바 삭제
    });
</script>

<body style="overflow:hidden;">

<div id ="vortexTop" class="vortex_top">	
</div>
<div id="fecMap" class="vortex_bottom" >
	<div id="vortex" style="width:430px;height:60px;margin-left:80px;">	
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_chungbuk.png"/>충북본부</div>		 
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_chungnam.png"/>대전충남</div>         
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_jeonbuk.png"/>전북본부</div>
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_jeonnam.png"/>광주전남</div>
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_kyeongbuk.png"/>대구경북</div>
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_kyeongnam.png"/>부산경남</div>
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_kyeonggi.png"/>수도권본부</div>
         <div class="square-button" style="text-align:center;color:#ccc;"><img src="${contextPath}/images/main/fec_kangwon.png"/>강원본부</div>

     </div>
</div>

<div id="bonbu" style="width:510px;height:150px;margin-top:-30px;">
   	<center>
   	<table class="tblWgt tp03" style="width:100%;height:100%;border-collapse: separate;border-spacing: 2px;border-color: grey; ">
		<tbody>
			<tr style="">
				<th scope="row" style="width:10%;text-align:center;padding:8px 5px 7px 5px;">				
				<a style="color:#ccc">MDT</a>
				</th>
				<th scope="row" style="width:10%;text-align:center;">
				<a style="color:#ccc">터널</a>
				</th>
				<th scope="row" style="width:10%;text-align:center;">
				<a style="color:#ccc">전기</a>
				</th>
				<th scope="row" style="width:10%;text-align:center;">
				<a style="color:#ccc">사면</a>
				</th>
				<th scope="row" style="width:10%;text-align:center;">
				<a style="color:#ccc">오수</a>
				</th>
				<th scope="row" style="width:10%;text-align:center;">
				<a style="color:#ccc">CCTV</a>
				</th>
				<th scope="row" style="width:10%;text-align:center;">
				<a style="color:grey">염수</a>
				</th>
				<th scope="row" style="width:10%;text-align:center;">
				<a style="color:grey">교량</a>
				</th>				
			</tr>
			<tr style="border-collapse:collapse;">			
				<td id="mdt" style="text-align:center;">
				0
				</td>
				<td id="tunnel" style="text-align:center;">
				0
				</td>
				<td id="elcty" style="text-align:center;">
				0
				</td>
				<td id="slope" style="text-align:center;">
				0
				</td>
				<td id="pltwtrProcess" style="text-align:center;">
				0
				</td>
				<td id="cctv" style="text-align:center;">	
				0
				</td>
				<td id="brine" style="text-align:center;">	
				<a style="color:grey">-</a>			
				</td>
				<td id="bridge" style="text-align:center;">
				<a style="color:grey">-</a>
				</td>				
			</tr>
		</tbody>
	</table>
	</center>
</div>

<script src="<%=request.getContextPath()%>/js/main/FecSptMap.js"></script>
</body>

</html>
