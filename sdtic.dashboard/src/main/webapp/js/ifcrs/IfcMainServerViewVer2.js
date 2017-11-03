var xAxisdata = [ '1a', '2a', '3a', '4a', '5a'];
var yAxisdata = ['1b', '2b', '3b','4b', '5b', '6b', '7b', '8b', '9b', '10b'];


var serverData = [
    [6, 0, 5, '[시설물]\n스마트\n제한차량수집'],
    [6, 1, 5, '[시설물]\n오수처리시설\n통신서버'],
    [6, 2, 5, '[시설물]\n터널관리\n통신서버'],
    [6, 3, 5, '[시설물]\n전기시설물관리\n통신서버'],
    [6, 4, 5, '[빅데이타]\n빅데이타'],
    [7, 0, 5, '[외부연계]\n대외연계MDT'],
    [7, 1, 5, '[외부연계]\n중계서버'],
    [7, 2, 5, '[Iot플랫폼]\n관리'],
    [7, 3, 5, '[Iot플랫폼]\n데이타'],
    [7, 4, 5, '[Iot플랫폼]\n수집'],
    [8, 0, 5, '[통합관제]\n관제'],
    [8, 1, 5, '[솔루션]\n전자지도'],
    [8, 2, 5, '[솔루션]\nMap관리'],
    [8, 3, 5, '[솔루션]\n도면관리'],
    [8, 4, 5, '[솔루션]\nSSO'],
    [9, 0, 5, '[솔루션]\nRexpert'],
    [9, 1, 5, '[내부연계]\nHi-포탈'],
    [9, 2, 5, '[내부연계]\n전자문서'],
    [9, 3, 5, '[내부연계]\n내부연계']
];

var dbData = [
    [0, 0, 5, '[DB]\n통합DB\n/시설물DB'],
    [0, 1, 5, '[DB]\n빅데이타\n/통합관제DB']
];

var webData = [
    [2, 0, 5],
    [2, 1, 5],
    [2, 2, 5],
    [2, 3, 5],
    [2, 4, 5],
    [3, 0, 5],
    [3, 1, 5],
    [3, 2, 5],
    [3, 3, 5],
    [3, 4, 5],
    [4, 0, 5],
    [4, 1, 5],
    [4, 2, 5],
    [4, 3, 5]

]

var noData = [
    [0, 2, 0],
    [0, 3, 0],
    [0, 4, 0],
    [1, 0, 0],
    [1, 1, 0],
    [1, 2, 0],
    [1, 3, 0],
    [1, 4, 0],
    [4, 4, 0],
    [5, 0, 0],
    [5, 1, 0],
    [5, 2, 0],
    [5, 3, 0],
    [5, 4, 0],
    [5, 4, 0],
    [9, 4, 0]
]

var option3dBar = {
    tooltip: {},

    xAxis3D: {
        type: 'category',
        data: xAxisdata,
        name:' ',
        axisTick:{
            show:false
        },
        axisLabel:{
            show:false
        },
        splitLine:{
            show:false
        },

    },
    yAxis3D: {
        type: 'category',
        data: yAxisdata,
        name:' ',
        axisTick:{
            show:false
        },
        axisLabel:{
            show:false
        },
        splitLine:{
            show:false
        }

    },
    zAxis3D: {
        type: 'category',
        name:' ',
        max:10,
        axisTick:{
            show:false
        },
        axisLabel:{
            show:false
        },
        splitLine:{
            show:false
        },
        axisLine:{
            lineStyle:{
                color:'#fff'
            }
        }
    },
    grid3D: {
        boxWidth: 150,
        boxDepth: 150,
        boxHeight:50,
        light: {
            main: {
                intensity: 1.2
            },
            ambient: {
                intensity: 0.3
            }
        },
        viewControl: {
            autoRotate: true,
            autoRotateAfterStill: 0.1,
            rotateSensitivity: 3,
            distance: 150
        }
    },
    series: [
        {
            type:'bar3D',
            data: webData.map(function(item) {
                return {
                    value: [item[1], item[0], item[2]]
                }
            }),
            shading:'color',
            itemStyle:{
                color:'#01A1DB',
                opacity:0.8
            },
            label: {
                show: true,
                textStyle: {
                    fontSize: 24,
                    borderWidth: 0
                },
                formatter : function(p){
					return webData[p.dataIndex][3];
				}
            },
        },
        {
	        type: 'bar3D',
	        data: dbData.map(function(item) {
	            return {
	                value: [item[1], item[0], item[2]]
	            }
	        }),
	        shading: 'color',
	
	        label: {
	            show: true,
	            textStyle: {
	                fontSize: 18,
	                borderWidth: 0
	            },
	            formatter : function(p){
					return dbData[p.dataIndex][3];
				}
	        },
	
	        itemStyle: {
	            color:'#787878',
	            opacity: 0.8
	        },
	
	        emphasis: {
	            label: {
	                textStyle: {
	                    fontSize: 24,
	                    color: '#900'
	                }
	            },
	            itemStyle: {
	                color: '#900'
	            }
	        }
        },
        {
	        type:'bar3D',
	          	data: noData.map(function(item) {
	          		return {
	          			value: [item[1], item[0], item[2]]
	            }
	        }),
	        shading:'color',
	        itemStyle:{
	            color:'#FFFFFF',
	            opacity:0.8
	        },
        },
        {
            type:'bar3D',
            data: serverData.map(function(item) {
                return {
                    value: [item[1], item[0], item[2]]
                }
            }),
            shading:'color',
            itemStyle:{
                color:'#469202',
                opacity:0.8
            },
            label: {
                show: true,
                textStyle: {
                    fontSize: 14,
                    borderWidth: 0,
                    color:'#fff'
                },
                formatter : function(p){
					return serverData[p.dataIndex][3];
				}
            },
        },
    ]
}