<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="ECharts">
<link href="<%=request.getContextPath()%>/css/fecrs/css/default.css" rel="stylesheet" type="text/css">
<%-- <link href="<%=request.getContextPath()%>/css/main/default.css" rel="stylesheet" type="text/css">  --%>
<script src="<%=request.getContextPath()%>/js/echarts/source/echarts.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/echarts/source/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/proj4js/lib/proj4js.js"></script>
    
<style>
	class_table {text-align: center;}
	li_table {width: 400px; border:1 solid red;border-top:none;border-right:none}
	li_table ul {clear: left;margin: 0;padding: 0;list-style-type: none;border-top:1 solid red;} 
	/* list-style-type 블릿표시 padding: 0; 들여쓰기*/
	li_table .subject {font-weight: bold;text-align: center;}
	li_table ul li {text-align: center;float: left;margin: 0;padding: 2px, 1px;border-right:1 solid red;width: 100px;}
	li_table ul .col {width: 99px;} /* 표 라인 맞추기기 위해*/
	
	.table_style {
		 width: 290px; /* 전체 테이블 폭 지정 */	
		 text-align: center; 
		 float: left;
		 margin-left:0px;
		 display:table-cell;
		 font-size:14px;
		}		
		
	.table_style ul {
		 clear: left;
		 margin: 0px; /*ul 에 대한 ie, ff 차이를 없애기 위해 0 으로 설정 */
		 padding: 1px 1px 1px 1px; /*ff 는 속성에 기본 margin, padding 이 설정된 경우가 았음*/
		 list-style-type: none; /* ul li 태그 사용으로 인한 disc 를 안보이도록*/		
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0);	 
/* 		 border-left-:1px solid rgba(0,0,0,0.1); */
/* 		 border-right:1px solid rgba(0,0,0,0.1); */
/* 		 background-color:rgb(27,31,36); */
		 
/* 		 height:36px;		  */
	}		
/* 	.table_style ul:first-child{ */
/* 		text-align: center; */
/* 		border-top:1px solid rgba(0,0,0,0.1); */
/* 		border-bottom:1px solid rgba(0,0,0,0.1); */
/* 	} */
/*  	.TABLE_STYLE UL LI:FIRST-CHILD {  */
/*  		 FONT-WEIGHT: BOLD; */
/*  		 TEXT-ALIGN: CENTER;  */
/*  		 MARGIN-TOP : 1PX; */
/*  	}  */
	.table_style ul li {
		 float: left;
		 margin: 0;  /* 테이블 속성에 사용하던 cellspacing 과 동일 */
		 padding: 0px 0px; /* 테이블 속성에 사용하던 cellpadding 과 동일 */
		 text-align: center;		 
    	 line-height: 36px;
    	 text-align: center; color:white; 
/*     	 background-color:rgba(68,68,68,0.75); */
    	 font-weight: bold;
	}
	.table_style ul .leftPos {
		 width: 112px;
		 height:37px; 
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);
		 font-size:12px;
		 background-color:rgba(51,51,51,0.75);	
		 margin-left:-2px;
		 line-height:37px;
	}	
	
	.table_style ul .middlePos {
		 width: 84px;
		 height:37px;
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);
		 font-size:12px;
		 background-color:rgba(51,51,51,0.75);	
		 margin-left:2px;
		 line-height:37px;
	}
	
	.table_style ul .rightPos {
		 width: 84px;
		 height:37px;
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);	
		 font-size:12px;
		 background-color:rgba(51,51,51,0.75);		 
		 margin-left:1px;
		 line-height:37px;
/* 		 border-right: 1px solid #000; /*테이블의 우측 보더를 만듬*/
	}	
	
  	#wrap_if.pdd{padding:0 10px 10px 10px;}  
  	.sctCntt{float:left;}  
  	.sctCntt.sct01{width:260px;padding-right:20px;text-align:center;}  
  	.sctCntt.sct02{width:260px;padding-right:10px;}  
  	.sctCntt.sct03{width:295px;margin-top:1px;}  
  	.tblWgt .tpG th{background:rgba(11,152,103,0.75);}  
  	.tblWgt .tpG .day{color:#0fc48d;}  
  	.tblWgt .tpY th{background:rgba(244,121,32,0.75);}  
  	.tblWgt .tpY .day{color:#e18229;}  
  	.tblWgt .tpR th{background:rgba(237,27,47,0.75);}  
  	.tblWgt .tpR .day{color:#f8375a;}  
	
/*  	#wrap_if.pdd{padding:0 10px 10px 10px;}  */
/*  	.sctCntt{float:left;}  */
/*  	.sctCntt.sct01{width:260px;padding-right:20px;text-align:center;}  */
/*  	.sctCntt.sct02{width:260px;padding-right:10px;}  */
/*  	.sctCntt.sct03{width:295px;margin-top:1px;}  */
/*  	.tblWgt .tpG th{background:rgba(8,142,171,0.75);}  */
/*  	.tblWgt .tpG .day{color:#76d5e9;}  */
/*  	.tblWgt .tpY th{background:rgba(141,24,202,0.75);}  */
/*  	.tblWgt .tpY .day{color:#cf91ef;}  */
/*  	.tblWgt .tpR th{background:rgba(224,114,47,0.75);}  */
/*  	.tblWgt .tpR .day{color:#f4b995;}  */
</style>
</head>
<script>
//위젯간 통신
var init = false;
var DeptCode = false;
function uf_receiveMessage(e){	   
	  var command = e.data.command;
	  switch(command){
	        case 'Level1MapDeptCode' :    { //레벨2, 레벨1 : Level1MapDeptCode
	        	AjaxQuery(e.data.data.DeptCode);
	        	DeptCode = e.data.data.DeptCode;
	           break;
	        }
	        
	        default : {
	           break;
	        } 
	     }
	}
	
$(function() {
	//위젯간 통신
    if(window.addEventListener) {
       window.addEventListener("message", uf_receiveMessage, false);
    }else if(window.attachEvent) {  //IE에서 이벤트 등록
       window.attachEvent("onmessage", uf_receiveMessage);
    }
	
    setTimeout($.proxy(function () {
    	init = true;
    	setDeptforMap();
    	AjaxQuery(DeptCode);
// 		AjaxQuery('N01796');
    	
    }, this), 1500);
});

var timeoutObj = null;
function ChangeRow(){	   
	   if (MaxListCount <= 5)
	      return;
	   if (CurrentListIdx >= MaxListCount)
	      CurrentListIdx = 0;
	   
	   CurrentListIdx++;
	   
	   var showIdx = CurrentListIdx+5;
	   if (CurrentListIdx+5 > MaxListCount)
	   {
	      showIdx = CurrentListIdx+5-MaxListCount;
	   }   
	   
	   $("#ul"+CurrentListIdx).animate({height: "0px"}, 1000,"swing",function(){$("#ul"+CurrentListIdx).hide();});
	   $("#ul"+showIdx).show();   
	   $("#ul"+showIdx).animate({height: "37px"}, 1000,"swing",function(){});  	 
	   
	   
	   timeoutObj = setTimeout($.proxy(function () {
		   if (breaktimer)
			   return;
	      var obj = $("#idTable_inform ul:first").clone().wrapAll("<div/>").parent().html();
	      $('#idTable_inform').append(obj);
	      $('#idTable_inform ul:first').remove(); 	      
	      ChangeRow();
	   }, this), 3000);
		
};
</script>
<body style="overflow:hidden;">
<div id="idDiv">
<div id="wrap_if" class="pdd">
	<div id = "idChart" style="width:400px; height: 305px; top:0px; left:0px; float:left;">		
	</div>
	
	<!--수신율별 운행차량-->
	<div id = "idTable_mdt" class="sctCntt sct02">
		<table class="tblWgt" summary="수신율별로 금일과 전일의 운행차량 댓수를 보여 준다.">
			<caption>수신율별 운행차량</caption>
			<colgroup>
				<col width="*" />
				<col width="60" />
				<col width="70" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">수신율</th>
					<th scope="col" colspan="2">운행차량</th>
				</tr>
			</thead>
			<tbody>
				<tr class="tpG">
					<th scope="row" rowspan="2">95% 이상</th>
					<td class="day">금일</td>
					<td>0</td>
				</tr>
				<tr class="tpG">
					<td class="day">전일</td>
					<td>0</td>
				</tr>
				<tr class="tpY">
					<th scope="row" rowspan="2">85~94%</th>
					<td class="day">금일</td>
					<td>0</td>
				</tr>
				<tr class="tpY">
					<td class="day">전일</td>
					<td>0</td>
				</tr>
				<tr class="tpR">
					<th scope="row" rowspan="2">85% 이하</th>
					<td class="day">금일</td>
					<td>0</td>
				</tr>
				<tr class="tpR">
					<td class="day">전일</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!--//수신율별 운행차량-->
	
	<!--수신율 장애장비 정보-->
	<div class="sctCntt sct03"  style="margin-top:3px;">
		<div class="table_style" >		
			<ul id="ul1234" style="height:37px;background-color:rgba(68,68,68,0.75);">
				<li style="margin-left:60px;font-weight: bold; height:37px;">수신율 불량 MDT 정보</li>	
			</ul>
			<ul id="ul12345" style="height:37px;width:295px;" class="header" >						
				<li style="height:37px;font-size:13px;"  class="leftPos"> 차량번호 </li>
				<li style="height:37px;font-size:13px;"  class="middlePos"> 지사 </li>
				<li style="height:37px;font-size:13px;"  class="rightPos"> 모델명 </li>				
			</ul>
			
			<div id = "idTable_inform" style="float:bottom;">
				<ul id="ul1" style="height:24px;width:295px;">
					<li class="leftPos" ></li>
					<li class="middlePos"></li>
					<li class="rightPos" ></li>
				</ul>
				<ul id="ul2" style="height:24px;width:295px;">
					<li class="leftPos" ></li>
					<li class="middlePos"></li>
					<li class="rightPos" ></li>
				</ul>
				<ul id="ul3" style="height:24px;width:295px;">
					<li class="leftPos" "></li>
					<li class="middlePos"></li>
					<li class="rightPos" ></li>
				</ul>
				<ul id="ul4" style="height:24px;width:295px;">
					<li class="leftPos" ></li>
					<li class="middlePos"></li>
					<li class="rightPos" "></li>
				</ul>
				<ul id="ul5" style="height:24px;width:295px;">
					<li class="leftPos" ></li>
					<li class="middlePos"></li>
					<li class="rightPos" ></li>
				</ul>
			</div>
			
		</div>
	</div>	
</div>
</div>
<div id = "sidebar-code" style="display:none"></div>
<div id = "graphic" style="display:none"></div>
<div id = "wrong-message" style="display:none"></div>
<div id = "icon-resize" style="display:none"></div>
<script src="<%=request.getContextPath()%>/js/echarts/source/echartsMap.js"></script>
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecMDTOperLv1.js" type="text/javascript"></script>

</body>


</html>