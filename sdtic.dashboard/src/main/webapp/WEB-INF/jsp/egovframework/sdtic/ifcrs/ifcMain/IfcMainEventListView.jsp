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
	    <script type="text/javascript" src="${contextPath}/js/common/tsort.js"></script>
	    
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/magicTime.css">
	    
	    <script type="text/javascript">
            $(window).load(function(){
            	getData();
            });
        </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <table border="0" cellpadding="0" cellspacing="0" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;">
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
	            <td id="main" valign="top">
	            </td>
	        </tr>
	    </table>
	    
	    <script type="text/javascript">
            function getData(id){
            	$.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcMainEventList.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'rownum'    : '5'
                    },
                    success :function(json) {
                        
                        var target = document.getElementById('main');
                        target.innerHTML = "";
                        
                        var table = document.createElement("TABLE");
                        table.id = "tableSorter";
                        table.border = "1";
                        table.cellpadding = "0";
                        table.cellspacing = "0";
                        table.width = "680";
                        table.style.backgroundColor = "#22272d";
                        table.style.color = "#f9f9f9";
                        table.style.fontWeight = "normal";
                        table.style.fontSize = "4px";
                        
                        var headTr = document.createElement("TR");
                        
                        var th = document.createElement("TH");
                        th.height = "25";
                        th.width = "17%";
                        th.align = "center";
                        th.style.backgroundColor = "#3d4146";
                        th.innerHTML = "발생일시";
                        headTr.appendChild(th);
                        
                        var th = document.createElement("TH");
                        th.height = "25";
                        th.width = "13%";
                        th.align = "center";
                        th.style.backgroundColor = "#3d4146";
                        th.innerHTML = "발생장비";
                        headTr.appendChild(th);
                        
                        var th = document.createElement("TH");
                        th.height = "25";
                        th.width = "30%";
                        th.align = "center";
                        th.style.backgroundColor = "#3d4146";
                        th.innerHTML = "호스트명";
                        headTr.appendChild(th);
                        
                        var th = document.createElement("TH");
                        th.height = "25";
                        th.width = "13%";
                        th.align = "center";
                        th.style.backgroundColor = "#3d4146";
                        th.innerHTML = "위험지수";
                        headTr.appendChild(th);
                        
                        var th = document.createElement("TH");
                        th.height = "25";
                        th.width = "27%";
                        th.align = "center";
                        th.style.backgroundColor = "#3d4146";
                        th.innerHTML = "이벤트 메세지";
                        headTr.appendChild(th);
                        
                        table.appendChild(headTr);
                        
                        for(var i=0;i<json.data.length;i++){
                            var tr = document.createElement("TR");
                            tr.height = "20";
                            
                            var td = document.createElement("TD");
                            td.align = "center";
                            td.innerHTML = json.data[i].cre_datetime;
                            tr.appendChild(td);
                            
                            var td = document.createElement("TD");
                            td.align = "center";
                            td.innerHTML = json.data[i].gubun_name;
                            tr.appendChild(td);
                            
                            var td = document.createElement("TD");
                            td.align = "center";
                            td.innerHTML = json.data[i].group2_name + "[" + json.data[i].host_name + "]";
                            tr.appendChild(td);
                            
                            var td = document.createElement("TD");
                            td.align = "center";
                            td.innerHTML = "●" + json.data[i].state_name;
                            //정상
                            if(0 == json.data[i].state){
                                td.style.color = "#1ef51e";
                            //경고
                            }else if(1 == json.data[i].state){
                                td.style.color = "#deb500";
                            //위험
                            }else if(2 == json.data[i].state){
                                td.style.color = "#de1500";
                                td.className = "magictimeInfinite blink";
                            }
                            tr.appendChild(td);
                            
                            var td = document.createElement("TD");
                            td.innerHTML = "&nbsp;" + json.data[i].message;
                            tr.appendChild(td);

                            table.appendChild(tr);
                        }
                        target.appendChild(table);

                        $("#tableSorter").tableSort({
                            animation: 'fade',
                            speed: 300,
                            delay: 100
                        });
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }

            var timeTicketData = setInterval(function () {
                getData();
            }, 10000);
		</script>
	</body>
</html>