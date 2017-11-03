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

<%-- 차트   --%>  
<script src="<%=request.getContextPath()%>/js/echarts/dist/echarts.js" type="text/javascript"></script>

<%-- 자바스크립트  --%>  
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecPwrerUsgqtyLv1.js" type="text/javascript"></script>
    
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

    //AjaxQuery('N01798');
    
});



//위젯간 통신
function uf_receiveMessage(e){	   
	  var command = e.data.command;
	  switch(command){
	        case 'Level1MapDeptCode' :    { //레벨2, 레벨1 : Level1MapDeptCode
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
<!-- <body style = "background-color:black"> -->
<body>
<div id = "idChart" style="width:485px; height: 300px; top:0px;  margin-left:10px;">

</div>

</body>
</html>