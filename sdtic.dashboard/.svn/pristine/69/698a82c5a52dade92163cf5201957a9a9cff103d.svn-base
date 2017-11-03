<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" class="cnt_if">
	<head>
	<meta charset="utf-8" />
	<title>클라우드(WEB/WAS)</title>
	<!-- including ECharts file -->
	    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	    <script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/common/showModalDialog.js"></script>
	
	    <script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
	    <script type="text/javascript" src="${contextPath}/js/main/MainCloudWebWasView.js"></script>
	    
	    <style type="text/css">
			#title {position:absolute;bottom:5%;left:4%}
		</style>
	
	    <script type="text/javascript">	
		    $(window).load(function(){
	            initData(0);
	            
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
	    </script>
	</head>
	
	<!-- 백그라운드 이미지 넣으면 차트도 동일하게 적용됩니다. -->
	<body>
	    <div id="main" style="width:600px;height:380px;"></div>
	
	    <div id="title" style="width:70px;height:50px;color:#ccc;font-size:14px;">공통1</div>
	
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main'), 'dark');
	        myChart.setOption(option);
	        
	        /*
	        var index = 0;
	        
	        var mainData = ['공통1','공통2','설계/건설','시설물','유지관리'];
        	
        	var mainTimeLineData = {
        		    '공통1' : ['통합포털','통계','통합연계','도면관리','통합관제','(외부)CITIS'],
        		    '공통2' : ['하이모피스','통합대외','브이월드','기상청','기술행정'],
        		    '설계/건설' : ['설계/건설/기술'],
        		    '시설물' : ['스마트제한차량','터널, 전기','(내부)정보통신','(외부)정보통신'],
        		    '유지관리' : ['도로/포장','재난/기상','장비/교통','구조물/외관','사고분석']
        		};
        	*/
	
	        function initData(idx){
                $.ajax({
                    url : "${pageContext.request.contextPath}/main/mainCloudWebWas.do",
                    async : false,
                    dataType : 'json',
                    data:{
                        'gubun'    : 'WEB',
                        'group1'   : 'CO1'
                    },
                    success :function(json) {
                        var cnt = 0;
                        var temp = "";
                        var gubunTemp = -1;
                        var cntTemp = 0;
                        
                        for(var i=0;i<json.data.length;i++){
                            if(temp != json.data[i].group2){
                                timeLineData[cnt] = json.data[i].group2_name;                                
                                temp = json.data[i].group2;
                                cnt++;
                            }
                        }
                        
                        for(var i=0;i<timeLineData.length;i++){
                            data[timeLineData[i]] = new Array();
                            
                            for(var j=0;j<json.data.length;j++){
                                if(timeLineData[i] == json.data[j].group2_name){
                                	for(var k=0;k<prfGubun.length;k++){
                                		if(prfGubun[k] == json.data[j].group3_name){
	                                		for(var l=0;l<hours.length;l++){
	                                            data[timeLineData[i]][l+(k*hours.length)] = new Array();
	                                            data[timeLineData[i]][l+(k*hours.length)][0] = k;
	                                            data[timeLineData[i]][l+(k*hours.length)][1] = l;
	                                            cntTemp = l + "";
	                                            if(cntTemp.length < 2){
	                                                cntTemp = "0" + cntTemp;
	                                            }
	                                            data[timeLineData[i]][l+(k*hours.length)][2] = eval("json.data[j].hh_" + cntTemp);
	                                        }
                                		}
                                	}
                                }else{
                                }
                            }
                        }
                        
                        for (var i = 0; i < timeLineData.length; i++) {
						    option.baseOption.timeline.data.push(timeLineData[i]);
						
						    dataTmp0 = new Array();
						    dataTmp1 = new Array();
						    dataTmp2 = new Array();
						    dataTmp3 = new Array();
						
						    for (var j = 0; j < data[timeLineData[i]].length; j++) {
						        if(data[timeLineData[i]][j][0] == 0){
						            dataTmp0.push(data[timeLineData[i]][j]);
						        }
						        if(data[timeLineData[i]][j][0] == 1){
						            dataTmp1.push(data[timeLineData[i]][j]);
						        }
						        if(data[timeLineData[i]][j][0] == 2){
						            dataTmp2.push(data[timeLineData[i]][j]);
						        }
						        if(data[timeLineData[i]][j][0] == 3){
						            dataTmp3.push(data[timeLineData[i]][j]);
						        }
						    }
						
						    dataTmp0 = dataTmp0.map(function (item) {
						        return [item[1], item[0], item[2]];
						    });
						    dataTmp1 = dataTmp1.map(function (item) {
						        return [item[1], item[0], item[2]];
						    });
						    dataTmp2 = dataTmp2.map(function (item) {
						        return [item[1], item[0], item[2]];
						    });
						    dataTmp3 = dataTmp3.map(function (item) {
						        return [item[1], item[0], item[2]];
						    });
						
						    option.options.push({
						        title: [{
						            textBaseline: 'middle',
						            top: (0 + 0.7) * 70 / 4 + '%',
						            left: 20,
						            text: prfGubun[0],
						            textStyle: {
						                fontSize: 11
						            }
						        },{
						            textBaseline: 'middle',
						            top: (1 + 0.7) * 70 / 4 + '%',
						            left: 20,
						            text: prfGubun[1],
						            textStyle: {
						                fontSize: 11
						            }
						        },{
						            textBaseline: 'middle',
						            top: (2 + 0.7) * 70 / 4 + '%',
						            left: 20,
						            text: prfGubun[2],
						            textStyle: {
						                fontSize: 11
						            }
						        },{
						            textBaseline: 'middle',
						            top: (3 + 0.7) * 70 / 4 + '%',
						            left: 20,
						            text: prfGubun[3],
						            textStyle: {
						                fontSize: 11
						            }
						        }],
						        //색상을 배열로 정의하면 차례에 맞게 색상이 표현됩니다.
						        //색상을 정의하지 않으면 기본색을 표현합니다.
						        //color: ['#ff0000','#00ff00','#0000ff', '#ffff00'],    //주석을 제거해서 테스트하시면 됩니다.
						        singleAxis: [{
						            left: 120,
						            type: 'category',
						            boundaryGap: false,
						            data: hours,
						            top: (0 * 70 / 4 + 5) + '%',
						            height: (70 / 4 - 10) + '%',
						            axisLabel: {
						                interval: 2
						            }
						        },
						        {
						            left: 120,
						            type: 'category',
						            boundaryGap: false,
						            data: hours,
						            top: (1 * 70 / 4 + 5) + '%',
						            height: (70 / 4 - 10) + '%',
						            axisLabel: {
						                interval: 2
						            }
						        },
						        {
						            left: 120,
						            type: 'category',
						            boundaryGap: false,
						            data: hours,
						            top: (2 * 70 / 4 + 5) + '%',
						            height: (70 / 4 - 10) + '%',
						            axisLabel: {
						                interval: 2
						            }
						        },
						        {
						            left: 120,
						            type: 'category',
						            boundaryGap: false,
						            data: hours,
						            top: (3 * 70 / 4 + 5) + '%',
						            height: (70 / 4 - 10) + '%',
						            axisLabel: {
						                interval: 2
						            }
						        }],
						        series: [{
						            singleAxisIndex: 0,
						            coordinateSystem: 'singleAxis',
						            type: 'scatter',
						            data: dataTmp0,
						            symbolSize: function (dataItem) {
						                return dataItem[2] * 1;
						            }
						        },
						        {
						            singleAxisIndex: 1,
						            coordinateSystem: 'singleAxis',
						            type: 'scatter',
						            data: dataTmp1,
						            symbolSize: function (dataItem) {
						                return dataItem[2] * 1;
						            }
						        },
						        {
						            singleAxisIndex: 2,
						            coordinateSystem: 'singleAxis',
						            type: 'scatter',
						            data: dataTmp2,
						            symbolSize: function (dataItem) {
						                return dataItem[2] * 1;
						            }
						        },
						        {
						            singleAxisIndex: 3,
						            coordinateSystem: 'singleAxis',
						            type: 'scatter',
						            data: dataTmp3,
						            symbolSize: function (dataItem) {
						                return dataItem[2] * 1;
						            }
						        }]
						
						    });
						}
                        myChart.setOption(option);  
                    },error : function(){
                        console.log(arguments);
                    }
                });
            }
	        
	        function getData(currentIndex){
	        	$.ajax({
	                    url : "${pageContext.request.contextPath}/main/mainCloudWebWas.do",
	                    async : false,
	                    dataType : 'json',
	                    data:{
	                        'gubun'    : 'WEB',
	                        'group1'   : 'CO1'
	                    },
	                    success :function(json) {
	                        var temp = "";
	                        var gubunTemp = -1;
	                        var cntTemp = 0;
	                        
	                        for(var i=0;i<timeLineData.length;i++){
	                            data[timeLineData[i]] = new Array();
	                            
	                            for(var j=0;j<json.data.length;j++){
	                                if(timeLineData[i] == json.data[j].group2_name){
	                                    for(var k=0;k<prfGubun.length;k++){
	                                        if(prfGubun[k] == json.data[j].group3_name){
	                                            for(var l=0;l<hours.length;l++){
	                                                data[timeLineData[i]][l+(k*hours.length)] = new Array();
	                                                data[timeLineData[i]][l+(k*hours.length)][0] = k;
	                                                data[timeLineData[i]][l+(k*hours.length)][1] = l;
	                                                cntTemp = l + "";
	                                                if(cntTemp.length < 2){
	                                                    cntTemp = "0" + cntTemp;
	                                                }
	                                                data[timeLineData[i]][l+(k*hours.length)][2] = eval("json.data[j].hh_" + cntTemp);
	                                            }
	                                        }
	                                    }
	                                }
	                            }
	                        }
	                        
	                        for (var i = 0; i < timeLineData.length; i++) {
	                            dataTmp0 = new Array();
	                            dataTmp1 = new Array();
	                            dataTmp2 = new Array();
	                            dataTmp3 = new Array();
	                        
	                            for (var j = 0; j < data[timeLineData[i]].length; j++) {
	                                if(data[timeLineData[i]][j][0] == 0){
	                                    dataTmp0.push(data[timeLineData[i]][j]);
	                                }
	                                if(data[timeLineData[i]][j][0] == 1){
	                                    dataTmp1.push(data[timeLineData[i]][j]);
	                                }
	                                if(data[timeLineData[i]][j][0] == 2){
	                                    dataTmp2.push(data[timeLineData[i]][j]);
	                                }
	                                if(data[timeLineData[i]][j][0] == 3){
	                                    dataTmp3.push(data[timeLineData[i]][j]);
	                                }
	                            }
	                        
	                            dataTmp0 = dataTmp0.map(function (item) {
	                                return [item[1], item[0], item[2]];
	                            });
	                            dataTmp1 = dataTmp1.map(function (item) {
	                                return [item[1], item[0], item[2]];
	                            });
	                            dataTmp2 = dataTmp2.map(function (item) {
	                                return [item[1], item[0], item[2]];
	                            });
	                            dataTmp3 = dataTmp3.map(function (item) {
	                                return [item[1], item[0], item[2]];
	                            });
	                            
	                            option.options[i].series[0].data = dataTmp0;                                
                                option.options[i].series[1].data = dataTmp1;                                
                                option.options[i].series[2].data = dataTmp2;                                
                                option.options[i].series[3].data = dataTmp3;
	                        }
	                        
	                        option.baseOption.timeline.currentIndex = currentIndex;
	                        myChart.setOption(option);  
	                    },error : function(){
	                        console.log(arguments);
	                    }
	                });
            }
            
	        
            myChart.on('timelinechanged', function (params) {
                getData(params.currentIndex);
                /*
                if(params.currentIndex == 0){
                	index++;
                	if(index == mainData.length){
                		index = 0;
                	}
                	$("#title").html(mainData[index]);
                	initData(index);
                }
                */
            });
            
	        /*
            var timeTicketEvent = setTimeout(function () {
                $("#event").show();
            }, 1500000);
	        */
	    </script>
	</body>
</html>