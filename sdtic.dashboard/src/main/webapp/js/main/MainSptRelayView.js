var dataNormal = new Array();
var dataDanger = new Array();

var bonbu = new Array();

var yMax = 10;
var dataShadow = new Array();

var option = {
    title: {
        text: ''
    },
    grid: {
    	top: '5%',
        left: '10%',
        right: '7%',
        bottom: '15%'
    },
    xAxis: {
        data: bonbu,
        axisLabel: {
            //inside: true,
            textStyle: {
            	fontSize: 10,
                color: '#ccc'
            }
        },
        axisTick: {
            show: false
        },
        axisLine: {
            show: false
        },
        z: 10
    },
    yAxis: {
        axisLine: {
            show: false
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            textStyle: {
                color: '#ccc'
            }
        }
    },
    dataZoom: [
        {
            type: 'inside'
        }
    ],
    series: [
        { // For shadow
            type: 'bar',
            itemStyle: {
                normal: {color: 'rgba(0,0,0,0.5)'}
            },
            barGap:'-100%',
            barCategoryGap:'40%',
            data: dataShadow,
            animation: false
        },
        {
        	name: '정상',
            type: 'bar',
            stack: 'bar',
            itemStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#aEc7F2'},
                            {offset: 0.5, color: '#6E97f2'},
                            {offset: 1, color: '#6E97f2'}
                        ]
                    )
                },
                emphasis: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#6E97f2'},
                            {offset: 0.7, color: '#6E97f2'},
                            {offset: 1, color: '#aEc7F2'}
                        ]
                    )
                }
            },
            label:{
            	normal:{
            		show: true,
            		textStyle: {
                        color: '#000'
                    }
            	}
            },
            data: dataNormal
        },
        {
        	name: '위험',
            type: 'bar',
            stack: 'bar',
            itemStyle: {
                normal: {
                    color: '#f47920'
                },
                emphasis: {
                    color: '#f47920'
                }
            },
            label:{
            	normal:{
            		show: true,
            		position: 'top',
            		textStyle: {
                        color: '#ccc'
                    },
            		formatter: function (params) {
                        if(params.value == 0){
                            return '';
                        }
                    }
            	}
            },
            data: dataDanger
        }
    ]
};

/*
var option = {
    tooltip : {
    	show: false,
        trigger: 'axis',
        axisPointer : {
            type : 'shadow'
        }
    },
    color : ['#7EA7F2','#B64753'],
    legend: {
        show : false
    },
    grid: {
    	top: '5%',
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : bonbu
        }
    ],
    yAxis : [
        {
            type : 'value',
            max : 25,
            splitLine : {
            	show : false
            }
        }
    ],
    series : [
        {
            name: '정상',
            type: 'bar',
            stack: 'bar',
            barWidth: '50%',
            data: dataNormal,
            label:{
            	normal:{
            		show: true,
            		textStyle: {
                        color: '#000'
                    }
            	}
            }
        },
        {
            name: '위험',
            type: 'bar',
            stack: 'bar',
            barWidth: '50%',
            data: dataDanger,
            label:{
            	normal:{
            		show: true,
            		position: 'top',
            		textStyle: {
                        color: '#B64753'
                    },
            		formatter: function (params) {
                        if(params.value == 0){
                            return '';
                        }
                    }
            	}
            }
        }
    ]
};
*/