var server = new Array();
var gubun = ['Total Sessions', 'Active Sessions', 'Execute Counts'];

var data = new Array();

var zMax = 20;

var option = {
    //차트 배경색
    //backgroundColor: '#171a1f',
    tooltip: {
        trigger: 'item',
        axisPointer: {
            type: 'shadow'
        }
    },
    visualMap: {
        text: '',
        type: 'piecewise',
        orient: 'horizontal',
        inverse: false,
        showLabel: true,
        splitNumber: 4,
        max: zMax,
        top : 0,
        right: '5%',
        inRange: {
            //왼쪽의 색깔바의 색상을 배열로 나열한 것입니다.
            //데이터의 크기에 따라 배열의 순서만큼 색상이 변경됩니다.
            //색상을 수정하면 왼쪽바의 색상과 3D차트 막대의 색상이 변경됩니다.
            color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
        }
    },
    xAxis3D: {
        type: 'category',
        data: gubun, //server,
        name: ''

    },
    yAxis3D: {
        type: 'category',
        data: server, //gubun,
        name: ''
    },
    zAxis3D: {
        type: 'value',
        name: '',
        max: zMax
    },
    grid3D: {
        //3D막대의 가로넓이
        boxWidth: 100,
        //3D막대의 세로넓이
        boxDepth: 70,
        light: {
            main: {
                intensity: 1.2
            },
            ambient: {
                intensity: 0.3
            }
        },
        viewControl: {
            alpha:10,
            beta:0,
            autoRotate: true,
            autoRotateAfterStill: 0.1,
            rotateSensitivity: 3,
            distance: 250
        }
    },
    series: [{
        type: 'bar3D',
        data: data.map(function(item) {
            return {
                value: [item[1], item[0], item[2]]
            }
        }),
        shading: 'color',

        label: {
            show: false,
            textStyle: {
                fontSize: 16,
                borderWidth: 1
            }
        },

        itemStyle: {
            //3D막대의 투명도(0~1)
            opacity: 0.8
        },

        emphasis: {
            label: {
                textStyle: {
                    //강조시 표시되는 텍스트 크기
                    fontSize: 20,
                    //강조시 표시되는 텍스트 색상
                    color: '#900'
                }
            },
            itemStyle: {
                //강조시 표시되는 3D막대차트 색상
                color: '#900'
            }
        },
        
        tooltip: {
        	show: false,
            formatter: function(params) {
                return [
                    '서버&nbsp&nbsp&nbsp&nbsp: ' + server[params.dataIndex % server.length],
                    '분류&nbsp&nbsp&nbsp&nbsp: ' + gubun[parseInt(params.dataIndex / server.length) % gubun.length],
                    '건수&nbsp&nbsp&nbsp&nbsp: ' + data[params.dataIndex][2]
                ].join('<br/>')
            }
        }
    }]
}