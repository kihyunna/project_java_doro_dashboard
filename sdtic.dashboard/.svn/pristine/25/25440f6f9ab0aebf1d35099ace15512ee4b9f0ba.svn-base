<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구조물 점검 현황</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/main/default.css" />
<script type="text/javascript">
        var deptcd = '';
        var instClsfcCd = '';
        var hgrn_dptcd = '';
        $(window).load(function(){  
			period = "${param.widgetTimer}";
			deptcd = "${param.dptCd}";
            instClsfcCd = "${param.instClsfcCd}";
        	
        	if(period == 0) {
        		period = 60 * 1000 * 60;
        	}
        	if(deptcd == null || deptcd == ''){
                deptcd = '';
            }
            
            if(instClsfcCd == null || instClsfcCd == ''){
                instClsfcCd = '';
            }
            
           
        	setInterval(function() {
        		if(bonbucd == ''){
        			getBucFcltsBrokenproavgdaybonbuAjax();
        		} else{
        			getBucFcltsBrokenproavgdayjisaAjax();
        		}
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

.itemGroup {
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
	background: #ffffffff;
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
	border: 1px solid rgba(74, 74, 74, 0.2);
	border-collapse: collapse;
}

.group {
	margin: 0;
	font-size: 18px;
	color: #fff;
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
	background-color: #ffffffff;
	border: 1px solid rgba(74, 74, 74, 0.2);
	border-collapse: collapse;
}

.grid__item--animate .title--preview {
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
	opacity: 0;
	-webkit-transform: translate3d(0, -20px, 0);
	transform: translate3d(0, -20px, 0);
}

.title--preview, .loader
    .category {
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
	<div id="idDiv"
		style="top: 10px; width: 510px; height: 30px; z-index: 102; position: absolute;">
		<div id="select1lv" style="float: right;"></div>
	</div>

	<div class="container"
		style="position: absolute; margin-left: 8px; width: 510px; height: 250px; top: 50px; float: left">
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
					<div class="title title--preview" id="tRanking1" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters1"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt1"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName1"
						style="width: 25%"></div>
				</a> <a id="gridItem2" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking2" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters2"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt2"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName2"
						style="width: 25%"></div>
				</a> <a id="gridItem3" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking3" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters3"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt3"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName3"
						style="width: 25%"></div>
				</a> <a id="gridItem4" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking4" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters4"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt4"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName4"
						style="width: 25%"></div>
				</a> <a id="gridItem5" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking5" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters5"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt5"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName5"
						style="width: 25%"></div>
				</a> <a id="gridItem6" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking6" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters6"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt6"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName6"
						style="width: 25%"></div>
				</a> <a id="gridItem7" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking7" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters7"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt7"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName7"
						style="width: 25%"></div>
				</a> <a id="gridItem8" class="grid__item" href="#">
					<div class="title title--preview" id="tRanking8" style="width: 15%"></div>
					<div class="title title--preview" id="headQuerters8"
						style="width: 35%"></div>
					<div class="title title--preview" id="brokenCnt8"
						style="width: 25%"></div>
					<div class="title title--preview" id="ferciltyName8"
						style="width: 25%"></div>
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
	var dataLength;
	var rowtimeout;
	//본부
	var griddata = [];
	var datalength = 0;
	var bonbucd='';
	var toggletimeout;
	var period =0;
	
	jQuery(document).ready(function($){
	    searchUpperhdqrtrs();
	    getBucFcltsBrokenproavgdaybonbuAjax();
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
	                contentStr += "<select id='upperhdqrtrs' onchange='callAjaxfunction();' style='border: 1px solid rgba(74, 74, 74, 0.2);width:150px;height: 30px;z-index:102;background-color:rgba(50,50,50,0.7);color:#eee;font-size:16px;'>";
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
	            ,complete :function(){
	            }
	        });
	    }

	  /*   $("#CallBtn").click( function (){
	        var brffcs_code =   $("#brffc").val();
	        alert("선택한 코드값은 : " + brffcs_code);
	    }); */

	});
	
	function callAjaxfunction(){
		bonbucd =  $("#upperhdqrtrs").val();
		
		if(bonbucd == ''){
			getBucFcltsBrokenproavgdaybonbuAjax();
		} else{
			getBucFcltsBrokenproavgdayjisaAjax();
		}
	}
	
	 function getBucFcltsBrokenproavgdaybonbuAjax(){
		 
		 
	        $.ajax({
	            url : "${pageContext.request.contextPath}/buc/bucFcltsBrokenproavgdaydb.do",
	            async : false,
	            dataType : 'json',
	            success :function(json) {
	                if(json.data1.length > 0 ){
	                	datalength = json.data1.length;
	                    for(var i=0; i<json.data1.length; i++)
	                    {
	                    	griddata[i] = json.data1[i];
	                    }
	                    	
	                }
	                else{
	                console.log(arguments);
	                }

	            },error : function(){
	                console.log(arguments);
	            },complete :function(){
	            	refreshGrid();
	            }
	        });

	    }
	        
	   	 function getBucFcltsBrokenproavgdayjisaAjax(){
	   		 
	   		    if(instClsfcCd = 'B'){
	   		    	 
	   		          bonbucd  = deptcd;
	   		       $('#upperhdqrtrs').value = bonbucd;
	   		    }
	   	 
                if(instClsfcCd == 'J'){
                	
		            $.ajax({
		                 url : "${pageContext.request.contextPath}/buc/bucCmmnGetHGRN_DPTCDAjax.do",
		                    async : false,
		                    dataType : 'json',
		                    data:{
		                       jasa_dptcd : deptcd
		                    },
		                    success :function(json) {
		                        hgrn_dptcd = json.data[0].bonbu_dptcd;
		                    }, error : function() {
		                        console.log(arguments);
		                    }, complete: function(json) {
		                        $('#upperhdqrtrs').value = hgrn_dptcd;
		                        bonbucd = jasa_dptcd;
		                        
		                    }                   
		             });
		           
		            
		        }

                bonbucd = $("#upperhdqrtrs").val();

		        $.ajax({
		            url : "${pageContext.request.contextPath}/buc/bucFcltsBrokenproavgdaydb.do",
		            async : false,
		            dataType : 'json',
		            data:{
		            	'use_cd' : bonbucd
		            },
		            success :function(json) {
		            	datalength = json.data2.length;
		                if(json.data2.length > 0 ){
		                    for(var i=0; i<json.data2.length; i++)
		                    {
		                    	griddata[i] = json.data2[i];
		                    }
		                }
		                else{
		                console.log(arguments);
		                }

		            },error : function(){
		                console.log(arguments);
		            },complete :function(){
		            	refreshGrid();
		            }
		        });

		    }        
	
	function refreshGrid() {	
        clearInterval(toggle);
        clearInterval(bigtoggle);
		clearTimeout(rowtimeout);
		clearTimeout(toggletimeout);
		$("#gridItem" + selectorNum).removeClass("grid__item--animate");
		$("#theGrid").load(" #theGrid > *", function() {
	        selectorNum = 1;
	    	toggleCnt = 0;
	        rankNum = 0;	
			initGrid();
			bigtoggle = setInterval(function() {
				changeSelection();
			},10000);
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
   	        			toggletimeout=setTimeout(function() {
   	        				selectorNum = 1;
   	        				rankNum=0;
   	        			}, 1000);
   	        		} else {
   	        			toggletimeout=setTimeout(function() {
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
		       			toggletimeout=setTimeout(function() {
		       				selectorNum = 1;
		       				rankNum=0;
		       			}, 1000);
		       		} else {
		       			toggletimeout=setTimeout(function() {
		       			}, 1000);
		       		}
		       	}
       		}, 1000);
       	}   	
    }
    
    function initGrid() {
    	for(var i=0;i<datalength;i++) {
    		rankNum++;
    		$('#tRanking' + (i+1)).text(rankNum);
    		$('#headQuerters' + (i+1)).text(griddata[i].hdqr_nm);
        	$('#brokenCnt' + (i+1)).text(griddata[i].broken_count);
        	$('#ferciltyName' + (i+1)).text(griddata[i].avgdttm +'일');
    	}
    	for(var i = datalength; i<8; i++){
    		$('#tRanking' + (i+1)).text('');
    		$('#headQuerters' + (i+1)).text('');
        	$('#brokenCnt' + (i+1)).text('');
        	$('#ferciltyName' + (i+1)).text('');
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