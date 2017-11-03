<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>현장서버</title>
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
	    <table border="0" cellpadding="0" cellspacing="0" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;">
	        <tr>
	            <td height="43">
	                &nbsp;현장서버
	            </td>
	        </tr>
	        <tr>
	            <td height="2" style="background-color:#3d4146;">
	            </td>
	        </tr>
	        <tr>
	            <td valign="top"">
                    <table cellpadding="0" cellspacing="0" style="border:2px solid">
	                    <tr>
	                        <td height="40" width="90px" style="background-color:#2ec7c9;">
	                            <table border="0" cellpadding="0" cellspacing="0" width="90px">
	                                <tr height="25">
	                                    <td style="font-size:18px;color:#fff;">
	                                        &nbsp;CPU
	                                    </td>
	                                </tr>
	                                <tr height="15">
	                                    <td style="font-size:10px;color:#fff;" align="right">
	                                        위험지사&nbsp;
	                                    </td>
	                                </tr>
	                            </table>
	                        </td>
	                        <td width="5px">
	                        </td>
	                        <td height="40" width="90px" style="background-color:#5ab1ef;">
                                <table border="0" cellpadding="0" cellspacing="0" width="90px">
                                    <tr height="25">
                                        <td style="font-size:18px;color:#fff;">
                                            &nbsp;MEMORY
                                        </td>
                                    </tr>
                                    <tr height="15">
                                        <td style="font-size:10px;color:#fff;" align="right">
                                            위험지사&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
	                        <td width="5px">
	                        </td>
	                        <td height="40" width="90px" style="background-color:#ffb980;">
                                <table border="0" cellpadding="0" cellspacing="0" width="90px">
                                    <tr height="25">
                                        <td style="font-size:18px;color:#fff;">
                                            &nbsp;DISK
                                        </td>
                                    </tr>
                                    <tr height="15">
                                        <td style="font-size:10px;color:#fff;" align="right">
                                            위험지사&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="5px">
                            </td>
                            <td height="40" width="90px" style="background-color:#d87a80;">
                                <table border="0" cellpadding="0" cellspacing="0" width="90px">
                                    <tr height="25">
                                        <td style="font-size:18px;color:#fff;">
                                            &nbsp;PROCESS
                                        </td>
                                    </tr>
                                    <tr height="15">
                                        <td style="font-size:10px;color:#fff;" align="right">
                                            위험지사&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
	                    </tr>
	                    <tr>
	                       <td height="5px" colspan="7">
	                       </td>
	                    </tr>
	                    
	                    <tr>
                            <td height="40" width="90px" style="background-color:#3D4146;">
                                <table border="0" cellpadding="0" cellspacing="0" width="90px">
                                    <tr height="30">
                                        <td align="center" valign="top" style="font-size:10px;">
                                            보성<br/>담양
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="5px">
                            </td>
                            <td height="40" width="90px" style="background-color:#3D4146;">
                                <table border="0" cellpadding="0" cellspacing="0" width="90px">
                                    <tr height="30">
                                        <td align="center" valign="top" style="font-size:10px;">
                                            광주
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="5px">
                            </td>
                            <td height="40" width="90px" style="background-color:#3D4146;">
                                <table border="0" cellpadding="0" cellspacing="0" width="90px">
                                    <tr height="30">
                                        <td align="center" valign="top" style="font-size:10px;">
                                            보성
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="5px">
                            </td>
                            <td height="40" width="90px" style="background-color:#3D4146;">
                                <table border="0" cellpadding="0" cellspacing="0" width="90px">
                                    <tr height="30">
                                        <td align="center" valign="top" style="font-size:10px;">
                                            보성<br/>담양
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
	                </table>
	            </td>
	        </tr>
	    </table>
	    
	    <script>
	    

	    
	    </script>
	</body>
</html>