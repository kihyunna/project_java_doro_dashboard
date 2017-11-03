<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="utf-8" />
	<title>서버 상태</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/ifcrs/IfcMainServerViewVer2.js"></script>
	
	    <link rel="stylesheet" type="text/css" href="${contextPath}/css/main/csshake.css">
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body style="background-color:#171a1f;">
	    <table border="0" cellpadding="0" cellspacing="0">
	        <tr>
	            <td height="45" width="800" style="background-color:transparent;color:#f9f9f9;font-weight:bolder;">
	                &nbsp;서버 상태
	            </td>
	        </tr>
	        <tr>
	            <td height="300">
	                <div id="3dBar" style="width:800px;height:535px;"></div>
	            </td>
	        </tr>
	    </table>
	
	    <script type="text/javascript">
	        var myChart3dBar = echarts.init(document.getElementById('3dBar'), 'dark');
	        myChart3dBar.setOption(option3dBar);
	        
	        /*
	
	        this.currentIndex = -1;
	
	        var subText = "";
	        var subServer = "";
	        var subGubun = "";
	        var subValue = "";
	
	        var timeTicket3dBar = setInterval(function () {
	            var dataLen = data.length;
	            myChart3dBar.dispatchAction({
	                type: 'downplay',
	                seriesIndex: 0,
	                dataIndex: this.currentIndex
	            });
	
	            this.currentIndex = (this.currentIndex + 1) % dataLen;
	
	            myChart3dBar.dispatchAction({
	                type: 'highlight',
	                seriesIndex: 0,
	                dataIndex: this.currentIndex
	            });
	
	            subGubun = gubun[data[this.currentIndex][0]];
	            subServer = server[data[this.currentIndex][1]];
	            subValue = data[this.currentIndex][2];
	
	            //선택된 데이터가 표시되는 DIV의 텍스트입니다.
	            subText = "<span style='font-weight:bolder;color:#f9f9f9'>[" + subServer + "] " + subGubun + " : " + subValue + " 건</span>";
	
	            $("#3dBarSub").html("<center>" + subText + "</center>");
	        }, 2000);
	
	        var isZoom = true;
	        var timeTicket3DZoom = setInterval(function () {
	            if(isZoom){
	                myChart3dBar.setOption({
	                    grid3D: {
	                         viewControl: {
	                            alpha:50,
	                            distance: 150
	                        }
	                    }
	                });
	                isZoom = false;
	            }else{
	                myChart3dBar.setOption({
	                    grid3D: {
	                         viewControl: {
	                            alpha:10,
	                            distance: 250
	                        }
	                    }
	                });
	                isZoom = true;
	            }
	        }, 9000);
	
	        var isData = false;
	
	        var timeTicket3DData = setInterval(function () {
	            if(isData){
	                isData = false;
	                myChart3dBar.setOption({
	                    series:{
	                        data: data.map(function(item) {
	                            return {
	                                value: [item[1], item[0], item[2]]
	                            }
	                        })
	                    }
	                });
	            }else{
	                isData = true;
	                myChart3dBar.setOption({
	                    series:{
	                        data: data2.map(function(item) {
	                            return {
	                                value: [item[1], item[0], item[2]]
	                            }
	                        })
	                    }
	                });
	            }
	        }, 7000);
	        
	        */
	    </script>
	</body>
</html>