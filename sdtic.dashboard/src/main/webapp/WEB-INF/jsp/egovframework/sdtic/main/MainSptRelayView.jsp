<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>현장 중계기</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	    
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>

	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/main/MainSptRelayView.js"></script>
	    
	    <script type="text/javascript">
            $(window).load(function(){
            	//이벤트
			    if(window.addEventListener) {
					window.addEventListener("message", uf_receiveMessage, false);
				}else if(window.attachEvent) {  //IE에서 이벤트 등록
					window.attachEvent("onmessage", uf_receiveMessage);
				}
            	
                getData();
                
                setDivHeight('main');
            });
            
            //리사이즈
            $(window).resize(function(){
                setDivHeight('main');
            });
            
            function setDivHeight(objSet){ 
                var objSet   = document.getElementById(objSet); 
                objSet.style.width  = ($(window).width()) + "px";
                objSet.style.height  = ($(window).height()) + "px";
                
                $(objSet).width(($(window).width()) + "px");
                $(objSet).height(($(window).height()) + "px");
                
                myChart.resize({
                    width: $(window).width(),
                    height : $(window).height()
                });
            }
            
            function setBorderDivHeight(objSet){ 
            	var objSet   = document.getElementById(objSet); 
                objSet.style.width  = ($(window).width() - 10) + "px";
                objSet.style.height  = ($(window).height() - 10) + "px";
                
                $(objSet).width(($(window).width() - 10) + "px");
                $(objSet).height(($(window).height() - 10) + "px");
            }
            
            function uf_receiveMessage(e){
				var command = e.data.command;
				switch(command){
					case 'ifcDiskError' : {
						setError(e.data.data.data);
			            break;
			        }
					case 'ifcNetError' : {
						setError(e.data.data.data);
			            break;
			        }
					case 'ifcAllClear' : {
						setErrorBorder(false);
			            break;
			        }
			        default : {
			        	break;
			        } 
			    }
			}
        </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <div id="main" style="width:500px;height:150px;"></div>
	    
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	        var chkStyle = /\d/;
            var widgetTimer = 60000 * 1;	//1분
            var paramWidgetTimer = "${param.widgetTimer}";
            if(paramWidgetTimer != null){
            	if(chkStyle.test(paramWidgetTimer)){
            		if(paramWidgetTimer != 0){
            			widgetTimer = paramWidgetTimer;
            		}
            	}
            }
	        
	        function getData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/main/mainSptRelay.do",
                    async : false,
                    dataType : 'json',
                    success :function(json) {
                        for(var i=0;i<json.data.length;i++){
                        	bonbu[i] = json.data[i].group2_name;
                        }
                        
                        for(var i=0;i<bonbu.length;i++) {
	                        if(yMax < json.data[i].total_cnt){
	                        	yMax = json.data[i].total_cnt;
	                        }
                        }
                        if(yMax > 10){
                        	yMax = Math.ceil(yMax/10) * 10;
                        }
                        
                        for(var i=0;i<bonbu.length;i++){
                        	dataShadow[i] = yMax;
	                        dataNormal[i] = json.data[i].normal_cnt;
	                        dataDanger[i] = json.data[i].danger_cnt;
                        }
                        
                        myChart.setOption(option);               
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
			
	        timeTicket = setInterval(function () {
	        	getData();
	        }, widgetTimer);
	        
	        function setErrorBorder(isError){
	        	if(isError){
	        		$("#mainBorder").show();
	        	}else{
	        		$("#mainBorder").hide();
	        	}
	        }
	        
	        function setError(val){
	        	if(val != "" && val != null && val != "undefined"){
	        		var valArr = new Array();
		        	valArr = val.split(",");
		        	
		        	if(valArr.length > 3){
			        	var gubun = valArr[0];
			        	var group1 = valArr[1];
			        	var group2 = valArr[2];
			        	var hostname = valArr[3];
			        	
						if(gubun == "SPT" || gubun == "TNL" || gubun == "ELC"){
							setErrorBorder(true);
						}
	        		}
	        	}
			}
	    </script>
	</body>
</html>