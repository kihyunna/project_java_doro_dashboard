<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 유지관리 현황</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:800px; height:600px;"></div>
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init(document.getElementById('main'),'dark');

        // specify chart configuration item and data     
		var xData = ['홍천양양', '수도권', '성남구리', '아산천안', '광주순환', '포항영덕', '김포포천', '창녕밀양',
			 '김해부산', '창원김해', '안양영천', '밀양울산', '대구순환', '구리포천', '도로개량'];

		//금일			 
		var data_now = [37, 24, 7, 26, 17, 4, 25, 42, 33, 24, 40, 13, 52, 17, 21];

		//전일
		var data_bef = [35, 22, 9, 21, 15, 8, 21, 42, 31, 23, 46, 23, 12, 18, 26];

		//금일 - 전일
		var data_dif = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

		//(금일 - 전일)의 절대값 -> 증감량 막대그래프에 사용
		var data_abs = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

		//금일 - (금일 - 전일)의 절대값 -> 금일 막대그래프에 사용
		var data_pro = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

		for(var i=0;i < data_now.length; i++){
			data_dif[i] = data_now[i] - data_bef[i];
			data_abs[i] = Math.abs(data_dif[i]);
			if(data_dif[i] > 0){
				data_pro[i] = data_now[i] - data_dif[i];
			}else{
				data_pro[i] = data_bef[i] - data_abs[i];
			}
		}

		option = {
			"title": {
				"text": "건설현장 현황 - 인력", 
				"subtext": "전일대비", 
				"x": "center"
			}, 
			"tooltip": {
				"trigger": "axis", 
				"axisPointer": {
					"type": "shadow"
				},
				"formatter" : function(p) 
				{
					var msg = "";
					msg = msg + "금일 : " + data_now[p[0].dataIndex];
					msg = msg + "</br>"
					msg = msg + "전일 : " + data_bef[p[0].dataIndex];
					msg = msg + "</br>"
					msg = msg + "증감량 : " + data_dif[p[0].dataIndex];
					return msg;
				}
			}, 
			"grid": {
				left:"7%",
				right:7,
				

			}, 
			"legend": {
				"x": "right", 
				"data": []
			}, 
			"calculable": true, 
			"xAxis": [
				{
					"type": "category", 
					"splitLine": {
						"show": false
					}, 
					"axisTick": {
						"show": false
					}, 
					"splitArea": {
						"show": false
					}, 
					"axisLabel": {
						"interval": 0, 
						"rotate": 45, 
						"show": true, 
						"splitNumber": 15, 
						"textStyle": {
							"fontSize": 12
						}
					}, 
					"data": xData,
				}
			], 
			"yAxis": [
				{
					"type": "value", 
					interval: 5,
					"splitLine": {
						"show": false
					}, 
					"axisLine": {
						"show": true
					}, 
					"axisTick": {
						"show": false
					}, 
					"splitArea": {
						"show": false
					}
				}
			], 
			"series": [
				{
					"name": "금일", 
					"type": "bar", 
					"stack": "bar", 
					"barMaxWidth": 50, 
					"barGap": "10%", 
					"itemStyle": {
						"normal": {
							"barBorderRadius": 0, 
							"color": "rgba(60,169,196,0.5)", 
							"label": {
								"show": true, 
								"textStyle": {
									"color": "rgba(0,0,0,1)"
								}, 
								"position": "insideTop",
								formatter : function(p) 
								{
									return data_now[p.dataIndex];
								}
							}
						}
					}, 
					"data": data_pro
				}, 
				{
					"name": "증감량", 
					"type": "bar", 
					"stack": "bar", 
					"itemStyle": {
						"normal": {
							"color": 
							function(p) {
								if(data_dif[p.dataIndex] > 0){
									return "rgba(51,204,112,1)";
								}else{
									return "rgba(193,35,43,1)";
								}
							}, 
							"barBorderRadius": 0, 
							"label": {
								"show": true, 
								"position": "top",
								formatter : 
								function(p) {
									if(data_dif[p.dataIndex] > 0){
										return p.value > 0 ? ('▲' + p.value + '') : '';
									}else{
										return p.value > 0 ? ('▼' + p.value + '') : '';
									}
								}
							}
						}
					}, 
					"data": data_abs
				}
			]
		}
		
		myChart.setOption(option);
		
		$(window).load(function() {
			setDivHeight('main');
		});
		
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
	      
			
	    }
		
        // use configuration item and data specified to show chart
   
    </script>
</body>
</html>
