var myChart;
var count = 300;
var categories = [];
var data1 = [];
var data2 = [];
var base1 = 8;
var base2 = 15;
var amp1 = 4;
var amp2 = 8;
var offset = 0;

var timeData = [];//시간
var data1 = [];//금일
var data2 = [];//전일

var Options = {  
	color:['#7ea7f2','teal'],
		//color: ['#fd2e89', '#ff80c2', ],	
    xAxis: {
        type: 'category',
        name: '분',
       splitLine: {
            lineStyle:{
                type:'solid',
                color: '#cccccc'
            }
        },
        "axisLine": {
            lineStyle: {
                color: '#cccccc'
            }
        },
        

        boundaryGap: true,
        splitLine: {
            show: false
        },
        axisLabel: {
//            interval: 0  
        	
        },
        data: timeData
    },
    grid: {
        left: '3%',
        right: '5%',
        top: '10%',
        bottom: '4%',
        containLabel: true
    },
    yAxis: {
        name: '사용량',
        splitLine: {
            lineStyle: {
                color: '#cccccc'
            }
        },  
        "axisLine": {
            lineStyle: {
                color: '#cccccc'
            }
        },
         axisLabel: {
            textStyle: {
                color: '#cccccc'
            },
            formatter: function(value) {
                if (value < 0) {
                    return -value
                } else {
                    return value
                }
            }
        },

    },
    series: [{
            name: '시간',
            type: 'line',            
//            smooth: 1,
            symbol: 'none',
            lineStyle: {
                normal: {
                    width: 0
                }
            },
            areaStyle: {
                normal: {
                    opacity:1,
                }
            },
            data: []
        },
        {        	
            name: '사용량',
            type: 'line',
            smooth: true,
            symbol: 'none',
            lineStyle: {
                normal: {
                    width: 0
                }
            },
            areaStyle: {
                normal: {
                    opacity: 1
                }
            },
            data: []
        }
    ],
    animation: false
};



AjaxQuery = function() {
	
	var url  = "http://" + location.host + "/mainSptIOT.do";
	
	if (myChart == null)
		myChart = echarts.init(document.getElementById("idChart"));	  	
		
	$.ajax(
    {
    	type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: {},
        cache: false,
        success: function(data){
        	
        	    timeData=[];
	        	data1=[];
	        	data2=[];
	        	
         		$.each(data.data, function(index){
         			timeData.push(data.data[index].tm);
         			
         			data1.push(index % 2 ? data.data[index].tTrAmnt : 0);	         			
         			data2.push(index % 2 ? 0 : -data.data[index].yTrAmnt);	
         		   			
	        	});          		
         		         		
         		Options.xAxis.data = timeData;  		
         		Options.series[0].data =data1;
     			Options.series[1].data =data2; 
     			
     		myChart.setOption(Options);	
        		
        },
        error: function(req)
        {
            //alert("Error : \n\n" + req.responseText);
        }
	
    });
function addZero(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	};
}
