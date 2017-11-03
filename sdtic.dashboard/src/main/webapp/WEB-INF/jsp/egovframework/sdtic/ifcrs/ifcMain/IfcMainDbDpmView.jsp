<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>DPM</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcMainDbDpmView.js"></script>
	    
	    <script type="text/javascript">
	        $(window).load(function(){
	        	getData();
	        });
	    </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body style="background-color:#171a1f;">
	    <table border="0" cellpadding="0" cellspacing="0">
	        <tr>
	            <td height="43" width="700" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;">
	                &nbsp;DPM
	            </td>
	        </tr>
	        <tr>
	            <td height="2" style="background-color:#3d4146;">
	            </td>
	        </tr>
	        <tr>
	            <td height="320">
	                <div id="main" style="width:700px;height:320px;"></div>
	            </td>
	        </tr>
	    </table>
	    
	    <script type="text/javascript">
            var myChart = echarts.init(document.getElementById('main'), 'dark');
            myChart.setOption(option);
            
            function getData(){
                $.ajax({
                    url : "${pageContext.request.contextPath}/ifc/ifcMainDbDpm.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    : 'DB'
                       ,'group1'   : 'DPM'
                    },
                    success :function(json) {
                        zMax = 20;
                        
                        for(var i=0;i<gubun.length;i++){
                        	data[i] = new Array();
                            for(var j=0;j<json.data.length;j++){
                                if(i == 0){
                                    data[i][j] = json.data[j].active_session;
                                    if(zMax < json.data[j].active_session){
                                        zMax = json.data[j].active_session;
                                        zMax = Math.ceil(zMax/10) * 10;
                                    }
                                }else if(i == 1){
                                    data[i][j] = json.data[j].lock_session;
                                    if(zMax < json.data[j].lock_session){
                                        zMax = json.data[j].lock_session;
                                        zMax = Math.ceil(zMax/10) * 10;
                                    }
                                }
                            }
                        }
                        
                        for(var i=0;i<json.data.length;i++){
                        	option.radar[0].indicator[i] = {};
                            option.radar[0].indicator[i].text = json.data[i].code_name;
                            option.radar[0].indicator[i].max = zMax;
                        }

                        for(var i=0;i<gubun.length;i++){
                        	option.series[0].data[i].value = data[i];
                        	option.series[0].data[i].value = data[i];
                        }

                        myChart.setOption(option);                        
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
            
            var timeTicketData = setInterval(function () {
                getData();
            }, 5000);
        </script>

	</body>
</html>