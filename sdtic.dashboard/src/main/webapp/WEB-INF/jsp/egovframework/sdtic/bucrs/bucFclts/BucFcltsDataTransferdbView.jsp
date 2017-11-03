<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 설계도서 35종 입력률</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body style="background-color:#ffffffff;">

     <div id="main_buc_fclts" style="width:500px;height:280px; " ></div>
    
    <script type="text/javascript">
       var buc_fclts_chart = echarts.init(document.getElementById('main_buc_fclts'));
   
   
       var hours = ['', '', '','', '', '', ''];
       var days = ['', '', '', '', ''];
   
       //var timeLineData = ['1', '2', '3', '4', '5', '6', '7', '8']
   
       var data = [ 
           [0, 0, 0,''],
           [1, 0, 0,''],
           [2, 0, 0,''],
           [3, 0, 0,''],
           [4, 0, 0,''],
           [5, 0, 0,''],
           [6, 0, 0,''],
           [0, 1, 0,''],
           [1, 1, 0,''],
           [2, 1, 0,''],
           [3, 1, 0,''],
           [4, 1, 0,''],
           [5, 1, 0,''],
           [6, 1, 0,''],
           [0, 2, 0,''],
           [1, 2, 0,''],
           [2, 2, 0,''],
           [3, 2, 0,''],
           [4, 2, 0,''],
           [5, 2, 0,''],
           [6, 2, 0,''],
           [0, 3, 0,''],
           [1, 3, 0,''],
           [2, 3, 0,''],
           [3, 3, 0,''],
           [4, 3, 0,''],
           [5, 3, 0,''],
           [6, 3, 0,''],
           [0, 4, 0,''],
           [1, 4, 0,''],
           [2, 4, 0,''],
           [3, 4, 0,''],
           [4, 4, 0,''],
           [5, 4, 0,''],
           [6, 4, 0,'']
       ];
   		
       	var title = new Array();
       	var rate = new Array();
         
        jQuery(document).ready(function($){
    		
        	//-----------------------------------AJAX 호출 영역 ---------------------------------------

        	       getBucFcltsDataTransferdbAjax();

        	//-----------------------------------AJAX 호출 영역 ---------------------------------------
        })
        function getBucFcltsDataTransferdbAjax(){
        $.ajax({
            url : "${pageContext.request.contextPath}/buc/bucFcltsDataTransferdbAjax.do",
            async : false,
            dataType : 'json',
            success :function(json) {           

                    if(json.data.length > 0 ){
                        for(var i = 0; i < json.data.length; i++) {
                        	if(json.data[i].bnstytrnsfer != null) {
	                        	data[i][2]= json.data[i].bnstytrnsfer;
	                        	if(json.data[i].cmmn_cd_nm.length >= 6){
	                        		data[i][3] = json.data[i].cmmn_cd_nm.substring(0,4) + '\r\n' + json.data[i].cmmn_cd_nm.substring(4,json.data[i].cmmn_cd_nm.length);
	                        	} else {
	                            	data[i][3] = json.data[i].cmmn_cd_nm;                        		
	                        	}
                        	}
                        }
                    }
                    else{
                    console.log(arguments);
                    }
    
                },error : function(){
                    console.log(arguments);
                }, complete : function() {
                	buc_fclts_chart.setOption(option);
                }
            });
        
        }
	
   
       option = {
                   trigger: 'item',
                  
                   axisPointer: {
                       show: false,
                       type: 'shadow' //shadow  cross line
                   },
                   backgroundColor: '#ffffffff',
                   borderWidth: 1,
                   borderColor: '#ccc',
                   padding: 10,
                   textStyle: {
                       color: '#fff'
                   },
               animation: true,
               grid: {
                   //height: '50%',
                   y: '27',
                   y2: '20',
                   x: '10',
                   x2: '10',
               },
               xAxis: {
                   type: 'category',
                   data: hours,
                   position: 'top',
                   splitArea: {
                       show: true
                   },
                   axisTick:{
                       inside:true
                   }
               },
               yAxis: {
                   inverse: true,
                   type: 'category',
                   data: days,
                   splitArea: {
                       show: true
                   },
                   axisTick:{
                       inside:true
                   }
               },
               legend: {
                   orient: 'vertical',
                   x:'right',
                   data:['경고','주의','정상'],
                   textStyle: {
                       color: "#000"
                   }
               },
               visualMap: {
                   type: 'piecewise',
                   splitNumber: 2,

                    textStyle: {
                        color: "#fff"
                    },
                   pieces: [
                       {
                           gt: 0,
                           lte: 35,
                           color:'rgba(255,51,51,0.7)',
                           
                           //symbol:'pin',
                           //symbolSize:'10'
                           
                           //opacity:100
                           //colorAlpha:10
                       },
                       {
                           gt: 35,
                           lte: 70,
                           color:'rgba(131,151,0,0.7)',
                           //symbol:'pin',
                           //symbolSize:'10'
                           
                           //opacity:100
                           //colorAlpha:10
                       },
                       
                      {
                           gt: 70,
                           lte: 100,
                           //color:'rgba(204,204,153,0.4)',
                           color:'rgba(9,128,73,0.7)',
                           //opacity:100
                           //colorAlpha:0.5
                       }
                   ],
                  
                   dimension: 2,
                   //min: 0,
                  // max: 100,
                   //itemWidth: '20',
                   itemHeight: '20',
                   align: 'left',
                   show: true,
                   //calculable: true,
                   orient: 'horizontal', //'vertical'  horizontal
                   left: 'right', //center   
                   top: 'top',
                   bottom: '15%'
               },
               series: [{
                   name: 'channel',
                   type: 'heatmap',
                   data: data,
                   label: {
                       normal: {
                           show: true, //是否显示叉叉
                           formatter: function(v) {
                               //alert(v.value[3]);
                               //显示节目名称
                               return v.value[3]+'\n'+ v.value[2] ;
   
                           }
                       }
                   },
                   itemStyle: {
                       emphasis: {
                           shadowBlur: 10,
                           shadowColor: 'rgba(0, 0, 0, 0.5)'
                       }
                   }
               }]
           
       };
    /*    function buc_fclts_getData(currentIndex){
           
           data = data.map(function(item) {
               //alert(item[3]);
               return [item[0], item[1], Math.round(Math.random() * 70+30) || '-', item[3]];
           });
           //option1.baseOption.timeline.currentIndex = currentIndex;
           option1.series.data = data;
           
           buc_fclts_chart.setOption({
               series:{
                   data: data
               }
           });
       }
       
       buc_fclts_chart.on('timelinechanged', function (params) {
          buc_fclts_getData(params.currentIndex);
       });
   
       buc_fclts_chart.setOption(option1); */
       var timerValue = 0;
       $(window).load(function() {
			setDivHeight('main_buc_fclts');
			
			if(timerValue == 0){
	            timerValue = 60000*60;
	        }
	        
	        window.setInterval("getBucFcltsDataTransferdbAjax()",timerValue);
	    
		});
		
	    $(window).resize(function(){

	        setDivHeight('main_buc_fclts');

	    });

	    function setDivHeight(objSet)
	    {

	        var objSet   = document.getElementById(objSet);
	        objSet.style.width  = ($(window).width()) + "px";
	        objSet.style.height  = ($(window).height()) + "px";


	        $('#main_buc_fclts').width(($(window).width()) + "px");
	        $('#main_buc_fclts').height(($(window).height()) + "px");


	        buc_fclts_chart.resize({
	            width: $(window).width(),
	            height : $(window).height()
	            
	        });
	        buc_fclts_chart.setOption(option);
			
	    }
       </script>
</body>
</html>