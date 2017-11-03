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
<script src="<%=request.getContextPath()%>/js/fecrs/facilities/FecAreclTroblOccrrncManagtMain.js" type="text/javascript"></script>
    
</head>
<script>
$(function() {

	AjaxQuery("1", "2", '<%=request.getContextPath()%>'); 

});
</script>
<script type="text/javascript">
    $(window).load(function() 
    {
        $('html').css("overflow","hidden");  // 레이어 뜬상태에서 html 스크롤바 삭제
    });
</script>
<body>
	<table border="0" cellpadding="0" cellspacing="0">
    	<tr >
    		<td height="43" style="background-color:#ffffffff;color:#f9f9f9;font-weight:bolder;">
    			
    				<font color="#f9f9f9" >
    					권역별 장애발생/조치
    				</font>
    			
    		</td>
    	</tr>
    	<tr>
			<td height="2" style="background-color:#3d4146;">
			</td>
		</tr>
    </table>

<div id = "idChart" style="width:600px; height: 300px; top:0px; left:0px;">

</div>

</body>
</html>