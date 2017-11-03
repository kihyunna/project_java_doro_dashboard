<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv='description' content='' />
<title>기술자문 처리 실적</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main/default.css" />


<script type="text/javascript">

    </script>
</head>
<style type="text/css">
    #grid1{position:absolute;top:22px; left:10px;font-color:#fff;font-family:"nanum", "Nanum Gothic", "NanumGothic", "나눔고딕", "돋움", "Dotum", Arial, AppleGothic, Sans-Serif;font-weight:normal;}
</style>

<body>

 <div id="main" style="width:700px; height:400px;" ></div>
    
    <div id="grid1" >
        <table class="tblWgt" style="width:140px; height:30px; font-size:11px;">

            <tr>
                <td id="ts1Name" scope="row" style="font-color:#fff;">
                    (요청건수 / 처리건수)건
                </td>
            </tr>
         </table>
   </div>


    <script type="text/javascript">
    
	    $(window).load(function() {
	    	setDivHeight('main');
	    	chartChange();
	    	divchangeTimer();
	    	
	   });
 
        var myChart = echarts.init(document.getElementById('main'),'dark');


        var data = [
                    { value: 18, name: '요청건수'}, { value: 15, name: '처리건수'},
                    { value: 16},{ value: 13},{ value: 19},{ value: 15},{ value: 15},{ value: 10},
                    { value: 17},{ value: 12},{ value: 12},{ value: 10},{ value: 16},{ value: 11},
                    { value: 19},{ value: 13},{ value: 14},{ value: 10},{ value: 0},{ value: 0},
                    { value: 0 },{ value: 0 },{ value: 0}, { value: 0}
                   ];
        var labelData = [
                         { value: 2, name: '1월\n\n' + data[0].value + ' / ' + data[1].value+'건'},
                         { value: 2, name: '2월\n\n' + data[2].value + ' / ' + data[3].value+'건'},
                         { value: 2, name: '3월\n\n' + data[4].value + ' / ' + data[5].value+'건'},
                         { value: 2, name: '4월\n\n' + data[6].value + ' / ' + data[7].value+'건'},
                         { value: 2, name: '5월\n\n' + data[8].value + ' / ' + data[9].value+'건'},
                         { value: 2, name: '6월\n\n' + data[10].value + ' / ' + data[11].value+'건'},
                         { value: 2, name: '7월\n\n' + data[12].value + ' / ' + data[13].value+'건'},
                         { value: 2, name: '8월\n\n' + data[14].value + ' / ' + data[15].value+'건'},
                         { value: 2, name: '9월\n\n' + data[16].value + ' / ' + data[17].value+'건'},
                         { value: 2, name: '10월\n\n' + data[18].value + ' / ' + data[19].value+'건'},
                         { value: 2, name: '11월\n\n' + data[20].value + ' / ' + data[21].value+'건'},
                         { value: 2, name: '12월\n\n' + data[22].value + ' / ' + data[23].value+'건'}
                        ];

        option = {
            /*title: {
                text: '기술자문처리실적',
                left: '50%',
                textAlign: 'center',
                top: '15%'
            },*/
            legend: {
                x: 'left',
                data: ['요청건수','처리건수']
            },
            textStyle: {
            color:'#fff',
           
            },

            series: [{
                type: 'pie',
                data: data,
                roseType: 'area',
                color: ['#61a0a8','#2f4554'],
                itemStyle: {
                    normal: {

                        borderColor: '#fff',
                        //opacity:'0.75',

                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                    normal: {
                        show: false,
                        color: '#fff'
                    }
                }

            },

            {
                type: 'pie',
                data: labelData,
                radius: ['75%', '99%'],
                zlevel: -2,
                itemStyle: {
                    normal: {
                       color: '#749f83',
                        //opacity: '0.8',
                        borderColor: 'white'
                    }
                },

                label: {
                    normal: {
                        position: 'inside',

                    }
                }
            }]

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
            myChart.setOption(option);
        }

        


    </script>
    <script type="text/javascript">
    //var myChart = echarts.init(document.getElementById('main2'), 'dark');

    var data0 = new Array();
    var data1 = new Array();

    data0 = ['8'];
    data1 = ['14'];

    option1 = {

   		
        xAxis: {
            data: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월','10월', '11월', '12월']
        },
        yAxis: {},
        grid: {
     	   left:'30',
     	   right:'10'
     	      },
        series: [
            {
            type: 'line',
            data: [22, 18, 19, 23, 15, 23, 15, 20, 14, , , ].map(function(val) {
                return val;
           	 })
            },
            {
                type: 'bar',
                stack:'1',
                // barWidth:'30%',
                data: data0
            },
            {
                type: 'bar',
                stack:'1',
                data: data1
            }
           
        ]
    };
    
    function divchangeTimer(){

        window.setInterval("chartChange()",26000);

    }
    var cnt= 0;
    function after_sliding() {
    	$("#grid1").hide();
        setInterval(function (){
            if(cnt == 11){
                location.reload();
                return false;
            }
            data0.push(Math.round(Math.random() * 50) + 30);
            data1.push(Math.round(Math.random() * 30));
            option1.series[1].data = data0;
            option1.series[2].data = data1;
            cnt++;
            myChart.setOption(option1);
        }, 2000);
    }
    
    var temp = false;
    function chartChange(){
        
    	if(temp){
    		myChart.clear();
    		myChart.setOption(option1);
    		after_sliding();
    		temp = false;
    	}else{
    		myChart.clear();
    		myChart.setOption(option);
            temp = true;
    	}

    }
    

    </script>
</body>
</html>