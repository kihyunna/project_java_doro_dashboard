<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 공통 SMS 발송현황 화면</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>


<div id="main" style="width:370px; height:200px;" ></div>

<script type="text/javascript">

jQuery(document).ready(function($){

//-----------------------------------AJAX 호출 영역 ---------------------------------------

        getBucCmmnSmssndngdbAjax();
        setDivHeight('main');

//-----------------------------------AJAX 호출 영역 ---------------------------------------
})
	var success = new Array();
	var failure = new Array();
	var systm_cd = new Array();
	var timerValue = 0;
	$(window).load(function(){

	    timerValue = "${param.widgetTimer}";
	    
	    if(timerValue == 0){
	        timerValue = 60000*60;
	    }
	    
	    window.setInterval("getBucCmmnSmssndngAjax()",timerValue);
	    
	});
	
    function getBucCmmnSmssndngdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnSmssndngdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                	
                    for(var i=0; i<json.data.length; i++)
                    {
                    	if(json.data[i].systm_cd == 'DSG')
                    		{
                    		option.series[0].data[0].name ='설계';
                    		option.series[1].data[0].name ='설계';
                    		option.series[0].data[0].value = json.data[i].success;
                    		option.series[1].data[0].value = json.data[i].failure;
	                   		}
                    	else if(json.data[i].systm_cd == 'CON')
                    		{
                    		option.series[0].data[1].name ='건설';
                    		option.series[1].data[1].name ='건설';
                    		option.series[0].data[1].value = json.data[i].success;
                    		option.series[1].data[1].value = json.data[i].failure;
	                   		}
                    	else if(json.data[i].systm_cd == 'UKP')
                			{
                		option.series[0].data[2].name ='유지관리';
                		option.series[1].data[2].name ='유지관리';
                		option.series[0].data[2].value = json.data[i].success;
                		option.series[1].data[2].value = json.data[i].failure;
                   			}
                    	else if(json.data[i].systm_cd == 'FCL')
                			{
                		option.series[0].data[3].name ='시설물';
                		option.series[1].data[3].name ='시설물';
                		option.series[0].data[3].value = json.data[i].success;
                		option.series[1].data[3].value = json.data[i].failure;
                   			}
                    	else if(json.data[i].systm_cd == 'COM')
            				{
            			option.series[0].data[4].name ='공통';
            			option.series[1].data[4].name ='공통';
            			option.series[0].data[4].value = json.data[i].success;
            			option.series[1].data[4].value = json.data[i].failure;
               				}
                       
                        
                    }
                    
                }
                else{
                	
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
            },complete : function(){
            	myChart.setOption(option);
            }
        });

    }

    var myChart = echarts.init(document.getElementById('main'),'dark');

    // specify chart configuration item and data
 option = {
         //backgroundColor : '#fff',
         title : [{
	        subtext: '발송',
       		 x:'26%',
       		 y:'-10%'       		
   		 },{
   			subtext: '발송실패',
      		 x:'68%',
      		 y:'-10%'  
      		 
  		 }],
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
            	 name:'SMS 발송건수',
                 type:'pie',
                 radius : ['40%', '65%'],
                 center : ['30%', '50%'],
                 color: ['#749f83','#c23531', '#2f4554', '#61a0a8', '#d48265'],
                data:[
                             {value:0, name:'설계'},
                             {value:0, name:'건설'},
                             {value:0, name:'유지관리'},
                             {value:0, name:'시설물'},
                             {value:0, name:'공통'}
                 ],
                label:{
                    normal:{
                        textStyle: {
                            fontSize: 13
                            
                        },
                        formatter: function(param){
                        	if(param.value == 0){
                        		return '';
                        	} else {
                            	return param.name + '\n' + Math.round(param.value)+'건';
                        	}
                        }

                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
            },
            
            {
            	name:'SMS 발송실패 건수',
                type:'pie',
                radius : '65%',
                center : ['75%', '50%'],
                //color: ['#91c7ae', '#749f83', '#ca8622', '#bda29a'],
               
                data:[
                           {value:0, name:'설계'},
                           {value:0, name:'건설'},
                           {value:0, name:'유지관리'},
                           {value:0, name:'시설물'},
                           {value:0, name:'공통'}
                ],
                label: {
                    normal: {
                        position: 'inside',
                        formatter: function(v){
                        	if(v.value == 0){
                        		return '';
                        	}
                        	else{
                        		return v.name + '\n' + Math.round(v.value)+'건';
                        	}
                        }
                    },
                    
                },
                labelLine: {
                    normal: {
                        show: false
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