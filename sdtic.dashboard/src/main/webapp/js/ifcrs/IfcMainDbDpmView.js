var gubun = ['ACTIVE SESSION', 'LOCK SESSION'];

var data = new Array();

var zMax = 20;

var option = {
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        x : 'center',
        y : 0,
        data: gubun
    },
    radar: [
        {
            indicator: [{}],
            center: ['50%', '55%'],
            radius: '70%',
            startAngle: 90,
            splitNumber: zMax / 5,
            shape: 'circle',
            name: {
                formatter:'【{value}】',
                textStyle: {
                    color:'#72ACD1'
                },
                textStyle: {
                	fontSize: 18
                }
            },
            splitArea: {
                areaStyle: {
                    color: ['rgba(114, 172, 209, 0.2)',
                    'rgba(114, 172, 209, 0.4)', 'rgba(114, 172, 209, 0.6)',
                    'rgba(114, 172, 209, 0.8)', 'rgba(114, 172, 209, 1)'],
                    shadowColor: 'rgba(0, 0, 0, 0.3)',
                    shadowBlur: 10
                }
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(255, 255, 255, 0.5)'
                }
            },
            splitLine: {
                lineStyle: {
                    color: 'rgba(255, 255, 255, 0.5)'
                }
            }
        }
    ],
    color: ['#ffb980','#ff0f0f'],
    series : [
        {
            type: 'radar',
            itemStyle: {
                emphasis: {
                    lineStyle: {
                        width: 4
                    }
                }
            },
            data: [
                {
                    value: [],
                    name: gubun[0],
                    symbol: 'rect',
                    symbolSize: 5,

                    itemStyle: {
                    	normal: {
                    		areaStyle: {
                    			type: 'default'
                    		}
                    	}
                    },
                    label: {
                        normal: {
                            show: true,
                            formatter:function(params) {
                                return params.value;
                            },
                            textStyle: {
                            	fontSize: 18
                            }
                        }
                    }
                },
                {
                    value: [],
                    name: gubun[1],
                    itemStyle: {
                    	normal: {
                    		areaStyle: {
                    			type: 'default'
                    		}
                    	}
                    },
                    label: {
                        normal: {
                            show: true,
                            formatter:function(params) {
                                return params.value;
                            },
                            textStyle: {
                            	fontSize: 18,
                            	color: '#fff00f'
                            }
                        }
                    }
                }
            ]
        }
    ]
};