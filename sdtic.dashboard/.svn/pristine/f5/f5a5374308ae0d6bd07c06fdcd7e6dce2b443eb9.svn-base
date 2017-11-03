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
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecPwrerUsgqtyLv2.js" type="text/javascript"></script>
    
</head>
<script>
$(function() {
	var bonbu=1;
	AjaxQuery(1, "2", '<%=request.getContextPath()%>'); 
	
	$('#idChart').css('width', $(window).width()); 
    $('#idChart').css('height', $(window).height()); 
    mapChart.resize({
        width: $(window).width(),
        height : $(window).height()+50
    });
    $(window).resize(function() { 
        $('#idChart').css('width', $(window).width()); 
        $('#idChart').css('height', $(window).height()); 
        mapChart.resize({
            width: $(window).width(),
            height : $(window).height()+50
        });
    }); 

});
</script>
<script type="text/javascript">
    $(window).load(function() 
    {
        $('html').css("overflow","hidden");  // 레이어 뜬상태에서 html 스크롤바 삭제

    });
</script>
<body>
<div id = "idChart" style="width:100%; height: 100%; top:0px;  margin-left:10px;">

</div>

</body>
</html>