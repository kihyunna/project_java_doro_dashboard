<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>이벤트 리스트</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/common/tsort.js"></script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <table border="0" cellpadding="0" cellspacing="0" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;">
	        <tr>
	            <td height="43" width="700">
	                &nbsp;이벤트 리스트
	            </td>
	        </tr>
	        <tr>
	            <td height="2" style="background-color:#3d4146;">
	            </td>
	        </tr>
	        <tr>
	            <td valign="top">
	                <table id="tableSorter" border="1" cellpadding="0" cellspacing="0" width="700" style="background-color:#22272d;color:#f9f9f9;font-weight:normal;font-size:4px;">
	                    <tr>
	                        <th height="25" width="17%" align="center" style="background-color:#3d4146;">
	                            발생일시
	                        </th>
	                        <th height="25" width="10%" align="center" style="background-color:#3d4146;">
	                            서버구분
	                        </th>
	                        <th height="25" width="30%" align="center" style="background-color:#3d4146;">
	                            서버명
	                        </th>
	                        <th height="25" width="13%" align="center" style="background-color:#3d4146;">
	                            위험지수
	                        </th>
	                        <th height="25" width="30%" align="center" style="background-color:#3d4146;">
	                            내용
	                        </th>
	                    </tr>
	                    <tr height="20">
	                        <td align="center">
	                            2017-01-02 16:15:54
	                        </td>
	                        <td align="center">
	                            수집/중계
	                        </td>
	                        <td align="center">
	                            스마트제한차량 수집 [tsrasgat1]
	                        </td>
	                        <td id="danger" align="center" style="color:#de1500">
	                            ●위험
	                        </td>
	                        <td>
	                            &nbsp;PROCESS OFF
	                        </td>
	                    </tr>
	                    <tr height="20">
	                        <td align="center">
	                            2017-01-02 16:13:12
	                        </td>
	                        <td align="center">
	                            수집/중계
	                        </td>
	                        <td align="center">
	                            스마트제한차량 수집 [tsrasgat1]
	                        </td>
	                        <td align="center" style="color:#deb500">
	                            ●경고
	                        </td>
	                        <td>
	                            &nbsp;CPU 95% 초과
	                        </td>
	                    </tr>
	                    <tr height="20">
	                        <td align="center">
	                            2017-01-02 15:11:22
	                        </td>
	                        <td align="center">
	                            수집/중계
	                        </td>
	                        <td align="center">
	                            빅데이타 [NEW_AP_BIG1]
	                        </td>
	                        <td align="center" style="color:#deb500">
	                            ●경고
	                        </td>
	                        <td>
	                            &nbsp;CPU 95% 초과
	                        </td>
	                    </tr>
	                    <tr height="20">
	                        <td align="center">
	                            2017-01-02 13:44:22
	                        </td>
	                        <td align="center">
	                            WEB/WAS
	                        </td>
	                        <td align="center">
	                            포털 [cclwas002]
	                        </td>
	                        <td align="center" style="color:#deb500">
	                            ●경고
	                        </td>
	                        <td>
	                            &nbsp;CPU 90% 초과
	                        </td>
	                    </tr>
	                    <tr height="20">
	                        <td align="center">
	                            2017-01-01 11:11:22
	                        </td>
	                        <td align="center">
	                            DB
	                        </td>
	                        <td align="center">
	                            통합DB/시설물DB
	                        </td>
	                        <td align="center" style="color:#deb500">
	                            ●경고
	                        </td>
	                        <td>
	                            &nbsp;MEMORY 95% 초과
	                        </td>
	                    </tr>
	                </table>
	
	            </td>
	        </tr>
	    </table>
	    
	    <script type="text/javascript">
		    $(document).ready(function() {
		        $("#tableSorter").tableSort({
		            animation: 'fade',
		            speed: 300,
		            delay: 100
		        });
		    });
		    
		    var cnt = 1;
		    var timeTicket = setInterval(function () {
	            if(cnt == 0){
	                $("#danger").css("color","#deb500");
	                $("#danger").text("●경고");
	                
	                cnt = 1;
	            }else if(cnt == 1){
	            	$("#danger").css("color","#de1500");
	                $("#danger").text("●위험");
	
	                cnt = 0;
	            }
	        }, 3000);
		</script>
	</body>
</html>