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

        //getBucCmmnSmssndngAjax();
        setDivHeight('main');

//-----------------------------------AJAX 호출 영역 ---------------------------------------
})
    function getBucCmmnSmssndngAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucCmmnSmssndng.do",
            async : false,
            dataType : 'json',
            success :function(json) {
                if(json.data.length > 0 ){
                    for(var i=0; i<json.data.length; i++)
                    {
                        option.series[0].data[i].value = json.data[i].sms_business_code_cnt;
                        option.series[0].data[i].name = json.data[i].sms_business_code_name;
                        myChart.setOption(option);
                    }
                }
                else{
                	
                console.log(arguments);
                }

            },error : function(){
                console.log(arguments);
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
                 color: ['#c23531', '#2f4554', '#61a0a8', '#d48265'],
                data:[
                        {value:1024, name:'설계'},
                        {value:869, name:'건설'},
                        {value:1257, name:'유지관리'},
                        {value:964, name:'시설물'}
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
            },
            
            {
            	name:'SMS 발송실패 건수',
                type:'pie',
                radius : '65%',
                center : ['75%', '50%'],
                //color: ['#91c7ae', '#749f83', '#ca8622', '#bda29a'],
               
                data:[
                        {value:12, name:'설계'},
                        {value:10, name:'건설'},
                        {value:5, name:'유지관리'},
                        {value:8, name:'시설물'}
                ],
                label: {
                    normal: {
                        position: 'inner',
                        formatter: function(v){
                        	return v.name + '\n' + Math.round(v.value)+'건';
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