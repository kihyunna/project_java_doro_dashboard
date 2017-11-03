<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
    <meta charset="utf-8">
    <title>SMS발송현황</title>
    <!-- including ECharts file -->
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<script>
</script>
<body>
    <!-- prepare a DOM container with width and height -->
    
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
    	<tr >
    		<td  height="43" style="background-color:#ffffffff; color:#f9f9f9; font-weight:bolder;">
    			금일 SMS 발송현황
    		</td>
    	</tr>
    	<tr>
			<td height="2" style="background-color:#3d4146;">
			</td>
		</tr>
    	<tr>
    		<td height="200">
    			<div id="main" style="width:370px; height:200px;" ></div>
    		</td>
    	</tr>
    </table>
    
    <script type="text/javascript">
        // based on prepared DOM, initialize echarts instance
        
        
        var myChart = echarts.init(document.getElementById('main'),'dark');

        // specify chart configuration item and data
     option = {
		     //backgroundColor : '#fff',
		
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		
		    },
		    legend: {
		        x : 'center',
		        y : 'bottom',
		       // data:['설계','건설','유지관리','시설물']
		    },
		    toolbox: {
		        show : false,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true,
		                type: ['funnel']
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		
		        {
		            name:'SMS 발송현황',
		            type:'pie',
		            radius : ['20%', '80%'],
		            roseType : 'area',
		            color: ['#f2c955', '#00a69d', '#46d185', '#ec5845'],
		            data:[
		                {value:20, name:'설계'},
		                {value:10, name:'건설'},
		                {value:15, name:'유지관리'},
		                {value:35, name:'시설물'}
		            ],
		            label:{
		                normal:{
		                    textStyle: {
		                        fontSize: 13
		
		                    },
		                    formatter: function(param){
		                        return param.name + '\n' + Math.round(param.value)+'건';
		                    }
		
		                }
		            },
		            labelLine: {
		                normal: {
		                    lineStyle: {
		                        width: 2
		                    }
		                }
		            },
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
          	objSet.style.width  = ($(window).width()-20) + "px";
          	objSet.style.height  = ($(window).height()-65) + "px";
          	
          	
          	$('#main').width(($(window).width()-20) + "px");
          	$('#main').height(($(window).height()-65) + "px");
          	
        	
			myChart.resize({
				width: $(window).width()-20,
				height : $(window).height()-65
			});
          	
        } 

        // use configuration item and data specified to show chart

    </script>
</body>
</html>