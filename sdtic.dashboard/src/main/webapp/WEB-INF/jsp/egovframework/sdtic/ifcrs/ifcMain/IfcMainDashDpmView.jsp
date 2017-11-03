<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>DPM</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    
	    <style>
        #menu {
           text-align: center;
           border-collapse: collapse;
           background-color: #22272d;
           border: 0px solid gray;
           color: #fbfbfb;
           }
           #menu tr,th,td{
           border-collapse: collapse;
           border: 0px solid gray;
        }
        th{
            color: #fbfbfb;
            border: 0px solid gray;
            background-color: #3D4146;
            font-size: 12px;
        }
        #menu td{
            border: 0px solid gray;
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
                    &nbsp;DPM
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
                            <td width="185">
                                <img src="${contextPath}/images/ifcrs/dpm_th.png" height="100" width="120">
                            </td>
                            <td width="185">
                                <img src="${contextPath}/images/ifcrs/dpm_ssm.png" height="100" width="120">
                            </td>
                        </tr>
                    </table>
                    <div id="th_ts" style="position:absolute;font-size:10px;color:#f9f9f9;top:80px;left:50px;height:40px;width:120px;">
                        TABLE SPLACE<br/>
						- IFC_TS_TABLE1 : 25%<br/>
						- IFC_TS_TABLE2 : 45%
                    </div>
                    <div id="th_as" style="position:absolute;font-size:10px;color:#f9f9f9;top:120px;left:50px;height:40px;width:120px;">
                        ACTIVE SESSION : 25건<br/>
                        LOCK SESSION : 1건
                    </div>
                    <div id="ssm_ts" style="position:absolute;font-size:10px;color:#f9f9f9;top:80px;left:240px;height:40px;width:120px;">
                        TABLE SPLACE<br/>
                        - IFC_TS_TABLE1 : 55%<br/>
                        - IFC_TS_TABLE2 : 10%
                    </div>
                    <div id="ssm_as" style="position:absolute;font-size:10px;color:#f9f9f9;top:120px;left:240px;height:40px;width:120px;">
                        ACTIVE SESSION : 21건<br/>
                        LOCK SESSION : 3건
                    </div>
	            </td>
	        </tr>
	    </table>
	    
	    <script>
	    </script>
	</body>
</html>