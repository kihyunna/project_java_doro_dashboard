<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"                     %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<title>비즈니스 메인관제 시설물 데이터 이관율 34종</title>
<!-- including ECharts file -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/etc/echarts-gl.min.js"></script>

<script type="text/javascript" src="${contextPath}/js/common/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/dist/world.js"></script>
<script type="text/javascript" src="${contextPath}/js/echarts/theme/dark.js"></script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr >
        <td  height="43" style="background-color:#ffffffff; color:#f9f9f9; font-weight:bolder;">
                    시설물 데이터 이관율 34종
        </td>
    </tr>
    <tr>
        <td height="2" style="background-color:#3d4146;">
        </td>
    </tr>
    <tr>
        <td height="200">
            <div id="main" style="width:500px; height:400px;" ></div>
        </td>
    </tr>
</table>
<script>
var myChart = echarts.init(document.getElementById('main'));


var hours = ['', '', '','', '', '', ''];
var days = ['', '', '', '', ''];

var timeLineData = ['1', '2', '3', '4', '5', '6', '7', '8']

var data = [
    [0, 0, 5,'교량'],
    [1, 0, 1,'절토사면'],
    [2, 0, 4,'터널'],
    [3, 0, 5,'암거'],
    [4, 0, 78,'출입시설'],
    [5, 0, 78,'옹벽'],
    [6, 0, 78,'석축'],
    [0, 1, 7,'배수관'],
    [1, 1, 78,'측구'],
    [2, 1, 78,'도로\n중심선'],
    [3, 1, 78,'평면선형'],
    [4, 1, 78,'종단경사'],
    [5, 1, 78,'제설시설'],
    [6, 1, 78,'방음벽'],
    [0, 2, 1,'정차대'],
    [1, 2, 1,'중앙\n분리대'],
    [2, 2, 78,'표지판'],
    [3, 2, 78,'차량방호\n안전시설'],
    [4, 2, 78,'충격흡수\n시설'],
    [5, 2, 78,'시선유도\n봉'],
    [6, 2, 78,'시선유도\n표지'],
    [0, 3, 3,'과속\n카메라'],
    [1, 3, 3,'갈매기\n표지'],
    [2, 3, 78,'도로표지병'],
    [3, 3, 78,'공구\n일반현황'],
    [4, 3, 78,'포장\n일반현황'],
    [5, 3, 78,'영업소'],
    [6, 3, 78,'본선길\n어깨'],
    [0, 4, 1,'휴게소'],
    [1, 4, 3,'오르막\n차로'],
    [2, 4, 78,'그루빙'],
    [3, 4, 78,'줄눈관리'],
    [4, 4, 78,'차선도색'],
    [5, 4, 1,'포장시공\n이력']
];

data = data.map(function(item) {
    //alert(item[3]);
    return [item[0], item[1], Math.round(Math.random() * 40+50) || '-', item[3]];
});

option = {
    baseOption: {
        timeline: {
            // y: 0,
            show:false,
            axisType: 'category',
            realtime: true,
            x: '5%',
            x2: '5%',
            loop: true,
            autoPlay: true,
            // currentIndex: 2,
            playInterval: 5000,
            controlStyle: {
                position: 'left'
            },
            //type: 'number',
            height: '30',
            symbol: 'circle',
            symbolSize: '8',
            lineStyle: {
                // show: false,
                width: 1
            },
            padding: [
                0, // 上
                0, // 右
                0, // 下
                0, // 左
            ],
            data: timeLineData
        },
        title: {
        },
        tooltip: {
            //position: 'top',
            /*axisPointer: { // 坐标轴指示器，坐标轴触发有效
                type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            },*/
            trigger: 'item',
            formatter: function(params, ticket, callback) {
                var sc=params.value[2]; //分数
                var ch=params.value[3]; //频道名称
                var r;

                return ch+':'+sc;
            },
            axisPointer: {
                show: false,
                type: 'shadow' //shadow  cross line
            },
            backgroundColor: 'rgba(245, 245, 245, 0.8)',
            borderWidth: 1,
            borderColor: '#ccc',
            padding: 10,
            textStyle: {
                color: '#000'
            },
            /*position: function(pos, params, el, elRect, size) {
                var obj = {
                    top: 10
                };
                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
                return obj;
            },*/
            //extraCssText: 'width: 170px'
        },
        animation: true,
        grid: {
            //height: '50%',
            y: '55',
            y2: '40',
            x: '20',
            x2: '20'
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
            data:['경고','주의','정상']
        },
        visualMap: {
            type: 'piecewise',
            splitNumber: 2,
            pieces: [
                {
                    gt: 0,
                    lte: 35,
                    color:'rgba(255,51,51,0.7)',//红色 一定要带透明度,否则背景的网格看不出来
                    //symbol:'pin',
                    //symbolSize:'10'
                    
                    //opacity:100
                    //colorAlpha:10
                },// 不指定 min，表示 min 为无限大（-Infinity）。
                {
                    gt: 35,
                    lte: 70,
                    color:'rgba(131,151,0,0.7)',//红色 一定要带透明度,否则背景的网格看不出来
                    //symbol:'pin',
                    //symbolSize:'10'
                    
                    //opacity:100
                    //colorAlpha:10
                },// 不指定 min，表示 min 为无限大（-Infinity）。
                
               {
                    gt: 70,
                    lte: 100,
                    //color:'rgba(204,204,153,0.4)',//一定要带透明度,否则背景的网格看不出来
                    color:'rgba(9,128,73,0.7)',
                    //opacity:100
                    //colorAlpha:0.5
                }// 不指定 min，表示 min 为无限大（-Infinity）。
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
                        return v.value[3]+'\n\n'+ v.value[2] ;

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
    }
};
function getData(currentIndex){
    
    data = data.map(function(item) {
        //alert(item[3]);
        return [item[0], item[1], Math.round(Math.random() * 70+30) || '-', item[3]];
    });
    option.baseOption.timeline.currentIndex = currentIndex;
    option.baseOption.series.data = data;
    
    myChart.setOption({
        series:{
            data: data
        }
    });
}


myChart.on('timelinechanged', function (params) {
    getData(params.currentIndex);
});

myChart.setOption(option);
</script>
</body>
</html>