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
			period = "${param.widgetTimer}";
        	
        	if(period == 0) {
        		period = 60 * 1000 * 60;
        	}
        	
        	setInterval(function() {
        		location.reload();
        	}, period);
            
        	
        	
        });
    </script>
	<style>
		body {
		  background: #ffffffff;
		  color: #7b7b7b;
		
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;
		  overflow: hidden;
		  
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
	<div id="systext" style="width:510px; margin-right: 10px; height:15px; font-size:13px; text-align: right; color:#fff; background-color:#ffffffff">[전체]</div>   
    
	<div class="container" style="position:absolute; margin-left:8px; width:510px; height:190px; top: 25px; float: left">			
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
					<div class="title title--preview" id="tRanking1" style="width: 10%"></div>
					<div class="title title--preview" id="systemName1" style="width: 20%"></div>
					<div class="title title--preview" id="useMenu1" style="width: 40%"></div>
					<div class="title title--preview" id="totalData1" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking1" style="display: inline-block"></div><div id="yRankblock1_1" style="display: inline-block">( </div></td>
                                  <td style="width: 50%"><img id="rankingImg1" src="" width="20px" height="15px"><div id="yRankblock1_2" style="display: inline-block"> )</div></td>
                               </tr>
                       	</table>
					</div>
				</a>
				<a id="gridItem2" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking2" style="width: 10%"></div>
					<div class="title title--preview" id="systemName2" style="width: 20%"></div>
					<div class="title title--preview" id="useMenu2" style="width: 40%"></div>
					<div class="title title--preview" id="totalData2" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking2" style="display: inline-block"></div><div id="yRankblock2_1" style="display: inline-block">( </div></td>
                                  <td style="width: 50%"><img id="rankingImg2" src="" width="20px" height="15px"><div id="yRankblock2_2" style="display: inline-block"> )</div></td>
                               </tr>
                           </table>
					</div>
				</a>
				<a id="gridItem3" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking3" style="width: 10%"></div>
					<div class="title title--preview" id="systemName3" style="width: 20%"></div>
					<div class="title title--preview" id="useMenu3" style="width: 40%"></div>
					<div class="title title--preview" id="totalData3" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                               <tr style="height: inherit">
                                  <td style="width: 50%" align="right"><div id="yRanking3" style="display: inline-block"></div><div id="yRankblock3_1" style="display: inline-block">( </div></td>
                                  <td style="width: 50%"><img id="rankingImg3" src="" width="20px" height="15px"><div id="yRankblock3_2" style="display: inline-block"> )</div></td>
                               </tr>
                           </table>
                       </div>
				</a>
				<a id="gridItem4" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking4" style="width: 10%"></div>
					<div class="title title--preview" id="systemName4" style="width: 20%"></div>
					<div class="title title--preview" id="useMenu4" style="width: 40%"></div>
					<div class="title title--preview" id="totalData4" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                           <tr style="height: inherit">
                              <td style="width: 50%" align="right"><div id="yRanking4" style="display: inline-block"></div><div id="yRankblock4_1" style="display: inline-block">( </div></td>
                              <td style="width: 50%"><img id="rankingImg4" src="" width="20px" height="15px"><div id="yRankblock4_2" style="display: inline-block"> )</div></td>
                           </tr>
                           </table>
					</div>
				</a>
				<a id="gridItem5" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking5" style="width: 10%"></div>
					<div class="title title--preview" id="systemName5" style="width: 20%"></div>
					<div class="title title--preview" id="useMenu5" style="width: 40%"></div>
					<div class="title title--preview" id="totalData5" style="width: 15%"></div>
					<div class="title title--preview" style="width: 15%">
						<table>
                           <tr style="height: inherit">
                              <td style="width: 50%" align="right"><div id="yRanking5" style="display: inline-block"></div><div id="yRankblock5_1" style="display: inline-block">( </div></td>
                              <td style="width: 50%"><img id="rankingImg5" src="" width="20px" height="15px"><div id="yRankblock5_2" style="display: inline-block"> )</div></td>
                           </tr>
                           </table>
					</div>
				</a>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">		
	jQuery(document).ready(function($){
		
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	        getBucMainTopmenudbAjax();
    	       // getBucCmmnLoadinfomenudbgridAjax();
    	        

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    })
    
    var griddata=[];
	var rankNum = 0;
	var period = 0;
    
    function getBucMainTopmenudbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucMainTopmenudb.do",
            async : false,
            dataType : 'json',
            success :function(json) {               
	                if(json.data.length > 0 ){
	                	var entire = 0;
	                	var design = 5;
	                	var constru = 10;
	                	var maint = 15;
	                	var ferc = 20;
	                	var etc = 25;
	                    for(var i=0; i<json.data.length; i++)
	                    {
							if(json.data[i].hgrn_systm_cd == 'ALL') {
								griddata[entire++] = json.data[i];
							} else if(json.data[i].hgrn_systm_cd == 'DSG') {
								griddata[design++] = json.data[i];
							} else if(json.data[i].hgrn_systm_cd == 'CON') {
								griddata[constru++] = json.data[i];
							} else if(json.data[i].hgrn_systm_cd == 'UKP') {
								griddata[maint++] = json.data[i];
							} else if(json.data[i].hgrn_systm_cd == 'FCL') {
								griddata[ferc++] = json.data[i];
							} else if(json.data[i].hgrn_systm_cd == 'ETC') {
								griddata[etc++] = json.data[i];
							}							
	                    }
	                }
	                else{
	                console.log(arguments);
	                }
	
	            },error : function(){
	                console.log(arguments);
	            }, complete : function() {
	            	initGrid();
	                setTimeout(function() {
	                	changeSelection();
	                }, 6000);
	            }
	        });
		
	    }
	
	
		var selectorNum = 1;
		var dataNum = 5;
		var toggle;
	    
		//그리드 애니메이션 효과 타이머 상단 행부터 아래로 내려감.
	    function changeSelection() {
	    	toggle = setInterval(function() {  
	            if(selectorNum > 5){
                    setTimeout(function() {  
                        if(selectorNum > 5)
                        	selectorNum = 1;
                        if(dataNum > 29) {
                        	dataNum = 0;
                        }
                    }, 1000);
	            } else {
	                rotateGrid(selectorNum, dataNum);
	                selectorNum++;    
	                dataNum++;
	            }
	        }, 1000);
	    }
	    
		//그리드 데이터 초기화 함수
	    function initGrid() {
    		$('#systext').text("[전체]");
	    	
	    	for(var i=0;i<5;i++) {
	    		if(griddata[i] != null) {
	    			$('#tRanking' + (i+1)).text(griddata[i].rank);
		    		$('#systemName' + (i+1)).text(griddata[i].up_systm_nm);
		        	$('#useMenu' + (i+1)).text(griddata[i].menu_nm);
		        	$('#totalData' + (i+1)).text(griddata[i].cnt);
		        	$('#yRankblock' + (i+1) + '_1').text('( ');
		        	$('#yRankblock' + (i+1) + '_2').text(' )');
		        	if(griddata[i].y_rank == null){
		        		$('#yRanking' + (i+1)).text("");
		        		$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/uparrow.png");
		        	} else {
		        		$('#yRanking' + (i+1)).text(griddata[i].y_rank);
		        		if(parseInt(griddata[i].y_rank) > parseInt($('#tRanking'+ (i+1)).text()))
		        			$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/uparrow.png");
		        		else if(parseInt(griddata[i].y_rank) < parseInt($('#tRanking' + (i+1)).text()))
		        			$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/downarrow.png");
		        		else
		        			$('#rankingImg' + (i+1)).attr('src', "${contextPath}/images/bucrs/minus.png");
		        	}
	    		} else {
	    			$('#tRanking' + (i+1)).text('');
		    		$('#systemName' + (i+1)).text('');
		        	$('#useMenu' + (i+1)).text('');
		        	$('#totalData' + (i+1)).text('');
		        	$('#yRankblock' + (i+1) + '_1').text('');
		        	$('#yRankblock' + (i+1) + '_2').text('');
		        	$('#yRanking' + (i+1)).text("");
		        	$('#rankingImg' + (i+1)).attr('src', "");
	    		}
	    	}
	    }
		
		//그리드 애니메이션 함수
	    function rotateGrid(selectorNum, dataNum){
	    	if(0 <= dataNum && dataNum < 5) {
	    		$('#systext').text("[전체]");
	    	} else if(5 <= dataNum && dataNum < 10) {
	    		$('#systext').text("[설계]");
	    	} else if(10 <= dataNum && dataNum < 15) {
	    		$('#systext').text("[건설]");
	    	} else if(15 <= dataNum && dataNum < 20) {
	    		$('#systext').text("[유지관리]");
	    	} else if(20 <= dataNum && dataNum < 25) {
	    		$('#systext').text("[시설물]");
	    	} else if(25 <= dataNum && dataNum < 30) {
	    		$('#systext').text("[기타]");
	    	}
	    	$("#gridItem" + selectorNum).addClass("grid__item--animate");
    		
            setTimeout(function() {
            	if(griddata[dataNum] != null) {
            		$('#tRanking' + selectorNum).text(griddata[dataNum].rank);
	            	$('#systemName' + selectorNum).text(griddata[dataNum].up_systm_nm);
	            	$('#useMenu' + selectorNum).text(griddata[dataNum].menu_nm);
	            	$('#totalData' + selectorNum).text(griddata[dataNum].cnt);
	            	$('#yRankblock' + selectorNum + '_1').text('( ');
		        	$('#yRankblock' + selectorNum + '_2').text(' )');
	            	if(griddata[dataNum].y_rank == null){
	            		$('#yRanking' + selectorNum).text("");
	            		$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/uparrow.png");
	            	} else {
	            		$('#yRanking' + selectorNum).text(griddata[dataNum].y_rank);
	            		if(parseInt(griddata[dataNum].y_rank) > parseInt($('#tRanking' + selectorNum).text()))
	            			$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/uparrow.png");
	            		else if(parseInt(griddata[dataNum].y_rank) < parseInt($('#tRanking' + selectorNum).text()))
	            			$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/downarrow.png");
	            		else
	            			$('#rankingImg' + selectorNum).attr('src', "${contextPath}/images/bucrs/minus.png");
	            	}
            	} else {
            		$('#tRanking' + selectorNum).text('');
            		$('#systemName' + selectorNum).text('');
		        	$('#useMenu' + selectorNum).text('');
		        	$('#totalData' + selectorNum).text('');
		        	$('#yRankblock' + selectorNum + '_1').text('');
		        	$('#yRankblock' + selectorNum + '_2').text('');
		        	$('#yRanking' + selectorNum).text("");
		        	$('#rankingImg' + selectorNum).attr('src', "");
            	}
                $("#gridItem" + selectorNum).removeClass("grid__item--animate");
            }, 500);	    
		}		
	</script>
</body>
</html>