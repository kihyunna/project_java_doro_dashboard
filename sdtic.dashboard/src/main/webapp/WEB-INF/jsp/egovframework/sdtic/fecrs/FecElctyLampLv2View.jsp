<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/fecrs/css/default.css" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="ECharts">
    
<%-- 차트 사용 jquery  --%>  
<script src="<%=request.getContextPath()%>/js/echarts/js/jquery.min.js"></script>

<%-- 자바스크립트  --%>
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecElctyLampLv2.js" type="text/javascript"></script>

<style>
	class_table {text-align: center;}
	li_table {width: 400px; border:1 solid red;border-top:none;border-right:none}
	li_table ul {clear: left;margin: 0;padding: 0;list-style-type: none;border-top:1 solid red;} 
	/* list-style-type 블릿표시 padding: 0; 들여쓰기*/
	li_table .subject {font-weight: bold;text-align: center;}
	li_table ul li {text-align: center;float: left;margin: 0;padding: 2px, 1px;border-right:1 solid red;width: 100px;}
	li_table ul .col {width: 99px;} /* 표 라인 맞추기기 위해*/

	.table_style {
		 width: 600px; /* 전체 테이블 폭 지정 */	
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
	}
	
	.table_style ul li {
		 float: left;
		 margin: 0;  /* 테이블 속성에 사용하던 cellspacing 과 동일 */
		 padding: 0px 0px; /* 테이블 속성에 사용하던 cellpadding 과 동일 */
		 text-align: center;		 
    	 line-height: 36px;
    	 text-align: center; color:white; 
    	 font-weight: bold;
	}
	
/* 	각 위치 default width */
	.table_style ul .leftPos {
		 width: 90px;
		 height:33px; 
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);
		 font-size:12px;
		 background-color:rgba(51,51,51,0.75);	
		 margin-left:-2px;
		 line-height:37px;
	}	
	
	.table_style ul .leftPos_header {
		 width: 90px;
		 height:37px; 
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);
		 font-size:12px;
		 background-color:rgba(68,68,68,0.75);	
		 margin-left:-2px;
		 line-height:37px;
	}	
	
	.table_style ul .middlePos {
		 width: 65px;
		 height:33px;
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);
		 font-size:12px;
		 background-color:rgba(51,51,51,0.75);	
		 margin-left:2px;
		 line-height:37px;
	}
	
	.table_style ul .middlePos_header{
		 width: 65px;
		 height:37px;
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);
		 font-size:12px;
		 background-color:rgba(68,68,68,0.75);	
		 margin-left:2px;
		 line-height:37px;
	}
	
	.table_style ul .rightPos {
		 width: 65px;
		 height:33px;
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);	
		 font-size:12px;
		 background-color:rgba(51,51,51,0.75);		 
		 margin-left:1px;
		 line-height:37px;
	}	
	
	.table_style ul .rightPos_header {
		 width: 65px;
		 height:37px;
		 text-align: center;
		 border: 1px solid rgba(255,255,255,0.1);	
		 font-size:12px;
		 background-color:rgba(68,68,68,0.75);		 
		 margin-left:1px;
		 line-height:37px;
	}	
	
  	#wrap_if.pdd{padding:0 10px 10px 10px;}  
  	.sctCntt{float:left;}  
  	.sctCntt.sct01{width:260px;padding-right:20px;text-align:center;}  
  	.sctCntt.sct02{width:260px;padding-right:10px;}  
/*   	width 수정 */
  	.sctCntt.sct03{width:450px;margin-top:1px;}    	
</style>
    
</head>
<script>
$(function() {
    //위젯간 통신
    if(window.addEventListener) {
       window.addEventListener("message", uf_receiveMessage, false);
    }else if(window.attachEvent) {  //IE에서 이벤트 등록
       window.attachEvent("onmessage", uf_receiveMessage);
    }
    //////////////////
    
	//AjaxQuery('');
	
});
var timeoutObj = null;
function ChangeRow(){	   
	   if (MaxListCount <= 4)
	      return;
	   if (CurrentListIdx >= MaxListCount)
	      CurrentListIdx = 0;
	   
	   CurrentListIdx++;
	   
	   var showIdx = CurrentListIdx+4;
	   if (CurrentListIdx+4 > MaxListCount)
	   {
	      showIdx = CurrentListIdx+4-MaxListCount;
	   }   
	   
	   $("#ul"+CurrentListIdx).animate({height: "0px"}, 1000,"swing",function(){$("#ul"+CurrentListIdx).hide();});
	   $("#ul"+showIdx).show();   
	   $("#ul"+showIdx).animate({height: "33px"}, 1000,"swing",function(){});  	 
	   
	   
	   timeoutObj = setTimeout($.proxy(function () {
		   if (breaktimer)
			   return;
	      var obj = $("#idTable_inform ul:first").clone().wrapAll("<div/>").parent().html();
	      $('#idTable_inform').append(obj);
	      $('#idTable_inform ul:first').remove(); 	      
	      ChangeRow();
	   }, this), 3000);
		
};

//위젯간 통신
function uf_receiveMessage(e){	   
	  var command = e.data.command;
	  switch(command){
	        case 'Level2MapDeptCode' :    { //레벨2, 레벨1 : Level1MapDeptCode
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

<body style="margin:0px;margin-left:5px;top:10px;">

<div id="idDiv" class="pdd">	
	<div class="table_style">
		<!--이벤트 효과 부분-->
		<!--width 수정-->
		<ul id="ul12345" style="height:33px;width:450px;" class="header" >						
			<li class="leftPos_header">위치명칭</li>
			<li class="middlePos_header"> 이정 </li>
			<li class="middlePos_header"> 구분 </li>		
			<li class="middlePos_header"> 정전 </li>
			<li class="middlePos_header"> 누전 </li>	
			<li class="rightPos_header"> 문열림 </li>					
		</ul>

		
		<!--제공된 소스로는 어느 부분이 반복 및 스윙되는지 판단할 수 없음-->
		<div id="idTable_inform" style="float:bottom;"></div>
	</div>
		
</div>
</body>
</html>
