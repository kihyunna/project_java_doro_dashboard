function setDeptforMap(){
	require('echarts/util/mapData/params').params.kyeongbuk = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kyeongbuk_geo.json', callback);
	    }
	};    
	
	require('echarts/util/mapData/params').params.kangwon = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kangwon_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.kyeongnam = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kyeongnam_geo.json', callback);
	    }
	};    
	
	require('echarts/util/mapData/params').params.kyeonggi = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kyeonggi_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.chungcheong = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/chungcheong_geo.json', callback);
	    }
	};    
	
	require('echarts/util/mapData/params').params.chungbuk = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/chungbuk_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.chungnam = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/chungnam_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.kangwon = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/kangwon_geo.json', callback);
	    }
	}; 
	
	require('echarts/util/mapData/params').params.jeonbuk = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/jeonbuk_geo.json', callback);
	    }
	};    
	
	require('echarts/util/mapData/params').params.jeonnam = {
	    getGeoJson: function (callback) {
	        $.getJSON('/js/echarts/source/geoJson/jeonnam_geo.json', callback);
	    }
	}; 
}


function chart(){
//	DeptName = '강원본부';
//	DeptJson = 'kangwon';		

//	DeptName = '경북본부';
//	DeptJson = 'kyeongbuk';		
//
//	DeptName = '경남본부';
//	DeptJson = 'kyeongnam';	

//	DeptName = '경기본부';
//	DeptJson = 'kyeonggi';	
//
//	DeptName = '충청본부';
//	DeptJson = 'chungcheong';
	
	DeptName = '충북본부';
	DeptJson = 'chungbuk';
	
//	DeptName = '충남본부';
//	DeptJson = 'chungnam';	
	
//
//	DeptName = '전북본부';
//	DeptJson = 'jeonbuk';	
//
//	DeptName = '전남본부';
//	DeptJson = 'jeonnam';	

	
	var Options = {				
				        
	    color: ['gold','aqua'],
	    title : {
	        //subtext: 'Data from www.census.gov.',
	        //sublink: 'http://www.census.gov/popest/data/datasets.html',
	        x:'center',
	        textStyle : {
	            color: '#fff'
	        }
	    },
	    tooltip : {
	        trigger: 'item'//,
	        //formatter: '{b}'						        
	        				        
	    }, 
	    dataRange: {
	        min : 85,
	        max : 100,
	        calculable : true,
	        color: [ 'lime','orange','#ff3333'],	
//	        color: [ 'rgba(22,96,74,1)','rgba(128,100,54,1)','rgba(112,46,33,1)'],	
	        textStyle:{
	            color:'#fff'
	        },
	        itemWidth : 10,
	        itemHeight : 10,
	        show: false
	    },			    
	    series : [					    
	        {					        
	            name: '전국지도',					            
	            type: 'map',
	            roam: false,
	            hoverable: false,
	            mapType: DeptJson, 					            
	            itemStyle:{
	                normal:{
	                    borderColor:'rgba(100,149,237,1)',
	                    borderWidth:0.5,
	                    areaStyle:{
	                        //color: '#1b1b1b'
	                        color: 'rgba(80, 80, 80,1)'					                        					                        
	                    },
	                    label: {
                            show: false,
                            textStyle: {
	                           color: "#fff",
	                           fontSize : 18,
	                           align : 'left'
//	                           baseline : 'top'
	                        }
                        }
	                },
					emphasis:{label:{show:true}}
	            },	
	             data : [	            				                   
	            ],					            
	            geoCoord: {			                
	                '강원지역본부': [127.9520,37.3997],
	                '강원차량1': [127.9929,37.4131],
	                '강원차량2': [128.3062,37.5430],
	                '강원차량3': [128.6764,37.9640],  					                
	                '강원차량4': [128.3025,37.7615],					                					                	
	                '강원차량5': [128.0567,38.0247],	
	                '강원차량6': [128.6462,38.0438],	
	                '강원차량7': [129.0911,37.3346] 
	            }
	        }
	    ]
	};
	
	myChart.setOption(Options);
}



function setPowrChart(){
	var myChart = echarts.init(document.getElementById("fecPower"), 'dark');
    
	var Options = {
			//backgroundColor : '#22272d',
		    tooltip : {
		        trigger: 'axis'
		    },    
		  legend: {
		        data:['금일','전일','월평균','전월평균','전년평균'],
		        textStyle : {color :  'rgba(255,255,255,100)'}
		    },
		    calculable : true,     
		    xAxis : [
		        {				        	
		           //name : '부',
		           color:'rgba(255,255,255,100)', 
		            type : 'category',
		            data : ['수도권','강원','충북','충남','전북','전남','경북','경남'],
		            axisLabel : {
		                formatter: '{value}',
		               textStyle : {color :  'rgba(255,255,255,100)'}
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            //name : '전력량',
		            axisLabel : {
		                formatter: '{value} kw',
		                textStyle : {color :  'rgba(255,255,255,100)'}
		            }
		        }
		    ],
		    series : [{     
		       
		           itemStyle: {
		                normal: {
		                    color: 'rgb(202,84,85)',				                	
		                    label: {
		                        show: false,
		                        position: '',
		                        formatter: '{a}'
		                    }
		                }
		            },
		            name:'금일',
		            type:'bar',
		            barWidth : 13,
		            data:[100, 150, 162.2, 123.2, 125.6, 176.7, 135.6, 145.2]
		        },
		        {
		          itemStyle: {
		                normal: {
		                    color: '#27727B',
		                    label: {
		                        show: false,
		                        position: 'bottom',
		                        formatter: '{a}'
		                    }
		                }
		            },         
		            name:'전일',
		            type:'bar',
		            barWidth : 13,
		            data:[142.6, 145.9, 129.0, 126.4, 128.7, 170.7, 175.6, 145.1]
		        },
		        {
		  itemStyle: {
		                normal: {
		                    color: '#99FF00',
		                    label: {
		                        show: false,
		                        position: 'bottom',
		                        formatter: '{a}'
		                    }
		                }
		            },
		            name:'월평균',
		            type:'line',
		            yAxisIndex: 0,
		            data:[152.0, 152.2, 163.3, 124.5, 176.3,110.2, 120.3, 164.2]
		        },
		        {
		          itemStyle: {
		                normal: {
		                    color: 'blue',
		                    label: {
		                        show: false,
		                        position: 'top',
		                        formatter: '{a}'
		                    }
		                }
		            },
		            name:'전월평균',
		            type:'line',
		            yAxisIndex: 0,
		            data:[142.0, 162.2, 153.3, 134.5, 136.3,170.2, 140.3, 182.3]
		        },
		        {
		          itemStyle: {
		                normal: {
		                    color: 'green',
		                    label: {
		                        show: false,
		                        position: 'bottom',
		                        formatter: '{a}'
		                    }
		                }
		            },
		            name:'전년평균',
		            type:'line',
		            yAxisIndex: 0,
		            data:[142.0, 155.2, 173.3, 144.5, 146.3,130.2, 160.3,153.6]
		        }
		    ]
		};
	
	myChart.setOption(Options);
	
}


function setMasterChart(){
	option = {
		    title: {
		        "text": '마스터',
		        "x": '48%',
		        "y": '45%',
		        textAlign: "center",
		        "textStyle": {
		            "fontWeight": 'bold',
		            "fontSize": 24,
		            "color": 'white'
		        },
		        "subtextStyle": {
		            "fontWeight": 'bold',
		            "fontSize": 32,
		            "color": '#3ea1ff'
		        }
		    },
		    series: [ 
		        {
		            "name": ' ',
		            "type": 'pie',
		            "radius": ['50%', '70%'],
		            "avoidLabelOverlap": false,
		            "startAngle": 225,
		            "color": ["#9f8fc1", "transparent"],
		            "hoverAnimation": false,
		            "legendHoverLink": false,
		            "label": {
		                "normal": {
		                    "show": false,
		                    "position": 'center'
		                },
		                "emphasis": {
		                    "show": true,
		                    "textStyle": {
		                        "fontSize": '30',
		                        "fontWeight": 'bold'
		                    }
		                }
		            },
		            "labelLine": {
		                "normal": {
		                    "show": false
		                }
		            },
		            "data": [{
		                "value": 75,
		                "name": '1'
		            }, {
		                "value": 25,
		                "name": '2'
		            }]
		        }, 
		      {
		            "name": '',
		            "type": 'pie',
		            "radius": ['52%', '68%'],
		            "avoidLabelOverlap": false,
		            "startAngle": 317,
		            "color": ["#fff", "transparent"],
		            "hoverAnimation": false,
		            "legendHoverLink": false,
		            "clockwise": false,
		            "itemStyle":{
		                "normal":{
		                    "borderColor":"transparent",
		                    "borderWidth":"20"
		                },
		                "emphasis":{
		                    "borderColor":"transparent",
		                    "borderWidth":"20"
		                }
		            }
		            ,
		            "z":10,
		            "label": {
		                "normal": {
		                    "show": false,
		                    "position": 'center'
		                },
		                "emphasis": {
		                    "show": true,
		                    "textStyle": {
		                        "fontSize": '30',
		                        "fontWeight": 'bold'
		                    }
		                }
		            },
		            "labelLine": {
		                "normal": {
		                    "show": false
		                }
		            },
		            "data": [{
		                // "value": (100 - value1) * 266 / 360,
		                "name": ''
		            }, {
		                // "value": 100 - (100 - value1) * 266 / 360,
		                "name": ''
		            }
		            ]
		        }

		    ]
		};
	
	return option;
}

function setColctChart(){
	option = {
		    title: {
		        "text": '수집',
		        "x": '48%',
		        "y": '45%',
		        textAlign: "center",
		        "textStyle": {
		            "fontWeight": 'bold',
		            "fontSize": 24,
		            "color": 'white'
		        },
		        "subtextStyle": {
		            "fontWeight": 'bold',
		            "fontSize": 32,
		            "color": '#3ea1ff'
		        }
		    },
		    series: [ 
		        {
		            "name": ' ',
		            "type": 'pie',
		            "radius": ['50%', '70%'],
		            "avoidLabelOverlap": false,
		            "startAngle": 225,
		            "color": ["#9f8fc1", "transparent"],
		            "hoverAnimation": false,
		            "legendHoverLink": false,
		            "label": {
		                "normal": {
		                    "show": false,
		                    "position": 'center'
		                },
		                "emphasis": {
		                    "show": true,
		                    "textStyle": {
		                        "fontSize": '30',
		                        "fontWeight": 'bold'
		                    }
		                }
		            },
		            "labelLine": {
		                "normal": {
		                    "show": false
		                }
		            },
		            "data": [{
		                "value": 75,
		                "name": '1'
		            }, {
		                "value": 25,
		                "name": '2'
		            }]
		        }, 
		      {
		            "name": '',
		            "type": 'pie',
		            "radius": ['52%', '68%'],
		            "avoidLabelOverlap": false,
		            "startAngle": 317,
		            "color": ["#fff", "transparent"],
		            "hoverAnimation": false,
		            "legendHoverLink": false,
		            "clockwise": false,
		            "itemStyle":{
		                "normal":{
		                    "borderColor":"transparent",
		                    "borderWidth":"20"
		                },
		                "emphasis":{
		                    "borderColor":"transparent",
		                    "borderWidth":"20"
		                }
		            }
		            ,
		            "z":10,
		            "label": {
		                "normal": {
		                    "show": false,
		                    "position": 'center'
		                },
		                "emphasis": {
		                    "show": true,
		                    "textStyle": {
		                        "fontSize": '30',
		                        "fontWeight": 'bold'
		                    }
		                }
		            },
		            "labelLine": {
		                "normal": {
		                    "show": false
		                }
		            },
		            "data": [{
		                // "value": (100 - value1) * 266 / 360,
		                "name": ''
		            }, {
		                // "value": 100 - (100 - value1) * 266 / 360,
		                "name": ''
		            }
		            ]
		        }

		    ]
		};
	
	return option;
} 
function setDataChart(){
	option = {
		    title: {
		        "text": '데이터',
		        "x": '48%',
		        "y": '45%',
		        textAlign: "center",
		        "textStyle": {
		            "fontWeight": 'bold',
		            "fontSize": 24,
		            "color": 'white'
		        },
		        "subtextStyle": {
		            "fontWeight": 'bold',
		            "fontSize": 32,
		            "color": '#3ea1ff'
		        }
		    },
		    series: [ 
		        {
		            "name": ' ',
		            "type": 'pie',
		            "radius": ['50%', '70%'],
		            "avoidLabelOverlap": false,
		            "startAngle": 225,
		            "color": ["#9f8fc1", "transparent"],
//		            "color": ["lime", "transparent"],
		            "hoverAnimation": false,
		            "legendHoverLink": false,
		            "label": {
		                "normal": {
		                    "show": false,
		                    "position": 'center'
		                },
		                "emphasis": {
		                    "show": true,
		                    "textStyle": {
		                        "fontSize": '30',
		                        "fontWeight": 'bold'
		                    }
		                }
		            },
		            "labelLine": {
		                "normal": {
		                    "show": false
		                }
		            },
		            "data": [{
		                "value": 75,
		                "name": '1'
		            }, {
		                "value": 25,
		                "name": '2'
		            }]
		        }, 
		      {
		            "name": '',
		            "type": 'pie',
		            "radius": ['52%', '68%'],
		            "avoidLabelOverlap": false,
		            "startAngle": 317,
//		            "color": ["#fff", "transparent"],
		            "color": ["#fff", "transparent"],
		            "hoverAnimation": false,
		            "legendHoverLink": false,
		            "clockwise": false,
		            "itemStyle":{
		                "normal":{
		                    "borderColor":"transparent",
		                    "borderWidth":"20"
		                },
		                "emphasis":{
		                    "borderColor":"transparent",
		                    "borderWidth":"20"
		                }
		            }
		            ,
		            "z":10,
		            "label": {
		                "normal": {
		                    "show": false,
		                    "position": 'center'
		                },
		                "emphasis": {
		                    "show": true,
		                    "textStyle": {
		                        "fontSize": '30',
		                        "fontWeight": 'bold'
		                    }
		                }
		            },
		            "labelLine": {
		                "normal": {
		                    "show": false
		                }
		            },
		            "data": [{
		                // "value": (100 - value1) * 266 / 360,
		                "name": ''
		            }, {
		                // "value": 100 - (100 - value1) * 266 / 360,
		                "name": ''
		            }
		            ]
		        }

		    ]
		};
	
	return option;
} 

function setIOTChart(){
	var xAxisData = [];
	var data1 = [];
	var data2 = [];

	for (var i = 0; i < 10; i++) {
	    // xAxisData.push('time' + i);
	    data1.push((Math.random() * 2).toFixed(2));
	    data2.push(-Math.random().toFixed(2));
	}

	var itemStyle = {			
	    normal: {},
	    emphasis: {
	        barBorderWidth: 1,
	        shadowBlur: 10,
	        shadowOffsetX: 0,
	        shadowOffsetY: 0,
	        shadowColor: 'rgba(255,255,255,1)'
	    }
	    
	};

	option = {
	    title: {
	        //text: '奖金统计'
	    },
	    //backgroundColor: '#fff',	    
	    
//	    tooltip: {
//	        formatter: function(params) {
//	            console.log(params);
//	            if (params.value < 0) {
//	                return params.name + '<br/>助学金额:' + -params.value
//	            } else {
//	                return params.name + '<br/>助学人数:' + params.value
//	            }
//	        }
//	    },
	    xAxis: {
	        data: xAxisData,
	        name: '',
	        axisLabel:{
	        	textStyle :{
	        		color:'white'
	        	}
            },	
	        silent: false,
	        type: 'category',
	        data: ['','00','','','','','02','','','','', '04','','','','', '06','','','','', '08','','','','', '12','','','','', '14','','','','', '16','','','','', '18','','','','', '20','','','','', '22']
		    
	    },	   
	    yAxis: [{
	        inverse: true,
	        name: '',
	        splitArea: {
	            show: false
	        },
	        axisLabel: {
	        	textStyle :{
	        		color:'white'
	        	},
	            formatter: function(value) {
	                if (value <= 30) {
	                    return 30-value+'M'
	                } else {
	                    return -value+'M'
	                }
	            }
	        }

	    }, {
	        inverse: true,
	        name: '',
	        axisLabel: {
	        	textStyle :{
	        		color:'white'
	        	},
	        },
	        position: 'left',
	        nameLocation: 'start',
	        splitArea: {
	            show: false
	        }
	    }],
	    grid: {

	    },
	    series: [{
	        name: '',
	        type: 'bar',
	        stack: 'one',
	        itemStyle: itemStyle,
	        data: [-30, -30, -25, -30, -25, -30, -25, -28, -18, -30, -27,-26, -30, -30, -30, -25, -30, -25, -30, -25, -28, -18, -30, -27,-26, -30,-30, -30, -25, -30, -25, -30, -25, -28, -18, -30, -27,-26, -30,-30, -30, -25, -30, -25, -30, -25, -28, -18, -30, -27,-26, -30]
	    }, {
	        name: '',
	        type: 'bar',
	        stack: 'one',
	        itemStyle: itemStyle,	        
	    	data: [30, 30, 25, 30, 25, 30, 25, 28, 18, 30, 27,26, 30,30, 30, 25, 30, 25, 30, 25, 28, 18, 30, 27,26, 30,30, 30, 25, 30, 25, 30, 25, 28, 18, 30, 27,26, 30,30, 30, 25, 30, 25, 30, 25, 28, 18, 30, 27,26, 30]
	    }]
	};
	
	return option;
	
}


$(window).load(function(){
	var masterOption;
	var ColctOption;
	var DataOption;
	var IOTOption;
	
	var masterChart = echarts.init(document.getElementById('fecMaster'),'dark');
	var ColctChart = echarts.init(document.getElementById('fecColct'),'dark');
	var DataChart = echarts.init(document.getElementById('fecData'),'dark');

	var IOTChart = echarts.init(document.getElementById('fecIOT'));
	
	masterOption = setMasterChart();    
	ColctOption = setColctChart(); 
	DataOption = setDataChart(); 
	IOTOption = setIOTChart();
	
	masterChart.setOption(masterOption, true);
	ColctChart.setOption(ColctOption, true);
	DataChart.setOption(DataOption, true);
	IOTChart.setOption(IOTOption, true);
	
	setTimeout($.proxy(function () {
		//setDeptforMap();
		setPowrChart();
	}, this), 1000);	
	
	setTimeout($.proxy(function () {
		chart();
	}, this), 1000);	
	
    $('#vortex').vortex({
        speed : 50,
        manualAdvance : true,
        initialPosition : 270
    });
    
    var timeTicketVortex = setInterval(function (){ 
        $('#vortex').data('vortex').step(1);
    }, 5000);
    
    
    setInterval(function() {
        var value = parseInt(Math.random() * 55) + 30,
            value_ = (100 - value) * 266 / 360;
        if (value < 80)
        	masterOption.series[0].color[0] = "red";
        else
        	masterOption.series[0].color[0] = "#9f8fc1";
        masterOption.title.subtext = value + "%";
        masterOption.series[1].data[0].value = value_;
        masterOption.series[1].data[1].value = 100 - value_;
        masterChart.setOption(masterOption, true);
    }, 3000);
    
    setInterval(function() {
        var value = parseInt(Math.random() * 55) + 30,
            value_ = (100 - value) * 266 / 360;
        if (value < 80)
        	ColctOption.series[0].color[0] = "red";
        else
        	ColctOption.series[0].color[0] = "#9f8fc1";
        ColctOption.title.subtext = value + "%";
        ColctOption.series[1].data[0].value = value_;
        ColctOption.series[1].data[1].value = 100 - value_;
        ColctChart.setOption(ColctOption, true);
    }, 3000);
    
    setInterval(function() {
        var value = parseInt(Math.random() * 55) + 30,
            value_ = (100 - value) * 266 / 360;
        if (value < 80)
        	DataOption.series[0].color[0] = "red";
        else
        	DataOption.series[0].color[0] = "#9f8fc1";
        DataOption.title.subtext = value + "%";
        DataOption.series[1].data[0].value = value_;
        DataOption.series[1].data[1].value = 100 - value_;
        DataChart.setOption(DataOption, true);
    }, 3000);
});