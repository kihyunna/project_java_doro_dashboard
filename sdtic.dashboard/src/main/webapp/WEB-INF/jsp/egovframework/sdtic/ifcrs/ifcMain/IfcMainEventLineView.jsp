<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>이벤트 발생</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	    
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/main/common.js"></script>

	    <script type="text/javascript">
            $(window).load(function(){
                getData();
            });
            
			function fn_event(val1, val2, val3) {
				var url = "${pageContext.request.contextPath}/ifc/ifcMainEventView.do?hostname="+val1+"&troblseq="+val2+"&colctgubun="+val3;

	        	var name = "eventPop";
	        	var width = 790;
	        	var height = 590;
	        	var opt = "";
	        	
	        	WinPop(url, name, width, height, opt);
		    }
        </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
		<div id="grid" style="width:1800px;height:20px;">
			<table class="tblWgt tp03" style="width:1800px;height:20px;">
				<tbody>
					<tr>
						<th scope="col" class="titS" style="width:1800px;height:20px;font-size:18px;">
							<marquee id="gridTitle" width="100%" height="100%" scrollAmount="9" direction="left"></marquee>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

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
                    url : "${pageContext.request.contextPath}/ifc/ifcMainEventLine.do",
                    async : false,
                    dataType : 'json',
                    success :function(json) {
                    	
                    	var nullText = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    	var target = document.getElementById("gridTitle");

                    	for(var i=0;i<json.data.length;i++){
	           				var sp = document.createElement("span");
	           				sp.id = "sp" + i;
	           				sp.style.cursor = "pointer";
	           				sp.setAttribute("onclick", "fn_event('"+json.data[i].hostname+"','"+json.data[i].troblseq+"','"+json.data[i].colct_gubun+"')");
	           				sp.innerHTML = json.data[i].event_text;
	           				target.appendChild(sp);
	           				
	           				if(i != json.data.length-1){
	           					var sp = document.createElement("span");
	           					sp.innerHTML = nullText + nullText + nullText + nullText + nullText;
	           					target.appendChild(sp);
	           				}
                    	}
                    	
                    	//위젯타이머 세팅(건수 * 20초)
                    	if(json.data.length == 0){
                    		widgetTimer = 60000 * 1;	//1분
                    	}else{
                    		widgetTimer = (1000 * 14 * json.data.length);
                    	}
                    	
                    	var timeTicketData = setTimeout(function () {
            	        	location.reload();
            	        }, widgetTimer);
                    	
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }	        
	    </script>		
	</body>
</html>