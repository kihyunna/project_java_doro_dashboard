<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>서버 상세</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/common/showModalDialogCallee.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/bucrs/anime.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/main/common.js"></script>
	
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/csshake.css">
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/magicTime.css">
	    
	    <style type="text/css">
			#grid1 {position:absolute;top:60px;left:25px;}
			#grid2 {position:absolute;top:60px;left:400px;}
			#grid3 {position:absolute;top:60px;left:775px;display:none;}
		</style>
		
		<script type="text/javascript">
            $(window).load(function(){
                initData();
            });
        </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body style="background-color:#171a1f;">
		<input type="hidden" id="hostname" value="" />
		<input type="hidden" id="troblseq" value="" />
		<input type="hidden" id="colctgubun" value="" />
		
	    <table id="borderTable" width="770" border="0" cellpadding="0" cellspacing="0" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;">
	        <tr>
	            <td height="45" width="100%">
	                &nbsp;서버 상세
	            </td>
	        </tr>
	        <tr>
	            <td valign="top">
	                <table width="100%"" cellpadding="0" cellspacing="0" align="center" style="border:2px solid #3d4146;">
	                    <tr>
	                        <td height="340" width="100%" align="center">
	                        </td>
	                    </tr>
	                </table>
	            </td>
	        </tr>
	    </table>
	    
	    <div id="grid1" style="width:380px;background-color:transparent;color:#f9f9f9;font-weight:bolder;">
        	<table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td id="hostname_title1" height="40" width="100%" align="center">
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%" style="font-size:12px;">
                <tr>
                    <td height="20" width="32%" align="center" style="background-color:#3d4146;">
                        HOST NAME
                    </td>
                    <td id="hostname1" width="68%" style="background-color:#22252b;">
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td height="60" width="31%" style="background-color:#5ab1ef;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;CPU
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="cpu1"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="31%" style="background-color:#ffb980;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;MEMORY
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="memory1"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="31%" style="background-color:#d87a80;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;DISK
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="disk1"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
            <table id="svr1" border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td height="60" width="100%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;NET IO
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="svr_netio1"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="web1" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="23%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;NET IO
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="web_netio1"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#b6a2de;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;수행건수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="exec_cnt1"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#d48265;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:12px;color:#fff;">
                                    &nbsp;동시접속자수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="concurrent_vs1"></span>명&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#749f83;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:12px;color:#fff;">
                                    &nbsp;평균응답시간
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="avg_resp_time1"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="db1" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="23%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;총세션
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="total_session1"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#b6a2de;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;동작세션
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="active_session1"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#d48265;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;실행건수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="execute_counts1"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#749f83;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;대기시간
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="wait_time1"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="spt1" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                	<td height="60" width="100%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;PROCESS
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="process1"></span>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="8px">
                    <td>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%"">
                <tr>
                    <td height="30" width="100%">
                        이벤트 로그
                    </td>
                </tr>
            </table>
            <table id="eventList1" border="1" cellpadding="0" cellspacing="0" width="95%" style="background-color:#22272d;color:#f9f9f9;font-weight:normal;font-size:12px;table-layout:fixed;">
                <tr>
                    <th height="25" width="35%" align="center" style="background-color:#3d4146;">
                        발생일시
                    </th>
                    <th height="25" width="10%" align="center" style="background-color:#3d4146;">
                        등급
                    </th>
                    <th height="25" width="15%" align="center" style="background-color:#3d4146;">
                        상태
                    </th>
                    <th height="25" width="40%" align="center" style="background-color:#3d4146;">
                        이벤트 메세지
                    </th>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        
        <div id="grid2" style="width:380px;background-color:transparent;color:#f9f9f9;font-weight:bolder;">
        	<table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td id="hostname_title2" height="40" width="100%" align="center">
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%" style="font-size:12px;">
                <tr>
                    <td height="20" width="32%" align="center" style="background-color:#3d4146;">
                        HOST NAME
                    </td>
                    <td id="hostname2" width="68%" style="background-color:#22252b;">
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td height="60" width="31%" style="background-color:#5ab1ef;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;CPU
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="cpu2"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="31%" style="background-color:#ffb980;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;MEMORY
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="memory2"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="31%" style="background-color:#d87a80;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;DISK
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="disk2"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
            <table id="svr2" border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td height="60" width="100%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;NET IO
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="svr_netio2"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="web2" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="23%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;NET IO
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="web_netio2"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#b6a2de;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;수행건수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="exec_cnt2"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#d48265;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:12px;color:#fff;">
                                    &nbsp;동시접속자수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="concurrent_vs2"></span>명&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#749f83;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:12px;color:#fff;">
                                    &nbsp;평균응답시간
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="avg_resp_time2"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="db2" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="23%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;총세션
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="total_session2"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#b6a2de;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;동작세션
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="active_session2"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#d48265;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;실행건수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="execute_counts2"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#749f83;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;대기시간
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="wait_time2"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="spt2" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="100%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;PROCESS
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="process2"></span>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="8px">
                    <td>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%"">
                <tr>
                    <td height="30" width="100%">
                        이벤트 로그
                    </td>
                </tr>
            </table>
            <table id="eventList2" border="1" cellpadding="0" cellspacing="0" width="95%" style="background-color:#22272d;color:#f9f9f9;font-weight:normal;font-size:12px;table-layout:fixed;">
                <tr>
                    <th height="25" width="35%" align="center" style="background-color:#3d4146;">
                        발생일시
                    </th>
                    <th height="25" width="10%" align="center" style="background-color:#3d4146;">
                        등급
                    </th>
                    <th height="25" width="15%" align="center" style="background-color:#3d4146;">
                        상태
                    </th>
                    <th height="25" width="40%" align="center" style="background-color:#3d4146;">
                        이벤트 메세지
                    </th>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        
        <div id="grid3" style="width:380px;background-color:transparent;color:#f9f9f9;font-weight:bolder;display:none;">
        	<table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td id="hostname_title3" height="40" width="100%" align="center">
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%" style="font-size:12px;">
                <tr>
                    <td height="20" width="32%" align="center" style="background-color:#3d4146;">
                        HOST NAME
                    </td>
                    <td id="hostname3" width="68%" style="background-color:#22252b;">
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td height="60" width="31%" style="background-color:#5ab1ef;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;CPU
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="cpu3"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="31%" style="background-color:#ffb980;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;MEMORY
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="memory3"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="31%" style="background-color:#d87a80;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;DISK
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="disk3"></span>%&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
            <table id="svr3" border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td height="60" width="100%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;NET IO
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="svr_netio3"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="web3" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="23%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;NET IO
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="web_netio3"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#b6a2de;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;수행건수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="exec_cnt3"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#d48265;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:12px;color:#fff;">
                                    &nbsp;동시접속자수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="concurrent_vs3"></span>명&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#749f83;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:12px;color:#fff;">
                                    &nbsp;평균응답시간
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="avg_resp_time3"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="db3" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="23%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;총세션
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="total_session3"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#b6a2de;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;동작세션
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="active_session3"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#d48265;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;실행건수
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="execute_counts3"></span>건&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">
                    </td>
                    <td width="23%" style="background-color:#749f83;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:14px;color:#fff;">
                                    &nbsp;대기시간
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:20px;color:#fff;" align="right">
                                    <span id="wait_time3"></span>ms&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="spt3" border="0" cellpadding="0" cellspacing="0" width="95%" style="display:none;">
                <tr>
                    <td height="60" width="100%" style="background-color:#2ec7c9;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr height="25">
                                <td style="font-size:16px;color:#fff;">
                                    &nbsp;PROCESS
                                </td>
                            </tr>
                            <tr height="35">
                                <td style="font-size:26px;color:#fff;" align="right">
                                    <span id="process3"></span>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="8px">
                    <td>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%"">
                <tr>
                    <td height="30" width="100%">
                        이벤트 로그
                    </td>
                </tr>
            </table>
            <table id="eventList3" border="1" cellpadding="0" cellspacing="0" width="95%" style="background-color:#22272d;color:#f9f9f9;font-weight:normal;font-size:12px;table-layout:fixed;">
                <tr>
                    <th height="25" width="35%" align="center" style="background-color:#3d4146;">
                        발생일시
                    </th>
                    <th height="25" width="10%" align="center" style="background-color:#3d4146;">
                        등급
                    </th>
                    <th height="25" width="15%" align="center" style="background-color:#3d4146;">
                        상태
                    </th>
                    <th height="25" width="40%" align="center" style="background-color:#3d4146;">
                        이벤트 메세지
                    </th>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr height="5px">
                    <td>
                    </td>
                </tr>
            </table>
        </div>
	                        	
	    <table id="eventLog" width="770" border="0" cellpadding="0" cellspacing="0" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;display:none;">
	        <tr>
	            <td height="45" width="100%">
	                &nbsp;이벤트 상황
	            </td>
	        </tr>
	        <tr>
	            <td height="100" valign="top">
	                <table width="100%" cellpadding="0" cellspacing="0" style="border:2px solid #3d4146;">
	                    <tr>
	                        <td height="10" width="2%">
	                        </td>
	                        <td width="96%">
	                        </td>
	                        <td width="2%">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        </td>
	                        <td>
	                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                                <tr>
	                                    <td id="troblprocesssttus1" height="40" width="30%" align="center" style="background-color:#22272d;">
	                                        이벤트 발생
	                                    </td>
	                                    <td width="5%" align="center">
	                                        >
	                                    </td>
	                                    <td id="troblprocesssttus2" width="30%" align="center" style="background-color:#22272d;">
	                                        SMS 발송
	                                    </td>
	                                    <td width="5%" align="center">
	                                        >
	                                    </td>
	                                    <td id="troblprocesssttus3" width="30%" align="center" style="background-color:#22272d;">
	                                        상황 완료
	                                    </td>
	                                </tr>
	                            </table>
	                        </td>
	                        <td>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td height="10" colspan="3">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        </td>
	                        <td>
	                            <table id="logTable" border="1" cellpadding="0" cellspacing="0" width="100%" style="background-color:#22272d;color:#f9f9f9;font-weight:normal;font-size:12px;">
	                                <tr>
	                                    <th height="25" width="30%" align="center" style="background-color:#3d4146;">
	                                        상황일시
	                                    </th>
	                                    <th height="25" width="70%" align="center" style="background-color:#3d4146;">
	                                        상황내용
	                                    </th>
	                                </tr>
	                            </table>
	                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                                <tr height="5px">
	                                    <td>
	                                    </td>
	                                </tr>
	                            </table>
	                        </td>
	                        <td>
	                        </td>
	                    </tr>
	                </table>
	            </td>
	        </tr>
	    </table>
	
	    <script type="text/javascript">
		    function Request(){	
		    	var requestParam = "";	
		            this.getParameter = function(param){	
		        	var url = unescape(location.href);	
		            var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");	
		            for(var i = 0 ; i < paramArr.length ; i++){	
		                var temp = paramArr[i].split("=");
		                if(temp[0].toUpperCase() == param.toUpperCase()){
		                	requestParam = paramArr[i].split("=")[1];
		                    break;
		                }
		            }
		            return requestParam;
		        };
		    }
		    
		    var request = new Request();
		    $("#hostname").val(request.getParameter("hostname"));
		    $("#troblseq").val(request.getParameter("troblseq"));
		    $("#colctgubun").val(request.getParameter("colctgubun"));
		    
		    var hostname_temp = $("#hostname").val();
		    //DB는 서버가 1개이고 DPM이 2개씩 있어서 수정처리
		    if(hostname_temp == "cfmsdb#1"){
		    	hostname_temp = "CIHMAN";
		    }else if(hostname_temp == "cfdb#2"){
		    	hostname_temp = "CBDATA";
		    }
		    var colctgubun = $("#colctgubun").val();
		    
		    function initData(){
                $.ajax({
                    url : '${pageContext.request.contextPath}/ifc/ifcMainEvent.do',
                    async : false,
                    dataType : 'json',
                    data:{
                        'hostname'  	: hostname_temp,
                        'colct_gubun' 	: colctgubun,
                        'rownum'  		: "3",
                        'time'			: "10"
                    },
                    success :function(json) {
                    	var dual_cnt = "";
                    	var dual = "";
                    	var dual_arr = new Array();
                    	var gubun = "";
                    	
                    	//grid1
                    	//기본정보 세팅
                    	for(var i=0;i<json.data1.length;i++){
                    		dual_cnt = json.data1[i].dual_cnt;
                    		dual = json.data1[i].dual;
                    		gubun = json.data1[i].gubun;
                    		
                    		//타이블 세팅
                    		$("#hostname_title1").html(json.data1[i].hangul_hostname);
                    		
                    		//hostname 세팅
                    		$("#hostname1").html("&nbsp;" + json.data1[i].hostname);
                    		
                    		//기본정보 세팅
                    		$("#cpu1").html(json.data1[i].cpu);
                    		$("#memory1").html(json.data1[i].memory);
                    		$("#disk1").html(json.data1[i].disk);
                    		$("#svr_netio1").html(json.data1[i].netio);
                    		
                    		//현장정보 세팅
                    		if(colctgubun = "SPT"){
                    			$("#process1").html(json.data1[i].process);
                    		}
                    		
                    		//부가정보 화면세팅
                    		if(gubun == "SVR"){
                    			$("#svr1").show();
                    			$("#web1").hide();
                    			$("#db1").hide();
                    			$("#spt1").hide();
                    		}else if(gubun == "WEB"){
                    			$("#svr1").hide();
                    			$("#web1").show();
                    			$("#db1").hide();
                    			$("#spt1").hide();
                    		}else if(gubun == "DB"){
                    			$("#svr1").hide();
                    			$("#web1").hide();
                    			$("#db1").show();
                    			$("#spt1").hide();
                    		}else if(gubun == "SPT"){
                    			$("#svr1").hide();
                    			$("#web1").hide();
                    			$("#db1").hide();
                    			$("#spt1").show();
                    		}
                    	}
                    	
                    	//dual_cnt에 따른 화면 세팅
                   		//dual_cnt 2개가 default
                   		if(dual_cnt == "1"){
                   			$("#grid2").hide();
                   		}else if(dual_cnt == "3"){
                   			window.resizeTo(1065,600);
                   			$("#borderTable").width("1145");
                   			$("#eventLog").width("1145");
                   			$("#grid3").show();
                   		}
                    	
                    	//부가정보 세팅
                    	if(json.data_sub1 != null){
                    		//was정보가 없는 WEB처리
                    		if(gubun == "WEB" && (json.data_sub1.length < 1)){
                    			$("#svr1").show();
			        			$("#web1").hide();
			        			$("#db1").hide();
			        			$("#spt1").hide();
                    		}
	                    	for(var i=0;i<json.data_sub1.length;i++){
	                    		if(gubun == "SVR"){
	                    			
	                    		}else if(gubun == "WEB"){
	                    			$("#web_netio1").html(json.data_sub1[i].netio);
	                    			$("#exec_cnt1").html(json.data_sub1[i].exec_cnt);
	                    			$("#concurrent_vs1").html(json.data_sub1[i].concurrent_vs);
	                    			$("#avg_resp_time1").html(json.data_sub1[i].avg_resp_time);
	                    		}else if(gubun == "DB"){
	                    			$("#total_session1").html(json.data_sub1[i].total_session);
	                    			$("#active_session1").html(json.data_sub1[i].active_session);
	                    			$("#execute_counts1").html(json.data_sub1[i].execute_counts);
	                    			$("#wait_time1").html(json.data_sub1[i].wait_time);
	                    		}
	                    	}
                    	}
                    	
                    	//이벤트 리스트 세팅
                    	if(json.event_list1.length > 0){
                    		for(var i=0;i<json.event_list1.length;i++){
                    			var targetEventList1 = document.getElementById("eventList1");
								var tr = document.createElement("TR");
								tr.height = "20";
                   				var td = document.createElement("TD");
                   				td.align = "center";
                   				td.innerHTML =  json.event_list1[i].inst_date;
                   				tr.appendChild(td);
                   				var td = document.createElement("TD");
                   				td.align = "center";
                   				td.innerHTML =  json.event_list1[i].troblgradse + "등급";
                   				tr.appendChild(td);
                   				var td = document.createElement("TD");
                   				td.align = "center";
                   				td.innerHTML =  json.event_list1[i].troblprocesssttus;
                   				tr.appendChild(td);
                   				var td = document.createElement("TD");
                   				td.title = json.event_list1[i].troblcn;
                   				td.style.overflow = "hidden";
                   				td.style.whiteSpace = "nowrap";
                   				td.style.textOverflow = "ellipsis";
                   				td.innerHTML =  "&nbsp;" + json.event_list1[i].troblcn;
                   				tr.appendChild(td);
                   				targetEventList1.appendChild(tr);
                    		}                  		
                    	}else{
                    		var targetEventList1 = document.getElementById("eventList1");
                    		var tr = document.createElement("TR");
							tr.height = "20";
               				var td = document.createElement("TD");
               				td.colSpan = "4";
               				td.align = "center";
               				td.innerHTML =  "이벤트발생이 없습니다.";
               				tr.appendChild(td);
               				targetEventList1.appendChild(tr);
                    	}
                    	
                    	//grid2
                    	if(json.data2 != null){
	                    	//기본정보 세팅
	                    	for(var i=0;i<json.data2.length;i++){
	                    		dual_cnt = json.data2[i].dual_cnt;
	                    		dual = json.data2[i].dual;
	                    		gubun = json.data2[i].gubun;
	                    		
	                    		//타이블 세팅
	                    		$("#hostname_title2").html(json.data2[i].hangul_hostname);
	                    		
	                    		//hostname 세팅
	                    		$("#hostname2").html("&nbsp;" + json.data2[i].hostname);
	                    		
	                    		//기본정보 세팅
	                    		$("#cpu2").html(json.data2[i].cpu);
	                    		$("#memory2").html(json.data2[i].memory);
	                    		$("#disk2").html(json.data2[i].disk);
	                    		$("#svr_netio2").html(json.data2[i].netio);
	                    		
	                    		//현장정보 세팅
	                    		if(colctgubun = "SPT"){
	                    			$("#process2").html(json.data2[i].process);
	                    		}
	                    		
	                    		//부가정보 화면세팅
	                    		if(gubun == "SVR"){
	                    			$("#svr2").show();
	                    			$("#web2").hide();
	                    			$("#db2").hide();
	                    			$("#spt2").hide();
	                    		}else if(gubun == "WEB"){
	                    			$("#svr2").hide();
	                    			$("#web2").show();
	                    			$("#db2").hide();
	                    			$("#spt2").hide();
	                    		}else if(gubun == "DB"){
	                    			$("#svr2").hide();
	                    			$("#web2").hide();
	                    			$("#db2").show();
	                    			$("#spt2").hide();
	                    		}else if(gubun == "SPT"){
	                    			$("#svr2").hide();
	                    			$("#web2").hide();
	                    			$("#db2").hide();
	                    			$("#spt2").show();
	                    		}
	                    	}
	                    	
	                    	//부가정보 세팅
	                    	if(json.data_sub2 != null){
	                    		//was정보가 없는 WEB처리
	                    		if(gubun == "WEB" && (json.data_sub2.length < 1)){
	                    			$("#svr2").show();
				        			$("#web2").hide();
				        			$("#db2").hide();
				        			$("#spt2").hide();
	                    		}
	                    		
		                    	for(var i=0;i<json.data_sub2.length;i++){
		                    		if(gubun == "SVR"){
		                    			
		                    		}else if(gubun == "WEB"){
		                    			$("#web_netio2").html(json.data_sub2[i].netio);
		                    			$("#exec_cnt2").html(json.data_sub2[i].exec_cnt);
		                    			$("#concurrent_vs2").html(json.data_sub2[i].concurrent_vs);
		                    			$("#avg_resp_time2").html(json.data_sub2[i].avg_resp_time);
		                    		}else if(gubun == "DB"){
		                    			$("#total_session2").html(json.data_sub2[i].total_session);
		                    			$("#active_session2").html(json.data_sub2[i].active_session);
		                    			$("#execute_counts2").html(json.data_sub2[i].execute_counts);
		                    			$("#wait_time2").html(json.data_sub2[i].wait_time);
		                    		}
		                    	}
	                    	}
	                    	
	                    	//이벤트 리스트 세팅
	                    	if(json.event_list2.length > 0){
	                    		for(var i=0;i<json.event_list2.length;i++){
	                    			var targetEventList2 = document.getElementById("eventList2");
									var tr = document.createElement("TR");
									tr.height = "20";
	                   				var td = document.createElement("TD");
	                   				td.align = "center";
	                   				td.innerHTML =  json.event_list2[i].inst_date;
	                   				tr.appendChild(td);
	                   				var td = document.createElement("TD");
	                   				td.align = "center";
	                   				td.innerHTML =  json.event_list2[i].troblgradse + "등급";
	                   				tr.appendChild(td);
	                   				var td = document.createElement("TD");
	                   				td.align = "center";
	                   				td.innerHTML =  json.event_list2[i].troblprocesssttus;
	                   				tr.appendChild(td);
	                   				var td = document.createElement("TD");
	                   				td.title = json.event_list2[i].troblcn;
	                   				td.style.overflow = "hidden";
	                   				td.style.whiteSpace = "nowrap";
	                   				td.style.textOverflow = "ellipsis";
	                   				td.innerHTML =  "&nbsp;" + json.event_list2[i].troblcn;
	                   				tr.appendChild(td);
	                   				targetEventList2.appendChild(tr);
	                    		}                  		
	                    	}else{
	                    		var targetEventList2 = document.getElementById("eventList2");
	                    		var tr = document.createElement("TR");
								tr.height = "20";
	               				var td = document.createElement("TD");
	               				td.colSpan = "4";
	               				td.align = "center";
	               				td.innerHTML =  "이벤트발생이 없습니다.";
	               				tr.appendChild(td);
	               				targetEventList2.appendChild(tr);
	                    	}
                    	}
                    	
                    	//grid3
                    	if(json.data3 != null){
	                    	//기본정보 세팅
	                    	for(var i=0;i<json.data3.length;i++){
	                    		dual_cnt = json.data3[i].dual_cnt;
	                    		dual = json.data3[i].dual;
	                    		gubun = json.data3[i].gubun;
	                    		
	                    		//타이블 세팅
	                    		$("#hostname_title3").html(json.data3[i].hangul_hostname);
	                    		
	                    		//hostname 세팅
	                    		$("#hostname3").html("&nbsp;" + json.data3[i].hostname);
	                    		
	                    		//기본정보 세팅
	                    		$("#cpu3").html(json.data3[i].cpu);
	                    		$("#memory3").html(json.data3[i].memory);
	                    		$("#disk3").html(json.data3[i].disk);
	                    		$("#svr_netio3").html(json.data3[i].netio);
	                    		
	                    		//현장정보 세팅
	                    		if(colctgubun = "SPT"){
	                    			$("#process3").html(json.data3[i].process);
	                    		}
	                    		
	                    		//부가정보 화면세팅
	                    		if(gubun == "SVR"){
	                    			$("#svr3").show();
	                    			$("#web3").hide();
	                    			$("#db3").hide();
	                    			$("#spt3").hide();
	                    		}else if(gubun == "WEB"){
	                    			$("#svr3").hide();
	                    			$("#web3").show();
	                    			$("#db3").hide();
	                    			$("#spt3").hide();
	                    		}else if(gubun == "DB"){
	                    			$("#svr3").hide();
	                    			$("#web3").hide();
	                    			$("#db3").show();
	                    			$("#spt3").hide();
	                    		}else if(gubun == "SPT"){
	                    			$("#svr3").hide();
	                    			$("#web3").hide();
	                    			$("#db3").hide();
	                    			$("#spt3").show();
	                    		}
	                    	}
	                    	
	                    	//부가정보 세팅
	                    	if(json.data_sub3 != null){
	                    		//was정보가 없는 WEB처리
	                    		if(gubun == "WEB" && (json.data_sub3.length < 1)){
	                    			$("#svr3").show();
				        			$("#web3").hide();
				        			$("#db3").hide();
				        			$("#spt3").hide();
	                    		}
	                    		
		                    	for(var i=0;i<json.data_sub3.length;i++){
		                    		if(gubun == "SVR"){
		                    			
		                    		}else if(gubun == "WEB"){
		                    			$("#web_netio3").html(json.data_sub3[i].netio);
		                    			$("#exec_cnt3").html(json.data_sub3[i].exec_cnt);
		                    			$("#concurrent_vs3").html(json.data_sub3[i].concurrent_vs);
		                    			$("#avg_resp_time3").html(json.data_sub3[i].avg_resp_time);
		                    		}else if(gubun == "DB"){
		                    			$("#total_session3").html(json.data_sub3[i].total_session);
		                    			$("#active_session3").html(json.data_sub3[i].active_session);
		                    			$("#execute_counts3").html(json.data_sub3[i].execute_counts);
		                    			$("#wait_time3").html(json.data_sub3[i].wait_time);
		                    		}
		                    	}
	                    	}
	                    	
	                    	//이벤트 리스트 세팅
	                    	if(json.event_list3.length > 0){
	                    		for(var i=0;i<json.event_list3.length;i++){
	                    			var targetEventList3 = document.getElementById("eventList3");
									var tr = document.createElement("TR");
									tr.height = "20";
	                   				var td = document.createElement("TD");
	                   				td.align = "center";
	                   				td.innerHTML =  json.event_list3[i].inst_date;
	                   				tr.appendChild(td);
	                   				var td = document.createElement("TD");
	                   				td.align = "center";
	                   				td.innerHTML =  json.event_list3[i].troblgradse + "등급";
	                   				tr.appendChild(td);
	                   				var td = document.createElement("TD");
	                   				td.align = "center";
	                   				td.innerHTML =  json.event_list3[i].troblprocesssttus;
	                   				tr.appendChild(td);
	                   				var td = document.createElement("TD");
	                   				td.title = json.event_list3[i].troblcn;
	                   				td.style.overflow = "hidden";
	                   				td.style.whiteSpace = "nowrap";
	                   				td.style.textOverflow = "ellipsis";
	                   				td.innerHTML =  "&nbsp;" + json.event_list3[i].troblcn;
	                   				tr.appendChild(td);
	                   				targetEventList3.appendChild(tr);
	                    		}                  		
	                    	}else{
	                    		var targetEventList3 = document.getElementById("eventList3");
	                    		var tr = document.createElement("TR");
								tr.height = "20";
	               				var td = document.createElement("TD");
	               				td.colSpan = "4";
	               				td.align = "center";
	               				td.innerHTML =  "이벤트발생이 없습니다.";
	               				tr.appendChild(td);
	               				targetEventList3.appendChild(tr);
	                    	}
                    	}
                    	
                    	if($("#troblseq").val() != ""){
                    		eventLog();
                    	}
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
		    
		    function eventLog(){
                $.ajax({
                    url : '${pageContext.request.contextPath}/ifc/ifcMainEventLogList.do',
                    async : false,
                    dataType : 'json',
                    data:{
                        'troblseq'  : $("#troblseq").val()
                    },
                    success :function(json) {
                    	$("#eventLog").show();
                    	
                    	var troblprocesssttus = "";
                    	var targetEventlog = document.getElementById("logTable");
                    	
                    	for(var i=0;i<json.data.length;i++){
                    		var tr = document.createElement("TR");
							tr.height = "20";
               				var td = document.createElement("TD");
               				td.align = "center";
               				td.innerHTML =  setDateFormat(json.data[i].cre_date);
               				tr.appendChild(td);
               				var td = document.createElement("TD");
               				td.align = "center";
               				td.innerHTML =  json.data[i].actioncn;
               				tr.appendChild(td);
               				targetEventlog.appendChild(tr);
               				
               				troblprocesssttus = json.data[i].troblprocesssttus;
                    	}
                    	
                    	if(troblprocesssttus == "0"){
                    		$("#troblprocesssttus1").css("color","#deb500");
                    	}else if(troblprocesssttus == "1"){
                    		$("#troblprocesssttus1").css("color","#3d4146");
                    		$("#troblprocesssttus2").css("color","#deb500");
                    	}else if(troblprocesssttus == "9"){
                    		$("#troblprocesssttus1").css("color","#3d4146");
                    		$("#troblprocesssttus2").css("color","#3d4146");
                    		$("#troblprocesssttus3").css("color","#deb500");
                    	}
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
	    </script>
	</body>
</html>