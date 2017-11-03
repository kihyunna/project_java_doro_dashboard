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
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>
<body>
    <!-- prepare a DOM container with width and height -->
    <div id="main" style="width:1000px; height:600px;"></div>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'),'dark'); 
		
	jQuery(document).ready(function($){
		
    	//-----------------------------------AJAX 호출 영역 ---------------------------------------

    	       getBucMntmngDaydbAjax();

    	//-----------------------------------AJAX 호출 영역 ---------------------------------------
    })
    
    function isNumeric(num, opt){
        num = String(num).replace(/^\s+|\s+$/g, "");
        if(typeof opt == "undefined" || opt == "1"){
            var regex = /^[+\-]?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
        }else if(opt == "2"){
        	var regex = /^(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+){1}(\.[0-9]+)?$/g;
	    }else if(opt == "3"){
	        var regex = /^[0-9]+(\.[0-9]+)?$/g;
	    }else{
	        var regex = /^[0-9]$/g;
	    }
	
	    if( regex.test(num) ){
	        num = num.replace(/,/g, "");
	        return isNaN(num) ? false : true;
	    }else{ return false;  }
	}
    function getNumeric(str, opt){
        if(isNumeric(str, opt)){
      	    str = String(str).replace(/^\s+|\s+$/g, "").replace(/,/g, "");
      	    return Number(str);
      	}else{
      		return str;

      	}

    }

    function formatNumber(str, opt){

      var rstr = "", sign = "";

      if(isNumeric(str, opt)){

    	    str = String(getNumeric(str, opt));

    	    if(str.substr(0, 1) == "-" ){

    	    	    sign = "-";

    	    	    str = str.substr(1);

    	    }

    	    var arr = str.split(".");

    	    for(var ii = 0 ; ii < arr[0].length ; ii++){

    	    	  if( ii % 3 == 0 && ii > 0){

    	    		    rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + "," + rstr;

    	    	 }else{

    	         rstr = arr[0].substring(arr[0].length-ii,arr[0].length-ii-1) + rstr;

    	         }

    	    }

		    rstr = sign + rstr;
		
		    return arr.length > 1 ? rstr + "." + arr[1] : rstr;

		}else{

	return str;

  }

}
    
	var timeLineData = ['인력', '장비',  '거리'];

	var todayData = {
		'인력' : [0, 0, 0, 0, 0, 0, 0, 0],
		'장비' : [0, 0, 0, 0, 0, 0, 0, 0],
		'거리' : [0, 0, 0, 0, 0, 0, 0, 0] 
	};

	var yesterdayData = {
			'인력' : [0, 0, 0, 0, 0, 0, 0, 0],
			'장비' : [0, 0, 0, 0, 0, 0, 0, 0],
			'거리' : [0, 0, 0, 0, 0, 0, 0, 0]
	};
		
	function getBucMntmngDaydbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucMntmngdaydbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {           
                var todayCnt =0;
                var yesterCnt =0;
                    if(json.data.length > 0 ){
                        for(var i = 0; i < json.data.length; i++) {
                        
                            if(json.data[i].gubun_date == 'T') {
                            	todayData['인력'][todayCnt] = parseInt(json.data[i].worker_cnt);
                            	todayData['거리'][todayCnt] = parseInt(json.data[i].c_km);
                            	todayData['장비'][todayCnt] = parseInt(json.data[i].eqp_cnt);
                            	todayCnt++;
                            }
                            else if(json.data[i].gubun_date == 'Y'){
                            	yesterdayData['인력'][yesterCnt] = parseInt(json.data[i].worker_cnt);
                            	yesterdayData['거리'][yesterCnt] = parseInt(json.data[i].c_km);
                            	yesterdayData['장비'][yesterCnt] = parseInt(json.data[i].eqp_cnt);
                            	yesterCnt++;
                            }
                            
                            
                        }
                    }
                    else{
                    console.log(arguments);
                    }
    
                },error : function(){
                    console.log(arguments);
                }, complete : function() {
                    myChart.setOption(option);
                }
            });
        
        }
	
	
option = {
	baseOption:{
    title : {        
    },
	timeline: {
		show: true,
		axisType: 'category',
		autoPlay: true,
		left: 0,
		currentIndex: 0,
		bottom: 5,
		width: '100%',
		playInterval: 3000,
		label: {
			normal: {
				show: true,
				interval: 'auto'
			}
		},
		data: timeLineData
	},
    tooltip : {
    },
    color : ['#c23531','#546570'],
    legend: {
    	right: 5,
        data:['금일','전일']
    },
	grid: {
          left: '5%',
          right: 7,
       	  bottom: 80
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['수도권', '강원', '대전충청','전북', '전남광주', '대구경북', '부산경남', '충북']
        }
    ],
    yAxis : [
        {
            type : 'value'            
        }
    ],
    series : [
        
    ]
	},
	options:[]
};

for(var n = 0; n < timeLineData.length; n++)
{
	option.options.push({
		series: [{
            name:'금일',
            type:'bar',
            data:todayData[timeLineData[n]]  ,
            label: {
            	normal: {
                    show: true,
                    position: 'outside',
                    offset: [0, 0],
                    textStyle: {
                        fontSize: 16
                    },
                    formatter:function(value) {
                        var texts = formatNumber(value.value);
                        return texts 
                       
                    }
                }
            }
        },
        {
            name:'전일',
            type:'bar',
            data:yesterdayData[timeLineData[n]],
            label: {
            	normal: {
                    show: true,
                    position: 'outside',
                    offset: [0, 0],
                    textStyle: {
                        fontSize: 16
                    },
                    formatter:function(value) {
                        var texts = formatNumber(value.value);
                        return texts 
                       
                    }
                }
            }
        }]
	});
}
	
	myChart.setOption(option);
	var timerValue = 0;
	$(window).load(function() {
		setDivHeight('main');
		if(timerValue == 0){
            timerValue = 60000*60;
        }
                
        window.setInterval("getBucMntmngDaydbAjax()",timerValue);
		
		
	});
	
    $(window).resize(function(){

        setDivHeight('main');
        

    });

    function setDivHeight(objSet)
    {

        var objSet   = document.getElementById(objSet);
        objSet.style.width  = ($(window).width()) + "px";
        objSet.style.height  = ($(window).height()) + "px";
        option.baseOption.timeline.width = ($(window).width()) + "px";


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
