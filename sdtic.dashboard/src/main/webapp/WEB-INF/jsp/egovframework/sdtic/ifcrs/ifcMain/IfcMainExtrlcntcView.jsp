<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>대외 연계</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/magicTime.css">
	    
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
                setBorderDivHeight('mainBorder');
            });
            
            //리사이즈
            $(window).resize(function(){
                setDivHeight('main');
            });
            
            function setDivHeight(objSet){ 
                var objSet   = document.getElementById(objSet); 
                objSet.style.width  = ($(window).width()-20) + "px";
                objSet.style.height  = ($(window).height()-65) + "px";
                
                $(objSet).width(($(window).width()-20) + "px");
                $(objSet).height(($(window).height()-65) + "px");
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
	    <div id="main" style="width:600px;height:40px;background-color:transparent;padding-top:10px;z-index:10;"></div>
	    <div id="mainBorder" style="position:absolute;top:0px;left:0px;width:590px;height:40px;border:solid 5px #f00;display:none;z-index:1;"></div>
	
	    <script type="text/javascript">
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
	                url : "${pageContext.request.contextPath}/ifc/ifcMainExtrlcntc.do",
	                async : false,
	                dataType : 'json',
	                data : {
                        'gubun'  : 'EXT'
                    },
	                success :function(json) {
	                	
	                	var target = document.getElementById('main');
	                    target.innerHTML = "";

	                    var table = document.createElement("TABLE");
	                    table.border = "0";
	                    table.cellpadding = "0";
	                    table.cellspacing = "0";
	                    table.width = "100%";
	                    table.height = "100%";
	                    table.style.color = "#f9f9f9";
	                    table.style.fontWeight= "bolder";
                        
                        var colCnt = 4;
                        
                        for(var i=0;i<json.data.length;i++){
                        	if(i % colCnt == 0){
                        		var tr = document.createElement("TR");
                                tr.style.width = "100%";
                        	}
                            var td = document.createElement("TD");
                            td.id = json.data[i].cmmn_cd;
                            td.align = "right";
	                        td.style.width = ((100 / json.data.length) * 1/4) + "%";	                        
	                        td.style.fontSize = "12px";
	                        /*
                            td.style.color = "#2ade00";
                            td.innerHTML =  "●";
                            */
	                        var img = document.createElement("IMG");
               				if(json.data[i].is_error == "Y"){
               					img.src = "${contextPath}/images/ifcrs/icoPrbBgCb.png";
               					//img.className = "magictimeInfinite blink";
               				}else{
               					img.src = "${contextPath}/images/ifcrs/icoNmlBgCb.png";
               				}
                            td.appendChild(img);
                            /*
                            if(json.data[i].is_error == "Y"){
                            	td.className = "magictimeInfinite blink";
                            }
                            */
	                        tr.appendChild(td);
	                        
	                        td = document.createElement("TD");
	                        td.id = json.data[i].cmmn_cd + "Text";
	                        td.style.width = ((100 / json.data.length) * 3/4) + "%"
                            if(json.data[i].cmmn_cd_nm.length > 8){
                                td.style.fontSize = "10px";
                            }
	                        if(json.data[i].is_error == "Y"){
                                td.className = "magictimeInfinite blink";
                            }
	                        var text_tmp = json.data[i].cmmn_cd_nm;
	                        if(json.data[i].cmmn_cd_nm == "한국시설안전공단"){
	                        	text_tmp = "시설안전공단";
	                        }
	                        td.innerHTML = text_tmp;
	                        tr.appendChild(td);
	                        
	                        if((i % colCnt == 0) || (i == (json.data.length-1))){
	                        	table.appendChild(tr);
                        	}
	                    }
	                    target.appendChild(table);            
	                },error : function(){
	                    console.log(arguments);
	                }
	            });
	        }
		    
		    var timeTicketData = setInterval(function () {
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
			        	
						if(gubun == "EXT"){
							//setErrorBorder(true);
						}
	        		}
	        	}
			}
	    </script>
	</body>
</html>