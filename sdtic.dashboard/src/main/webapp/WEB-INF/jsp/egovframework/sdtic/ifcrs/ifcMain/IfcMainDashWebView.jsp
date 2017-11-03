<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>WEB/WAS</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/common/tsort.js"></script>
	    
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
		    font-size: 12px;
		}
		#menu td{
		    border: 1px solid gray;
		    font-size: 11px;
		    height: 15px;
		    border-left: none;
		}
		
		div{
		    
		   
		}
		
		#title_1 table,td{
		    border: 0px;
		}
		</style>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <table border="0" cellpadding="0" cellspacing="0">
	        <tr>
	            <td height="43" style="background-color:#ffffffff; color:#f9f9f9; font-weight:bolder;">
	                &nbsp;WEB/WAS
	            </td>
	        </tr>
	        <tr>
	            <td height="2" style="background-color:#3d4146;">
	            </td>
	        </tr>
	        <tr>
	            <td valign="top"">
                    <table id="menu" frame="void">
						<tr>
						    <th width="50px;" height="18px;">서버</th>
						    <th width="80px;">동시접속자</th>
						    <th width="80px;">평균처리시간</th>
						    <th width="70px;">수행건수</th>
						    <th width="90px;">JDBC커넥션수</th>
						</tr>
						
						<tr>
						    <td>포털</td>
						    <td>10명</td>
						    <td>120ms</td>
						    <td>121건</td>
						    <td>5건</td>
						</tr>
						<tr>
                            <td>재난</td>
                            <td>13명</td>
                            <td>200ms</td>
                            <td>189건</td>
                            <td>11건</td>
                        </tr>
                        <tr>
                            <td>도로</td>
                            <td>2명</td>
                            <td>80ms</td>
                            <td>5건</td>
                            <td>1건</td>
                        </tr>
					</table>
	            </td>
	        </tr>
	    </table>
	    
	    <script>
	    /*
	    $("#menu").tableSort({
            animation: 'fade',
            speed: 300,
            delay: 100,
            distance : '500px'
        });
	    */
	    </script>
	</body>
</html>