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
<script src="<%=request.getContextPath()%>/js/main/mainSptIOTView.js" type="text/javascript"></script>
    
<style type="text/css"> html, body { height:100%; overflow:hidden } .h-div {height:96%; border:3px #f99 solid} </style>


</head>
<script>

$(function() {
	AjaxQuery();
	
	setInterval($.proxy(function () {
		AjaxQuery();
	}, this), 1000*60);
	
	$('#idChart').css('width', $(window).width()); 
    $('#idChart').css('height', $(window).height()); 
    $(window).resize(function() { 
        $('#idChart').css('width', $(window).width()); 
        $('#idChart').css('height', $(window).height()); 
        myChart.resize({
            width: $(window).width(),
            height : $(window).height()
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
<body >
<div id = "idChart" style="width:100%; height:100%;">

</div>

</body>
</html>