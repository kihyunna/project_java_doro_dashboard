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
	    <script type="text/javascript" src="${contextPath}/js/common/makisu.js"></script>
	    
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/makisu.css">
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <table border="0" cellpadding="0" cellspacing="0" style="background-color:transparent;color:#f9f9f9;">
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
	            <td valign="top"">
	                <section class="demo"">
	                    <ul style="text-align:center;text-decoration:none;list-style:none;;margin:0;position:absolute;top:30px;left:-30px;">
	                        <li style="float:left;">
	                            <dl class="list maki">
	                                <dt style="width:150px;">발생일시</dt>
	                                <dd style="width:150px;">2017-01-02 16:15:54</dd>
	                                <dd style="width:150px;">2017-01-02 16:13:12</dd>
	                                <dd style="width:150px;">2017-01-02 13:44:22</dd>
	                                <dd style="width:150px;">2017-01-02 13:44:22</dd>
	                                <dd style="width:150px;">2017-01-01 11:11:22</dd>
	                            </dl>
	                        </li>
	                        <li style="float:left;">
	                            <dl class="list maki">
	                                <dt style="width:100px;">서버구분</dt>
	                                <dd style="width:100px;">수집/중계</dd>
	                                <dd style="width:100px;">수집/중계</dd>
	                                <dd style="width:100px;">수집/중계</dd>
	                                <dd style="width:100px;">WEB/WAS</dd>
	                                <dd style="width:100px;">DB</dd>
	                            </dl>
	                        </li>
	                        <li style="float:left;">
	                            <dl class="list maki">
	                                <dt style="width:200px;">서버명</dt>
	                                <dd style="width:200px;">스마트제한차량 수집 [tsrasgat1]</dd>
	                                <dd style="width:200px;">스마트제한차량 수집 [tsrasgat1]</dd>
	                                <dd style="width:200px;">빅데이타 [NEW_AP_BIG1]</dd>
	                                <dd style="width:200px;">포털 [cclwas002]</dd>
	                                <dd style="width:200px;">통합DB/시설물DB</dd>
	                            </dl>
	                        </li>
	                        <li style="float:left;">
	                            <dl class="list maki">
	                                <dt style="width:100px;">위험지수</dt>
	                                <dd style="width:100px;color:#de1500;">●위험</dd>
	                                <dd style="width:100px;color:#deb500;">●경고</dd>
	                                <dd style="width:100px;color:#deb500;">●경고</dd>
	                                <dd style="width:100px;color:#deb500;">●경고</dd>
	                                <dd style="width:100px;color:#deb500;">●경고</dd>
	                            </dl>
	                        </li>
	                        <li style="float:left;">
	                            <dl class="list maki">
	                                <dt style="width:150px;">내용</dt>
	                                <dd style="width:150px;">&nbsp;PROCESS OFF</dd>
	                                <dd style="width:150px;">&nbsp;CPU 95% 초과</dd>
	                                <dd style="width:150px;">&nbsp;CPU 95% 초과</dd>
	                                <dd style="width:150px;">&nbsp;CPU 90% 초과</dd>
	                                <dd style="width:150px;">&nbsp;MEMORY 95% 초과</dd>
	                            </dl>
	                        </li>
	                    </ul>
	                </section>
	            </td>
	        </tr>
	    </table>
	    
	    <script>
	    if($.fn.makisu.enabled){
	    	var $maki = $('.maki');

			// Create Makisus
			$maki.makisu({
			    selector: 'dd',
			    overlap: 0.6,
			    speed: 0.85,
			
			});
			
			// Open all
			$( '.list' ).makisu( 'open' );
			
			// Toggle on click
			$( '.toggle' ).on( 'click', function() {
			    $( '.list' ).makisu( 'toggle' );
			});
			
			// Disable all links
			$( '.demo a' ).click( function( event ) {
			    event.preventDefault();
			});
	    }
	    </script>
	</body>
</html>