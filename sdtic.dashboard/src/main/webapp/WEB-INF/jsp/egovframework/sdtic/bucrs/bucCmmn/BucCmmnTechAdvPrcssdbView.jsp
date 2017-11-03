<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>기술자문 처리 실적</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />


<script type="text/javascript">

    </script>
</head>
<style type="text/css">
    #grid1{position:absolute;top:22px; left:10px;font-color:#fff;font-family:"nanum", "Nanum Gothic", "NanumGothic", "나눔고딕", "돋움", "Dotum", Arial, AppleGothic, Sans-Serif;font-weight:normal;}
</style>

<body>

 <div id="main" style="width:700px; height:400px;" ></div>
    <script type="text/javascript">
	    
	    jQuery(document).ready(function($){

	    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

	    	        getBucCmmnTechAdvPrcssdbAjax();
	    	        setDivHeight('main');

	    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
	    })
	    
	    var timerValue = 0;
        $(window).load(function(){

            timerValue = "${param.widgetTimer}";
            
            if(timerValue == 0){
                timerValue = 60000*60;
            }
            
            window.setInterval("getBucCmmnTechAdvPrcssdbAjax()",timerValue);
            
        });

	    function getBucCmmnTechAdvPrcssdbAjax(){
	        $.ajax({
	            url : "${pageContext.request.contextPath}/buc/bucCmmnTechAdvPrcssdbAjax.do",
	            async : false,
	            dataType : 'json',
	            success :function(json) {
	            	if(json.data.length > 0) {
	            		for(var i = 0; i<json.data.length; i++) {
	            			xAxisData[i] = json.data[i].cnsut_realm_nm;
	            			prcssingData[i] = parseInt(json.data[i].realm_01_cnt1);	            			
	            			registData[i] = parseInt(json.data[i].realm_01_cnt2);
	            			completeData[i] = parseInt(json.data[i].realm_01_cnt3);
	            		}
	            		
	            	}
	            },error : function(){
	               console.log(arguments);
	            }, complete : function() {
	                myChart.setOption(option);
	            }
	        });		
	    }
 
        var myChart = echarts.init(document.getElementById('main'),'dark');
		
        var xAxisData = [];
        var completeData = [];
        var registData = [];
        var prcssingData = [];

        option = {
        	    legend: {
        	        data: ['완료', '결과등록', '수행중'],
        	        right: 10
        	    },
        	    grid: {
        	        left: '3%',
        	        right: '4%',
        	        bottom: '3%',
        	        containLabel: true
        	    },
        	    yAxis:  {
        	        type: 'value'
        	    },
        	    xAxis: {
        	        type: 'category',
        	        data: xAxisData
        	    },
        	    series: [
        	        {
        	            name: '완료',
        	            type: 'bar',
        	            stack: 'a',
        	            label: {
        	                normal: {
        	                    show: true,
        	                    formatter:function(v) {
        	                    	var temp = '';
        	                    	if(v.value > 0) {
        	                    		temp  = v.value;
        	                    		return temp;
        	                    	} else {
        	                    		temp = '';
        	                    		return temp;
        	                    	}
        	                    },
        	                    position: 'insideTop'
        	                }
        	            },
        	            data: completeData
        	        },
        	        {
        	            name: '결과등록',
        	            type: 'bar',
        	            stack: 'a',
        	            label: {
        	                normal: {
        	                    show: true,
        	                    formatter:function(v) {
        	                    	var temp = '';
        	                    	if(v.value > 0) {
        	                    		temp  = v.value;
        	                    		return temp;
        	                    	} else {
        	                    		temp = '';
        	                    		return temp;
        	                    	}
        	                    },
        	                    position: 'insideTop'
        	                }
        	            },
        	            data: registData
        	        },
        	        {
        	            name: '수행중',
        	            type: 'bar',
        	            stack: 'a',
        	            label: {
        	                normal: {
        	                    show: true,
        	                    formatter:function(v) {
        	                    	var temp = '';
        	                    	if(v.value > 0) {
        	                    		temp  = v.value;
        	                    		return temp;
        	                    	} else {
        	                    		temp = '';
        	                    		return temp;
        	                    	}
        	                    },
        	                    position: 'insideTop'
        	                }
        	            },
        	            data: prcssingData
        	        }
        	    ]
        	};

        myChart.setOption(option);


        $(window).resize(function(){

            setDivHeight('main');

        });

        function setDivHeight(objSet)
        {

            var objSet   = document.getElementById(objSet);
            objSet.style.width  = ($(window).width()) + "px";
            objSet.style.height  = ($(window).height()) + "px";


            $('#main').width(($(window).width()) + "px");
            $('#main').height(($(window).height()) + "px");


            myChart.resize({
                width: $(window).width(),
                height : $(window).height()
            });
            myChart.setOption(option);
        }

    </script>
</body>
</html>