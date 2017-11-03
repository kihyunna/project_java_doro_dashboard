<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>유지관리 시설물 점검/보수보강</title>
<meta charset="utf-8">
<title></title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>

  <style>
#menu {
   text-align: center;
   border-collapse: collapse;
   background-color: #22272d;
   border: 1px solid gray;
   color: #fbfbfb;
}
#menu tr,th,td{
   border-collapse: collapse;
   border: 1px solid gray;
}
th{
    color: #fbfbfb;
    border: 1px solid gray;
    background-color: #3D4146;
    font-size: 15px;
}
#menu td{
    border: 1px solid gray;
    font-size: 14px;
}
div{
    

}


#title_1 table,td{
    border: 0px;
}


</style>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr >
        <td  height="43" style="background-color:#ffffffff; color:#f9f9f9; font-weight:bolder;">
            유지관리 시설물 점검/보수보강
        </td>
    </tr>
    <tr>
        <td height="2" style="background-color:#3d4146;">
        </td>
    </tr>
            <div>
		        <div>
		            <table id="title_1">
		               <td width="500px;" align="right"><font style="font-size:12px; color:#f9f9f9;">시설별 점검 / 보수보강(건수)</font></td>
		            </table>
		            <table id="menu" > 
		                <tr>
		                    <th width="140px;" height="30px;">구분</th>
		                    <th width="90px;">교량</th>
		                    <th width="90px;">터널</th>
		                    <th width="90px;">포장</th>
		                    <th width="90px;">사면</th>
		                </tr>
		            
		                <tr>
		                    <td height="28px;">점검<font style="font-size:12px">(일/누계)</font></td>
		                    <td>18/1,800</td>
		                    <td>16/590</td>
		                    <td>24/625</td>
		                    <td>13/255</td>
		                </tr>
		                <tr>
		                    <td height="28px;"> 보수/보강<font style="font-size:12px">(일/누계)</font></td>
		                    <td>8/530</td>
		                    <td>6/325</td>
		                    <td>4/420</td>
		                    <td>3/120</td>
		                </tr>
		            </table>
		        </div>
		    </div>
        </td>
    </tr>
</table>

<script type="text/javascript">


</script>
</body>
</html>