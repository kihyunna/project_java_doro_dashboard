var STEP = 10 ;
var TOTAL = new Array();
var TOTAL_ALL = new Array();

var errorIndex = [];
var deviceData = [];
var gubun = ['도로기술','시설','빅데이터','관제'];

function setDeviceData(index){	
	for (var c=0; c<gubun.length; c++) {
	    TOTAL = TOTAL_ALL[c];
	    var deviceItemData = [];
	
	    for (var i=0; i<TOTAL.length; i++) {
	        var color = '#0c96e2';
	        var borderColor = '#333';
	        var borderWidth = 0.5;
	        
	        if(index == c && index == 0){
	        	borderColor = '#b69549';
	        	borderWidth = 2;
	        }else if(index == c && index == 1){
	        	borderColor = '#6C9C44';
	        	borderWidth = 2;
	        }else if(index == c && index == 2){
	        	borderColor = '#3Ab6aE';
	        	borderWidth = 2;
	        }else if(index == c && index == 3){
	        	borderColor = '#4353a6';
	        	borderWidth = 2;
	        }
	        
	        if( c == 0 ){
	            if(TOTAL[i] == 1){
	                color = '#D6A569';
	            }else{
	                color = '#374554';
	            }
	        }else if( c == 1  ){
	            if(TOTAL[i] == 1){
	                color = '#8CBC64';
	            }else{
	                color = '#374554';
	            }
	        }else if( c == 2  ){
	            if(TOTAL[i] == 1){
	                color = '#5AD6CE';
	            }else{
	                color = '#374554';
	            }
	        }else if( c == 3  ){
	             if(TOTAL[i] == 1){
	                color = '#6373C6';
	            }else{
	                color = '#374554';
	            }
	        }
	        deviceItemData.push({
	            value: 1,
	            name: 'name'+i,
	            itemStyle: {
	                normal: {
	                    color: color,
	                    borderColor: borderColor,
	                    borderWidth: borderWidth,
	                }
	            }
	        })
	
	    }
	    deviceData.push(deviceItemData);
	}
}

var option = {
    //backgroundColor: 'linear-gradient(#000135, #0252a3)',

    tooltip: {
    	show: false,
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    color: ['#d48265','#2f4554','#61a0a8'],
    series: [{
        name: '',
        type: 'pie',
        selectedMode: 'single',
        radius: [0, '28%'],

        label: {
            normal: {
                position: 'inner'
            }
        },
        labelLine: {
            normal: {
                show: false
            }
        },
        data: [{
            value: 1,
            name: 'DISK',
            selected: false
        }, {
            value: 1,
            name: 'CPU'
        }, {
            value: 1,
            name: 'MEM'
        }]
    },
    {
        name:'Device',
        type:'pie',
        selectedMode: 'single',
        radius: ['30%', '43%'],
        animation: true,
        label: {
            normal: {
                show: false,
                position: 'inner'
            }
        },
        labelLine: {
            normal: {
                show: false
            }
        },
        data: deviceData[0]
    },
    {
        name:'Device',
        type:'pie',
        radius: ['45%', '58%'],
        animation: true,
        label: {
          normal: {
              show: false
          }
        },
        data:deviceData[1]
    },
    {
        name:'Device',
        type:'pie',
        radius: ['60%', '73%'],
        animation: true,
        label: {
          normal: {
              show: false
          }
        },
        data:deviceData[2]
    },
    {
        name:'Device',
        type:'pie',
        radius: ['75%', '88%'],
        animation: true,
        label: {
          normal: {
              show: false
          }
        },
        data:deviceData[3]
    },
    {
        name:'Device',
        type:'pie',
        radius: ['90%', '100%'],
        animation: true,
        label: {
          normal: {
              show: false
          }
        },
        data:deviceData[4]
    }]
};