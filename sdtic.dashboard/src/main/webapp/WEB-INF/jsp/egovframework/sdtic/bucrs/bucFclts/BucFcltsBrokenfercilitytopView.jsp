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
	<div id = "idDiv" style="margin-left: 8px; top: 10px;width:510px;height: 30px;z-index:102;position: absolute;">
	    <div id = "select1lv" style="float:left; margin-left:60px"></div><div id = "select2lv" style="float:left;"></div>
	    <div id = "select3lv" onchange="setSqlParameters(); getBucFcltsBrokenfercilitytopAjax();" style="float:right;">
	    	<select id="selectMonth"  style='width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>
	    		<option value="1">1개월</option>
			    <option value="2">3개월</option>
			    <option value="3">6개월</option>
			    <option value="4">12개월</option>
	    	</select>
	    </div>
	</div>

	<div class="container" style="position:absolute; margin-left:8px; width:510px; height:190px; top: 50px; float: left">			
		<div id="theGrid" class="main">
			<section class="grid">
                   <!-- 카테고리 추가-->
			    <a id="itemCategory" class="itemGroup" href="#">
					<div class="group group--preview" style="width: 10%">순위</div>
					<div class="group group--preview" style="width: 25%">본부</div>
					<div class="group group--preview" style="width: 30%">지사</div>
					<div class="group group--preview" style="width: 20%">장비명</div>
					<div class="group group--preview" style="width: 15%">건수</div>
				</a>
				<!-- 카테고리 추가-->
				<a id="gridItem1" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking1" style="width: 10%">1</div>
					<div class="title title--preview" id="headQuerters1" style="width: 25%">차선유지관리</div>
					<div class="title title--preview" id="branches1" style="width: 30%">차선전자지도 조회</div>
					<div class="title title--preview" id="ferciltyName1" style="width: 20%">32</div>
					<div class="title title--preview" id="brokenCnt1" style="width: 15%">45</div>
				</a>
				<a id="gridItem2" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking2" style="width: 10%">1</div>
					<div class="title title--preview" id="headQuerters2" style="width: 25%">차선유지관리</div>
					<div class="title title--preview" id="branches2" style="width: 30%">차선전자지도 조회</div>
					<div class="title title--preview" id="ferciltyName2" style="width: 20%">32</div>
					<div class="title title--preview" id="brokenCnt2" style="width: 15%">45</div>
				</a>
				<a id="gridItem3" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking3" style="width: 10%">1</div>
					<div class="title title--preview" id="headQuerters3" style="width: 25%">차선유지관리</div>
					<div class="title title--preview" id="branches3" style="width: 30%">차선전자지도 조회</div>
					<div class="title title--preview" id="ferciltyName3" style="width: 20%">32</div>
					<div class="title title--preview" id="brokenCnt3" style="width: 15%">45</div>
				</a>
				<a id="gridItem4" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking4" style="width: 10%">1</div>
					<div class="title title--preview" id="headQuerters4" style="width: 25%">차선유지관리</div>
					<div class="title title--preview" id="branches4" style="width: 30%">차선전자지도 조회</div>
					<div class="title title--preview" id="ferciltyName4" style="width: 20%">32</div>
					<div class="title title--preview" id="brokenCnt4" style="width: 15%">45</div>
				</a>
				<a id="gridItem5" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking5" style="width: 10%">1</div>
					<div class="title title--preview" id="headQuerters5" style="width: 25%">차선유지관리</div>
					<div class="title title--preview" id="branches5" style="width: 30%">차선전자지도 조회</div>
					<div class="title title--preview" id="ferciltyName5" style="width: 20%">32</div>
					<div class="title title--preview" id="brokenCnt5" style="width: 15%">45</div>
				</a>
			</section>
		</div>
	</div>
	
	<script type="text/javascript">	
	var rowtimeout;
	var selectorNum = 6;
	var toggleCnt = 0;
	var toggle;
	var rankNum = 0;
	var bonbuCode;
	var jisaCode;
	var selectedMonth;
	var bigtoggle;
	var gridData = [];
	
	jQuery(document).ready(function($){	
	    searchUpperhdqrtrs();
	    setSqlParameters();
	    getBucFcltsBrokenfercilitytopAjax();
	    
	    function searchUpperhdqrtrs(){
	        $.ajax({
	            type: 'POST',
	            url: "/buc/selectMainInstt1lv.do",
	            dataType: "json",
	            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	            success: function(data, responseText, statusText, textStatus){
	                $("#select1lv").html("");
	                $("#select2lv").html("");
	                var contentStr  = "";
	                contentStr += "<select id='upperhdqrtrs' onchange='searchBrffc(); setSqlParameters(); getBucFcltsBrokenfercilitytopAjax();' style='width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>";
	                contentStr += "<option value=''> == 전체 ==</option>";
	                for(var i=0; i<data.data.length; i++)
	                {
	                    contentStr += "    <option value=\'"+data.data[i].intg_dptcd+"\'>"+data.data[i].kor_dptnm+"\</option>";
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
	    	bonbuConde = $('#upperhdqrtrs').val();
	    }
	    if($('#upperhdqrtrs').val()=='' || $('#brffc').val()=='') {
	    	jisaCode = 'ALL';
	    } else {
	    	jisaCode = $('#brffc').val();
	    }
	    selectedMonth = $('#selectMonth').val();
	}
	
	function getBucFcltsBrokenfercilitytopAjax() {
		 $.ajax({
        	 url : "${pageContext.request.contextPath}/buc/bucFcltsBrokenfercilitytop.do",
	            async : false,
	            dataType : 'json',
	            data:{
	            	'headquerter' : bonbuCode,
	            	'branches' : jisaCode,
	            	'period' : selectedMonth
	            },
	            success :function(json) {
	            	if(json.data.length > 0) {
	            		for(var i =0; i<json.data.length; i++) {
	            			gridData[i] = json.data[i];
	            		}
	            	}
	            }, error : function() {
	            	console.log(arguments);
	            }, complete: function(json) {
	            	refreshGrid();
	            }	            	
       	 });
	}

    function searchBrffc() {
        var upperhdqrtrscode = $("#upperhdqrtrs").val();        
        $.ajax({
            type: 'POST',
            url: "/buc/selectMainInstt2lv.do",
              data : {
                "upperhdqrtrscode" :upperhdqrtrscode
            },
            dataType: "json",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(data, responseText, statusText, textStatus){
                $("#select2lv").html("");
                var contentStr  = "";
                    contentStr += "<select id='brffc' onchange='setSqlParameters(); getBucFcltsBrokenfercilitytopAjax();' style='width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:20px;'>";
                    contentStr += "<option value=''> == 전체 ==</option>";
                for(var i=0; i<data.data.length; i++)
                {
                    contentStr += "    <option value=\'"+data.data[i].INTG_DPTCD+"\'>"+data.data[i].KOR_DPTNM+"\</option>";
                }
                    contentStr += "</select>";
                $("#select2lv").html(contentStr);
            }
            ,error : function(request, status, error){  alert("code : " +request.status + "\r\nmessage : " + request.reponseText); }
            ,beforeSend:function(){}
            ,complete :function(){}
        });
    }
	
	function refreshGrid() {	
        clearInterval(toggle);
        clearInterval(bigtoggle);
		clearTimeout(rowtimeout);
		if(selectorNum<=5) {
            $("#gridItem" + selectorNum).removeClass("grid__item--animate");    
    	} else if(5 < selectorNum && selectorNum <= 10) {
            $("#gridItem" + (selectorNum-5)).removeClass("grid__item--animate");
    	} else if(10 < selectorNum && selectorNum <= 15) {
            $("#gridItem" + (selectorNum-10)).removeClass("grid__item--animate");
    	} else if( 15< selectorNum && selectorNum <= 20) {
            $("#gridItem" + (selectorNum-15)).removeClass("grid__item--animate");
    	}
		$("#theGrid").load(" #theGrid > *", function() {
	        selectorNum = 6;
	    	toggleCnt = 0;
	        rankNum = 0;	
			initGrid();
			bigtoggle= setInterval(function() {
				changeSelection();
			}, 6000);
		});
	} 
	
    function changeSelection() {
    	if(toggleCnt == 0) {
   	    	toggle = setInterval(function() {  
   	        	rotateGrid(selectorNum);
   	        	selectorNum++;
   	        	toggleCnt++;
   	        	if(toggleCnt == 5) {
   	        		clearInterval(toggle);
   	        		if(selectorNum > 20) {
   	        			setTimeout(function() {
   	        				selectorNum = 1;
   	        				rankNum=0;
   	        			}, 1000);
   	        		} else {
   	        			setTimeout(function() {
   	        			}, 1000);
   	        		}
   	        	}
   	        }, 1000);    	
       	} else if(toggleCnt == 5) {
       		toggleCnt =0;
			toggle = setInterval(function() {  
		       	rotateGrid(selectorNum);
		       	selectorNum++;
		       	toggleCnt++;
		       	if(toggleCnt == 5) {
		       		clearInterval(toggle);
		       		if(selectorNum > 20) {
		       			setTimeout(function() {
		       				selectorNum = 1;
		       				rankNum=0;
		       			}, 1000);
		       		} else {
		       			setTimeout(function() {
		       			}, 1000);
		       		}
		       	}
       		}, 1000);
       	}   	
    }
    
    function initGrid() {
    	for(var i=0;i<5;i++) {
    		rankNum+=1;
    		$('#tRanking' + (i+1)).text(rankNum);
    		$('#headQuerters' + (i+1)).text('수도권본부');
        	$('#branches' + (i+1)).text('수원지사');
        	$('#ferciltyName' + (i+1)).text('FTMS');
        	$('#brokenCnt' + (i+1)).text('45');
    	}
    }
    
    
    function rotateGrid(selectorNum) {
    	if(selectorNum<=5) {
			$("#gridItem" + selectorNum).addClass("grid__item--animate");
		
			rowtimeout= setTimeout(function() {				
        	    rankNum+=1;
        	    $('#tRanking' + selectorNum).text(rankNum);
           		$('#headQuerters' + selectorNum).text('수도권본부');
           		$('#branches' + selectorNum).text('인천지사');
           		$('#ferciltyName' + selectorNum).text('FTMS');
           		$('#brokenCnt' + selectorNum).text('45');
                $("#gridItem" + selectorNum).removeClass("grid__item--animate");
           }, 500);	    
    	} else if(5 < selectorNum && selectorNum <= 10) {
    		$("#gridItem" + (selectorNum-5)).addClass("grid__item--animate");
    		
    		rowtimeout = setTimeout(function() {
            	rankNum+=1;
           		$('#tRanking' + (selectorNum-5)).text(rankNum);
           		$('#headQuerters' + (selectorNum-5)).text('강원본부');
           		$('#branches' + (selectorNum-5)).text('이천지사');
           		$('#ferciltyName' + (selectorNum-5)).text('FTMS');
           		$('#brokenCnt' + (selectorNum-5)).text('32');
                $("#gridItem" + (selectorNum-5)).removeClass("grid__item--animate");
            }, 500);	  
    	} else if(10 < selectorNum && selectorNum <= 15) {
    		$("#gridItem" + (selectorNum-10)).addClass("grid__item--animate");
    		
    		rowtimeout = setTimeout(function() {
            	rankNum+=1;
           		$('#tRanking' + (selectorNum-10)).text(rankNum);
           		$('#headQuerters' + (selectorNum-10)).text('부산경남본부');
           		$('#branches' + (selectorNum-10)).text('울산지사');
           		$('#ferciltyName' + (selectorNum-10)).text('FTMS');
           		$('#brokenCnt' + (selectorNum-10)).text('21');
                $("#gridItem" + (selectorNum-10)).removeClass("grid__item--animate");
            }, 500);	  
    	} else if( 15< selectorNum && selectorNum <= 20) {
    		$("#gridItem" + (selectorNum-15)).addClass("grid__item--animate");
    		
    		rowtimeout =setTimeout(function() {
            	rankNum+=1;
       			$('#tRanking' + (selectorNum-15)).text(rankNum);
      			$('#headQuerters' + (selectorNum-15)).text('대구경북본부');
        		$('#branches' + (selectorNum-15)).text('구미지사');
        		$('#ferciltyName' + (selectorNum-15)).text('FTMS');
        		$('#brokenCnt' + (selectorNum-15)).text('11');
                $("#gridItem" + (selectorNum-15)).removeClass("grid__item--animate");
            }, 500);	  
    	}
    }
	</script>
</body>
</html>