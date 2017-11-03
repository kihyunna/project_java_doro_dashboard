<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>도로정보시스템 활용메뉴 Top5</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript">
        $(window).load(function(){ 
            setTimeout(function() {
            	changeSelection();
            }, 6000);
        });
    </script>
	<style>
		body {
		  background: #ffffffff;
		  color: #7b7b7b;
		
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;
		  overflow: hidden;
		  width:510px;
		  /* force scroll to appear */
		}
		
		a {
		  outline: none;
		  color: #81c483;
		  text-decoration: none;
		}
		
		.grid__item {  
		  height: 28px;
		  width: inherit;
		  position: relative;
		  color: inherit;
		  background: #ffffffff;
		  cursor: pointer;
		  text-align: center;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-direction: normal;
		  -webkit-box-orient: vertical;
		  -webkit-flex-direction: row;
		  -ms-flex-direction: row;
		  flex-direction: row;
		  -webkit-justify-content: center;
		  justify-content: center;
		    /*??? ??*/
		  margin-top: 1px;
	        border: 1px solid rgba(74, 74, 74, 0.2);
		}
		
		.itemGroup{  
		  height: 25px;
		  width: inherit;
		  position: relative;
		  cursor: pointer;
		  text-align: center;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-direction: normal;
		  -webkit-box-orient: vertical;
		  -webkit-flex-direction: row;
		  -ms-flex-direction: row;
		  flex-direction: row;
		  -webkit-justify-content: center;
		  justify-content: center;
		    /*margin-top? ??*/
		  margin-top: 1px;
	      background:#ffffffff;
		  border: 1px solid rgba(74, 74, 74, 0.2);
		}
	    
	    .title {
		  margin: 0;
		  font-size: 13px;
		  color: #fff;
		  text-align: center;
		}
		
		.title--preview {
		/*  -webkit-flex: 0.3;*/
		/*  flex: 1;*/
		  display: -webkit-flex;
		  display: flex;
		  -webkit-align-items: center;
		  align-items: center;
		  -webkit-justify-content: center;
		  justify-content: center;
		}
		
		.group {
		  margin: 0;
		  font-size: 13px;
		  color:#fff;
		  text-align: center;
		}
		
		.group--preview {
		/*  -webkit-flex: 0.3;*/
		/*  flex: 1;*/
		  display: -webkit-flex;
		  display: flex;
		  -webkit-align-items: center;
		  align-items: center;
		  -webkit-justify-content: center;
		  justify-content: center;
		  background-color:#ffffffff;
		}
		
		    .grid__item--animate .title--preview {
      -webkit-transition-delay: 0s;
      transition-delay: 0s;
      opacity: 0;
      -webkit-transform: translate3d(0, -20px, 0);
      transform: translate3d(0, -20px, 0);
    }
    
    .title--preview,
    .loader
    .category{
      -webkit-transition: -webkit-transform 0.2s, opacity 0.2s;
      transition: transform 0.2s, opacity 0.2s;
      -webkit-transition-timing-function: cubic-bezier(0.7, 0, 0.3, 1);
      transition-timing-function: cubic-bezier(0.7, 0, 0.3, 1);
    }
    
    .title--preview {
      -webkit-transition-delay: 0.15s;
      transition-delay: 0.15s;
    }
    
	</style>
</head>
<body>
	<div id="systext" style="width:inherit; margin-right: 10px; height:15px; font-size:13px; text-align: right; color:#fff; background-color:#ffffffff">[전체]</div>   
    
	<div class="container" style="position:absolute; margin-left:8px; width:510px; height:190px; top: 20px; float: left">			
		<div id="theGrid" class="main">
			<section class="grid">
                   <!-- 카테고리 추가-->
			    <a id="itemCategory" class="itemGroup" href="#">
					<div class="group group--preview" style="width: 10%">순위</div>
					<div class="group group--preview" style="width: 20%">시스템</div>
					<div class="group group--preview" style="width: 40%">메뉴</div>
					<div class="group group--preview" style="width: 15%">사용건수</div>
					<div class="group group--preview" style="width: 15%">전일순위</div>
				</a>
				<!-- 카테고리 추가-->
				<a id="gridItem1" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking1" style="width: 10%">1</div>
					<div class="title title--preview" id="systemName1" style="width: 20%">차선유지관리</div>
					<div class="title title--preview" id="useMenu1" style="width: 40%">차선전자지도 조회</div>
					<div class="title title--preview" id="totalData1" style="width: 15%">32</div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking1" style="display: inline-block">2</div>( </td>
                                  <td style="width: 50%"><img id="rankingImg1" src="${contextPath}/images/bucrs/uparrow.png" width="20px" height="15px"> )</td>
                               </tr>
                       	</table>
					</div>
				</a>
				<a id="gridItem2" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking2" style="width: 10%">2</div>
					<div class="title title--preview" id="systemName2" style="width: 20%">원클릭</div>
					<div class="title title--preview" id="useMenu2" style="width: 40%">사고알림앱 수신확인</div>
					<div class="title title--preview" id="totalData2" style="width: 15%">18</div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking2" style="display: inline-block">3</div>( </td>
                                  <td style="width: 50%"><img id="rankingImg2" src="${contextPath}/images/bucrs/uparrow.png" width="20px" height="15px"> )</td>
                               </tr>
                           </table>
					</div>
				</a>
				<a id="gridItem3" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking3" style="width: 10%">3</div>
					<div class="title title--preview" id="systemName3" style="width: 20%">hi-건설</div>
					<div class="title title--preview" id="useMenu3" style="width: 40%">공사일지</div>
					<div class="title title--preview" id="totalData3" style="width: 15%">15</div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking3" style="display: inline-block">1</div>( </td>
                                  <td style="width: 50%"><img id="rankingImg3" src="${contextPath}/images/bucrs/downarrow.png" width="20px" height="15px"> )</td>
                               </tr>
                           </table>
                       </div>
				</a>
				<a id="gridItem4" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking4" style="width: 10%">4</div>
					<div class="title title--preview" id="systemName4" style="width: 20%">hi-설계</div>
					<div class="title title--preview" id="useMenu4" style="width: 40%">설계내역등록</div>
					<div class="title title--preview" id="totalData4" style="width: 15%">10</div>
					<div class="title title--preview" style="width: 15%">
						<table>
                           <tr style="height: inherit">
                              <td style="width: 50%" align="right"><div id="yRanking4" style="display: inline-block">4</div>( </td>
                              <td style="width: 50%"><img id="rankingImg4" src="${contextPath}/images/bucrs/minus.png" width="20px" height="15px"> )</td>
                           </tr>
                           </table>
					</div>
				</a>
				<a id="gridItem5" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking5" style="width: 10%">5</div>
					<div class="title title--preview" id="systemName5" style="width: 20%">터널관리</div>
					<div class="title title--preview" id="useMenu5" style="width: 40%">터널계통도</div>
					<div class="title title--preview" id="totalData5" style="width: 15%">10</div>
					<div class="title title--preview" style="width: 15%">
						<table>
                           <tr style="height: inherit">
                              <td style="width: 50%" align="right"><div id="yRanking5" style="display: inline-block">7</div>(</td>
                              <td style="width: 50%"><img id="rankingImg5" src="${contextPath}/images/bucrs/uparrow.png" width="20px" height="15px"> )</td>
                           </tr>
                           </table>
					</div>
				</a>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">		
		var toggleVal = 1;
		var toggleOn1 = 1;
	    var toggleOn2 = 1;
	    var toggleOn3 = 1;
	    var toggleOn4 = 1;
	    var toggleOn5 = 1;
		var toggleColor1;
		var toggleColor2;
		var toggleColor3;
		var toggleColor4;
		var toggleColor5;
	    
	    function changeSelection() {
	    	var toggle = setInterval(function() {  
	            if(toggleVal > 5){
                    setTimeout(function() {  
                        if(toggleVal >5)
	                       toggleVal = 1;
                    }, 1000);
	            } else {
	                rotateGrid();
	                toggleVal++;                    
	            }
	        }, 1000);
	    }
		
	    function rotateGrid(){
	        if(toggleVal==1){
	            if(toggleOn1 == 1){
	            	$('#systext').text("[설계]");
	                $("#gridItem1").addClass("grid__item--animate");
	
	                setTimeout(function() {
	                	$('#systemName1').text('hi-설계');
	                	$('#useMenu1').text('설계내역서등록');
	                	$('#totalData1').text('10');
	                	$('#yRanking1').text('1');
                        $('#rankingImg1').attr('src', "${contextPath}/images/bucrs/minus.png");
	                    $("#gridItem1").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn1 = 2;
	            } else if(toggleOn1 == 2) {
	            	$('#systext').text("[건설]");
	                $("#gridItem1").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName1').text('hi-건설');
	                	$('#useMenu1').text('공사일지');
	                	$('#totalData1').text('15');
	                	$('#yRanking1').text('3');
                        $('#rankingImg1').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem1").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn1=3;
	            } else if(toggleOn1 == 3) {
	            	$('#systext').text("[유지관리]");
	                $("#gridItem1").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName1').text('차선유지관리');
	                	$('#useMenu1').text('차선전자지도 조회');
	                	$('#totalData1').text('32');
	                	$('#yRanking1').text('1');
                        $('#rankingImg1').attr('src', "${contextPath}/images/bucrs/minus.png");
	                    $("#gridItem1").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn1=4;
	            } else if(toggleOn1 == 4) {
	            	$('#systext').text("[시설물]");
	                $("#gridItem1").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName1').text('터널관리');
	                	$('#useMenu1').text('터널계통도');
	                	$('#totalData1').text('10');
	                	$('#yRanking1').text('9');
                        $('#rankingImg1').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem1").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn1=5;
	            } else if(toggleOn1 == 5) {
	            	$('#systext').text("[전체]");
	                $("#gridItem1").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName1').text('차선유지관리');
	                	$('#useMenu1').text('차선도색 현황조회');
	                	$('#totalData1').text('32');
	                	$('#yRanking1').text('2');
                        $('#rankingImg1').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem1").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn1=1;
	            }
	        } else if(toggleVal==2) {
	            if(toggleOn2 == 1){
	                $("#gridItem2").addClass("grid__item--animate");
	
	                setTimeout(function() {
	                	$('#systemName2').text('hi-설계');
	                	$('#useMenu2').text('표준단가산출서');
	                	$('#totalData2').text('8');
	                	$('#yRanking2').text('3');
                        $('#rankingImg2').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem2").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn2 = 2;
	            } else if(toggleOn2 == 2) {
	                $("#gridItem2").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName2').text('hi-건설');
	                	$('#useMenu2').text('기성관리');
	                	$('#totalData2').text('9');
	                	$('#yRanking2').text('4');
                        $('#rankingImg2').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem2").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn2=3;
	            } else if(toggleOn2 == 3) {
	                $("#gridItem2").addClass("grid__item--animate");
	
	                setTimeout(function() {
		            	$('#systemName2').text('원클릭'); 
		            	$('#useMenu2').text('사고알림앱 수신확인');
		            	$('#totalData2').text('18');
	                	$('#yRanking2').text('2');
                        $('#rankingImg2').attr('src', "${contextPath}/images/bucrs/minus.png");
	                    $("#gridItem2").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn2=4;
	            } else if(toggleOn2 == 4) {
	                $("#gridItem2").addClass("grid__item--animate");
	
	                setTimeout(function() {
		            	$('#systemName2').text('터널관리'); 
		            	$('#useMenu2').text('시설물현황');
		            	$('#totalData2').text('7');
	                	$('#yRanking2').text('4');
                        $('#rankingImg2').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem2").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn2=5;
	            } else if(toggleOn2 == 5) {
	                $("#gridItem2").addClass("grid__item--animate");
	
	                setTimeout(function() {     
	                	$('#systemName2').text('원클릭');
	                	$('#useMenu2').text('사고알림앱 수신확인');
	                	$('#totalData2').text('18');
	                	$('#yRanking2').text('3');
                        $('#rankingImg2').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem2").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn2=1;
	            }
	        } else if(toggleVal==3) {
	            if(toggleOn3 == 1){
	                $("#gridItem3").addClass("grid__item--animate");
	
	                setTimeout(function() {
	                	$('#systemName3').text('hi-설계');
	                	$('#useMenu3').text('수행중인용역현황');
	                	$('#totalData3').text('7');
	                	$('#yRanking3').text('2');
                        $('#rankingImg3').attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                    $("#gridItem3").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn3 = 2;
	            } else if(toggleOn3 == 2) {
	                $("#gridItem3").addClass("grid__item--animate");
	
	                setTimeout(function() {   
	                	$('#systemName3').text('hi-건설');
	                	$('#useMenu3').text('물량분개');
	                	$('#totalData3').text('7');
	                	$('#yRanking3').text('6');
                        $('#rankingImg3').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem3").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn3=3;
	            } else if(toggleOn3 == 3) {
	                $("#gridItem3").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName3').text('장비관리');
	                	$('#useMenu3').text('장비현황');
	                	$('#totalData3').text('10');
	                	$('#yRanking3').text('10');
                        $('#rankingImg3').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem3").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn3=4;
	            } else if(toggleOn3 == 4) {
	                $("#gridItem3").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName3').text('전기시설관리');
	                	$('#useMenu3').text('전력현황 조회');
	                	$('#totalData3').text('5');
	                	$('#yRanking3').text('3');
                        $('#rankingImg3').attr('src', "${contextPath}/images/bucrs/minus.png");
	                    $("#gridItem3").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn3=5;
	            } else if(toggleOn3 == 5) {
	                $("#gridItem3").addClass("grid__item--animate");
	
	                setTimeout(function() {    
	                	$('#systemName3').text('hi-건설');
	                	$('#useMenu3').text('공사일지');
	                	$('#totalData3').text('15');
	                	$('#yRanking3').text('1');
                        $('#rankingImg3').attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                    $("#gridItem3").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn3=1;
	            }
	        } else if(toggleVal==4) {
	            if(toggleOn4 == 1){
	                $("#gridItem4").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName4').text('hi-설계');
	                	$('#useMenu4').text('공구관리');
	                	$('#totalData4').text('5');
	                	$('#yRanking4').text('9');
                        $('#rankingImg4').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem4").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn4 = 2;
	            } else if(toggleOn4 == 2) {	            	
	                $("#gridItem4").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName4').text('hi-건설');
	                	$('#useMenu4').text('공정계획일정');
	                	$('#totalData4').text('3');
	                	$('#yRanking4').text('1');
                        $('#rankingImg4').attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                    $("#gridItem4").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn4=3;
	            } else if(toggleOn4 == 3) {
	                $("#gridItem4").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName4').text('원클릭');
	                	$('#useMenu4').text('긴급견인서비스');
	                	$('#totalData4').text('9');
	                	$('#yRanking4').text('4');
                        $('#rankingImg4').attr('src', "${contextPath}/images/bucrs/minus.png");
	                    $("#gridItem4").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn4=4;
	            } else if(toggleOn4 == 4) {
	                $("#gridItem4").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName4').text('전기시설관리');
	                	$('#useMenu4').text('영업소 단선결선도');
	                	$('#totalData4').text('5');
	                	$('#yRanking4').text('1');
                        $('#rankingImg4').attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                    $("#gridItem4").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn4=5;
	            } else if(toggleOn4 == 5) {
	                $("#gridItem4").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName4').text('hi-설계');
	                	$('#useMenu4').text('설계내역등록');
	                	$('#totalData4').text('10');
	                	$('#yRanking4').text('4');
                        $('#rankingImg4').attr('src', "${contextPath}/images/bucrs/minus.png");
	                    $("#gridItem4").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn4=1;
	            }
	        } else if(toggleVal==5) {
	            if(toggleOn5 == 1){
	                $("#gridItem5").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName5').text('hi-설계');
	                	$('#useMenu5').text('Hi-Value 기본정보관리');
	                	$('#totalData5').text('3');
	                	$('#yRanking5').text('5');
                        $('#rankingImg5').attr('src', "${contextPath}/images/bucrs/minus.png");
	                    $("#gridItem5").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn5 = 2;
	            } else if(toggleOn5 == 2) {
	                $("#gridItem5").addClass("grid__item--animate");
	
	                setTimeout(function() { 
	                	$('#systemName5').text('hi-건설');
	                	$('#useMenu5').text('공정공사비분석');
	                	$('#totalData5').text('1');
	                	$('#yRanking5').text('2');
                        $('#rankingImg5').attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                    $("#gridItem5").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn5=3;
	            } else if(toggleOn5 == 3) {
	                $("#gridItem5").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName5').text('차선유지관리');
	                	$('#useMenu5').text('차선도색 현황조회');
	                	$('#totalData5').text('6');
	                	$('#yRanking5').text('3');
                        $('#rankingImg5').attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                    $("#gridItem5").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn5=4;
	            } else if(toggleOn5 == 4) {
	                $("#gridItem5").addClass("grid__item--animate");
	
	                setTimeout(function() {  
	                	$('#systemName5').text('부대시설관리');
	                	$('#useMenu5').text('냉방기기현황');
	                	$('#totalData5').text('3');
	                	$('#yRanking5').text('2');
                        $('#rankingImg5').attr('src', "${contextPath}/images/bucrs/downarrow.png");
	                    $("#gridItem5").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn5=5;
	            } else if(toggleOn5 == 5) {
	                $("#gridItem5").addClass("grid__item--animate");
	
	                setTimeout(function() {      
	                	$('#systemName5').text('터널관리');
	                	$('#useMenu5').text('터널계통도');
	                	$('#totalData5').text('10');
	                	$('#yRanking5').text('7');
                        $('#rankingImg5').attr('src', "${contextPath}/images/bucrs/uparrow.png");
	                    $("#gridItem5").removeClass("grid__item--animate");
	                }, 500);
	                toggleOn5=1;
	            }
	        }
		}		
	</script>
</body>
</html>