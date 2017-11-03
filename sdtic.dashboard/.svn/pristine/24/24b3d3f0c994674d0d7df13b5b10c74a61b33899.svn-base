<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="ECharts">
    
<%-- 차트 사용 jquery  --%>  
<script src="<%=request.getContextPath()%>/js/echarts/js/jquery.min.js"></script>

<%-- 자바스크립트  --%>
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecSlopeDetailLv2.js" type="text/javascript"></script>

<style>

	li_table {width: 400px; border:1 solid red;border-top:none;border-right:none}
	li_table ul {clear: left;margin: 0;padding: 0;list-style-type: none;border-top:1 solid red;} 
	/* list-style-type 블릿표시 padding: 0; 들여쓰기*/
	li_table .subject {font-weight: bold;text-align: center;}
	li_table ul li {text-align: center;float: left;margin: 0;padding: 2px, 1px;border-right:1 solid red;width: 100px;}
	li_table ul .col {width: 99px;} /* 표 라인 맞추기기 위해*/
	
	.table_style {
		 width: 430px; /* 전체 테이블 폭 지정 */	
		 text-align: center; 
		 float: left;
		 margin-left:5px;
		}
		
	.table_style ul {
		 clear: left;
		 margin: 0; /*ul 에 대한 ie, ff 차이를 없애기 위해 0 으로 설정 */
		 padding: 0; /*ff 는 속성에 기본 margin, padding 이 설정된 경우가 았음*/
		 list-style-type: none; /* ul li 태그 사용으로 인한 disc 를 안보이도록*/		
		 text-align: center;		 
		 border-left:1px solid rgb(39,43,49);
		 border-right:1px solid rgb(39,43,49);
		 background-color:rgb(27,31,36);
		 height:36px;		 
	}		
	.table_style ul:first-child{
		text-align: center;
		border-top:1px solid rgb(39,43,49);
		border-bottom:1px solid rgb(39,43,49);
	}
/* 	.table_style ul li:first-child { */
/* 		 font-weight: bold; */
/* 		 text-align: center; */
/* 	} */
	.table_style ul li {
		 float: left;
		 margin: 0;  /* 테이블 속성에 사용하던 cellspacing 과 동일 */
		 padding: 0px 0px; /* 테이블 속성에 사용하던 cellpadding 과 동일 */
		 text-align: center;		 
    	 line-height: 40px;
    	 text-align: center; color:white; background-color:rgb(27,31,36);
    	 font-weight: bold;
	}
	.table_style ul .leftPos {
		 width: 70px; 
		 text-align: center;
		 border-bottom:1px solid rgb(39,43,49);
		 height:35px;
		 font-size:12px;
	}	
	
	.table_style ul .middlePos {
		 width: 70px;
		 text-align: center;
		 border-bottom:1px solid rgb(39,43,49);
		 border-left:1px solid rgb(39,43,49);
		 height:35px;
		 font-size:12px;
	}
	
	.table_style ul .rightPos {
		 width: 70px;
		 text-align: center;
		 border-bottom:1px solid rgb(39,43,49);
		 border-left:1px solid rgb(39,43,49);
		 font-size:12px;
		 height:35px;		 
/* 		 border-right: 1px solid #000; /*테이블의 우측 보더를 만듬*/
	}	

</style>
    
</head>
<script>
$(function() {
	createData();
	AjaxQuery("1", "2", '<%=request.getContextPath()%>'); 

	
// 	setInterval($.proxy(function () {
// 		if (bonbu==1)
// 			bonbu ++;
// 		else
// 			bonbu = 1;
// 		$( "#idDiv" ).fadeOut( "fast", function() {
<%-- 			AjaxQuery(bonbu, "2", '<%=request.getContextPath()%>'); --%>
// 		});
// 	}, this), 10000);
});

function ChangeRow(){
	
	if (MaxListCount <= CurrentListIdx+5)
		return;
	
	CurrentListIdx++;
	
	$("#ul"+CurrentListIdx).animate({height: "0px"}, 1000,"swing",function(){$("#ul"+CurrentListIdx).hide();});
	$("#ul"+(CurrentListIdx+5)).show();	
	$("#ul"+(CurrentListIdx+5)).animate({height: "36px"}, 1000,"swing",function(){});
	
	setTimeout($.proxy(function () {
		ChangeRow();
	}, this), 1500);
		
};
</script>

<script type="text/javascript">
    $(window).load(function() 
    {
        $('html').css("overflow","hidden");  // 레이어 뜬상태에서 html 스크롤바 삭제
    });
</script>
<body>

<div id = "idDiv" style="width:100%;height: 275px; margin-top:5px;float:left;background-color:transparent;">	
	<div class="table_style">
		<ul id="ul1234" style="height:36px;" class="header">
			<li style="height:36px;font-size:13px;width:70px;" class="leftPos">사면명</li>
			<li style="height:36px;font-size:13px;width:70px;" class="middlePos">게이트웨이</li>
			<li style="height:36px;font-size:13px;width:70px;" class="middlePos">센서</li>
			<li style="height:36px;font-size:13px;width:70px;" class="rightPos">충격량(max)</li>
		</ul>
		
		<div id="idTable_inform" style="float:bottom;"></div>
	</div>
</div>
</body>
</html>
