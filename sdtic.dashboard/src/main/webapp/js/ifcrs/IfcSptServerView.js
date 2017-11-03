var chkStyle = /\d/;
var widgetTimer = 60000 * 1;	//1분
var paramWidgetTimer = "${param.widgetTimer}";
if(paramWidgetTimer != null){
	if(chkStyle.test(paramWidgetTimer)){
		if(paramWidgetTimer != 0){
			widgetTimer = paramWidgetTimer;
		}
	}
}

var data = {};
var timeLineData = new Array();
var regionData = {};
var diskData = {};
var cpuData = {};
var memoryData = {};

var option = {
    baseOption: {
        title: {
            text: '',
        },
        legend: {
            show: true,
            x : 'right',
            data: ['DISK', 'CPU', 'MEMORY']
        },
        timeline: {
        	show: true,
            axisType: 'category',
            autoPlay: true,
            left: 'center',
            top: '80%',
            width: '90%',
            currentIndex: 0,
            playInterval: widgetTimer,
            label: {
                normal: {
                    show: true,
                    interval: 'auto',
                    textStyle: {
                    	fontSize: 10
                    }
                },
            },
            data: [],
        },
        grid: [{
            show: false,
            left: '8%',
            top: '10%',
            width: '90%',
            height: '18%'        
        }, {
            show: false,
            left: '8%',
            top: '32%',
            width: '90%',
            height: '18%'
        }, {
            show: false,
            left: '8%',
            top: '54%',
            width: '90%',
            height: '18%'
        } ],
        xAxis: [{
            gridIndex: 0,
            data: []
        }, {
            gridIndex: 1,
            data: []
        }, {
            gridIndex: 2,
            data: []
        } ],
        yAxis: [{
        	show: true,
            gridIndex: 0,
            splitLine:{
                show: false
            },
            max:100,
            splitNumber: 2,
            axisLabel: {
            	show: true
            }
        }, {
        	show: true,
            gridIndex: 1,
            splitLine:{
                show: false
            },
            max:100,
            splitNumber: 2,
            axisLabel: {
            	show: true
            }
        }, {
        	show: true,
            gridIndex: 2,                
            splitLine:{
                show: false
            },
            max:100,
            splitNumber: 2,
            axisLabel: {
            	show: true
            }
        }],
        series: [{
            type: 'bar',
            name: 'DISK',
            xAxisIndex: 0,
            yAxisIndex: 0,

            data: []
        }, {
            type: 'bar',
            name: 'CPU',
            xAxisIndex: 1,
            yAxisIndex: 1,

            data: []
        }, {
            type: 'bar',
            name: 'MEMORY',
            xAxisIndex: 2,
            yAxisIndex: 2,

            data: []
        }]
    },
    options: []
};