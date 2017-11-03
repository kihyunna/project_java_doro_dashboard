<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>구조물 점검 현황</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
	<script type="text/javascript">
        $(window).load(function(){ 
            
        });
    </script>
	<style>
		body {
		  background: #000;
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
		  background: #000;
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
		  height: 33px;
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
	      background:#000;
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
		  border: 1px solid #fff;
		  border-collapse : collapse;
		}
		
		.group {
		  margin: 0;
		  font-size: 18px;
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
		  background-color:#000;
		  border: 1px solid #fff;
		  border-collapse : collapse;
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
	<div id = "idDiv" style="margin-left:8px;top: 10px; width:510px;height: 30px;z-index:102;position: absolute;">
	     <div id = "select1lv" style="float:right;"></div>
	</div>

	<div class="container" style="position:absolute; margin-left:8px; width:510px; height:250px; top:50px; float: left">			
		<div id="theGrid" class="main">
			<section class="grid">
                   <!-- 카테고리 추가-->
			    <a id="itemCategory" class="itemGroup" href="#">
					<div class="group group--preview" style="width: 15%">순위</div>
					<div class="group group--preview" style="width: 35%">본부/지사</div>
					<div class="group group--preview" style="width: 25%">건수</div>
					<div class="group group--preview" style="width: 25%">평균처리일</div>
				</a>
				<!-- 카테고리 추가-->
				<a id="gridItem1" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking1" style="width: 15%">1</div>
					<div class="title title--preview" id="headQuerters1" style="width: 35%">수도권본부</div>
					<div class="title title--preview" id="brokenCnt1" style="width: 25%">45</div>
					<div class="title title--preview" id="ferciltyName1" style="width: 25%">2.8일</div>
				</a>
				<a id="gridItem2" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking2" style="width: 15%">2</div>
					<div class="title title--preview" id="headQuerters2" style="width: 35%">강원본부</div>
					<div class="title title--preview" id="brokenCnt2" style="width: 25%">67</div>
					<div class="title title--preview" id="ferciltyName2" style="width: 25%">3.1일</div>					
				</a>
				<a id="gridItem3" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking3" style="width: 15%">3</div>
					<div class="title title--preview" id="headQuerters3" style="width: 35%">전북본부</div>
					<div class="title title--preview" id="brokenCnt3" style="width: 25%">72</div>
					<div class="title title--preview" id="ferciltyName3" style="width: 25%">3.4일</div>
				</a>
				<a id="gridItem4" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking4" style="width: 15%">4</div>
					<div class="title title--preview" id="headQuerters4" style="width: 35%">부산/경남본부</div>
					<div class="title title--preview" id="brokenCnt4" style="width: 25%">51</div>
					<div class="title title--preview" id="ferciltyName4" style="width: 25%">4일</div>
				</a>
				<a id="gridItem5" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking5" style="width: 15%">5</div>
					<div class="title title--preview" id="headQuerters5" style="width: 35%">대전/충남본부</div>
					<div class="title title--preview" id="brokenCnt5" style="width: 25%">41</div>
					<div class="title title--preview" id="ferciltyName5" style="width: 25%">4.2일</div>
				</a>
				<a id="gridItem6" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking6" style="width: 15%">6</div>
					<div class="title title--preview" id="headQuerters6" style="width: 35%">대구/경북본부</div>
					<div class="title title--preview" id="brokenCnt6" style="width: 25%">60</div>
					<div class="title title--preview" id="ferciltyName6" style="width: 25%">4.5일</div>
				</a>
				<a id="gridItem7" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking7" style="width: 15%">7</div>
					<div class="title title--preview" id="headQuerters7" style="width: 35%">광주/전남본부</div>
					<div class="title title--preview" id="brokenCnt7" style="width: 25%">42</div>
					<div class="title title--preview" id="ferciltyName7" style="width: 25%">5.1일</div>
				</a>
				<a id="gridItem8" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking8" style="width: 15%">8</div>
					<div class="title title--preview" id="headQuerters8" style="width: 35%">충북본부</div>
					<div class="title title--preview" id="brokenCnt8" style="width: 25%">27</div>
					<div class="title title--preview" id="ferciltyName8" style="width: 25%">6일</div>
				</a>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">		
	var selectorNum = 1;
	var toggleCnt = 0;
	var toggle;
	var rankNum =0;
	var bigtoggle;
	var rowtimeout;
	var bonbuCode;
	var changeTimeout;
	var gridData = [];
	var length = 0;
	
	jQuery(document).ready(function($){
	    searchUpperhdqrtrs();
	    setSqlParameters();
	    getBucFcltsBrokenproavgdayAjax();
	    function searchUpperhdqrtrs(){
	        $.ajax({
	            type: 'POST',
	            url: "/buc/selectMainInstt1lv.do",
	            dataType: "json",
	            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	            success: function(data, responseText, statusText, textStatus){
	                $("#select1lv").html("");
	                var contentStr  = "";
	                contentStr += "<select id='upperhdqrtrs' onchange='setSqlParameters(); refreshGrid();' style='width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>";
	                contentStr += "<option value=''> == 전체 ==</option>";
	                for(var i=0; i<data.data.length; i++)
	                {
	                    contentStr += "    <option value=\'"+data.data[i].upperhdqrtrscode+"\'>"+data.data[i].upperhdqrtrsnm+"\</option>";
	                }
	                contentStr += "</select>";
	                $("#select1lv").html(contentStr);
	            }
	            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
	            ,beforeSend:function(){}
	            ,complete :function(){}
	        });
	    }

	  /*   $("#CallBtn").click( function (){
	        var brffcs_code =   $("#brffc").val();
	        alert("선택한 코드값은 : " + brffcs_code);
	    }); */

	});
	
	function setSqlParameters() {
		if($('#upperhdqrtrs').val() == '') {
			bonbuCode = 'ALL';
		} else {
			bonbuCode = $('#upperhdqrtrs').val();
		}
	}
	
	function getBucFcltsBrokenproavgdayAjax() {
		 $.ajax({
        	 url : "${pageContext.request.contextPath}/buc/bucFcltsBrokenproavgday.do",
	            async : false,
	            dataType : 'json',
	            data:{
	            	'headQuerter' : bonbuCode
	            },
	            success :function(json) {
            		for(var i =0; i<json.data.length; i++) {
            			gridData[i] = json.data[i];
            		}	            		
	            }, error : function() {
	            	console.log(arguments);
	            }, complete: function(json) {
	            	refreshGrid();
	            }	            	
       	 });
	}
	
	function refreshGrid() {	
        clearInterval(toggle);
        clearTimeout(changeTimeout);
        clearInterval(bigtoggle);
		clearTimeout(rowtimeout);
		$("#gridItem" + selectorNum).removeClass("grid__item--animate");
		$("#theGrid").load(" #theGrid > *", function() {
	        selectorNum = 1;
	    	toggleCnt = 0;
	        rankNum = 0;	
			initGrid();
			bigtoggle= setInterval(function() {
				changeSelection();
			}, 20000);
		});
	} 
    
    function changeSelection() {       	
       	if(toggleCnt == 0) {
   	    	toggle = setInterval(function() {  
   	        	rotateGrid(selectorNum);
   	        	selectorNum++;
   	        	toggleCnt++;
   	        	if(toggleCnt == 8) {
   	        		clearInterval(toggle);
   	        		if(selectorNum > 8) {
   	        			changeTimeout = setTimeout(function() {
   	        				selectorNum = 1;
   	        				rankNum=0;
   	        			}, 1000);
   	        		} else {
   	        			changeTimeout = setTimeout(function() {
   	        			}, 1000);
   	        		}
   	        	}
   	        }, 1000);    	
       	} else if(toggleCnt == 8) {
       		toggleCnt =0;
			toggle = setInterval(function() {  
		       	rotateGrid(selectorNum);
		       	selectorNum++;
		       	toggleCnt++;
		       	if(toggleCnt == 8) {
		       		clearInterval(toggle);
		       		if(selectorNum > 8) {
		       			changeTimeout = setTimeout(function() {
		       				selectorNum = 1;
		       				rankNum=0;
		       			}, 1000);
		       		} else {
		       			changeTimeout = setTimeout(function() {
		       			}, 1000);
		       		}
		       	}
       		}, 1000);
       	}   	
    }
    
    function initGrid() {
    	for(var i=0;i<8;i++) {
    		rankNum++;
    		$('#tRanking' + (i+1)).text(rankNum);
    		$('#headQuerters' + (i+1)).text('수도권본부');
        	$('#branches' + (i+1)).text('수원지사');
        	$('#ferciltyName' + (i+1)).text('FTMS');
        	$('#brokenCnt' + (i+1)).text('45');
    	}
    }
    
    
    function rotateGrid(selectorNum) {    	
		$("#gridItem" + selectorNum).addClass("grid__item--animate");
	
        rowtimeout= setTimeout(function() {
      	   /*  $('#tRanking' + selectorNum).text('1');
       		$('#headQuerters' + selectorNum).text('수도권본부');
       		$('#branches' + selectorNum).text('인천지사');
       		$('#ferciltyName' + selectorNum).text('FTMS');
       		$('#brokenCnt' + selectorNum).text('45'); */
            $("#gridItem" + selectorNum).removeClass("grid__item--animate");
        }, 500);	
    }
	</script>
</body>
</html>