var data = {};
var timeLineData = new Array();

//임계치 세팅
var limitDiskValue = 101;
var limitCpuValue = 101;
var limitMemoryValue = 101;

//DISK, MEMORY, CPU 색상입니다.
var diskColor = "#fc7a26";
var cpuColor = "#ffa127";
var memoryColor = "#ffcd26";

var oriDiskColor = diskColor;
var oriCpuColor = cpuColor;
var oriMemoryColor = memoryColor;

var dangerDiskColor = "#ed1b2f";
var dangerCpuColor = "#ed1b2f";
var dangerMemoryColor = "#ed1b2f";

var centerStyle = {
    normal: {
        label: {
            show: false,
            position: "center"
        },
        labelLine: {
            show: false
        },
        color: "#787878",
        borderColor: "#787878",
        borderWidth: 0
    },
    emphasis: {
        color: "#787878",
        borderColor: "#787878",
        borderWidth: 0
    }
};

function createSeries(mainData) {
    var result = [];
    var maxValue = 100;
    var width = 1;
    var heightOri = 30;
    var height = 30;
    var titleTxt = "";
    var titleFontSize = 12;
    var diskRadius = [49, 50];
    var cpuRadius = [39, 40];
    var memoryRadius = [29, 30];

    var diskLableYn = false;
    var diskLableLineYn = false;
    var cpuLableYn = false;
    var cpuLableLineYn = false;
    var memoryLableYn = false;
    var memoryLableLineYn = false;
    var mainCnt = 0;;

    for (var i = 0; i < mainData.length; i++) {
        titleTxt = mainData[i][0];

        mainCnt = 0;
        for (var j = 0; j < mainData.length; j++) {
            if(mainData[j][0] != null){
                mainCnt++;
            }
        }

        if(mainCnt == 1){
            height = 43;
            width = 50;
            diskRadius = [69, 70];
            cpuRadius = [59, 60];
            memoryRadius = [49, 50];

            titleFontSize = 16;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 14;
            }
        }else if(mainCnt == 2){
            height = 43;
            width = ((i%2) * 40) + 30;
            diskRadius = [69, 70];
            cpuRadius = [59, 60];
            memoryRadius = [49, 50];

            titleFontSize = 16;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 14;
            }
        }else if(mainCnt == 3){
            height = 43;
            width = ((i%3) * 30) + 20;
            diskRadius = [69, 70];
            cpuRadius = [59, 60];
            memoryRadius = [49, 50];

            titleFontSize = 16;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 14;
            }
        }else if(mainCnt == 4){
        	/*
            height = 43;
            width = ((i%4) * 25) + 12.5;
            diskRadius = [69, 70];
            cpuRadius = [59, 60];
            memoryRadius = [49, 50];

            titleFontSize = 16;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 14;
            }
            */
        	if(i/2 >= 1){
                height = heightOri * (parseInt(i/2) * 2);
            }
            width = ((i%2) * 30) + 35;
            
            titleFontSize = 12;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 10;
            }
        }else if(mainCnt == 5){
            if(i/3 >= 1){
                height = heightOri * (parseInt(i/3) * 2);
            }
            if(i/3 >= 1){
                width = ((i%2) * 30) + 35;
            }else{
                width = ((i%3) * 30) + 20;
            }

            titleFontSize = 12;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 10;
            }
        }else if(mainCnt == 6){
            if(i/3 >= 1){
                height = heightOri * (parseInt(i/3) * 2);
            }
            width = ((i%3) * 30) + 20;

            titleFontSize = 12;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 10;
            }
        }else if(mainCnt == 7){
            if(i/4 >= 1){
                height = heightOri * (parseInt(i/4) * 2);
            }
            if(i/4 >= 1){
            	width = ((i%3) * 25) + 25;
            }else{
            	width = ((i%4) * 25) + 12.5;
            }

            titleFontSize = 12;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 10;
            }
        }else if(mainCnt == 8){
            if(i/4 >= 1){
                height = heightOri * (parseInt(i/4) * 2);
            }
            width = ((i%4) * 25) + 12.5;

            titleFontSize = 12;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 10;
            }
        }else{
        	height = 43;
            width = 50;
            diskRadius = [69, 70];
            cpuRadius = [59, 60];
            memoryRadius = [49, 50];

            titleFontSize = 16;
            if(titleTxt != null && titleTxt.length > 6){
                titleFontSize = 14;
            }
        }

        //DISK, CPU, MEMORY 색상입니다.
        diskColor = oriDiskColor;
        cpuColor = oriCpuColor;
        memoryColor = oriMemoryColor;

        diskLableYn = false;
        diskLableLineYn = false;
        cpuLableYn = false;
        cpuLableLineYn = false;
        memoryLableYn = false;
        memoryLableLineYn = false;

        if(mainData[i][1] >= parseInt(limitDiskValue)){
            //위험발생시 DISK, CPU, MEMORY 색상입니다.
            diskColor = dangerDiskColor;
            diskLableYn = true;
            diskLableLineYn = true;
        }
        if(mainData[i][2] >= parseInt(limitCpuValue)){
            //위험발생시 DISK, CPU, MEMORY 색상입니다.
        	cpuColor = dangerCpuColor;
            cpuLableYn = true;
            cpuLableLineYn = true;
        }
        if(mainData[i][3] >= parseInt(limitMemoryValue)){
            //위험발생시 DISK, CPU, MEMORY 색상입니다.
        	memoryColor = dangerMemoryColor;
            memoryLableYn = true;
            memoryLableLineYn = true;
        }

        result.push({
            name: 'DISK',
            type: 'pie',
            clockWise: true,
            hoverAnimation: false,
            radius: diskRadius,
            center : [width + '%', height + '%'],
            itemStyle: {
                normal: {
                    label: {
                        show: diskLableYn,
                        textStyle: {
                            color : diskColor,
                            fontSize: 9
                        }
                    },
                    labelLine: {
                        show: diskLableLineYn,
                        lineStyle: {
                            color : diskColor
                        }
                    },
                    borderWidth: 5,
                    shadowBlur: 40,
                    borderColor: diskColor,
                    shadowColor: 'rgba(0, 0, 0, 0)'
                }
            },
            data: [{
                value: mainData[i][1],
                name: 'DISK\n'+mainData[i][1]+'%',
            }, {
                value: maxValue - mainData[i][1],
                name: '',
                itemStyle: centerStyle
            }]
        }, {
            name: 'DISK_WHITE',
            type: 'pie',
            clockWise: false,
            radius: [0, 0],
            center : [width + '%', height + '%'],
            hoverAnimation: false,
            itemStyle: {
                normal: {
                    label: {
                        show: false,
                    },
                    labelLine: {
                        show: false
                    }
                }
            },
            data: [{
                value: 1
            }]
        }, {
            name: 'CPU',
            type: 'pie',
            clockWise: true,
            hoverAnimation: false,
            radius: cpuRadius,
            center : [width + '%', height + '%'],
            itemStyle: {
                normal: {
                    label: {
                        show: cpuLableYn,
                        textStyle: {
                            color : cpuColor,
                            fontSize: 9
                        }
                    },
                    labelLine: {
                        show: cpuLableLineYn,
                        lineStyle: {
                            color : cpuColor
                        }
                    },
                    borderWidth: 5,
                    shadowBlur: 40,
                    borderColor: cpuColor,
                    shadowColor: 'rgba(0, 0, 0, 0)'
                }
            },
            data: [{
                value: mainData[i][2],
                name: 'CPU\n'+mainData[i][2]+'%'
            }, {
                value: maxValue - mainData[i][2],
                name: '',
                itemStyle: centerStyle
            }]
        }, {
            name: 'CPU_WHITE',
            type: 'pie',
            clockWise: false,
            hoverAnimation: false,
            radius: [0, 0],
            center : [width + '%', height + '%'],
            itemStyle: {
                normal: {
                    label: {
                        show: false,
                    },
                    labelLine: {
                        show: false
                    }
                }
            },
            data: [{
                value: 1
            }]
        }, {
            name: 'MEMORY',
            type: 'pie',
            clockWise: true,
            hoverAnimation: false,
            radius: memoryRadius,
            center : [width + '%', height + '%'],
            itemStyle: {
                normal: {
                    label: {
                        show: memoryLableYn,
                        textStyle: {
                            color : memoryColor,
                            fontSize: 9
                        }
                    },
                    labelLine: {
                        show: memoryLableLineYn,
                        lineStyle: {
                            color : memoryColor
                        }
                    },
                    borderWidth: 5,
                    shadowBlur: 40,
                    borderColor: memoryColor,
                    shadowColor: 'rgba(0, 0, 0, 0)'
                }
            },
            data: [{
                value: mainData[i][3],
                name: 'CPU\n'+mainData[i][3]+'%'
            }, {
                value: maxValue - mainData[i][3],
                name: '',
                itemStyle: centerStyle
            }]
        }, {
            name: 'MEMORY_WHITE',
            type: 'pie',
            clockWise: true,
            hoverAnimation: false,
            radius: [0, 0],
            center : [width + '%', height + '%'],
            label: {
                normal: {
                    position: 'center'
                }
            },
            data: [{
                value: 1,
                label: {
                    normal: {
                        formatter: titleTxt,
                        textStyle: {
                            color: '#eee',
                            fontSize: titleFontSize
                        }
                    }
                }
            }]
        });
    }
    return result;
}

var option = {
    baseOption: {
        timeline: {
            show: true,
            axisType: 'category',
            autoPlay: false,
            left: 'center',
            top: '80%',
            width: '90%',
            currentIndex: 0,
            playInterval: 1000,
            label: {
                normal: {
                    show: true,
                    interval: 'auto'
                },
            },
            data: [],
        }
    },
    options: []
};